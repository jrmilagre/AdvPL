//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zEmbedded | Autor | Jairo Milagre da Fonseca Jr.   | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de utilizacao do Embedded SQL                                  |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zEmbedd()

    //Declarando variaveis
    Local aArea := GetArea()

    //Construindo a consulta
    BeginSql Alias "SQL_SB1"

        //COLUMN F3_ENTRADA AS DATE //Deve-se usar isso para transformar o campo em data
        select
                B1_COD
            ,   B1_DESC
        from
                %table:SB1% SB1
        where
                SB1.%notDel%
            and B1_MSBLQL != '1'

    EndSql

    //Percorrendo os registros
    While ! SQL_SB1->(EoF())
        
        ConOut("# SQL_SB1: " + SQL_SB1->B1_COD + " | " + SQL_SB1->B1_DESC)

        SQL_SB1->(dbSkip())

    EndDo

    SQL_SB1->(dbCloseArea())

    RestArea(aArea)

Return
