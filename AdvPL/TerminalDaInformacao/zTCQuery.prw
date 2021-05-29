//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"

//Constantes
#Define STR_PULA    Chr(13) + Chr(10)

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zTCQuery | Autor | Jairo Milagre da Fonseca Jr.    | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de manipulacao de query via AdvPL                              |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zTCQuery()

    Local aArea     := GetArea()
    Local cQuery    := ""

    //Montando a consulta... Tentem evitar o 'SELECT *' pois isso pode travar o TOPCONN
    cQuery := " select "                                + STR_PULA
    cQuery += "         B1_COD  as CODIGO "             + STR_PULA
    cQuery += "     ,   B1_DESC as DESCRI "             + STR_PULA
    cQuery += " from "                                  + STR_PULA
    cQuery += "     " + RetSQLName("SB1") + " SB1 "     + STR_PULA
    cQuery += " where "                                 + STR_PULA
    cQuery += "         SB1.D_E_L_E_T_ = '' "           + STR_PULA
    cQuery += "     and B1_MSBLQL != '1' "              + STR_PULA
    cQuery := ChangeQuery(cQuery)

    //Executando a consulta
    TCQuery cQuery New Alias "QRY_SB1"
    //TCSetField("QRY_SB1", "CAMPO_DATA", "D")

    //Percorrendo os registros
    While ! QRY_SB1->(EoF())
        ConOut("> QRY_SB1: " + QRY_SB1->CODIGO + " | " + QRY_SB1->DESCRI)
        QRY_SB1->(dbSkip())
    EndDo     

    QRY_SB1->(dbCloseArea())

    RestArea(aArea)

Return
