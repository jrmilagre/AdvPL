#Include 'Protheus.ch'
#Include 'RwMake.ch'
#Include 'Font.ch'
#Include 'Colors.ch'

/*/{Protheus.doc} CRUD

CRUD AdvPL.

@type function
@author Jairo Milagre da Fonseca Jr
@since 02/06/2021
@version P12.1.27

@return nulo
/*/

User Function xCrud

    //Declaração de cVariable dos componentes
    Private cGCod      := Space(5)
    Private cGEnder    := Space(20)
    Private cGNome     := Space(10)
    Private aDados     := {}            //Array de armazenamento dos registros

    //Declaração de Variaveis Private dos Objetos
    SetPrvt("oDlg1","oSCod","oSNome","oSEndereco","oGCod","oGNome","oGEnder","oBIncluir","oBMostrarTodos")

    //Definicao do Dialog e todos os seus componentes
    //Tela principal
    oDlg1      := MSDialog():New( 223,731,383,1269,"CRUD - AdvPL",,,.F.,,,,,,.T.,,,.T. )

    //Rotulos dos campos
    oSCod      := TSay():New( 028,012,{||"Codigo"   },oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSNome     := TSay():New( 028,080,{||"Nome"     },oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSEndereco := TSay():New( 028,148,{||"Endereco" },oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)

    //Campos
    oGCod      := TGet():New( 036,012,{|u| If(PCount()>0,cGCod:=u,cGCod)    },oDlg1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGCod"     ,,)
    oGNome     := TGet():New( 036,080,{|u| If(PCount()>0,cGNome:=u,cGNome)  },oDlg1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNome"    ,,)
    oGEnder    := TGet():New( 036,148,{|u| If(PCount()>0,cGEnder:=u,cGEnder)},oDlg1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGEnder"   ,,)

    //Botoes
    oBIncluir  := TButton():New( 036,216,"Incluir",oDlg1,{|u| fIncluir(cGCod, cGNome, cGEnder), cGCod := Space(5), cGNome := Space(10), cGEnder := Space(20)},037,012,,,,.T.,,"",,,,.F.)
    oBMostrar  := TButton():New( 052,012,"Mostrar todos",oDlg1,{|u| fMostrar()},037,012,,,,.T.,,"",,,,.F.)
    oBBuscar   := TButton():New( 052,080,"Buscar"       ,oDlg1,{|u| fBuscar()} ,037,012,,,,.T.,,"",,,,.F.)

    //Ativacao da tela
    oDlg1:Activate(,,,.T.)

Return

/*--------------------------------------------------------------+
| Funcao   : fIncluir                                           |
| Autor    : Jairo Milagre da Fonseca Jr                        |
| Data     : 17/04/2021                                         |
+---------------------------------------------------------------+
| Descricao: Funcao para incluir registro                       |
+--------------------------------------------------------------*/

Static Function fIncluir(cCodigo, cNome, cEnder)

    If Empty(AllTrim(cCodigo)) .Or. Empty(AllTrim(cNome)) .Or. Empty(AllTrim(cEnder))

        Alert("Existem campos vazios, favor preencher", "Atenção")

    Else

        //Grava registro no banco de dados
        dbSelectArea("ZA1")

        ZA1->(dbGoBottom())     //Posiciona a tabela no ultimo registro logico

        RecLock("ZA1", .T.)     

        ZA1->ZA1_COD    := cCodigo
        ZA1->ZA1_NOME   := cNome
        ZA1->ZA1_ENDER  := cEnder

        MsUnlock()

        ZA1->(dbCloseArea())

        MsgInfo("Inclusão realizada com sucesso", "Aviso")

    EndIf


Return

/*--------------------------------------------------------------+
| Funcao   : fMostrar                                           |
| Autor    : Jairo Milagre da Fonseca Jr                        |
| Data     : 17/04/2021                                         |
+---------------------------------------------------------------+
| Descricao: Funcao para inclusao de registro no array          |
+--------------------------------------------------------------*/

Static Function fMostrar()

    Local cMsg      := ""
    
    dbSelectArea("ZA1") //Seleciona a tabela
    ZA1->(dbGoTop())    //Posiciona no primeiro registro

    If ZA1->(RecCount()) = 0    //Verifica se existe(m) registro(s) na tabela

        Alert("Não há dados para exibir!", "Atenção")

        ZA1->(dbCloseArea())

    Else

        While !ZA1->(EoF()) //Laco percorrendo a tabela enquanto nao for o ultimo registro

            cMsg += " Código: "       + ZA1->ZA1_COD
            cMsg += " | Nome: "       + ZA1->ZA1_NOME
            cMsg += " | Endereço: "   + ZA1->ZA1_ENDER + Chr(13) + Chr(10)

            ZA1->(dbSkip()) //Salta para o proximo registro

        EndDo

        ZA1->(dbCloseArea())

        MsgInfo(cMsg, "Aviso")

    EndIf

Return

/*--------------------------------------------------------------+
| Funcao   : fBuscar                                            |
| Autor    : Jairo Milagre da Fonseca Jr                        |
| Data     : 03/06/2021                                         |
+---------------------------------------------------------------+
| Descricao: Funcao para buscar registro                        |
+--------------------------------------------------------------*/

Static Function fBuscar()

    dbSelectArea("ZA1")
    ZA1->(dbSetOrder(1))

    If !ZA1->(dbSeek(xFilial("ZA1") + cGCod))

        Alert("Não há dados para exibir!", "Atenção!")

    Else

        MsgInfo("Registro encontrado com sucesso!", "Sucesso")
        cGNome  := ZA1->ZA1_NOME
        cGEnder := ZA1->ZA1_ENDER

    EndIf

    ZA1->(dbCloseArea())

Return


