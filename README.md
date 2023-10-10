﻿# Conversion

## Description

This library provides some functions to convert Integer values to Strings and Strings to Integer values.

## Install this package tesxt

Enter:

```cli
apax add @simatic-ax/conversion
```

> to install this package you need to login into the GitHub registry. You'll find more information [here](https://github.com/simatic-ax/.github/blob/main/docs/personalaccesstoken.md)

## Namespace

```yml
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

## Strings

### Strings.ToHex

This function convert a string containing a hex number into a hex number

Example:

```iec-st
    ret := Strings.ToHex(str := 'a231', n := 4, result => res);  // res = WORD#16#a231
```

| ReturnValue  | Explanation                                                |
|--------------|------------------------------------------------------------|
| WORD#16#0000 |  no error                                                  |
| WORD#16#0007 |  invalid character                                         |
| WORD#16#8182 |  Input buffer is too small for data in the N parameter     |
| WORD#16#8482 |  Output buffer is too small for data in the N parameter    |

### ToArray.OfCharCount

Description:
The function `ToArray.OfCharCount()` converts a string into a array of CHAR

- When the string is longer than the array, then the string will be cut. The function returns the length of the array.
- When the string is shorter then the array. The complete string can be copied to the array. The elements behind will not be touched. The function returns the length of the string
- arrays with other start index than 0 are supported
- only one dimensional arrays are supported

```iecst
Strings.ToArray.OfCharCount(str : STRING, arr : ARRAY[*] OF CHAR) : DINT;
```

|||
|-|-|
| ToArray.OfCharCount() : DINT | Returns the number of copied characters
|str : STRING| Source string |
|arr : ARRAY[*] OF CHAR| Destination array |

### ToArray.OfLint

```iec-st
Strings.ToArray.OfLint(str : STRING, arr : ARRAY[*] of LINT) : BOOL;
```

Convert a String "[123, 456, 789]" to an ARRAY[*] OF LINT and returns TRUE if the conversion was successful. If the target array `arr` is to small, the function returns also `true` but converts not more elements than the size of the destination array. If you want the number of converted elements, then ist the function `ToArray.OfLintCount()`

### ToArray.OfLintCount

```iec-st
Strings.ToArray.OfLintCount(str : STRING, arr : ARRAY[*] of LINT) : DINT;
```

Convert a String "[123, 456, 789]" to an ARRAY[*] OF LINT and returns the number of converted elements,

### Arrays.ToString

|||
|-|-|
| ToArray() : STRING | Returns the string created of the array. Arrays > 254 elements will be cut off
|arr : ARRAY[*] OF CHAR| Source array |
|startIdx : INT | Start index|
|endIdx : INT | End index|

> when startIdx and endIdx are not used, the whole array until max string length will be copied.
> Implausible indices will return a empty string. Examples:
>
> - startIdx > endIdx
> - startIdx out of the array boundaries startIdx : 1 and Array[5..10]
> - endIdx out of the array boundaries endIdx : 15 and Array[0..10]

## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## Markdownlint-cli

This workspace will be checked by the [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) (there is also documented ho to install the tool) tool in the CI workflow automatically.  
To avoid, that the CI workflow fails because of the markdown linter, you can check all markdown files locally by running the markdownlint with:

```sh
markdownlint **/*.md --fix
```

## License and Legal information

Please read the [Legal information](LICENSE.md)
