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
            _tempString : STRING[1] := '0';
        END_VAR

        _value := value;
        // Prepare the sting with the correct lenght
        AnyIntToString := '';
        digits := CountDigits(value);
        FOR i := 1 TO digits  DO
            AnyIntToString := Concat(AnyIntToString, _tempString);
        END_FOR;
        
        // -32768 ‥ 32767
        IF (_value < 0) THEN  // Add sign to 
            AnyIntToString := Concat(AnyIntToString, _tempString);
            AnyIntToString[1] := '-';
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