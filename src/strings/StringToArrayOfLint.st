USING Simatic.Ax.Conversion.Strings;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings.ToArray

    /// Converts a string representation of an array of integers to an array of LINT values.
    ///
    /// This function parses a string containing integers (e.g., "[1, 2, 3]") and converts it
    /// into an array of LINT values. If the string cannot be converted, the function returns FALSE.
    ///
    /// @param str The input string to parse.
    /// @param arr The output array to store the converted LINT values.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Extracts the bounds of an array from a string representation.
    ///
    /// This function identifies the positions of the opening and closing brackets
    /// in a string representing an array (e.g., "[1, 2, 3]") and returns their indices.
    ///
    /// @param str The input string to analyze.
    /// @param lower The index of the opening bracket.
    /// @param upper The index of the closing bracket.
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
