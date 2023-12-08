NAMESPACE AxUnit.Assert

    FUNCTION Equal
        VAR_INPUT
            expected : STRING;
            actual : STRING;
        END_VAR
        Equal(expected := TRUE, actual := expected = actual);
        ;
    END_FUNCTION

END_NAMESPACE