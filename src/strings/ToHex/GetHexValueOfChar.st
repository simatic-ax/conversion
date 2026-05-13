USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    /// Converts a hexadecimal character to its byte value.
    ///
    /// This function takes a single hexadecimal character (0-9, A-F, a-f) and converts it
    /// to its corresponding byte value. If the character is invalid, the function returns FALSE.
    ///
    /// @param c The input hexadecimal character.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
    FUNCTION INTERNAL GetHexValueOfChar : BOOL
        VAR_INPUT
            c : CHAR;
        END_VAR
        VAR_OUTPUT
            result : BYTE; // The byte value of the hexadecimal character
        END_VAR
        GetHexValueOfChar := TRUE;
        CASE c OF
            '0':
                result := BYTE#16#0;
                RETURN;
            '1':
                result := BYTE#16#1;
                RETURN;
            '2':
                result := BYTE#16#2;
                RETURN;
            '3':
                result := BYTE#16#3;
                RETURN;
            '4':
                result := BYTE#16#4;
                RETURN;
            '5':
                result := BYTE#16#5;
                RETURN;
            '6':
                result := BYTE#16#6;
                RETURN;
            '7':
                result := BYTE#16#7;
                RETURN;
            '8':
                result := BYTE#16#8;
                RETURN;
            '9':
                result := BYTE#16#9;
                RETURN;
            'a', 'A':
                result := BYTE#16#A; //a A
                RETURN;
            'b', 'B':
                result := BYTE#16#B; //b B
                RETURN;
            'c', 'C':
                result := BYTE#16#C; //c C
                RETURN;
            'd', 'D':
                result := BYTE#16#D; //d D
                RETURN;
            'e', 'E':
                result := BYTE#16#E; //e E
                RETURN;
            'f', 'F':
                result := BYTE#16#F; //f F
                RETURN;
        ELSE
            // ERROR ;  
            GetHexValueOfChar := FALSE;
            RETURN;
        END_CASE;
        ;
    END_FUNCTION

END_NAMESPACE
