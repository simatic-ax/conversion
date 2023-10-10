USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    // returns the hex value as byte of a hex character
    // Example 'a' --> BYTE#16#a
    // Valid characters: [A-Fa-f0-9]
    // Return vlaue: character is valid
    FUNCTION INTERNAL GetHexValueOfChar : BOOL
        VAR_INPUT
            c : CHAR;
        END_VAR
        VAR_OUTPUT
            result : BYTE;
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
