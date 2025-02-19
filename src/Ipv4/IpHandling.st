USING Siemens.Simatic.S71500.IPConfiguration;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion

    CLASS IpHandling
        VAR
            _ipAddress : STRING;
            _port : UINT;
            _isSecure : BOOL;
            _ipv4 : IP_V4;
            _isValid : BOOL;
        END_VAR

        // Public Methods
        METHOD PUBLIC SetIpAddress : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            _isValid := THIS._ToIpV4(ipAddress := ipAddress, ipV4 => _ipv4);
            IF _isValid THEN
                THIS._GetPort(ipAddress := ipAddress, Port => _port);
                _isSecure := THIS._IsHttps(ipAddress := ipAddress);
            END_IF;
            SetIpAddress := _isValid;
        END_METHOD

        METHOD PUBLIC GetIpAddress : IP_V4
            GetIpAddress := _ipv4;
        END_METHOD

        METHOD PUBLIC SetPort : BOOL
            VAR_INPUT
                portNumber : UINT;
            END_VAR
            _port := portNumber;
        END_METHOD

        METHOD PUBLIC GetPort : UINT
            GetPort := _port;
        END_METHOD

        METHOD PUBLIC IsSecure : BOOL
            IsSecure := _isSecure;
        END_METHOD

        // Private Methods
        METHOD PRIVATE _ToIpV4 : BOOL
            VAR_INPUT  
                ipAddress : STRING;  
            END_VAR  
            VAR_OUTPUT
                ipV4 : IP_V4;  
            END_VAR
            
            _ToIpV4 := THIS._ConvertToIpV4(THIS._CleanIpAddress(ipAddress), ipV4);
        END_METHOD  
        
        METHOD PRIVATE _CleanIpAddress : STRING
            VAR_INPUT
                ipAddress : STRING;  
            END_VAR
            VAR
                cleanedIpAddress : STRING;  
                protocolEndPos : INT;  
                portPos : INT;  
            END_VAR
            
            IF PositionOf(ipAddress, 'http://') = 1 THEN
                protocolEndPos := 8;
            ELSIF PositionOf(ipAddress, 'https://') = 1 THEN
                protocolEndPos := 9;
            ELSE
                protocolEndPos := 1;
            END_IF;
            cleanedIpAddress := Substring(ipAddress, protocolEndPos, LengthOf(ipAddress) - protocolEndPos + 1);
            
            portPos := PositionOf(cleanedIpAddress, ':');
            IF portPos > 0 THEN
                cleanedIpAddress := Substring(cleanedIpAddress, 1, portPos - 1);
            END_IF;
            
            _CleanIpAddress := cleanedIpAddress;
        END_METHOD
        
        METHOD PRIVATE _ConvertToIpV4 : BOOL
            VAR_INPUT
                ipAddress : STRING;  
            END_VAR
            VAR
                ipParts : ARRAY[1..4] OF DINT;  
                dotPos : INT;  
                prevDotPos : INT;  
                i : INT;  
                part : STRING;  
                restString : STRING;  
                partLength : INT;  
                isValid : BOOL;  
            END_VAR
            VAR_OUTPUT
                ipV4 : IP_V4;  
            END_VAR
            
            prevDotPos := 1;  
            i := 1;  
            restString := ipAddress;
            isValid := TRUE;  
            
            REPEAT  
                dotPos := PositionOf(restString, '.');  
                IF dotPos = 0 THEN  
                    dotPos := LengthOf(restString) + 1; 
                END_IF;
                partLength := dotPos - 1; 
                part := Substring(restString, 1, partLength);  
                IF NOT Strings.ToInt(part, ipParts[i]) OR ipParts[i] < 0 OR ipParts[i] > 255 THEN
                    ipParts[i] := 0;
                    isValid := FALSE;  
                END_IF;
                restString := Substring(restString, dotPos + 1, LengthOf(restString) - dotPos); 
                i := i + 1;  
            UNTIL LengthOf(restString) = 0
            END_REPEAT;  
              
            IF i <> 5 THEN
                isValid := FALSE;
            END_IF;
            
            IF isValid THEN
                FOR i := 1 TO 4 DO  
                    ipV4[i] := TO_BYTE(ipParts[i]);  
                END_FOR;
            END_IF;
            
            _ConvertToIpV4 := isValid;
        END_METHOD
        
        METHOD PRIVATE _GetPort : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            VAR_OUTPUT
                port : UINT;
            END_VAR
            VAR
                portPos : INT;
                portStr : STRING;
                portInt : UINT;
            END_VAR
            
            portPos := PositionOf(ipAddress, ':');
            IF portPos > 0 THEN
                portStr := Substring(ipAddress, portPos + 1, LengthOf(ipAddress) - portPos);
                IF PositionOf(portStr, ':') > 0 THEN
                    portStr := Substring(portStr, PositionOf(portStr, ':') + 1, LengthOf(portStr) - PositionOf(portStr, ':'));
                END_IF;
                IF Strings.ToInt(portStr, portInt) AND portInt >= UINT#0 AND portInt <= UINT#65535 THEN
                    port := portInt;
                    _GetPort := TRUE;
                ELSE
                    port := UINT#0;  // Invalid port
                    _GetPort := FALSE;
                END_IF;
            ELSE
                port := UINT#0;  // No port found
                _GetPort := FALSE;
            END_IF;
        END_METHOD

        METHOD PRIVATE _IsHttp : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            _IsHttp := PositionOf(ipAddress, 'http://') = 1;
        END_METHOD
        
        METHOD PRIVATE _IsHttps : BOOL
            VAR_INPUT
                ipAddress : STRING;
            END_VAR
            _IsHttps := PositionOf(ipAddress, 'https://') = 1;
        END_METHOD

    END_CLASS

END_NAMESPACE
