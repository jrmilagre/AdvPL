//Bibliotecas
#Include "Protheus.ch"

/*----------------------------------------------------------------------------------+
| Rotina    : zIndPos                                                               | 
| Autor     : Jairo Milagre da Fonseca Jr.                                          | 
| Data      : 17/04/2021                                                            |
+-----------------------------------------------------------------------------------+
| Descricao : Funcao de exemplo de indices e posicionamento                         |
+-----------------------------------------------------------------------------------+
| Uso       : Para treinamento e capacitacao.                                       |
+----------------------------------------------------------------------------------*/

User Function zIndPos()

    // Declarando variaveis
    Local aArea     := GetArea()
    Local cDescri   := ""

    dbSelectArea("SB1")
    SB1->(dbSetOrder(1))    //Nesta funcao, parametrizo que irei utilizar o indice 1...
                            //apos o 9, na tabela de indices sera gravado A (10), B (11), C (12) ...
    SB1->(dbGoTop())        //Garante que apos a ordenacao, minha tabela fique no topo

    //Posicionamento conforme dbSeek, onde passo os campos na sequencia do indice...
    //utilizamos a FWxFilial que retorna a filial atual para esta tabela
    If SB1->(dbSeek(FWxFilial("SB1") + "F00001"))

        MsgInfo("Descrição 1: " + SB1->B1_DESC, "Atenção")

    EndIf

    //Tambem posso utilizar o dbOrderNickName, caso o indice tenha um apelido, por exemplo:
    //SE1->(dbOrderNickName("TITPAI"))

    //Por ultimo, existe tambem a funcao Posicione, que me retorna um campo de qualquer tabela
    cDescri :=  Posicione(;
                    "SB1",;                                 //Alias da tabela
                    1,;                                     //Indice de pesquisa
                    FWxFilial("SB1") + "F00002",;           //Chave da pesquisa
                    "B1_DESC")                              //Campo de retorno
    
    MsgInfo("Descricao 2: " + cDescri, "Atenção")

    RestArea(aArea)

Return
