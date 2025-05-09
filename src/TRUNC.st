NAMESPACE Simatic.Ax.Conversion

    /// Truncates a 64-bit floating-point number (LREAL) to an integer.
    ///
    /// This function truncates the input LREAL value to the nearest integer toward zero.
    /// It handles both positive and negative values.
    ///
    /// @param Value The LREAL value to truncate.
    /// @return The truncated integer value.
    FUNCTION TRUNC : DINT
        VAR_INPUT
            Value : LREAL;
        END_VAR
        TRUNC := TO_DINT(Value);
        IF Value > 0.0 THEN
            IF TO_LREAL(TRUNC) > Value THEN
                TRUNC := TRUNC - 1;
            END_IF;
        ELSE
            IF TO_LREAL(TRUNC) < Value THEN
                TRUNC := TRUNC + 1;
            END_IF;
        END_IF;
    END_FUNCTION

    /// Truncates a 32-bit floating-point number (REAL) to an integer.
    ///
    /// This function truncates the input REAL value to the nearest integer toward zero.
    /// It handles both positive and negative values.
    ///
    /// @param Value The REAL value to truncate.
    /// @return The truncated integer value.
    FUNCTION TRUNC : DINT
        VAR_INPUT
            Value : REAL;
        END_VAR
        TRUNC := TO_DINT(Value);
        IF Value > 0.0 THEN
            IF TO_LREAL(TRUNC) > Value THEN
                TRUNC := TRUNC - 1;
            END_IF;
        ELSE
            IF TO_LREAL(TRUNC) < Value THEN
                TRUNC := TRUNC + 1;
            END_IF;
        END_IF;
    END_FUNCTION

END_NAMESPACE
