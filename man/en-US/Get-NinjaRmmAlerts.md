---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version: https://github.com/rhymeswithmogul/NinjaRMM-PowerShell/blob/main/man/en-US/Get-NinjaRmmAlerts.md
schema: 2.0.0
---

# Get-NinjaRmmAlerts

## SYNOPSIS
Get alerts from NinjaRMM.

## SYNTAX

### AllAlerts (Default)
```
Get-NinjaRmmAlerts [<CommonParameters>]
```

### OneAlert
```
Get-NinjaRmmAlerts [-AlertId <UInt32>] [<CommonParameters>]
```

### AllAlertsSince
```
Get-NinjaRmmAlerts [-Since <UInt32>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet will retrieve one or more alerts from NinjaRMM.  With no parameters specified, all alerts will be returned.  You may use -AlertId to return only a single alert, or -Since to get all alerts that have occurred after the one with that specific ID.

In this version of the NinjaRMM API, alerts contain both device and customer information.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-NinjaRmmAlerts
```

Retrieve all alerts.

### Example 2
```powershell
PS C:\> Get-NinjaRmmAlerts -Since 1234567
```

Retrieve all alerts that have happened since alert ID 1234567 was logged.

### Example 3
```powershell
PS C:\> Get-NinjaRmmAlerts | Where {$_.Role -eq 'WINDOWS_WORKSTATION'} | Format-List
```

Retrieve all alerts that have happened on a Windows workstation.  This module converts the API results into native PowerShell objects that can be parsed, filtered, and manipulated with other cmdlets.

## PARAMETERS

### -AlertId
Retrieve a specific alert.  This parameter is undocumented and not part of official API specification.  Thus, using it in a production environment may not be a wise idea.

```yaml
Type: UInt32
Parameter Sets: OneAlert
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Since
Retrieve all alerts since this last known alert ID.

```yaml
Type: UInt32
Parameter Sets: AllAlertsSince
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
Upon success, this cmdlet will return zero or more Objects containing alert data.

## NOTES
Before you can use this cmdlet, you will need to run Set-NinjaRmmSecrets.

## RELATED LINKS

[about_NinjaRmmApi]()
[Reset-NinjaRmmAlert]()
[Set-NinjaRmmSecrets]()