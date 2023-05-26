NAMESPACE Simatic.Ax.Conversion

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
