NAMESPACE Simatic.Ax.Conversion.Times
    
    {TestFixture}
    CLASS TestSimotionDateTimeToLDateAndTime
    
        {Test}
        METHOD PUBLIC CheckStartTime
            //test with 1ms added from initial time
            VAR_TEMP
                timestamp : LDATE_AND_TIME;
                SimotionDateTime : SimotionDateTime;
            END_VAR
            SimotionDateTime.SimotionDate := DWORD#1;
            SimotionDateTime.SimotionTime := DWORD#1;
            timestamp := ToLDateAndTime(SimotionDateTime);
            AxUnit.Assert.Equal(timestamp = LDATE_AND_TIME#1992-01-01-00:00:00.001, TRUE);
        END_METHOD
    
        {Test}
        METHOD PUBLIC CheckCurrentTime
            VAR_TEMP
                timestamp : LDATE_AND_TIME;
                SimotionDateTime : SimotionDateTime;
            END_VAR
            SimotionDateTime.SimotionDate := DWORD#11627;
            SimotionDateTime.SimotionTime := DWORD#57423483;
            timestamp := ToLDateAndTime(SimotionDateTime);
            //the values have been read from a simotion plc and converted, so they proven to be valid
            AxUnit.Assert.Equal(timestamp = LDT#2023-10-31-15:57:03.483, TRUE);
    
        END_METHOD
    
    END_CLASS

END_NAMESPACE
