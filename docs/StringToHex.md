# StringToHex

## Summary

Converts a hexadecimal string into a `DWORD` value and returns a status code.

## Namespace

`Simatic.Ax.Conversion.Strings`

## Signature

```st
FUNCTION ToHex : WORD
    VAR_INPUT
        str : STRING;
        n : INT;
    END_VAR
    VAR_OUTPUT
        result : DWORD;
    END_VAR
END_FUNCTION
```

## Behavior

- Converts up to 8 hexadecimal characters from the input string.
- Validates input length and character set.
- Returns status codes for invalid characters and buffer size issues.

## Parameters

- `str`: Input string containing hexadecimal characters.
- `n`: Number of characters to convert.

## Returns

- Status code as `WORD`.

## Outputs

- `result`: Converted `DWORD` value.

## Status Codes

- `WORD#16#0000`: Success.
- `WORD#16#0007`: Invalid character.
- `WORD#16#8182`: Input buffer too small.
- `WORD#16#8482`: Output buffer too small.

## Examples

```st
VAR
    status : WORD;
    hexResult : DWORD;
END_VAR

status := ToHex(str := '1A2B', n := 4, result => hexResult);
// status = WORD#16#0000, hexResult = DWORD#16#1A2B
```
