# StringToArrayOfCharCount

## Summary

Converts a `STRING` into an array of `CHAR` values and returns the number of copied characters.

## Namespace

`Simatic.Ax.Conversion.Strings.ToArray`

## Signature

```iecst
FUNCTION OfCharCount : DINT
    VAR_INPUT
        str : STRING;
    END_VAR
    VAR_IN_OUT
        arr : ARRAY[*] OF CHAR;
    END_VAR
END_FUNCTION
```

## Behavior

- Copies characters from the input string into the target array.
- Truncates the copy when the target array is smaller than the string.

## Parameters

- `str`: Source string.
- `arr`: Destination character array.

## Returns

- Number of copied characters as `DINT`.

## Examples

```iecst
VAR
    chars : ARRAY[0..9] OF CHAR;
    copied : DINT;
END_VAR

copied := OfCharCount(str := 'AX', arr := chars);
// copied = 2, chars[0] = 'A', chars[1] = 'X'
```
