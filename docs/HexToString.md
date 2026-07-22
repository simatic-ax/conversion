# HexToString

## Summary

Provides hexadecimal string conversion helpers for byte values.

## Namespace

`Simatic.Ax.Conversion`

## Signatures

```iecst
FUNCTION PUBLIC ByteToString : STRING
    VAR_INPUT
        b : BYTE;
    END_VAR
END_FUNCTION
```

## Behavior

- Converts a `BYTE` to a two-character uppercase hexadecimal string.
- Uses an internal nibble lookup helper for `0..F` conversion.

## Parameters

- `b`: Byte value to convert.

## Returns

- `ByteToString`: Two-character hexadecimal string.

## Examples

```iecst
VAR
    hexValue : STRING;
END_VAR

hexValue := ByteToString(b := BYTE#16#AF);   // 'AF'
```
