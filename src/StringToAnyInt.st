USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
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
            _sig : INT;
            _start : INT;
            _c : STRING;
        END_VAR

        _len := LengthOf(str);

        IF (str[1] = '+') THEN
            _sig := 1;
            _start := 2;
        ELSIF (str[1] = '-') THEN
            _sig := -1;
            _start := 2;
        ELSE 
            _sig := 1;
            _start := 1;
        END_IF;
        value := 0;
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
            value := value * 10;
            value := value + _val;
        END_FOR;        
        value := value * _sig;
        IF (_sig = 1 AND value < 0) OR (_sig = -1 AND value > 0) THEN
            value := 0;
            StringToAnyInt := FALSE;
        ELSE
            StringToAnyInt := TRUE;
        END_IF;
        ;
    END_FUNCTION

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
        ;
    END_FUNCTION
END_NAMESPACE