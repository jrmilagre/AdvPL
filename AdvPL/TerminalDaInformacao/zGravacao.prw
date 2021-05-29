//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zGravacao | Autor | Jairo Milagre da Fonseca Jr.   | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de gravacao de dados via Reclock                               |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zGravacao()

    Local aArea := GetArea()

    //Abrindo a tabela de produtos e setando o indice
    dbSelectArea("SB1")
    SB1->(dbSetOrder(1)) //B1_FILIAL + B1_COD
    SB1->(dbGoTop())

    //Iniciando a transacao, tudo dentro da transacao, pode ser desarmado (cancelado)
    Begin Transaction

        MsgInfo("Antes da Alteração!", "Atenção")

        //Se conseguir posicionar no codigo E00001
        If SB1->(dbSeek(FWxFilial("SB1") + "E00001"))
            //Quando passo .F. no RecLock, o registro é travado para Alteracao
            RecLock("SB1", .F.)
                B1_COD  := "XXX1"
                B1_DESC := AllTrim(SB1->B1_DESC) + "."
            SB1->(MsUnlock())

            /*
                Ao inves de so utilizar o :=, pode-se tambem utilizar o comando Replace:
                Replace [CAMPO] With [CONTEUDO]
                Replace B1_X_CAMPO With "XXX"
            */

        EndIf

        //Quando passo .T. no RecLock, o registro é travado para Inclusao
        RecLock("SB1", .T.)
            SB1->B1_FILIAL  := FWxFilial("SB1")
            SB1->B1_COD     := "XXX2"
            SB1->B1_DESC    := "TESTE"
        SB1->(MsUnlock())

        MsgInfo("Após a Alteração!", "Atenção")

        //Ao desarmar a transacao, toda a manipulacao de dados eh cancelada
        DisarmTransaction()

    End Transaction

    //Se conseguir posicionar no produto de codigo E00001
    If SB1->(dbSeek(FWxFilial("SB1") + "E00001"))
        //Quando faco a alteracao fora de uma transacao, automaticamente os dados sao salvos
        RecLock("SB1", .F.)
            B1_DESC := AllTrim(SB1->B1_DESC) + "."
        SB1->(MsUnlock())
    EndIf

    RestArea(aArea)

Return
