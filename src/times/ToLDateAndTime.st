USING System.DateTime;
NAMESPACE Simatic.Ax.Conversion.Times

    FUNCTION ToLDateAndTime : LDATE_AND_TIME

        VAR_INPUT
         SimotionDateTime : SimotionDateTime;
        END_VAR

        VAR_TEMP
           u32Date : UDINT;
           u32Year : UDInt;
           u32Month : UDInt;
           u32Days : UDInt;
           b32AuxHours : UDInt;
           boDateReady : Bool;
           HOUR : UDINT;
           MINUTE : UDINT;
           SECOND : UDINT;
           NANOSECOND : UDINT;
        END_VAR

        u32Date := TO_UDINT(SimotionDateTime.SimotionDate);// + UDINT#1;

         // calculation of hours
         HOUR := TO_UDINT(SimotionDateTime.SimotionTime) / UDINT#3600000;
         b32AuxHours := TO_UDINT(SimotionDateTime.SimotionTime) - HOUR * UDINT#3600000;

         // calculation of minutes
         MINUTE := b32AuxHours / UDINT#60000;

         // calculation of seconds
         SECOND :=  (b32AuxHours - MINUTE * UDINT#60000) / UDINT#1000;

         // calculation of mseconds
         NANOSECOND := ( TO_UDINT(SimotionDateTime.SimotionTime) - (HOUR *  UDINT#3600000) - (MINUTE *  UDINT#60000) - (SECOND *  UDINT#1000)) *  UDINT#1000000;

         //Reset values to calculate actual year
         u32Year :=  UDINT#1991;
         u32Days :=  UDINT#0;

         //Detect actual year by adding the days since 01.01.1992
         REPEAT
           //Increase number of years
           u32Year := u32Year +  UDINT#1;
           //If year is a leap-year
           IF  (u32Year MOD  UDINT#4 =  UDINT#0) AND  (u32Year <>  UDINT#2100) THEN //only 2100 is not a leap-year between 1992-2200
             u32Days := u32Days +  UDINT#366;
           ELSE
             u32Days := u32Days +  UDINT#365;
           END_IF;
           //Number of days is greater or equals number of days of SIMOTION system
         UNTIL u32Days >= u32Date
         END_REPEAT;

         u32Days := u32Days;

         //Decrease number of days by number of days of one year
         //If year is a leap-year
         IF  (u32Year MOD  UDINT#4 =  UDINT#0) AND  (u32Year <>  UDINT#2100) THEN //only 2100 is not a leap-year between 1992-2200
           u32Date := u32Date -  (u32Days -  UDINT#366);
         ELSE
           u32Date := u32Date -  (u32Days -  UDINT#365);
         END_IF;

         //Reset values to calculate actual month and day
         u32Month :=  UDINT#1;
         boDateReady := FALSE;

         //Start CASE with value "1" (-> january)
         REPEAT
           CASE u32Month OF
               // for months with 31 days
               UDINT#1,  UDINT#3,  UDINT#5,  UDINT#7,  UDINT#8,  UDINT#10:
               IF  (u32Date <=  UDINT#31) THEN
                 u32Days := u32Date;
                 boDateReady := TRUE;
               ELSE
                 u32Month := u32Month +  UDINT#1;
                 u32Date := u32Date -  UDINT#31;
               END_IF;
               //for february
               UDINT#2:
               IF  (u32Year MOD  UDINT#4 =  UDINT#0) AND  (u32Year <>  UDINT#2100) THEN //only 2100 is not a leap-year between 1992-2200
                 IF  (u32Date <=  UDINT#29) THEN
                   u32Days := u32Date;
                   boDateReady := TRUE;
                 ELSE
                   u32Month := u32Month +  UDINT#1;
                   u32Date := u32Date -  UDINT#29;
                 END_IF;
               ELSE
                 IF  (u32Date <=  UDINT#28) THEN
                   u32Days := u32Date;
                   boDateReady := TRUE;
                 ELSE
                   u32Month := u32Month +  UDINT#1;
                   u32Date := u32Date -  UDINT#28;
                 END_IF;
               END_IF;
               //for months with 30 days
               UDINT#4,  UDINT#6,  UDINT#9,  UDINT#11:
               IF  (u32Date <=  UDINT#30) THEN
                 u32Days := u32Date;
                 boDateReady := TRUE;
               ELSE
                 u32Month := u32Month +  UDINT#1;
                 u32Date := u32Date -  UDINT#30;
               END_IF;
               //for december
               UDINT#12:
               u32Days := u32Date;
               boDateReady := TRUE;
           END_CASE;
           //Correct month and day found
         UNTIL boDateReady = TRUE
         END_REPEAT;

         NewDateAndTime(
                     year := to_int(u32Year),
                     month := to_int(u32Month),
                     day := to_int(u32Days),
                     hour := to_int(hour),
                     minute := to_int(MINUTE),
                     second := to_int(second),
                     millisecond := to_int(NANOSECOND/UDINT#1000000),
                     value => ToLDateAndTime);

    END_FUNCTION

END_NAMESPACE
