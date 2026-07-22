# StringToArrayOfLint

## Summary

Parses a string representation of an integer array into a `LINT` array.

## Namespace

`Simatic.Ax.Conversion.Strings.ToArray`

## Signatures

```iecst
FUNCTION GetArrayBounds
    VAR_INPUT
        str : STRING;
    END_VAR
    VAR_OUTPUT
        lower : INT;
        upper : INT;
    END_VAR
END_FUNCTION
```

## Behavior

- Uses `GetArrayBounds` to locate the array content inside the string.

## Parameters

- `str`: Source string containing array syntax.

## Returns

- No direct return value. The function provides the detected lower and upper bounds.

## Examples

```iecst
VAR
    lowerBound : INT;
    upperBound : INT;
END_VAR

GetArrayBounds(str := '[10, 20, 30]', lower => lowerBound, upper => upperBound);
// lowerBound points behind '[', upperBound points to ']'
```
