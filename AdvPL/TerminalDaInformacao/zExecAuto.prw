//Bibliotecas
#Include "Protheus.ch"
#Include "RwMake.ch"
#Include "TBIConn.ch"

/*----------------------------------------------------------------------------------+
| Rotina    : zExecAuto                                                             | 
| Autor     : Jairo Milagre da Fonseca Jr.                                          | 
| Data      : 17/04/2021                                                            |
+-----------------------------------------------------------------------------------+
| Descricao : Exemplo de gravacao via ExecAuto                                      |
+-----------------------------------------------------------------------------------+
| Uso       : Para treinamento e capacitacao.                                       |
+----------------------------------------------------------------------------------*/

User Function zExecAuto()

    //Declara variaveis e atribui valores
    Local aArea     := GetArea()
    Local aVetor    := {}

    //Variaveis utilizadas pelo ExecAuto (caso queira gravar o log em arquivo texto, 
    //utilize as duas variaveis abaixo)
    //Private lMSHelpAuto     := .T.
    //Private lAutoErrNoFile  := .T.
    Private lMsErroAuto := .F.

    //Adicionando dados no produto para testar inclusao
    aVetor :=   {;
                    {"B1_COD",      "F00007",   Nil},;
                    {"B1_DESC",     "ABACAXI",  Nil},;
                    {"B1_TIPO",     "PA",       Nil},;
                    {"B1_UM",       "UN",       Nil},;
                    {"B1_LOCPAD",   "01",       Nil} ;
                }

    //Iniciando controle de transacao
    Begin Transaction

        //Chamando o cadastro de produtos de forma automatica
        MsExecAuto({|x, y| Mata010(x, y)}, aVetor, 3)
        //3. Inclusao
        //4. Alteracao
        //5. Exclusao

        //Se houver erro
        If lMsErroAuto

            //Caso queira gravar o log em arquivo texto, não se deve usar a rotina 
            //MostraErro, mas sim o trecho abaixo:
            /*
            aLogAuto    := {}
            cLogTxt     := ""

            //Pegando log do ExecAuto
            aLogAuto    := GetAutoGRLog()

            //Percorrendo o Log
            For nAux := 1 To Len(aLogAuto)
                cLogTxt += aLogAuto(nAux) + Chr(13) + Chr(10)
            Next nAux
            */

            //Mostrando erro
            MostraErro()

            //Desarmando a transacao
            DisarmTransaction()

        EndIf

    End Transaction

    RestArea(aArea)

Return
