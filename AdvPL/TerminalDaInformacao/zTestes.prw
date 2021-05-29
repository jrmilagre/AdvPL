//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zTestes     | Autor | Jairo Milagre da Fonseca Jr. | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de testes em AdvPL                                             |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zTestes()

    Local aArea     := GetArea()
    Local dDataTst  := Date()
    Local lQuinta   := .F.

    //Teste simples

    //Testando se o dia de hoje � quinta feira
    If Upper(cDoW(dDataTst)) == "THURSDAY"
        lQuinta := .T.
        Alert("Hoje � Quinta!")

    //Sen�o mostra um alerta que hoje n�o � quinta
    Else
        lQuinta := .F.
        Alert("Hoje n�o � Quinta!")
    EndIf

    //Teste composto

    //Se n�o for quinta, e for s�bado
    If !lQuinta .And. Upper(cDow(dDataTst)) == "SATURDAY"
        Alert("Sabad�o!")
    
    //Sen�o, se n�o for quinta e for domingo
    ElseIf !Quinta .And. Upper(cDoW(dDataTst)) == "SUNDAY"
        Alert("Doming�o!")
    EndIf

    //Fazendo case de testes
    Do Case 

        Case Upper(cDoW(dDataTst)) == "MONDAY"
            Alert("Hoje � <b>Segunda</b>")

        Case Upper(cDoW(dDataTst)) == "TUESDAY"
            Alert("Hoje � <b>Ter�a</b>")

        Case Upper(cDoW(dDataTst)) == "WEDNESDAY"
            Alert("Hoje � <b>Quarta</b>")

        Case Upper(cDoW(dDataTst)) == "THURSDAY"
            Alert("Hoje � <b>Quinta</b>")

        Case Upper(cDoW(dDataTst)) == "FRIDAY"
            Alert("Hoje � <b>Sexta</b>")

        Case Upper(cDoW(dDataTst)) == "SATURDAY"
            Alert("Hoje � <b>S�bado</b>")

        Case Upper(cDoW(dDataTst)) == "SUNDAY"
            Alert("Hoje � <b>Domingo</b>")

        OtherWise
            Alert("Hoje � <b>???</b>")
        
    EndCase

    RestArea(aArea)

Return
