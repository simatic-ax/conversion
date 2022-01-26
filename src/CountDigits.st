USING System.Math;

NAMESPACE Simatic.Ax.Conversion
    FUNCTION CountDigits : INT
        VAR_INPUT
            value : LINT;
        END_VAR
        VAR_TEMP
            divisor : LINT := LINT#1;
            i : INT;
        END_VAR
        VAR CONSTANT
            MAX_DIGITS : INT := 19;
        END_VAR

        IF (value = 0) THEN
            CountDigits := 1;
            RETURN;
        END_IF;

        FOR i := 0 TO MAX_DIGITS DO
            IF(value / divisor = 0) THEN
                CountDigits := i;
                RETURN;
            END_IF;
            divisor := divisor * 10;
        END_FOR;
        CountDigits := 19;
    END_FUNCTION    

    FUNCTION CountDigits : INT
        VAR_INPUT
            value : ULINT;
        END_VAR
        VAR_TEMP
            divisor : ULINT := ULINT#1;
            i : INT;
        END_VAR
        VAR CONSTANT
            MAX_DIGITS : INT := 19;
        END_VAR

        IF (value = UINT#0) THEN
            CountDigits := 1;
            RETURN;
        END_IF;

        FOR i := 0 TO MAX_DIGITS DO
            IF(value / divisor = UINT#0) THEN
                CountDigits := i;
                RETURN;
            END_IF;
            divisor := divisor * UINT#10;
        END_FOR;
        CountDigits := 20;
    END_FUNCTION    
END_NAMESPACE