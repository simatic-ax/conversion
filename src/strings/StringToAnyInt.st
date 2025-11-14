USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    /// Converts a string to a signed 64-bit integer (LINT).
    ///
    /// This function parses a string and converts it to a signed 64-bit integer. It handles
    /// optional '+' or '-' signs and checks for overflow. If the string is invalid, the
    /// function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
    FUNCTION StringToAnyInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : LINT;
        END_VAR
        VAR_TEMP
            _len : INT;
            i : INT;
            _val : INT;
            _val_max : INT; 
            _sig : INT;
            _start : INT;
            _c : STRING;
        END_VAR

        _len := LengthOf(str);

        IF (str[1] = '+') THEN
            _sig := 1;
            _start := 2;
            _val_max := 7; // = 2^63-1 MOD 10
        ELSIF (str[1] = '-') THEN
            _sig := -1;
            _start := 2;
            _val_max := 8; // = 2^63   MOD 10
        ELSE 
            _sig := 1;
            _start := 1;
            _val_max := 7; // = 2^63-1 MOD 10
        END_IF;

        value := 0;

        IF (_len - _start < 0) THEN
            // no digits.
            StringToAnyInt := FALSE;
            RETURN;        
        END_IF;

        FOR i := _start TO _len DO
            _c := str[i];
            CASE _c OF
                '0' : _val := 0;
                '1' : _val := 1;
                '2' : _val := 2;
                '3' : _val := 3;
                '4' : _val := 4;
                '5' : _val := 5;
                '6' : _val := 6;
                '7' : _val := 7;
                '8' : _val := 8;
                '9' : _val := 9;
            ELSE
                value := 0;
                StringToAnyInt := FALSE;
                RETURN;
            END_CASE;

            IF ((value < 0) OR //previously accepted overflow for minimum of LINT
                // 2^63-1    >9223372036854775807 
                (value > LINT#922337203685477580) OR
                (value = LINT#922337203685477580 AND _val > _val_max)) THEN
                // overflow
                value := LINT#0;
                StringToAnyInt := FALSE;
                RETURN;            
            END_IF;

            value := value * 10;
            value := value + _val;
        END_FOR;        
        value := value * _sig;
        
        StringToAnyInt := TRUE;

    END_FUNCTION

    /// Converts a string to an unsigned 64-bit integer (ULINT).
    ///
    /// This function parses a string and converts it to an unsigned 64-bit integer. It handles
    /// optional '+' signs and checks for overflow. If the string is invalid, the function
    /// returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
    FUNCTION INTERNAL StringToULint: BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : ULINT;
        END_VAR
        VAR_TEMP
            _len : INT;
            i : INT;
            _val : ULINT;
            _start : INT;
            _c : STRING;
        END_VAR

        _len := LengthOf(str);

        IF (str[1] = '+') THEN
            _start := 2;
        ELSE 
            _start := 1;
        END_IF;

        value := ULINT#0;
        
        IF (_len - _start < 0) THEN
            // no digits.
            StringToULint := FALSE;
            RETURN;        
        END_IF;

        

        FOR i := _start TO _len DO

            _c := str[i];
            CASE _c OF
                '0' : _val := ULINT#0;
                '1' : _val := ULINT#1;
                '2' : _val := ULINT#2;
                '3' : _val := ULINT#3;
                '4' : _val := ULINT#4;
                '5' : _val := ULINT#5;
                '6' : _val := ULINT#6;
                '7' : _val := ULINT#7;
                '8' : _val := ULINT#8;
                '9' : _val := ULINT#9;
            ELSE
                value := ULINT#0;
                StringToULint := FALSE;
                RETURN;
            END_CASE;
            
            IF ((value > ULINT#1844674407370955161) OR (value = ULINT#1844674407370955161 AND _val > ULINT#5)) THEN
                //  2^64 - 1 = 18446744073709551616
                // overflow
                value := ULINT#0;
                StringToULint := FALSE;
                RETURN;            
            END_IF;

            value := value * ULINT#10;
            value := value + _val;
        END_FOR;        
        StringToULint := TRUE;
    END_FUNCTION

END_NAMESPACE