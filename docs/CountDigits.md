# CountDigits

## Summary

Provides overloads that count the number of decimal digits in signed and unsigned 64-bit integers.

## Namespace

`Simatic.Ax.Conversion`

## Signatures

```iecst
FUNCTION CountDigits : INT
    VAR_INPUT
        value : LINT;
    END_VAR
END_FUNCTION

FUNCTION CountDigits : INT
    VAR_INPUT
        value : ULINT;
    END_VAR
END_FUNCTION
```

## Behavior

- Counts decimal digits for `LINT` and `ULINT` values.
- Uses iterative divisor growth to determine the digit count.

## Parameters

- `value`: Integer value whose decimal digit count is required.

## Returns

- Number of decimal digits as `INT`.

## Examples

```iecst
VAR
    signedDigits : INT;
    unsignedDigits : INT;
END_VAR

signedDigits := CountDigits(value := LINT#-12345);      // 5
unsignedDigits := CountDigits(value := ULINT#987654);   // 6
```
