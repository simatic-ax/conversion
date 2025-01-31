USING Siemens.Simatic.S71500.IPConfiguration;
USING AxUnit.Assert;
NAMESPACE Ipv4Tests
    {TestFixture}
    CLASS MyTestFixture
        {Test}
        METHOD PUBLIC MyTestMethod
            VAR
                result : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168.0.1');
            AxUnit.Assert.Equal(expected := BYTE#192, actual := result[1]);
            AxUnit.Assert.Equal(expected := BYTE#168, actual := result[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := result[3]);
            AxUnit.Assert.Equal(expected := BYTE#1, actual := result[4]);
        END_METHOD
    {Test}
    METHOD PUBLIC TestInvalidIpAddress
        VAR
            result : IP_V4;
        END_VAR
        result := Simatic.Ax.Conversion.ToIpv4('999.999.999.999');
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[1]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[2]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[3]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[4]);
    END_METHOD

    {Test}
    METHOD PUBLIC TestEmptyIpAddress
        VAR
            result : IP_V4;
        END_VAR
        result := Simatic.Ax.Conversion.ToIpv4('');
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[1]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[2]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[3]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[4]);
    END_METHOD

    {Test}
    METHOD PUBLIC TestIncompleteIpAddress
        VAR
            result : IP_V4;
        END_VAR
        result := Simatic.Ax.Conversion.ToIpv4('192.168');
        AxUnit.Assert.Equal(expected := BYTE#192, actual := result[1]);
        AxUnit.Assert.Equal(expected := BYTE#168, actual := result[2]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[3]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[4]);
    END_METHOD

    {Test}
    METHOD PUBLIC TestIpAddressWithExtraDots
        VAR
            result : IP_V4;
        END_VAR
        result := Simatic.Ax.Conversion.ToIpv4('192.168.0.1.1');
        AxUnit.Assert.Equal(expected := BYTE#192, actual := result[1]);
        AxUnit.Assert.Equal(expected := BYTE#168, actual := result[2]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[3]);
        AxUnit.Assert.Equal(expected := BYTE#1, actual := result[4]);
    END_METHOD

    {Test}
    METHOD PUBLIC TestIpAddressWithLetters
        VAR
            result : IP_V4;
        END_VAR
        result := Simatic.Ax.Conversion.ToIpv4('192.abc.0.1');
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[1]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[2]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[3]);
        AxUnit.Assert.Equal(expected := BYTE#0, actual := result[4]);
    END_METHOD
END_CLASS
END_NAMESPACE