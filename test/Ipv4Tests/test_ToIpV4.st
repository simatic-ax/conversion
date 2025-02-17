USING Siemens.Simatic.S71500.IPConfiguration;
USING AxUnit.Assert;
NAMESPACE Ipv4Tests
    {TestFixture}
    CLASS MyTestFixture
        {Test}
        METHOD PUBLIC MyTestMethod
            VAR
                result : BOOL;
                ipv4 : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168.0.1', ipv4);
            Equal(expected := TRUE, actual := result);
            AxUnit.Assert.Equal(expected := BYTE#192, actual := ipv4[1]);
            AxUnit.Assert.Equal(expected := BYTE#168, actual := ipv4[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[3]);
            AxUnit.Assert.Equal(expected := BYTE#1, actual := ipv4[4]);
        END_METHOD

        {Test}
        METHOD PUBLIC TestInvalidIpAddress
            VAR
                result : BOOL;
                ipv4 : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('999.999.999.999', ipv4);
            Equal(expected := FALSE, actual := result);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[1]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[3]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[4]);
        END_METHOD

        {Test}
        METHOD PUBLIC TestEmptyIpAddress
            VAR
                result : BOOL;
                ipv4 : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('', ipv4);
            Equal(expected := FALSE, actual := result);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[1]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[3]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[4]);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIncompleteIpAddress
            VAR
            result : BOOL;
            ipv4 : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168', ipv4);
            Equal(expected := FALSE, actual := result);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[1]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[3]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[4]);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressWithExtraDots
            VAR
                result : BOOL;
                ipv4 : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.168.0.1.1', ipv4);
            Equal(expected := FALSE, actual := result);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[1]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[3]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[4]);
        END_METHOD

        {Test}
        METHOD PUBLIC TestIpAddressWithLetters
            VAR
                result : BOOL;
                ipv4 : IP_V4;
            END_VAR
            result := Simatic.Ax.Conversion.ToIpv4('192.abc.0.1', ipv4);
            Equal(expected := FALSE, actual := result);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[1]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[2]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[3]);
            AxUnit.Assert.Equal(expected := BYTE#0, actual := ipv4[4]);
        END_METHOD
    END_CLASS
END_NAMESPACE