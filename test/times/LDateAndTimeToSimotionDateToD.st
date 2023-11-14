NAMESPACE Simatic.Ax.Conversion.Times
    
    {TestFixture}
    CLASS TestLDateAndTimeToSimotionDateToD

        {Test}
        METHOD PUBLIC CheckStartTime
            //test with 1ms added from initial time
            VAR_TEMP
                inputTimestamp : LDATE_AND_TIME := LDT#1992-01-01-00:00:00.001;
                simotionDate : DWORD;
                simotionTime : DWORD;
            END_VAR
            LDateAndTimeToSimotionDateToD(inputTimestamp, simotionTime, simotionDate);
            AxUnit.Assert.Equal(simotionTime , DWORD#1);
            AxUnit.Assert.Equal(simotionDate , DWORD#1);
        END_METHOD

        {Test}
        METHOD PUBLIC CheckCurrentTime
            VAR_TEMP
                inputTimestamp : LDATE_AND_TIME := LDT#2023-10-31-15:57:03.483;
                simotionDate : DWORD;
                simotionTime : DWORD;
            END_VAR

            LDateAndTimeToSimotionDateToD(SimaticTime := inputTimestamp, simotionTime => simotionTime, simotionDate => simotionDate);
            //the values have been read from a simotion plc and converted, so they proven to be valid
            AxUnit.Assert.Equal(simotionTime , DWORD#57423483);
            AxUnit.Assert.Equal(simotionDate , DWORD#11627);

        END_METHOD

    END_CLASS

END_NAMESPACE
