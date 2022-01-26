USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    FUNCTION SetStringLength : STRING
        VAR_INPUT
            str : STRING;
            len : INT;
        END_VAR
        SetStringLength := '';

    END_FUNCTION
END_NAMESPACE