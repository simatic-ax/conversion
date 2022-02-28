USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    FUNCTION INTERNAL StringToArrayOfLint : BOOL
        VAR_INPUT
            str: STRING;
        END_VAR
        VAR_IN_OUT
            arr: ARRAY[*] OF LINT;
        END_VAR
        VAR_TEMP
            arrayStart: INT;
            arrayEnd: INT;
            lb: DINT;
            ub: DINT;
            index: INT;
            intString: STRING;
            arrayIndex: DINT;

            elementStart: INT;
            elementEnd: INT;
            inElement: BOOL := FALSE;
            elementFound: BOOL := FALSE;

            substr: STRING;
            parseSucces: BOOL;
            value: LINT; //mehr möglich machen!
        END_VAR

        StringToArrayOfLint := FALSE;
        IF LengthOf(str) = 0 THEN
            RETURN;
        END_IF;

        //TODO: make funktion out of it that gives back boundaries
        lb := LOWER_BOUND(arr, 1);
        ub := UPPER_BOUND(arr, 1);
        
        
    FOR index := 1 TO LengthOf(str) DO
        IF str[index] = '[' THEN
            arrayStart := index + 1;
            EXIT;
        END_IF;
    END_FOR;

    FOR index := LengthOf(str) TO 1 BY -1 DO
        IF str[index] = ']' THEN
            arrayEnd := index;
            EXIT;
        END_IF;
    END_FOR;

    arrayIndex := LOWER_BOUND(arr, 1);
    //loop through string
    FOR index := arrayStart TO arrayEnd DO

        IF NOT inElement AND NOT ((str[index] = ' ' OR str[index] = ',')) THEN
            elementStart := index;
            inElement := TRUE;
        END_IF;

        IF inElement AND (str[index] = ' ' OR str[index] = ',' OR str[index] = ']') THEN
            elementEnd := index;
            inElement := FALSE;
            elementFound := TRUE;
        END_IF;

        //substring
        IF elementFound THEN
            substr := Substring(str, elementStart, elementEnd - elementStart);
            parseSucces := StringToAnyInt(substr, value);
            IF parseSucces THEN
                arr[arrayIndex] := value;
                arrayIndex := arrayIndex + 1;
                elementFound := FALSE;
                StringToArrayOfLint := TRUE;
            ELSE
                StringToArrayOfLint := FALSE;
                RETURN;
            END_IF;
        END_IF;
    END_FOR;

    END_FUNCTION

END_NAMESPACE