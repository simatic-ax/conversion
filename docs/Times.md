# Times

## Summary

Documents the time conversion functions in the `Simatic.Ax.Conversion.Times` namespace.

## Namespace

`Simatic.Ax.Conversion.Times`

## Covered Functions

- `ToLDateAndTime`
- `ToSimotionDateTime`

## Behavior

- Converts between SIMOTION-specific date/time representation and AX date/time types.

## Notes

- This file documents the time conversion function group rather than a single overload.

## Examples

```st
VAR
	simotionValue : SimotionDateTime;
	simaticValue : LDATE_AND_TIME;
END_VAR

simaticValue := ToLDateAndTime(SimotionDateTime := simotionValue);
simotionValue := ToSimotionDateTime(SimaticTime := simaticValue);
```