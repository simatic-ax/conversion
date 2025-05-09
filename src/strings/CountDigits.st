NAMESPACE Simatic.Ax.Conversion

    /// Counts the number of digits in a signed 64-bit integer (LINT).
    ///
    /// This function calculates the number of decimal digits in the given signed 64-bit integer.
    /// It iteratively checks the range of the value against increasing powers of 10.
    /// The maximum number of digits it can handle is defined by `MAX_DIGITS`.
    ///
    /// @param value The signed 64-bit integer whose digits are to be counted.
    /// @return The number of decimal digits in the input value.
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

    /// Counts the number of digits in an unsigned 64-bit integer (ULINT).
    ///
    /// This function calculates the number of decimal digits in the given unsigned 64-bit integer.
    /// It iteratively checks the range of the value against increasing powers of 10.
    /// The maximum number of digits it can handle is defined by `MAX_DIGITS`.
    ///
    /// @param value The unsigned 64-bit integer whose digits are to be counted.
    /// @return The number of decimal digits in the input value.
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