USING Siemens.Simatic.S71500.IPConfiguration;
USING System.Strings;
NAMESPACE Simatic.Ax.Conversion
    FUNCTION ToIpV4 : IP_V4  
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
        END_VAR  
          
        // Initialisierung  
        prevDotPos := 1;  
        i := 1;  
        restString := ipAddress;
        // Zerlegen der IP-Adresse in ihre Bestandteile  
        REPEAT  
            dotPos := PositionOf(restString, '.');  
            IF dotPos = 0 THEN  
                dotPos := LengthOf(restString) + 1; // Ende des Strings erreichen  
            END_IF;
            partLength := dotPos - 1; // Länge des Teils berechnen  
            part := Substring(restString, 1, partLength);  
            Strings.ToInt(part, ipParts[i]);  
            restString := Substring(restString, dotPos + 1, LengthOf(restString) - dotPos); // Reststring aktualisieren  
            i := i + 1;  
        UNTIL  i > 4  
        END_REPEAT;  
          
        // Konvertieren der Teile in Bytes und in den IP_V4 Array speichern  
        FOR i := 1 TO 4 DO  
            ToIpV4[i] := TO_BYTE(ipParts[i]);  
        END_FOR;
    END_FUNCTION  
END_NAMESPACE