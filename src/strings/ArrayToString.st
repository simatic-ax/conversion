USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Arrays

    /// Converts a subset of a character array to a string.
    /// 
    /// This function takes a character array and converts a specified range of elements
    /// (from `startIdx` to `endIdx`) into a string. If the range is invalid or exceeds
    /// the array bounds, an empty string is returned. The maximum string length is limited
    /// to `MAX_STR_LEN`.
    ///
    /// @param arr The input character array.
    /// @param startIdx The starting index of the range to convert.
    /// @param endIdx The ending index of the range to convert.
    /// @return A string representation of the specified range of the array.
    FUNCTION ToString : STRING
        VAR_INPUT
            arr : ARRAY[*] OF CHAR;
            startIdx : INT;
            endIdx : INT;
        END_VAR
        VAR CONSTANT
            MAX_STR_LEN : INT := 254;
        END_VAR
        VAR_TEMP
            i : DINT;
            _lb : DINT;
            _ub : DINT;
            _arrayLen : DINT;
        END_VAR
        _lb := LOWER_BOUND(arr, 1);
        _ub := UPPER_BOUND(arr, 1);

        // start index > end index
        IF (startIdx > endIdx) THEN
            ToString := '';
            RETURN;
        END_IF;

        // start index is not existing 
        IF (startIdx < _lb) OR (startIdx > _ub) AND (startIdx <> 0) THEN
            ToString := '';
            RETURN;
        END_IF;
        // end index is ot existing
        IF (endIdx > _ub) THEN
            ToString := '';
            RETURN;
        END_IF;
        _arrayLen := endIdx - startIdx + 1;            

        IF (_arrayLen > MAX_STR_LEN) THEN
            _arrayLen := MAX_STR_LEN;
        END_IF;

        FOR i := 0 TO _arrayLen - 1 DO
            ToString[i + 1] := arr[i + _lb + startIdx];
        END_FOR;

    END_FUNCTION

    /// Converts an entire character array to a string.
    ///
    /// This function takes a character array and converts all its elements into a string.
    /// If the array length exceeds `MAX_STR_LEN`, the resulting string is truncated to
    /// the maximum allowed length.
    ///
    /// @param arr The input character array.
    /// @return A string representation of the entire array.
    FUNCTION ToString : STRING
        VAR_INPUT
            arr : ARRAY[*] OF CHAR;
        END_VAR
        VAR CONSTANT
            MAX_STR_LEN : INT := 254;
        END_VAR
        VAR_TEMP
            i : DINT;
            _lb : DINT;
            _ub : DINT;
            _arrayLen : DINT;
        END_VAR
        _lb := LOWER_BOUND(arr, 1);
        _ub := UPPER_BOUND(arr, 1);

        _arrayLen := _ub - _lb + 1;

        IF (_arrayLen > MAX_STR_LEN) THEN
            _arrayLen := MAX_STR_LEN;
        END_IF;

        FOR i := 0 TO _arrayLen - 1 DO
            ToString[i + 1] := arr[i + _lb];
        END_FOR;

    END_FUNCTION

END_NAMESPACE