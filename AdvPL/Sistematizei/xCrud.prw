#Include 'Protheus.ch'
#Include 'RWMAKE.CH'
#Include 'FONT.CH'
#Include 'COLORS.CH'

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
    Private cCodigo    := Space(5)
    Private cGEndereco := Space(20)
    Private cGNome     := Space(10)

    //Declaração de Variaveis Private dos Objetos
    SetPrvt("oDlg1","oCodigo","oSNome","oSEndereco","oGet1","oGNome","oGEndereco","oBIncluir","oBMostrarTodos")

    //Definicao do Dialog e todos os seus componentes
    oDlg1      := MSDialog():New( 223,731,383,1269,"CRUD - AdvPL",,,.F.,,,,,,.T.,,,.T. )
    oCodigo    := TSay():New( 028,012,{||"Codigo"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSNome     := TSay():New( 028,080,{||"Nome"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oSEndereco := TSay():New( 028,148,{||"Endereco"},oDlg1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
    oGet1      := TGet():New( 036,012,,oDlg1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","",,)
    oGNome     := TGet():New( 036,080,{|u| If(PCount()>0,cGNome:=u,cGNome)},oDlg1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGNome",,)
    oGEndereco := TGet():New( 036,148,{|u| If(PCount()>0,cGEndereco:=u,cGEndereco)},oDlg1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cGEndereco",,)
    oBIncluir  := TButton():New( 036,216,"Incluir",oDlg1,,037,012,,,,.T.,,"",,,,.F. )
    oBMostrarT := TButton():New( 052,012,"Mostrar todos",oDlg1,,037,012,,,,.T.,,"",,,,.F. )

    oDlg1:Activate(,,,.T.)

Return
