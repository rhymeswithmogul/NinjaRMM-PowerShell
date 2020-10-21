---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version: https://github.com/rhymeswithmogul/NinjaRMM-PowerShell/blob/main/man/en-US/Get-NinjaRmmDevices.md
schema: 2.0.0
---

# Get-NinjaRmmDevices

## SYNOPSIS
Gets device information from NinjaRMM.

## SYNTAX

### AllDevices (Default)
```
Get-NinjaRmmDevices [<CommonParameters>]
```

### OneDevice
```
Get-NinjaRmmDevices [-DeviceId <UInt32>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet will retrieve one or more available devices and their information from NinjaRMM.  With no parameters specified, all devices will be returned.  You may use -DeviceId to return only a single device.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-NinjaRmmDevices
```

Retrieve a list of all available devices.

### Example 2
```powershell
PS C:\> Get-NinjaRmmDevices -DeviceId 528
```

Retrieve all information about device number 528.

### Example 3
```powershell
PS C:\> Get-NinjaRmmDevices | Where {$_.System.Manufacturer -eq 'Hewlett-Packard'} | Out-GridView
```

Retrieve all devices that report their manufacturer as Hewlett-Packard.  This module converts the API results into native PowerShell objects that can be parsed, filtered, and manipulated with other cmdlets.

## PARAMETERS

### -DeviceId
Specify this parameter to retrieve data about one particular device.

```yaml
Type: UInt32
Parameter Sets: OneDevice
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object[]
Upon success, this cmdlet will return zero or more Objects containing device data.

## NOTES
Before you can use this cmdlet, you will need to run Set-NinjaRmmSecrets.

## RELATED LINKS

[about_NinjaRmmApi]()
[Set-NinjaRmmSecrets]()