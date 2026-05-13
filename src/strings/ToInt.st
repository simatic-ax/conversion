USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Strings

    /// Converts a string to a signed 8-bit integer (SINT).
    ///
    /// This function parses a string and converts it to a signed 8-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to a signed 16-bit integer (INT).
    ///
    /// This function parses a string and converts it to a signed 16-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to a signed 32-bit integer (DINT).
    ///
    /// This function parses a string and converts it to a signed 32-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to a signed 64-bit integer (LINT).
    ///
    /// This function parses a string and converts it to a signed 64-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to an unsigned 8-bit integer (USINT).
    ///
    /// This function parses a string and converts it to an unsigned 8-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to an unsigned 16-bit integer (UINT).
    ///
    /// This function parses a string and converts it to an unsigned 16-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to an unsigned 32-bit integer (UDINT).
    ///
    /// This function parses a string and converts it to an unsigned 32-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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

    /// Converts a string to an unsigned 64-bit integer (ULINT).
    ///
    /// This function parses a string and converts it to an unsigned 64-bit integer. If the value
    /// is out of range or invalid, the function returns FALSE and sets the output to 0.
    ///
    /// @param str The input string to convert.
    /// @return TRUE if the conversion is successful, FALSE otherwise.
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