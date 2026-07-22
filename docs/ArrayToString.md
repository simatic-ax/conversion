# ArrayToString

## Summary

Provides overloads that convert a `CHAR` array, or a selected range within it, to a `STRING`.

## Namespace

`Simatic.Ax.Conversion.Arrays`

## Signatures

```st
FUNCTION ToString : STRING
    VAR_INPUT
        arr : ARRAY[*] OF CHAR;
        startIdx : INT;
        endIdx : INT;
    END_VAR
END_FUNCTION

FUNCTION ToString : STRING
    VAR_INPUT
        arr : ARRAY[*] OF CHAR;
    END_VAR
END_FUNCTION
```

## Behavior

- Converts a full `CHAR` array to `STRING`.
- Converts a selected subrange when `startIdx` and `endIdx` are provided.
- Returns an empty string for invalid ranges.
- Truncates output to the maximum supported string length.

## Parameters

- `arr`: Source character array.
- `startIdx`: Start index of the range to convert.
- `endIdx`: End index of the range to convert.

## Returns

- `STRING` containing the copied characters.

## Notes

- The implementation limits the result to 254 characters.

## Examples

```st
VAR
    chars : ARRAY[0..4] OF CHAR := ['H', 'e', 'l', 'l', 'o'];
    fullText : STRING;
    partText : STRING;
END_VAR

fullText := ToString(arr := chars);                    // 'Hello'
partText := ToString(arr := chars, startIdx := 1, endIdx := 3); // 'ell'
```
