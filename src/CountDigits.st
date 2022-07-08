NAMESPACE Simatic.Ax.Conversion
    FUNCTION CountDigits : INT
        VAR_INPUT
            value : LINT;
        END_VAR
        VAR_TEMP
            divisor : LINT := LINT#10;
            i : INT;
        END_VAR
        VAR CONSTANT
            MAX_DIGITS : INT := 18;
        END_VAR

        FOR i := 1 TO MAX_DIGITS DO
            IF((value > (LINT#-1 * divisor)) AND (value < divisor)) THEN
                CountDigits := i;
                RETURN;
            END_IF;
            divisor := divisor * LINT#10;
        END_FOR;
        CountDigits := 19;
    END_FUNCTION    

    FUNCTION CountDigits : INT
        VAR_INPUT
            value : ULINT;
        END_VAR
        VAR_TEMP
            divisor : ULINT := ULINT#10;
            i : INT;
        END_VAR
        VAR CONSTANT
            MAX_DIGITS : INT := 19;
        END_VAR

        FOR i := 1 TO MAX_DIGITS DO
            IF(value < divisor) THEN
                CountDigits := i;
                RETURN;
            END_IF;
            divisor := divisor * UINT#10;
        END_FOR;
        CountDigits := 20;
    END_FUNCTION    
END_NAMESPACE