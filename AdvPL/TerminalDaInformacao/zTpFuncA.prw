//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zTpFuncA | Autor | Jairo Milagre da Fonseca Jr.    | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Teste de funcao de usuario                                             |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zTpFuncA()

    //Declara variaveis e atribui valores
    Local aArea := GetArea()

    /*Chamada de funcao padrao
    Mata010()
    */

    //Chamada de funcao de usuario
    u_zTpFuncB()

    //Chamada de funcao estatica no mesmo prw
    fTesteA()

    //Chamada de funcao estatica de outro prw
    StaticCall(zTpFuncB, fTesteB, "Jairo")


    RestArea(aArea)

Return

Static Function fTesteA(cPar1)

    Local aArea := GetArea()
    Default cPar1 := ""

    //Mostrando mensagem
    MsgInfo("Estou em uma função estática <b>(A)</b>, " + cPar1 + "!", "Atenção")

    RestArea(aArea)

Return
