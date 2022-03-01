USING Simatic.Ax.Conversion.Strings;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    FUNCTION StringToBool : BOOL
        VAR_INPUT
            str: STRING;
        END_VAR
        VAR_OUTPUT
            value: BOOL;
        END_VAR
        
        IF LengthOf(str) < 4 OR LengthOf(str) > 5 THEN
            value:= FALSE; StringToBool := FALSE;
            RETURN;
        END_IF;

        IF LengthOf(str) = 5 THEN
            IF NOT (str[1] = 'F' OR str[1] = 'f') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[2] = 'A' OR str[2] = 'a') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[3] = 'L' OR str[3] = 'l') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[4] = 'S' OR str[4] = 's') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[5] = 'E' OR str[5] = 'e') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            value:= FALSE;
            StringToBool := TRUE;
            RETURN;
        END_IF;

        IF LengthOf(str) = 4 THEN
            IF NOT (str[1] = 'T' OR str[1] = 't') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[2] = 'R' OR str[2] = 'r') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[3] = 'U' OR str[3] = 'u') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            IF NOT (str[4] = 'E' OR str[4] = 'e') THEN
                StringToBool := FALSE;
                RETURN;
            END_IF;
            value:= TRUE;
            StringToBool := TRUE;
        END_IF;
    END_FUNCTION

END_NAMESPACE