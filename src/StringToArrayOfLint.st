USING Simatic.Ax.Conversion.Strings;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings.ToArray

    FUNCTION INTERNAL OfLint : BOOL
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
            ch : CHAR;
            substr: STRING;
            parseSucces: BOOL;

            value: LINT; //mehr möglich machen!
        END_VAR

        OfLint := FALSE;
        IF LengthOf(str) = 0 THEN
            RETURN;
        END_IF;

        lb := LOWER_BOUND(arr, 1);
        ub := UPPER_BOUND(arr, 1);
        
        GetArrayBounds(str, arrayStart, arrayEnd);

        arrayIndex := LOWER_BOUND(arr, 1);
        //loop through string
        FOR index := arrayStart TO arrayEnd DO

            ch := str[index];

            IF (NOT inElement AND ch = ']') THEN
                OfLint := TRUE;
                RETURN;
            END_IF;


            IF NOT inElement AND NOT ((ch = ' ' OR ch = ',')) THEN
                elementStart := index;
                inElement := TRUE;
            END_IF;


            IF inElement AND (ch = ' ' OR ch = ',' OR ch = ']') THEN
                elementEnd := index;
                inElement := FALSE;
                elementFound := TRUE;
            END_IF;

            IF elementFound THEN

                substr := Substring(str, elementStart, elementEnd - elementStart);
                parseSucces := StringToAnyInt(substr, value);

                IF parseSucces THEN                  
                    IF (arrayIndex > ub) THEN
                        OfLint := TRUE;
                        RETURN;
                    END_IF;
                    arr[arrayIndex] := value;
                    OfLint := TRUE;
                    arrayIndex := arrayIndex + 1;
                    elementFound := FALSE;
                ELSE
                    OfLint := FALSE;
                    RETURN;
                END_IF;
            END_IF;
        END_FOR;
    END_FUNCTION

    FUNCTION GetArrayBounds
        VAR_INPUT
            str: STRING;
        END_VAR
        VAR_OUTPUT
            lower: INT;
            upper: INT;
        END_VAR
        VAR
            index: INT;
        END_VAR
        
        FOR index := 1 TO LengthOf(str) DO
            IF str[index] = '[' THEN
                lower := index + 1;
                EXIT;
            END_IF;
        END_FOR;
    
        FOR index := LengthOf(str) TO 1 BY -1 DO
            IF str[index] = ']' THEN
                upper := index;
                EXIT;
            END_IF;
        END_FOR;

    END_FUNCTION

END_NAMESPACE
