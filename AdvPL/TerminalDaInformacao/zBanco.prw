//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zBanco | Autor | Jairo Milagre da Fonseca Jr.      | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de manipulacao de Banco de dados via AdvPL                     |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zBanco()

    Local aArea     := GetArea()
    Local aAreaB1   := SB1->(GetArea())
    Local cMens     := ""

    //Se a tabela já estiver posicionada
    If Select("SB1") > 0
        MsgStop("Tabela SB1 já está aberta!", "Atenção")
    EndIf

    //Selecionando a tabela de produtos
    dbSelectArea("SB1")
    SB1->(dbSetOrder(1))    //B1_FILIAL+B1_COD
    SB1->(dbGoTop())

    //Posicionando no produto de código
    If SB1->(dbSeek(FWxFilial("SB1") + "000000000000001"))
        Alert(SB1->B1_DESC)
    EndIf

    //Agora, percorro todos os registros e adiciono a ddescricao em uma variavel
    SB1->(dbGoTop())
    While !SB1->(EoF())
        cMens += AllTrim(SB1->B1_DESC) + ";" + Chr(13) + Chr(10)

        SB1->(dbSkip())
    EndDo

    //Mostrando a mensagem
    Aviso('Atenção', cMens, {'OK'}, 03)

    RestArea(aAreaB1)
    RestArea(aArea)

Return

/*
O ideal de usar referencias:
Modo errado:
    dbSelectArea("SB1")

    While ! EoF()
        //Tratamento para o relatorio...
        
        dbSelectArea("SB2")
        //Pega o saldo do produto

        dbSkip()
    EndDo

Modo certo:

    dbSelectArea("SB1")
    dbSelectArea("SB2")

    While ! SB1->(EoF())
        //Tratamento para o relatorio...
        
        dbSelectArea("SB2")
        //Pega o saldo do produto

        SB1->(dbSkip())
    EndDo

*/
