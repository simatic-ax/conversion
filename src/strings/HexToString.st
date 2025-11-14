USING System;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    /// Converts a BYTE value to its hexadecimal string representation.
    ///
    /// This function takes a BYTE value and converts it into a two-character hexadecimal string.
    /// It splits the BYTE into two nibbles, converts each nibble to its hexadecimal character,
    /// and concatenates the results.
    ///
    /// @param b The BYTE value to convert.
    /// @return A two-character string representing the hexadecimal value of the input BYTE.
    FUNCTION PUBLIC ByteToString : STRING
        VAR_INPUT
            b : BYTE;
        END_VAR
        VAR_TEMP            
            tempN1 : BYTE;
            tempN2 : BYTE;
        END_VAR
        tempN1 := b AND BYTE#16#0F;
        tempN2 := SHR(b,USINT#4);
        
        ByteToString := Concat(LookUpHEX(tempN2),LookUpHEX(tempN1));

    END_FUNCTION

    /// Converts a nibble (4 bits) to its hexadecimal character representation.
    ///
    /// This function takes a nibble (a value between 0 and 15) and returns the corresponding
    /// hexadecimal character (0-9, A-F) using a lookup table.
    ///
    /// @param nibble The nibble value to convert (0-15).
    /// @return The hexadecimal character corresponding to the input nibble.
    FUNCTION INTERNAL LookUpHEX : CHAR
        VAR_INPUT
            nibble : BYTE;
        END_VAR
        VAR
            h : ARRAY[0..15] of CHAR := ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
        END_VAR

        LookUpHEX := h[TO_UINT(nibble)];
        
    END_FUNCTION

END_NAMESPACE