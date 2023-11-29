NAMESPACE Simatic.Ax.Conversion.Times
    
    {TestFixture}
    CLASS TestLDateAndTimeToSimotionDateTime

        {Test}
        METHOD PUBLIC CheckStartTime
            //test with 1ms added from initial time
            VAR_TEMP
                inputTimestamp : LDATE_AND_TIME := LDT#1992-01-01-00:00:00.001;
                retval : SimotionDateTime;
                simotionDate : DWORD;
                simotionTime : DWORD;
            END_VAR
            retval := ToSimotionDateTime(inputTimestamp);
            AxUnit.Assert.Equal(retval.simotionTime , DWORD#1);
            AxUnit.Assert.Equal(retval.simotionDate , DWORD#1);
        END_METHOD

        {Test}
        METHOD PUBLIC CheckCurrentTime
            VAR_TEMP
                inputTimestamp : LDATE_AND_TIME := LDT#2023-10-31-15:57:03.483;
                retval : SimotionDateTime;
            END_VAR

            retval := ToSimotionDateTime(inputTimestamp);
            //the values have been read from a simotion plc and converted, so they proven to be valid
            AxUnit.Assert.Equal(retval.SimotionTime , DWORD#57423483);
            AxUnit.Assert.Equal(retval.SimotionDate , DWORD#11627);

        END_METHOD

    END_CLASS

END_NAMESPACE
