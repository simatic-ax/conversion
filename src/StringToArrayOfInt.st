USING Simatic.Ax.Conversion.Strings;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    /// Convert a string with array of integers like [1, 2, 3] into an array of LINT
    /// Returns the number of converted elements. 
    /// Returns 0, if the string can't be converted
    /// If the destination array is smaller than the number of elements in the string,
    /// the array will be filled it's maximum size. In this case the function returns 
    /// the number of the converted numbers (size of array)
    /// If less elements in the string than the size of the array, the last elements
    /// will not overwritten.
    FUNCTION INTERNAL StringToArrayOfLint : DINT
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
            count: DINT;

            elementStart: INT;
            elementEnd: INT;
            inElement: BOOL := FALSE;
            elementFound: BOOL := FALSE;
            ch : CHAR;
            substr: STRING;
            parseSucces: BOOL;

            value: LINT; //mehr möglich machen!
        END_VAR

        StringToArrayOfLint := 0;
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
                StringToArrayOfLint := count;
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
                        StringToArrayOfLint := count;
                        RETURN;
                    END_IF;
                    arr[arrayIndex] := value;
                    count := count + 1;
                    StringToArrayOfLint := count;
                    arrayIndex := arrayIndex + 1;
                    elementFound := FALSE;
                ELSE
                    StringToArrayOfLint := 0;
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
