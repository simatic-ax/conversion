USING AxUnit.ResultFunctions;
NAMESPACE AxUnit.Assert

    FUNCTION Equal
        VAR_INPUT
            expected : STRING;
            actual : STRING;
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR
        IF expected = actual THEN
            axunit_Succeed();
        ELSE
            axunit_Fail('Condition is not true', file, line);
        END_IF;
        Equal(expected := TRUE, actual := expected = actual);
        ;
    END_FUNCTION

END_NAMESPACE