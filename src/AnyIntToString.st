USING System.Strings;
USING System.Math;

NAMESPACE Simatic.Ax.Conversion
    FUNCTION INTERNAL AnyIntToString : STRING
        VAR_INPUT
            value : LINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
            _value : LINT;
            digit : INT;
            c : USINT;
            i : INT;
            digits : INT;
            offset : INT;
        END_VAR

        _value := value;
        // Prepare the sting with the correct lenght
        digits := CountDigits(value);
        AnyIntToString := CreateStringWithBlanksOfLength(len := digits);

        IF (_value < 0) THEN  // Add sign to 
            AnyIntToString := CreateStringWithBlanksOfLength(len := digits + 1);
            AnyIntToString[1] := '-';
            offset := 1; // keep space for the sign
        ELSIF (_value > 0 AND (mode AND ConversionMode#FORCE_SIGN) = ConversionMode#FORCE_SIGN) THEN  // Add sign to 
            AnyIntToString := CreateStringWithBlanksOfLength(len := digits + 1);
            AnyIntToString[1] := '+';
            offset := 1; // keep space for the sign
        ELSE
            offset := 0;
        END_IF;
      
        FOR i := 0 TO digits - 1 DO
            digit := ABS(TO_INT(_value MOD 10));        
            c := TO_USINT('0') + TO_USINT(digit); 
            AnyIntToString[digits - i + offset] := TO_CHAR(TO_BYTE(c));
            _value := _value / 10;
        END_FOR;
    END_FUNCTION
END_NAMESPACE