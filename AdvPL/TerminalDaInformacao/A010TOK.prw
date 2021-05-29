//Bibliotecas
#Include "Protheus.ch"

/*--------------------------------------------------------------+
| P.E.     : A010TOK                                            |
| Autor    : Jairo Milagre da Fonseca Jr                        |
| Data     : 20/04/2021                                         |
| Descricao: Funcao que valida o cadastro de produto            |
+--------------------------------------------------------------*/

User Function A010TOK()

    Local aArea     := GetArea()
    Local aAreaB1   := SB1->(GetArea())
    Local lRet      := .T.

    //Mostrando a pergunta
    lRet := MsgYesNo("Confirma o cadastro do <b>" + M->B1_DESC + "</b>?", "Atenção")

    RestArea(aArea)
    RestArea(aAreaB1)

Return lRet
