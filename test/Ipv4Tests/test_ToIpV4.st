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
            AxUnit.Assert.Equal(BYTE#192, result[1]);
            AxUnit.Assert.Equal(BYTE#168, result[2]);
            AxUnit.Assert.Equal(BYTE#0, result[3]);
            AxUnit.Assert.Equal(BYTE#1, result[4]);
        END_METHOD
    END_CLASS
END_NAMESPACE