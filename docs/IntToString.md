# IntToString

## Summary

Provides overloaded `ToString` functions for signed and unsigned integer types.

## Namespace

`Simatic.Ax.Conversion.Integer`

## Supported Types

- `SINT`
- `USINT`
- `INT`
- `UINT`
- `DINT`
- `UDINT`
- `LINT`
- `ULINT`

## Behavior

- Converts integer values to decimal strings.
- Supports optional `ConversionMode` formatting.
- Uses internal helpers for signed and unsigned 64-bit conversion logic.

## Parameters

- `value`: Integer value to convert.
- `mode`: Optional conversion mode.

## Returns

- String representation sized for the target integer type.

## Notes

- All overloads share the same function name: `ToString`.

## Examples

```st
VAR
	sintText : STRING[4];
	dintText : STRING[11];
	ulintText : STRING[21];
END_VAR

sintText := ToString(value := SINT#-12);
dintText := ToString(value := DINT#34567, mode := ConversionMode#FORCE_SIGN);
ulintText := ToString(value := ULINT#123456789);
```
