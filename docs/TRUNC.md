# TRUNC

## Summary

Provides overloads of `TRUNC` that truncate `REAL` and `LREAL` values toward zero and return a `DINT`.

## Namespace

`Simatic.Ax.Conversion`

## Signatures

```iecst
FUNCTION TRUNC : DINT
    VAR_INPUT
        Value : LREAL;
    END_VAR
END_FUNCTION

FUNCTION TRUNC : DINT
    VAR_INPUT
        Value : REAL;
    END_VAR
END_FUNCTION
```

## Behavior

- Truncates positive and negative floating-point values toward zero.
- Returns the truncated result as `DINT`.
- Applies a correction after `TO_DINT` to ensure toward-zero behavior.

## Parameters

- `Value`: Input floating-point value to truncate.

## Returns

- Truncated integer value as `DINT`.

## Notes

- Two overloads are available: one for `REAL`, one for `LREAL`.

## Examples

```iecst
VAR
    resultReal : DINT;
    resultLReal : DINT;
END_VAR

resultReal := TRUNC(Value := REAL#12.9);    // 12
resultLReal := TRUNC(Value := LREAL#-7.8);  // -7
```
