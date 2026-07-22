# StringToAnyInt

## Summary

Provides string-to-integer parsing helpers for signed and unsigned 64-bit integer values.

## Namespace

`Simatic.Ax.Conversion`

## Signatures

```iecst
FUNCTION StringToAnyInt : BOOL
    VAR_INPUT
        str : STRING;
    END_VAR
    VAR_OUTPUT
        value : LINT;
    END_VAR
END_FUNCTION
```

## Behavior

- Parses decimal strings into `LINT` values.
- Accepts optional leading `+` or `-`.
- Detects invalid characters and overflow.

## Parameters

- `str`: Input string to parse.

## Returns

- `TRUE` when parsing succeeds.
- `FALSE` when the input is invalid or overflows.

## Outputs

- `value`: Parsed signed integer result.

## Examples

```iecst
VAR
    ok : BOOL;
    parsedValue : LINT;
END_VAR

ok := StringToAnyInt(str := '-2048', value => parsedValue);
// ok = TRUE, parsedValue = -2048
```
