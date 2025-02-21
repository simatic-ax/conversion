USING AxUnit.Assert;
USING Simatic.Ax.RegularExpression;

NAMESPACE RegexTests
    {TestFixture}
    CLASS Test_RegexClass
        VAR
            Regex, Regex_Stateless : Regex;
        END_VAR

        {TestSetup}
        METHOD PUBLIC TestSetup
            Regex := Regex_Stateless;
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchIpAddress_1
            VAR
                pattern : STRING := '\d{1,3}.';
                input : STRING := '192.168.0.1';
                expected_match : STRING := '192.';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsTrue(result);
            Equal(actual := Regex.GetMatch(), expected := expected_match);
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchIpAddress
            VAR
                pattern : STRING := '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := '192.168.0.1';
                expected_match : STRING := '192.168.0.1';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsTrue(result);
            Equal(actual := Regex.GetMatch(), expected := expected_match);
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchIpAddressWith4Digits
            VAR
                pattern : STRING := '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := '1922.168.0.1';
                expected_match : STRING := '';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsFalse(result);
            Equal(actual := Regex.GetMatch(), expected := expected_match);

        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchIpAddressWithHttp
            VAR
                pattern : STRING := '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := 'http://192.168.0.1';
                expected_match : STRING := '192.168.0.1';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsTrue(result);
            Equal(actual := Regex.GetMatch(), expected := expected_match);

        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchInvalidIpAddress
            VAR
                pattern : STRING := '^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := '999.999.999.999';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsFalse(result);
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchHttpUrl
            VAR
                pattern : STRING := '^http:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := 'http://192.168.0.1';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsTrue(result);
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchHttpsUrl
            VAR
                pattern : STRING := '^https:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := 'https://192.168.0.1';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsTrue(result);
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchUrlWithPort
            VAR
                pattern : STRING := '^https?:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}:\d+$$';
                input : STRING := 'https://192.168.0.1:443';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsTrue(result);
        END_METHOD

        {Test}
        METHOD PUBLIC TestMatchInvalidUrl
            VAR
                pattern : STRING := '^https?:\/\/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$$';
                input : STRING := 'ftp://192.168.0.1';
                result : BOOL;
            END_VAR
            Regex.SetInput(input);
            Regex.SetPattern(pattern);
            result := Regex.Match();
            IsFalse(result);
        END_METHOD
    END_CLASS
END_NAMESPACE