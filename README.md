# Conversion

## Description
This library provides some functions to convert Integer values to Strings and Strings to Integer values.

## Version history

Current version 0.0.2

See also [changelog](changelog.md)

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
            FORCE_SIGN := WORD#16#0001
    END_TYPE
END_NAMESPACE
```
|Mode|Example|Result|
|-|-|-|
|NONE       | Integer.ToString(value := 123) | '123'
|FORCE_SIGN | Integer.ToString(value := 123, mode := ConversionMode#FORCE_SIGN) | '+123'
<!-- |FORCE_LEADING_ZEROS | Integer.ToString(value := INT#123)  | '+00123' 
|FORCE_LEADING_ZEROS | Integer.ToString(value := DINT#123) | '+0000000123'  -->

<!-- > Modes can be combined. Example:
> ```
> Integer.ToString(value := 123, mode := ConversionMode#FORCE_SIGN) 
> ```
>  -->

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
Integer.ToString(value : ULINT, mode : ConversionMode) : STRING[21];
```

### ToInt
```iecst
Strings.ToInt(str : STRING, value =>  SINT) : BOOL;
Strings.ToInt(str : STRING, value =>   INT) : BOOL;
Strings.ToInt(str : STRING, value =>  DINT) : BOOL;
Strings.ToInt(str : STRING, value =>  LINT) : BOOL;
Strings.ToInt(str : STRING, value => USINT) : BOOL;
Strings.ToInt(str : STRING, value =>  UINT) : BOOL;
Strings.ToInt(str : STRING, value => UDINT) : BOOL;
```

### ToInt --> ULINT
```iecst
Strings.ToInt(str : STRING, value => ULINT) : BOOL;
```
> Values > MAX ULINT will handled as MOD MAX_ULINT (MAX_ULINT = 18446744073709551615);


### ToArray

Description:
This function `ToArray()` converts a string into a array of CHAR

- When the string is longer than the array, then the string will be cut. TThe function returns the length of the array.
- When the string is shorter then the array. The complete string can be copied to the array. The elements behind will not be touched. The function returns the length of the string
- arrays with other start index than 0 are supported
- only one dimensional arrays are supported

```iecst
Strings.ToArray(str : STRING, arr : ARRAY[*] OF CHAR) : DINT;
```

|||
|-|-|
| ToArray() : DINT | Returns the number of copied characters
|str : STRING| Source string |
|arr : ARRAY[*] OF CHAR| Destination array |


## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## License and Legal information

Please read the [Legal information](LICENSE.md)