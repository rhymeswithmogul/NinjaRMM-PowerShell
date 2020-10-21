---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version:
schema: 2.0.0
---

# Set-NinjaRmmServerLocation

## SYNOPSIS
Selects a NinjaRMM API server.

## SYNTAX

```
Set-NinjaRmmServerLocation [[-Location] <String>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet allows you to select a NinjaRMM API server to use.  NinjaRMM has API servers located in the United States and in the European Union.  By default, the US server is used, but EU residents may prefer to use a closer server for better performance.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-NinjaRmmServerLocation -Location 'EU'
```

Switches this module to use the API servers located in the European Union.

## PARAMETERS

### -Location
Specify a region code.  At this time, there are only two hostnames available, the US server (api.ninjarmm.com) and the EU server (eu-api.ninjarmm.com).

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: US, EU

Required: False
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
It is not clear if there are any functional differences between the two hostnames.  By default, this module will use the servers located in the United States.

## RELATED LINKS

[about_NinjaRmmApi]()