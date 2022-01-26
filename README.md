# Conversion

## Description
This library provides some functions to convert Integer values to Strings and Strings to Integer values.

## Install this package

Enter:
```cli
apax add @simatic-ax/conversion
```
> to install this package you need to login into the GitHub registry. You'll find more information [here](https://github.com/simatic-ax/.github/blob/main/doc/personalaccesstoken.md) 


## Namespace
```
Simatic.Ax.Conversion;
Simatic.Ax.Conversion.Integer;
Simatic.Ax.Conversion.Strings;
```
## ConversionMode
```iecst
NAMESPACE Simatic.Ax.Conversion
    TYPE
        ConversionMode : WORD (
            NONE := WORD#16#0000, 
            FORCE_SIGN := WORD#16#0001, 
            FORCE_LEADING_ZEROS := WORD#16#0002) := NONE;
    END_TYPE
END_NAMESPACE
```
|Mode|Example|Result|
|-|-|-|
|NONE       | Integer.ToString(value := 123) | '123'
|FORCE_SIGN | Integer.ToString(value := 123, mode := ConversionMode#FORCE_SIGN) | '+123'
<!-- |FORCE_LEADING_ZEROS | Integer.ToString(value := INT#123)  | '+00123' 
|FORCE_LEADING_ZEROS | Integer.ToString(value := DINT#123) | '+0000000123'  -->

> Modes can be combined. Example:
> ```
> Integer.ToString(value := 123, mode := ConversionMode#FORCE_SIGN OR ConversionMode#FORCE_LEADING_ZEROS) 
> ```
> 

## Functions 

### ToString

```iecst
Integer.ToString(value :  SINT, mode : ConversionMode) : STRING[4];
Integer.ToString(value : USINT, mode : ConversionMode) : STRING[4];
Integer.ToString(value :   INT, mode : ConversionMode) : STRING[6];
Integer.ToString(value :  UINT, mode : ConversionMode) : STRING[6];
Integer.ToString(value :  DINT, mode : ConversionMode) : STRING[11];
Integer.ToString(value : UDINT, mode : ConversionMode) : STRING[11];
Integer.ToString(value :  LINT, mode : ConversionMode) : STRING[20];
Integer.ToString(value :  ULINT, mode : ConversionMode) : STRING[21];
```

## ToInt
```iecst
Strings.ToInt(str : STRING, value =>  SINT) : BOOL;
Strings.ToInt(str : STRING, value =>   INT) : BOOL;
Strings.ToInt(str : STRING, value =>  DINT) : BOOL;
Strings.ToInt(str : STRING, value =>  LINT) : BOOL;
Strings.ToInt(str : STRING, value => USINT) : BOOL;
Strings.ToInt(str : STRING, value =>  UINT) : BOOL;
Strings.ToInt(str : STRING, value => UDINT) : BOOL;
```

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_OUTPUT
            value : LINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## License and Legal information

Please read the [Legal information](LICENSE.md)