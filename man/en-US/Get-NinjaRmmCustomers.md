---
external help file: NinjaRmmApi-help.xml
Module Name: NinjaRmmApi
online version: https://github.com/rhymeswithmogul/NinjaRMM-PowerShell/blob/main/man/en-US/Get-NinjaRmmCustomers.md
schema: 2.0.0
---

# Get-NinjaRmmCustomers

## SYNOPSIS
Get customers from NinjaRMM.

## SYNTAX

### AllCustomers (Default)
```
Get-NinjaRmmCustomers [<CommonParameters>]
```

### OneCustomer
```
Get-NinjaRmmCustomers [-CustomerId <UInt32>] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet will retrieve data about one or more customers from NinjaRMM.  With no parameters specified, all available customers will be returned.  You may use -CustomerId to return only a single customer.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-NinjaRmmCustomers
```

Retrieve all customers' data.

### Example 2
```powershell
PS C:\> Get-NinjaRmmCustomer -CustomerId 42
```

Retrieve data about the customer with the ID number of 42.  To find ID numbers, look in your NinjaRMM dashboard.

### Example 3
```powershell
PS C:\> Get-NinjaRmmCustomer | Where {$_.Name -Like '*Consulting'} | Format-List
```

Retrieve all customers whose name ends with "Consulting."  This module converts the API results into native PowerShell objects that can be parsed, filtered, and manipulated with other cmdlets.

## PARAMETERS

### -CustomerId
If specified, this will retrieve data about only this one particular customer.

```yaml
Type: UInt32
Parameter Sets: OneCustomer
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
Upon success, this cmdlet will return zero or more objects containing customer data.

## NOTES
Before you can use this cmdlet, you will need to run Set-NinjaRmmSecrets.

## RELATED LINKS

[about_NinjaRmmApi]()
[Set-NinjaRmmSecrets]()