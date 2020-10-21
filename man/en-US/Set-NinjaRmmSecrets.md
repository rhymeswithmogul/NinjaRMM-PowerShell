---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version: https://github.com/rhymeswithmogul/NinjaRMM-PowerShell/blob/main/man/en-US/Reset-NinjaRmmSecrets.md
schema: 2.0.0
---

# Set-NinjaRmmSecrets

## SYNOPSIS
Sets your NinjaRMM API keys.

## SYNTAX

```
Set-NinjaRmmSecrets [[-AccessKeyId] <String>] [[-SecretAccessKey] <String>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet stores your NinjaRMM API access key ID and secret access key in memory.  This cmdlet must be run before you can use any of the Get-* or Reset-* cmdlets in this module.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-NinjaRmmSecrets -AccessKeyID "TF4STGMDR4H7AEXAMPLE" -SecretAccessKey "eh14c4ngchhu6283he03j6o7ar2fcuca0example"
```

This prepares the module to access the NinjaRMM API.

## PARAMETERS

### -AccessKeyId
Your NinjaRMM API access key identifier.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecretAccessKey
Your NinjaRMM API secret access key.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES
Your NinjaRMM API information is stored in the system's environment.  It is possible for another process on your computer to see this information.  If this is a concern, you may wish to run Reset-NinjaRmmSecrets when you are finished.

Your NinjaRMM secrets are only stored for the current PowerShell session.  For long-term storage, consider using a password manager, saving them to your profile, or storing them with the SecretManagement module.

## RELATED LINKS

[about_NinjaRmmApi]()
[Reset-NinjaRmmSecrets]()
[SecretManagement](https://github.com/PowerShell/SecretManagement)