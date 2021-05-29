//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zTpFuncB | Autor | Jairo Milagre da Fonseca Jr.    | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Teste de funcao de usuario                                             |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zTpFuncB()

    //Declara variaveis e atribui valores
    Local aArea := GetArea()

    //Mostra mensagem e chama funcao estatica
    MsgInfo("Estou na função u_zTpFuncB()", "Atenção")
    fTesteB()

    RestArea(aArea)

Return

/*--------------------------------------------------------------+
| Funcao   : fTesteB                                            |
| Autor    : Jairo Milagre da Fonseca Jr                        |
| Data     : 17/04/2021                                         |
| Descricao: Funcao estatica de teste (vista so dentro do prw)  |
| Sobre    : Funcao estatica so e vista dentro do prw           |  
+--------------------------------------------------------------*/

Static Function fTesteB(cPar1)

    Local aArea := GetArea()
    Default cPar1 := ""

    //Mostrando mensagem
    MsgInfo("Estou em uma função estática <b>(B)</b>, " + cPar1 + "!", "Atenção")

    RestArea(aArea)

Return

/*
Abaixo uma funcao de usuario com o nome similar com a funcao acima, porem ultrapassa 8 caracteres

User Function zTpFuncB2()

Return

*/

/*
Abaixo uma funcao padrao, porem somente e possivel compilar se tiver chave de compilacao

Function zTpFunPad()

Return
*/
