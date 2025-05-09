NAMESPACE Simatic.Ax.Conversion.Times

    /// Represents a date and time in the Simotion format.
    ///
    /// This structure contains two DWORD values:
    /// - `SimotionDate`: The number of days since 01.01.1992.
    /// - `SimotionTime`: The time of day in milliseconds.
    TYPE 
        SimotionDateTime : STRUCT
            SimotionDate : DWORD; // Days since 01.01.1992
            SimotionTime : DWORD; // Time of day in milliseconds
        END_STRUCT;
    END_TYPE

END_NAMESPACE
