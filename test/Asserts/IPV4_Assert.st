USING Simatic.Ax.Conversion;
USING Simatic.Ax.Conversion.Integer;
USING Siemens.Simatic.S71500.IPConfiguration;
USING AxUnit.ResultFunctions;
USING System.Strings;

NAMESPACE AxUnit.Assert
    FUNCTION PUBLIC Equal
        VAR_INPUT
            actual : IP_V4;
            expected : IP_V4;
           
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR

        VAR_TEMP
            result : BOOL;
            i : INT;
            messageOnFail : STRING;
        END_VAR
        
        result := (actual[1] = expected[1]) AND (actual[2] = expected[2]) AND (actual[3] = expected[3]) AND (actual[4] = expected[4]);
        
        IF result THEN
            axunit_Succeed();
        ELSE
            messageOnFail := Concat('Expected [', ByteToString(actual[1]), ', ');
            messageOnFail := Concat(messageOnFail, ByteToString(actual[2]), ', ');
            messageOnFail := Concat(messageOnFail, ByteToString(actual[3]), ', ');
            messageOnFail := Concat(messageOnFail, ByteToString(actual[4]), '] ');
            messageOnFail := Concat(messageOnFail, 'but found: [', ByteToString(expected[1]), ', ');
            messageOnFail := Concat(messageOnFail, ByteToString(expected[2]), ', ');
            messageOnFail := Concat(messageOnFail, ByteToString(expected[3]), ', ');
            messageOnFail := Concat(messageOnFail, ByteToString(expected[4]), ']');
            axunit_Fail(messageOnFail, file, line);
        END_IF;

    END_FUNCTION

    FUNCTION PUBLIC IsTrue
        VAR_INPUT
            condition : BOOL;
           
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR

        IF condition THEN
            axunit_Succeed();
        ELSE
            axunit_Fail('Condition is not true', file, line);
        END_IF;

    END_FUNCTION

    FUNCTION PUBLIC IsFalse
        VAR_INPUT
            condition : BOOL;
           
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR

        IF NOT condition THEN
            axunit_Succeed();
        ELSE
            axunit_Fail('Condition is not false', file, line);
        END_IF;

    END_FUNCTION

END_NAMESPACE