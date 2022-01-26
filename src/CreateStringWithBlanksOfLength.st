USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    FUNCTION CreateStringWithBlanksOfLength : STRING
        VAR_INPUT
            str : STRING;
            len : INT;
            _tempString : STRING[1] := '0';
        END_VAR
        VAR_TEMP
            i : INT;
        END_VAR
        CreateStringWithBlanksOfLength := '';
        
        FOR i := 1 TO len  DO
            CreateStringWithBlanksOfLength := Concat(CreateStringWithBlanksOfLength, _tempString);
        END_FOR;
        
    END_FUNCTION
END_NAMESPACE