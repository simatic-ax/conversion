# StringToBool

## Summary

Converts the strings `TRUE` and `FALSE` to a boolean value.

## Namespace

`Simatic.Ax.Conversion`

## Signature

```iecst
FUNCTION StringToBool : BOOL
    VAR_INPUT
        str : STRING;
    END_VAR
    VAR_OUTPUT
        value : BOOL;
    END_VAR
END_FUNCTION
```

## Behavior

- Accepts `TRUE` and `FALSE` case-insensitively.
- Returns `FALSE` when the input does not match a supported boolean literal.

## Parameters

- `str`: Input string.

## Returns

- `TRUE` when conversion succeeds, otherwise `FALSE`.

## Outputs

- `value`: Parsed boolean value.

## Examples

```iecst
VAR
    ok : BOOL;
    parsedValue : BOOL;
END_VAR

ok := StringToBool(str := 'TRUE', value => parsedValue);
// ok = TRUE, parsedValue = TRUE
```
