USING System.DateTime;
NAMESPACE Simatic.Ax.Conversion.Times
    FUNCTION ToSimotionDateTime : SimotionDateTime
        VAR_INPUT
            SimaticTime : LDATE_AND_TIME;
        END_VAR

        VAR_TEMP
            actDays : INT;
            actMonth : INT;
            actYear : INT;
            actHour : INT;
            actMinute : INT;
            actSecond : INT;
            actMillisecond : INT;
            elapsedYears : INT;
            elapsedDays : DINT;
            loop : DINT;
        END_VAR

        //we ignore microseconds and nanoseconds, since they are supported by the destination data type
        SplitDateAndTime(value := SimaticTime,
        year => actYear,
        month => actMonth,
        day => actDays,
        hour => actHour,
        minute => actMinute,
        second => actSecond,
        millisecond => actMillisecond);

        //add number of days from full years, subtracting the current year
        FOR loop := 1992 TO (actYear - 1) DO
            IF loop MOD 4 = 0 AND loop <> 2100 THEN
                elapsedDays := elapsedDays + 366;
            ELSE
                elapsedDays := elapsedDays + 365;
            END_IF;
        END_FOR;

        //add days from full months of the current year
        IF actMonth > 1 THEN
            elapsedDays := elapsedDays + 31;
        END_IF;
        IF actMonth > 2 THEN
            IF actYear MOD 4 = 0 AND NOT (actYear = 2100) THEN
                elapsedDays := elapsedDays + 29;
            ELSE
                elapsedDays := elapsedDays + 28;
            END_IF;
        END_IF;
        IF actMonth > 3 THEN
            elapsedDays := elapsedDays + 31;
        END_IF;
        IF actMonth > 4 THEN
            elapsedDays := elapsedDays + 30;
        END_IF;
        IF actMonth > 5 THEN
            elapsedDays := elapsedDays + 31;
        END_IF;
        IF actMonth > 6 THEN
            elapsedDays := elapsedDays + 30;
        END_IF;
        IF actMonth > 7 THEN
            elapsedDays := elapsedDays + 31;
        END_IF;
        IF actMonth > 8 THEN
            elapsedDays := elapsedDays + 31;
        END_IF;
        IF actMonth > 9 THEN
            elapsedDays := elapsedDays + 30;
        END_IF;
        IF actMonth > 10 THEN
            elapsedDays := elapsedDays + 31;
        END_IF;
        IF actMonth > 11 THEN
            elapsedDays := elapsedDays + 30;
        END_IF;

        //add days from current month
        elapsedDays := elapsedDays + actDays;

        ToSimotionDateTime.SimotionDate := TO_DWORD(elapsedDays);
        ToSimotionDateTime.SimotionTime := TO_DWORD (TO_UDINT(actMillisecond) + UDINT#1000 * (TO_UDINT(actSecond) + UDINT#60 * (TO_UDINT(actMinute + 60 * ( actHour)))));

    END_FUNCTION

END_NAMESPACE
