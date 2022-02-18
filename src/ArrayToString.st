USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Arrays
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

        // if ther is a sstart and end index, check the values
        IF (endIdx <> 0) OR (startIdx <> 0) THEN
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
        ELSE
            _arrayLen := _ub - _lb + 1;
        END_IF;

        IF (_arrayLen > MAX_STR_LEN) THEN
            _arrayLen := MAX_STR_LEN;
        END_IF;

        FOR i := 0 TO _arrayLen - 1 DO
            ToString[i + 1] := arr[i + _lb + startIdx];
        END_FOR;

    END_FUNCTION
END_NAMESPACE