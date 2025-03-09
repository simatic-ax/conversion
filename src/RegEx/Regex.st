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
                i, j, startPos, repeatCount : INT;
                charInput, charPattern : CHAR;
                tempMatch : STRING := '';
                repeatMin, repeatMax : INT;
            END_VAR
            Match := FALSE;
            matchFound := FALSE;
            i := 1;
            j := 1;
            startPos := 0;
            WHILE i <= LengthOf(strInput) AND j <= LengthOf(strPattern) DO
                charInput := strInput[i];
                charPattern := strPattern[j];
                CASE charPattern OF
                    // '.':
                    //     IF startPos = 0 THEN
                    //         startPos := i;
                    //     END_IF;
                    //     tempMatch := CONCAT(tempMatch, charInput);
                    //     i := i + 1;
                    //     j := j + 1;
                    'A'..'Z', 'a'..'z', '0'..'9':
                        IF charInput = charPattern THEN
                            IF startPos = 0 THEN
                                startPos := i;
                            END_IF;
                            tempMatch := CONCAT(tempMatch, charInput);
                            i := i + 1;
                            j := j + 1;
                        ELSE
                            tempMatch := '';
                            matchFound := FALSE;
                            EXIT;
                        END_IF;
                    '\':
                        j := j + 1;
                        charPattern := strPattern[j];
                        CASE charPattern OF
                            'd':
                                IF charInput >= '0' AND charInput <= '9' THEN
                                    IF startPos = 0 THEN
                                        startPos := i;
                                    END_IF;
                                    tempMatch := CONCAT(tempMatch, charInput);
                                    i := i + 1;
                                    j := j + 1;
                                    IF strPattern[j] = '{' THEN
                                        j := j + 1;
                                        repeatMin := 0;
                                        repeatMax := 0;
                                        WHILE strPattern[j] <> ',' AND strPattern[j] <> '}' DO
                                            repeatMin := repeatMin * 10 + (TO_INT(TO_BYTE(strPattern[j])) - 48);
                                            j := j + 1;
                                        END_WHILE;
                                        IF strPattern[j] = ',' THEN
                                            j := j + 1;
                                            WHILE strPattern[j] <> '}' DO
                                                repeatMax := repeatMax * 10 + (TO_INT(TO_BYTE(strPattern[j])) - 48);
                                                j := j + 1;
                                            END_WHILE;
                                        ELSE
                                            repeatMax := repeatMin;
                                        END_IF;
                                        j := j + 1;
                                        repeatCount := 1;
                                        WHILE repeatCount < repeatMax AND i <= LengthOf(strInput) DO
                                            IF strInput[i] >= '0' AND strInput[i] <= '9' THEN
                                                tempMatch := CONCAT(tempMatch, strInput[i]);
                                                i := i + 1;
                                                repeatCount := repeatCount + 1;
                                            ELSE
                                                EXIT;
                                            END_IF;
                                        END_WHILE;
                                        IF repeatCount < repeatMin THEN
                                            tempMatch := '';
                                            matchFound := FALSE;
                                            EXIT;
                                        END_IF;
                                    END_IF;
                                ELSE
                                    tempMatch := '';
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
                                    IF strPattern[j] = '{' THEN
                                        j := j + 1;
                                        repeatMin := 0;
                                        repeatMax := 0;
                                        WHILE strPattern[j] <> ',' AND strPattern[j] <> '}' DO
                                            repeatMin := repeatMin * 10 + (TO_INT(TO_BYTE(strPattern[j])) - 48);
                                            j := j + 1;
                                        END_WHILE;
                                        IF strPattern[j] = ',' THEN
                                            j := j + 1;
                                            WHILE strPattern[j] <> '}' DO
                                                repeatMax := repeatMax * 10 + (TO_INT(TO_BYTE(strPattern[j])) - 48);
                                                j := j + 1;
                                            END_WHILE;
                                        ELSE
                                            repeatMax := repeatMin;
                                        END_IF;
                                    END_IF;
                                END_IF;
                                j := j + 1;
                                repeatCount := 0;
                                WHILE repeatCount < repeatMax AND i <= LengthOf(strInput) DO
                                    IF strInput[i] >= '0' AND strInput[i] <= '9' THEN
                                        tempMatch := CONCAT(tempMatch, strInput[i]);
                                        i := i + 1;
                                        repeatCount := repeatCount + 1;
                                    ELSE
                                        EXIT;
                                    END_IF;
                                END_WHILE;
                                IF repeatCount < repeatMin THEN
                                    matchFound := FALSE;
                                    tempMatch := '';
                                    EXIT;
                                END_IF;
                            '.':
                                // IF startPos = 0 THEN
                                //     startPos := i;
                                // END_IF;
                                if (charInput <> '.') THEN
                                    matchFound := FALSE;
                                    tempMatch := '';
                                EXIT;
                                end_if;
                                tempMatch := CONCAT(tempMatch, charInput);
                                i := i + 1;
                                j := j + 1;
                        END_CASE;
                    '^':
                        IF i <> 1 THEN
                            matchFound := FALSE;
                            tempMatch := '';
                            EXIT;
                        END_IF;
                        j := j + 1;
                    '$$':
                        IF i <> LengthOf(strInput) THEN
                            matchFound := FALSE;
                            tempMatch := '';
                            EXIT;
                        END_IF;
                        j := j + 1;
                ELSE
                    matchFound := FALSE;
                    tempMatch := '';
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

        METHOD PUBLIC GetMatch : STRING
            VAR
            END_VAR
            GetMatch := strMatch;
        END_METHOD

        // METHOD PUBLIC IsMatch2 : BOOL
        //     VAR_INPUT
        //         inputStr : STRING;
        //         pattern : STRING;
        //     END_VAR
        //     VAR
        //         i, j, repeatCount : INT;
        //         charInput, charPattern : CHAR;
        //         repeatMin, repeatMax : INT;
        //     END_VAR
        //     IsMatch2 := FALSE;
        //     i := 1;
        //     j := 1;
        //     WHILE i <= LengthOf(inputStr) AND j <= LengthOf(pattern) DO
        //         charInput := inputStr[i];
        //         charPattern := pattern[j];
        //         CASE charPattern OF
        //             '\':
        //                 j := j + 1;
        //                 charPattern := pattern[j];
        //                 CASE charPattern OF
        //                     'd':
        //                         IF charInput >= '0' AND charInput <= '9' THEN
        //                             i := i + 1;
        //                             j := j + 1;
        //                             IF pattern[j] = '{' THEN
        //                                 j := j + 1;
        //                                 repeatMin := 0;
        //                                 repeatMax := 0;
        //                                 WHILE pattern[j] <> ',' AND pattern[j] <> '}' DO
        //                                     repeatMin := repeatMin * 10 + (TO_INT(TO_BYTE(pattern[j])) - 48);
        //                                     j := j + 1;
        //                                 END_WHILE;
        //                                 IF pattern[j] = ',' THEN
        //                                     j := j + 1;
        //                                     WHILE pattern[j] <> '}' DO
        //                                         repeatMax := repeatMax * 10 + (TO_INT(TO_BYTE(pattern[j])) - 48);
        //                                         j := j + 1;
        //                                     END_WHILE;
        //                                 ELSE
        //                                     repeatMax := repeatMin;
        //                                 END_IF;
        //                                 j := j + 1;
        //                                 repeatCount := 1;
        //                                 WHILE repeatCount < repeatMax AND i <= LengthOf(inputStr) DO
        //                                     IF inputStr[i] >= '0' AND inputStr[i] <= '9' THEN
        //                                         i := i + 1;
        //                                         repeatCount := repeatCount + 1;
        //                                     ELSE
        //                                         EXIT;
        //                                     END_IF;
        //                                 END_WHILE;
        //                                 IF repeatCount < repeatMin THEN
        //                                     RETURN;
        //                                 END_IF;
        //                             END_IF;
        //                         ELSE
        //                             RETURN;
        //                         END_IF;
        //                 '.':
        //                     i := i + 1;
        //                     j := j + 1;
        //             END_CASE;
        //             ELSE
        //                 IF charInput = charPattern THEN
        //                     i := i + 1;
        //                     j := j + 1;
        //                 ELSE
        //                     RETURN;
        //                 END_IF;
        //         END_CASE;
        //     END_WHILE;
        //     IF i > LengthOf(inputStr) AND j > LengthOf(pattern) THEN
        //         IsMatch2 := TRUE;
        //     END_IF;
        // END_METHOD
    END_CLASS

   

END_NAMESPACE
