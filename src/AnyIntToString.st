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
            s : STRING[1];
            t : ARRAY[0..19] OF CHAR; // MAX: -9223372036854775808
        END_VAR

        _value := value;
        digits := CountDigits(value);
        IF (_value < 0) THEN  // Add sign to 
            AnyIntToString := Concat(AnyIntToString, '-');
            offset := 1; // keep space for the sign
        ELSIF (_value > 0 AND (mode AND ConversionMode#FORCE_SIGN) = ConversionMode#FORCE_SIGN) THEN  // Add sign to 
            AnyIntToString := Concat(AnyIntToString, '+');
            offset := 1; // keep space for the sign
        ELSE
            offset := 0;
        END_IF;
      
        FOR i := 0 TO digits - 1 DO
            digit := ABS(TO_INT(_value MOD 10));        
            c := TO_USINT('0') + TO_USINT(digit); 
            t[digits - i - 1] := TO_CHAR(TO_BYTE(c));
            _value := _value / 10;
        END_FOR;
        FOR i := 0 TO digits - 1 DO
            s[1] := t[i];
            AnyIntToString := Concat(AnyIntToString, s);
        END_FOR;
    END_FUNCTION

    FUNCTION INTERNAL ULintToString : STRING
        VAR_INPUT
            value : ULINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
            _value : ULINT;
            digit : INT;
            c : USINT;
            i : INT;
            digits : INT;
            offset : INT;
        END_VAR

        _value := value;
        // Prepare the sting with the correct lenght
        digits := CountDigits(value);

        IF (_value > ULINT#0 AND (mode AND ConversionMode#FORCE_SIGN) = ConversionMode#FORCE_SIGN) THEN  // Add sign to 
            ULintToString[1] := '+';
            offset := 1; // keep space for the sign
        ELSE
            offset := 0;
        END_IF;
      
        FOR i := 0 TO digits - 1 DO
            digit := ABS(TO_INT(_value MOD UINT#10));        
            c := TO_USINT('0') + TO_USINT(digit); 
            ULintToString[digits - i + offset] := TO_CHAR(TO_BYTE(c));
            _value := _value / UINT#10;
        END_FOR;
    END_FUNCTION
END_NAMESPACE