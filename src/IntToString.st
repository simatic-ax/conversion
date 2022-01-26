USING System.Strings;
NAMESPACE Simatic.Ax.Conversion.Integer
    FUNCTION ToString : STRING[4]
        VAR_INPUT
            value : SINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION ToString : STRING[4]
        VAR_INPUT
            value : USINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION ToString : STRING[6]
        VAR_INPUT
            value : INT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION ToString : STRING[6]
        VAR_INPUT
            value : UINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION


    FUNCTION ToString : STRING[11]
        VAR_INPUT
            value : DINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION ToString : STRING[11]
        VAR_INPUT
            value : UDINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION ToString : STRING[20]
        VAR_INPUT
            value : LINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        ToString := AnyIntToString(value := value, mode := mode);
    END_FUNCTION

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