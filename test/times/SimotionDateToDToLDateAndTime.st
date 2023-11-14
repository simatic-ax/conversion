NAMESPACE Simatic.Ax.Conversion.Times
    
    {TestFixture}
    CLASS TestSimotionDateToDToLDateAndTime
    
        {Test}
        METHOD PUBLIC CheckStartTime
            //test with 1ms added from initial time
            VAR_TEMP
                timestamp : LDATE_AND_TIME;
                simotionDate : DWORD := DWORD#1;
                simotionTime : DWORD := DWORD#1;
            END_VAR
            timestamp := SimotionDateToDToLDateAndTime(SimotionTime := simotionTime, SimotionDate := simotionDate);
            AxUnit.Assert.Equal(timestamp = LDATE_AND_TIME#1992-01-01-00:00:00.001, TRUE);
        END_METHOD
    
        {Test}
        METHOD PUBLIC CheckCurrentTime
            VAR_TEMP
                timestamp : LDATE_AND_TIME;
                simotionDate : DWORD := DWORD#11627;
                simotionTime : DWORD := DWORD#57423483;
            END_VAR
            timestamp := SimotionDateToDToLDateAndTime(SimotionTime := simotionTime, SimotionDate := simotionDate);
            //the values have been read from a simotion plc and converted, so they proven to be valid
            AxUnit.Assert.Equal(timestamp = LDT#2023-10-31-15:57:03.483, TRUE);
    
        END_METHOD
    
    END_CLASS

END_NAMESPACE
