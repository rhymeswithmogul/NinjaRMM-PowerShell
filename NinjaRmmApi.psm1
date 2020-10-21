<#
This file is part of the NinjaRmmApi module.
This module is not affiliated with, endorsed by, or related to NinjaRMM, LLC.

NinjaRmmApi is free software:  you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

NinjaRmmApi is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY;  without even the implied warranty of MERCHANTABILITY or FITNESS FOR
A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with NinjaRmmApi.  If not, see <https://www.gnu.org/licenses/>.
#>

Function Set-NinjaRmmSecrets {
	[OutputType('void')]
	Param(
		[AllowNull()]
		[String] $AccessKeyId,

		[AllowNull()]
		[String] $SecretAccessKey
	)

	$env:NinjaRmmAccessKeyID     = $AccessKeyId
	$env:NinjaRmmSecretAccessKey = $SecretAccessKey
}

Function Reset-NinjaRmmSecrets {
	[Alias('Remove-NinjaRmmSecrets')]
	[OutputType('void')]
	Param()

	Remove-Variable -Name $env:NinjaRmmAccessKeyID
	Remove-Variable -Name $env:NinjaRmmSecretAccessKey
}

Function Set-NinjaRmmServerLocation {
	[OutputType('void')]
	Param(
		[ValidateSet('US', 'EU')]
		[String] $Location = 'US'
	)

	$env:NinjaRmmServerLocation = $Location
}

Function Send-NinjaRmmApi {
	[CmdletBinding()]
	Param(
		[Parameter(Mandatory)]
		[ValidateNotNullOrEmpty()]
		[String] $RequestToSend,

		[ValidateSet('GET', 'PUT', 'POST', 'DELETE')]
		[String] $Method = 'GET'
	)

	# Stop if our secrets have not been learned.
	If ($null -eq $env:NinjaRmmSecretAccessKey) {
		Throw [Data.NoNullAllowedException]::new('No secret access key has been provided.  Please run Set-NinjaRmmSecrets.')
	}
	If ($null -eq $env:NinjaRmmAccessKeyID) {
		Throw [Data.NoNullAllowedException]::new('No access key ID has been provided.  Please run Set-NinjaRmmSecrets.')
	}

	# Get the current date.  Calling -Format converts it to a [String], so we
	# need two separate calls to Get-Date.
	$DateString = Get-Date -Format 'R' -Date ((Get-Date).ToUniversalTime())
	
	# Format our signing string correctly.
	# NinjaRMM's signature has a place to put Content-MD5 and Content-Type
	# values, but leaving them out ($null) seems to be perfectly acceptable.
	$ContentMD5   = $null
	$ContentType  = $null
	$StringToSign = @($Method, $ContentMD5, $ContentType, $DateString, $RequestToSend) -Join "`n"

	# Convert your string to a byte array, and then Base64-encode it.
	# Not sure why we're removing newlines, but Ninja's example C# code did it.
	$StringToSignBytes = [Text.Encoding]::UTF8.GetBytes($StringToSign)
	$EncodedString = ([Convert]::ToBase64String($StringToSignBytes)).Trim()

	# Construct our HMAC-SHA1 thing, then convert *it* to Base64 as well.
	# Sample: https://stackoverflow.com/questions/42150420/why-does-encrypting-hmac-sha1-in-exactly-the-same-code-in-c-sharp-and-powershell
	$Hasher = [Security.Cryptography.KeyedHashAlgorithm]::Create('HMACSHA1')
	$Hasher.Key = [Text.Encoding]::UTF8.GetBytes($env:NinjaRmmSecretAccessKey)
	$HashedStringBytes= $Hasher.ComputeHash([Text.Encoding]::UTF8.GetBytes($EncodedString))

	# Convert the result to a Base64 string.
	$Signature = [Convert]::ToBase64String($HashedStringBytes) -Replace "`n",""
	
	# Pick our server.  By default, we will use the United States server.
	# However, the European Union server can be used instead.'
	If (($env:NinjaRmmServerLocation -eq 'US') -or ($null -eq $env:NinjaRmmServerLocation)) {
		$HostName = 'api.ninjarmm.com'
	}
	ElseIf ($env:NinjaRmmServerLocation -eq 'EU') {
		$HostName = 'eu-api.ninjarmm.com'
	}
	Else {
		Throw [ArgumentException]::new("The server location ${env:NinjaRmmServerLocation} is not valid.  Please run Set-NinjaRmmServerLocation.")
	}

	# Create a user agent for logging purposes.
	$UserAgent  = "PowerShell/$($PSVersionTable.PSVersion) "
	$UserAgent += "NinjaRmmApi/$((Get-Module -Name 'NinjaRmmApi').Version) "
	$UserAgent += '(implementing API version 0.1.2)'

	# PowerShell 5.1 and older do not use TLS 1.2 by default, which NinjaRMM
	# requires.  Enable TLS 1.2 (and TLS 1.3, if supported by the host OS).
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls13

	# Finally, send it.
	Write-Debug -Message ("Will send the request:`n`n" `
		+ "$Method $RequestToSend HTTP/1.1`n" `
		+ "Host: $HostName`n" `
		+ "Authorization: NJ ${env:NinjaRmmAccessKeyID}:$Signature`n" `
		+ "Date: $DateString`n" `
		+ "User-Agent: $UserAgent")

	$Arguments = @{
		'Method'  = $Method
		'Uri'     = "https://$HostName$RequestToSend"
		'Headers' = @{
			'Authorization' = "NJ ${env:NinjaRmmAccessKeyID}:$Signature"
			'Date'          = $DateString
			'Host'          = $HostName
			'User-Agent'    = $UserAgent
		}
	}

	Return (Invoke-RestMethod @Arguments)
}

Function Get-NinjaRmmAlerts {
	[CmdletBinding(DefaultParameterSetName='AllAlerts')]
	Param(
		[Parameter(ParameterSetName='OneAlert')]
		[UInt32] $AlertId,

		[Parameter(ParameterSetName='AllAlertsSince')]
		[UInt32] $Since
	)

	$Request = '/v1/alerts'
	If ($PSCmdlet.ParameterSetName -eq 'OneAlert') {
		$Request += "/$AlertId"
	}
	ElseIf ($PSCmdlet.ParameterSetName -eq 'AllAlertsSince') {
		$Request += "/since/$Since"
	}

	Return (Send-NinjaRmmApi -RequestToSend $Request)
}

Function Reset-NinjaRmmAlert {
	[CmdletBinding()]
	[Alias('Remove-NinjaRmmAlert')]
	Param(
		[Parameter(Mandatory)]
		[UInt32] $AlertId
	)

	Return (Send-NinjaRmmApi -Method 'DELETE' -RequestToSend "/v1/alerts/$AlertId")
}

Function Get-NinjaRmmCustomers {
	[CmdletBinding(DefaultParameterSetName='AllCustomers')]
	Param(
		[Parameter(ParameterSetName='OneCustomer')]
		[UInt32] $CustomerId
	)

	$Request = '/v1/customers'
	If ($PSCmdlet.ParameterSetName -eq 'OneCustomer') {
		$Request += "/$CustomerId"
	}
	Return (Send-NinjaRmmApi -RequestToSend $Request)
}

Function Get-NinjaRmmDevices {
	[CmdletBinding(DefaultParameterSetName='AllDevices')]
	Param(
		[Parameter(ParameterSetName='OneDevice')]
		[UInt32] $DeviceId
	)

	$Request = '/v1/devices'
	If ($PSCmdlet.ParameterSetName -eq 'OneDevice') {
		$Request += "/$DeviceId"
	}
	Return (Send-NinjaRmmApi -RequestToSend $Request)
}