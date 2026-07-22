# ToInt

## Summary

Provides overloaded `ToInt` functions that parse a `STRING` into signed and unsigned integer target types.

## Namespace

`Simatic.Ax.Conversion.Strings`

## Supported Types

- `SINT`
- `INT`
- `DINT`
- `LINT`
- `USINT`
- `UINT`
- `UDINT`
- `ULINT`

## Behavior

- Parses decimal string input into the requested integer type.
- Returns `FALSE` when the input is invalid or outside the target type range.
- Uses `StringToAnyInt` for signed and most unsigned conversions.
- Uses `StringToULint` for the `ULINT` overload.

## Parameters

- `str`: Input string to convert.

## Returns

- `TRUE` when conversion succeeds, otherwise `FALSE`.

## Outputs

- `value`: Parsed integer value in the requested target type.

## Examples

```st
VAR
	okSint : BOOL;
	okUdint : BOOL;
	sintValue : SINT;
	udintValue : UDINT;
END_VAR

okSint := ToInt(str := '-12', value => sintValue);
okUdint := ToInt(str := '4000', value => udintValue);
```