USING System.Strings;

NAMESPACE Simatic.Ax.RegularExpression

    CLASS Regex
        VAR
            strInput : STRING;
            strPattern : STRING;
            strMatch : STRING;
            matchFound : BOOL;
        END_VAR
(* Methode: Initialisierung *)

        METHOD Init
            VAR
            END_VAR
            strInput := '';
            strPattern := '';
            strMatch := '';
            matchFound := FALSE;
        END_METHOD
(* Methode: Setzt den regulären Ausdruck *)

        METHOD PUBLIC SetPattern
            VAR_INPUT
                pattern : STRING;
            END_VAR
            strPattern := pattern;
        END_METHOD
(* Methode: Setzt die zu überprüfende Zeichenkette *)

        METHOD PUBLIC SetInput
            VAR_INPUT
                inputStr : STRING;
            END_VAR
            strInput := inputStr;
        END_METHOD
(* Methode: Prüft, ob der Input zur Regex passt *)

        METHOD PUBLIC Match : BOOL
            VAR
                i, j, startPos : INT;
                charInput, charPattern : CHAR;
                tempMatch : STRING := '';
            END_VAR
            Match := FALSE;
            matchFound := FALSE;
            i := 1;
            j := 1;
            startPos := 0;
            WHILE i <= LengthOf(strInput) AND j <= LengthOf(strPattern) DO
                charInput := Substring(strInput, i, 1)[1];
                charPattern := Substring(strPattern, j, 1)[i];
                CASE charPattern OF
                    '.':
                        IF startPos = 0 THEN
                            startPos := i;
                        END_IF;
                        tempMatch := CONCAT(tempMatch, charInput);
                        i := i + 1;
                        j := j + 1;
                    'A'..'Z', 'a'..'z', '0'..'9':
                        IF charInput = charPattern THEN
                            IF startPos = 0 THEN
                                startPos := i;
                            END_IF;
                            tempMatch := CONCAT(tempMatch, charInput);
                            i := i + 1;
                            j := j + 1;
                        ELSE
                            matchFound := FALSE;
                            EXIT;
                        END_IF;
                    '\':
                        j := j + 1;
                        charPattern := Substring(strPattern, j, 1)[1];
                        CASE charPattern OF
                            'd':
                                IF charInput >= '0' AND charInput <= '9' THEN
                                    IF startPos = 0 THEN
                                        startPos := i;
                                    END_IF;
                                    tempMatch := CONCAT(tempMatch, charInput);
                                    i := i + 1;
                                    j := j + 1;
                                ELSE
                                    matchFound := FALSE;
                                    EXIT;
                                END_IF;
                            'w':
                                IF (charInput >= 'A' AND charInput <= 'Z') OR (charInput >= 'a' AND charInput <= 'z') OR (charInput >= '0' AND charInput <= '9') OR (charInput = '_') THEN
                                    IF startPos = 0 THEN
                                        startPos := i;
                                    END_IF;
                                    tempMatch := CONCAT(tempMatch, charInput);
                                    i := i + 1;
                                    j := j + 1;
                                ELSE
                                    matchFound := FALSE;
                                    EXIT;
                                END_IF;
                        ELSE
                            matchFound := FALSE;
                            EXIT;
                        END_CASE;
                    '[':
                        j := j + 1;
                        matchFound := FALSE;
                        WHILE Substring(strPattern, j, 1) <> ']' DO
                            IF Substring(strPattern, j, 2) = '-Z' THEN
                                IF charInput >= Substring(strPattern, j - 1, 1) AND charInput <= 'Z' THEN
                                    matchFound := TRUE;
                                END_IF;
                            ELSIF charInput = Substring(strPattern, j, 1) THEN
                                matchFound := TRUE;
                            END_IF;
                            j := j + 1;
                        END_WHILE;
                        IF matchFound = FALSE THEN
                            EXIT;
                        END_IF;
                        IF startPos = 0 THEN
                            startPos := i;
                        END_IF;
                        tempMatch := CONCAT(tempMatch, charInput);
                        i := i + 1;
                        j := j + 1;
                    '^':
                        IF i <> 1 THEN
                            matchFound := FALSE;
                            EXIT;
                        END_IF;
                        j := j + 1;
                    '$$':
                        IF i <> LengthOf(strInput) THEN
                            matchFound := FALSE;
                            EXIT;
                        END_IF;
                        j := j + 1;
                ELSE
                    matchFound := FALSE;
                    EXIT;
                END_CASE;
            END_WHILE;
            IF LengthOf(tempMatch) > 0 THEN
                matchFound := TRUE;
                strMatch := tempMatch;
            ELSE
                matchFound := FALSE;
                strMatch := '';
            END_IF;
            Match := matchFound;
        END_METHOD
(* Methode: Gibt den gefundenen Match zurück *)

        METHOD GetMatch : STRING
            VAR
            END_VAR
            GetMatch := strMatch;
        END_METHOD
    END_CLASS

END_NAMESPACE
