USING Siemens.Simatic.S71500.IPConfiguration;

NAMESPACE Simatic.Ax.Conversion

CLASS IpHandling
    VAR
        _ipAddress : STRING;
        _port : INT;
        _isSecure : BOOL;
        _ipv4 : IP_V4;
        _isValid : BOOL;
    END_VAR

        METHOD PUBLIC SetIpAddress : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            VAR
                isValid : BOOL;
            END_VAR
            _isValid := THIS._ToIPv4(ipAddress := ipAddress, ipV4 =>_ipv4);
            SetIpAddress := _isValid;
        END_METHOD

        METHOD PRIVATE _ToIPv4 : BOOL
            VAR_INPUT  
                ipAddress : STRING;  // Input IP address as a string
            END_VAR  
            VAR_OUTPUT
                ipV4 : IP_V4;  // Output IP_V4 address
            END_VAR
            

            _ToIPv4 := ToIpV4(ipAddress := ipAddress, ipV4 => ipV4);
        END_METHOD


    METHOD PUBLIC GetIpAddress : IP_V4
        // Implementation to return the IP address as IPv4 or an error
        ;
    END_METHOD

    METHOD SetPort : BOOL
        VAR_INPUT
            portNumber : INT;
        END_VAR
        // Implementation to set the port number
        ;
    END_METHOD

    METHOD GetPort : INT
        // Implementation to get the port number
        ;
    END_METHOD

    METHOD IsSecure : BOOL
        // Implementation to check if the connection is secure (https)
        ;
    END_METHOD

END_CLASS

END_NAMESPACE