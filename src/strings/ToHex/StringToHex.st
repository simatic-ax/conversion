USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings

    /// Converts a string containing a hexadecimal number to a DWORD value.
    ///
    /// This function parses a string containing a hexadecimal number and converts it into
    /// a DWORD value. It validates the input string and checks for buffer size constraints.
    ///
    /// @param str The input string containing the hexadecimal number.
    /// @param n The number of characters to convert.
    /// @return A WORD indicating the status of the conversion:
    ///         - WORD#16#0000: No error.
    ///         - WORD#16#0007: Invalid character.
    ///         - WORD#16#8182: Input buffer is too small.
    ///         - WORD#16#8482: Output buffer is too small.
    FUNCTION ToHex : WORD
        VAR_INPUT
            str : STRING; // Pointer to ASCII character string
            n : INT; // Number of ASCII characters to be converted
        END_VAR
        VAR_OUTPUT
            result : DWORD; // Hexadecimal number
        END_VAR
        VAR_TEMP
            i : INT;
            tempCharacter : USINT;
            tempValue : BYTE;
            tempDword : DWORD;
            tempResult : DWORD;
            tempSuccess : BOOL;
        END_VAR
        // Check input length
        IF n > lengthOF(str) THEN
            ToHex := WORD#16#8182; // Input buffer is too small for data in the N parameter
            RETURN;
            ;
        END_IF;
        // Check buffer size
        IF n > 8 THEN
            ToHex := WORD#16#8482; // Output buffer is too small for data in the N parameter
            RETURN;
        END_IF;
        // Valid ASCII [0-9a-fA-F]
        FOR i := 1 TO n DO
            IF (GetHexValueOfChar(str[i], tempValue)) THEN
                tempDword := tempValue;
                tempDword := SHL(tempDword, TO_UINT((n - i) * 4));
                tempResult := tempResult OR TO_DWORD(TO_INT(tempDword));
            ELSE
                // ERROR invalid character;  
                ToHex := WORD#16#0007; // Invalid charcter               
                RETURN;
            END_IF;
            ;
        END_FOR;
        result := tempResult;
        ToHex := WORD#16#0000; // no Error
        ;
    END_FUNCTION

END_NAMESPACE
