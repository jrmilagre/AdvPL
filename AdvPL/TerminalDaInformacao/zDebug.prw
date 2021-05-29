//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zDebug | Autor | Jairo Milagre da Fonseca Jr.      | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de gravacao de dados via Reclock                               |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zDebug()

    Local aArea     := GetArea()
    Local aProds    := {}
    Local nSequen   := 0

    //Selecionando a tabela de produtos e posicionando no topo
    dbSelectArea("SB1")
    SB1->(dbSetOrder(1))
    SB1->(dbGoTop())

    //Enquanto nao for o fim do arquivo popula array
    While ! SB1->(EoF())
        aAdd(aProds, {SB1->B1_COD, SB1->B1_DESC, SB1->B1_TIPO})
        nSequen++
        SB1->(dbSkip())
    EndDo

    Alert(nSequen)
    
    RestArea(aArea)

Return
