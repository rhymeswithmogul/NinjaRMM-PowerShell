---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version: https://github.com/rhymeswithmogul/NinjaRMM-PowerShell/blob/main/man/en-US/Reset-NinjaRmmSecrets.md
schema: 2.0.0
---

# Reset-NinjaRmmSecrets

## SYNOPSIS
Removes your NinjaRMM API keys from memory.

## SYNTAX

```
Reset-NinjaRmmSecrets [<CommonParameters>]
```

## DESCRIPTION
This cmdlet will remove the NinjaRMM access key ID and secret access key from memory.  After running this cmdlet, no other NinjaRmm cmdlets will work;  you will need to run Set-NinjaRmmSecrets again.

## EXAMPLES

### Example 1
```powershell
PS C:\> Reset-NinjaRmmSecrets
```

Forgets the NinjaRMM secrets.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES
After you use this cmdlet, you will need to run Set-NinjaRmmSecrets.

## RELATED LINKS

[about_NinjaRmmApi]()
[Set-NinjaRmmSecrets]()