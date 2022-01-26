USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings
    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : SINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#127;
            MIN_VAL : LINT := LINT#-128;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := SINT#0;
            ToInt := FALSE;
        ELSE
            value := TO_SINT(_val);
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : INT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#32767;
            MIN_VAL : LINT := LINT#-32768;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := SINT#0;
            ToInt := FALSE;
        ELSE
            value := TO_INT(_val);
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : DINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#2147483647;
            MIN_VAL : LINT := LINT#-2147483648;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := SINT#0;
            ToInt := FALSE;
        ELSE
            value := TO_DINT(_val);
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : LINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#9223372036854775807;
            MIN_VAL : LINT := LINT#-9223372036854775808;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := SINT#0;
            ToInt := FALSE;
        ELSE
            value := _val;
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : USINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#255;
            MIN_VAL : LINT := LINT#0;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := USINT#0;
            ToInt := FALSE;
        ELSE
            value := TO_USINT(_val);
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : UINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#65535;
            MIN_VAL : LINT := LINT#0;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := USINT#0;
            ToInt := FALSE;
        ELSE
            value := TO_UINT(_val);
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : UDINT;
        END_VAR
        VAR_TEMP
            _val : LINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : LINT := LINT#4294967295;
            MIN_VAL : LINT := LINT#0;
        END_VAR

        ToInt := StringToAnyInt(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := USINT#0;
            ToInt := FALSE;
        ELSE
            value := TO_UDINT(_val);
        END_IF;
    END_FUNCTION

    FUNCTION ToInt : BOOL
        VAR_INPUT
            str : STRING;
        END_VAR
        VAR_OUTPUT
            value : ULINT;
        END_VAR
        VAR_TEMP
            _val : ULINT;
        END_VAR
        VAR CONSTANT
            MAX_VAL : ULINT := ULINT#18446744073709551615;
            MIN_VAL : ULINT := ULINT#0;
        END_VAR

        ToInt := StringToULint(str := str, value => _val);
        
        IF (_val < MIN_VAL) OR (_val > MAX_VAL) THEN
            value := USINT#0;
            ToInt := FALSE;
        ELSE
            value := _val;
        END_IF;
    END_FUNCTION

END_NAMESPACE