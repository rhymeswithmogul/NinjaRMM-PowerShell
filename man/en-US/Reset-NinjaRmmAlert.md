---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version: https://github.com/rhymeswithmogul/NinjaRMM-PowerShell/blob/main/man/en-US/Reset-NinjaRmmAlert.md
schema: 2.0.0
---

# Reset-NinjaRmmAlert

## SYNOPSIS
Reset one alert in NinjaRMM.

## SYNTAX

```
Reset-NinjaRmmAlert [-AlertId] <UInt32> [<CommonParameters>]
```

## DESCRIPTION
This cmdlet will acknowledge and reset an alert in NinjaRMM.  Note that an alert may only be reset if it has the can_reset property.

## EXAMPLES

### Example 1
```powershell
PS C:\> Reset-NinjaRmmAlert -AlertId 1234567
```

Reset the alert with ID 1234567.  If successful, there will be no output.

## PARAMETERS

### -AlertId
Specify the alert to reset.

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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
Before you can use this cmdlet, you will need to run Set-NinjaRmmSecrets.

## RELATED LINKS

[about_NinjaRmmApi]()
[Get-NinjaRmmAlerts]()
[Set-NinjaRmmSecrets]()