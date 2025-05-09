NAMESPACE Simatic.Ax.Conversion

    /// Represents the conversion mode for integer-to-string operations.
    ///
    /// This type defines the available modes for formatting integer-to-string conversions:
    /// - `NONE`: No special formatting is applied.
    /// - `FORCE_SIGN`: Forces the inclusion of a '+' sign for positive numbers.
    TYPE
        ConversionMode : WORD (NONE := WORD#16#0000, FORCE_SIGN := WORD#16#0001) := NONE;
    END_TYPE

END_NAMESPACE