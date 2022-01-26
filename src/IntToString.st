USING System.Strings;
USING System.Math;

NAMESPACE Simatic.Ax.Conversion
    FUNCTION SIntToString : STRING[4]
        VAR_INPUT
            value : DINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION IntToString : STRING[6]
        VAR_INPUT
            value : INT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION DIntToString : STRING[11]
        VAR_INPUT
            value : DINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        AnyIntToString(value := value, mode := mode);
    END_FUNCTION

    FUNCTION LIntToString : STRING[20]
        VAR_INPUT
            value : DINT;
            mode : ConversionMode := ConversionMode#NONE;
        END_VAR
        VAR_TEMP
        END_VAR
        AnyIntToString(value := value, mode := mode);
    END_FUNCTION
END_NAMESPACE