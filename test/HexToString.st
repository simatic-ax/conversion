USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Conversion
    {TestFixture}
    CLASS HexToString
        
        
        {Test (b:= BYTE#16#00, hex := STRING#'00')}
        {Test (b:= BYTE#16#11, hex := STRING#'11')}
        {Test (b:= BYTE#16#22, hex := STRING#'22')}
        {Test (b:= BYTE#16#33, hex := STRING#'33')}
        {Test (b:= BYTE#16#44, hex := STRING#'44')}
        {Test (b:= BYTE#16#55, hex := STRING#'55')}
        {Test (b:= BYTE#16#66, hex := STRING#'66')}
        {Test (b:= BYTE#16#77, hex := STRING#'77')}
        {Test (b:= BYTE#16#88, hex := STRING#'88')}
        {Test (b:= BYTE#16#99, hex := STRING#'99')}
        {Test (b:= BYTE#16#AA, hex := STRING#'AA')}
        {Test (b:= BYTE#16#BB, hex := STRING#'BB')}
        {Test (b:= BYTE#16#CC, hex := STRING#'CC')}
        {Test (b:= BYTE#16#DD, hex := STRING#'DD')}
        {Test (b:= BYTE#16#EE, hex := STRING#'EE')}
        {Test (b:= BYTE#16#FF, hex := STRING#'FF')}

        METHOD PUBLIC Convert_Hex_Byte_To_String

            VAR_INPUT
                b : BYTE;
                hex : STRING;
            END_VAR
            VAR_TEMP
                s : STRING;
            END_VAR

            s := HTA(b);
            Equal(expected := hex, actual := s);
            
        END_METHOD


    END_CLASS
END_NAMESPACE