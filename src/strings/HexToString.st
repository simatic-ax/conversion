USING System;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    
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