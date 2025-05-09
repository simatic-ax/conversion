USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings.ToArray

    /// Converts a string to an array of CHAR values.
    ///
    /// This function copies characters from the input string into the provided array of CHAR.
    /// It returns the number of characters copied. If the array is smaller than the string,
    /// the output is truncated to fit the array size.
    ///
    /// @param str The input string to convert.
    /// @param arr The output array to store the CHAR values.
    /// @return The number of characters copied to the array.
    FUNCTION OfCharCount : DINT
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_IN_OUT
            arr : ARRAY[*] OF CHAR;            
        END_VAR
        VAR_TEMP
            i : DINT;
            _lb : DINT;
            _ub : DINT;
            _maxLen : DINT;
        END_VAR
        _lb := LOWER_BOUND(arr, 1);
        _ub := UPPER_BOUND(arr, 1);
        _maxLen := LengthOf(str);

        IF (_maxLen > _ub - _lb + 1) THEN
            _maxLen := TO_INT(_ub - _lb + 1);
        END_IF;

        FOR i := 0 TO _maxLen - 1 DO
            arr[i + _lb] := str[i + 1];
        END_FOR;
        OfCharCount := i;
    END_FUNCTION

END_NAMESPACE