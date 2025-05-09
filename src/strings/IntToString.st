USING System.Strings;

NAMESPACE Simatic.Ax.Conversion.Integer

    /// Converts a signed 8-bit integer (SINT) to a string.
    ///
    /// This function converts a signed 8-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The signed 8-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[4]
        VAR_INPUT
            value : SINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    /// Converts an unsigned 8-bit integer (USINT) to a string.
    ///
    /// This function converts an unsigned 8-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The unsigned 8-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[4]
        VAR_INPUT
            value : USINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    /// Converts a signed 16-bit integer (INT) to a string.
    ///
    /// This function converts a signed 16-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The signed 16-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[6]
        VAR_INPUT
            value : INT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    /// Converts an unsigned 16-bit integer (UINT) to a string.
    ///
    /// This function converts an unsigned 16-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The unsigned 16-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[6]
        VAR_INPUT
            value : UINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION


    /// Converts a signed 32-bit integer (DINT) to a string.
    ///
    /// This function converts a signed 32-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The signed 32-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[11]
        VAR_INPUT
            value : DINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    /// Converts an unsigned 32-bit integer (UDINT) to a string.
    ///
    /// This function converts an unsigned 32-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The unsigned 32-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[11]
        VAR_INPUT
            value : UDINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    /// Converts a signed 64-bit integer (LINT) to a string.
    ///
    /// This function converts a signed 64-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The signed 64-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[20]
        VAR_INPUT
            value : LINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    /// Converts an unsigned 64-bit integer (ULINT) to a string.
    ///
    /// This function converts an unsigned 64-bit integer to its string representation.
    /// The conversion supports an optional mode parameter to customize the output format.
    ///
    /// @param value The unsigned 64-bit integer to convert.
    /// @param mode The conversion mode (e.g., force sign).
    /// @return A string representation of the input integer.
    FUNCTION ToString : STRING[21]
        VAR_INPUT
            value : ULINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := ULintToString(value := value, mode := mode);
    END_FUNCTION

END_NAMESPACE