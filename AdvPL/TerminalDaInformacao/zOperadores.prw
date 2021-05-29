//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zOperadores | Autor | Jairo Milagre da Fonseca Jr. | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de Operadores mais comuns em AdvPL                             |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitação.                                      |
+------------------------------------------------------------------------------------+
/*/

User Function zOperadores()

    Local aArea := GetArea()

    //Declaracai de variaveis
    Local nValor1 := 5
    Local nValor2 := 3
    Local cTexto1 := "Jairo Milagre da Fonseca Jr"
    Local cTexto2 := "Jairo"

    //Atribuicao
    nValor1 := 6

    //Manipulacao
    nValor1++    //Soma 1 na variavel.      Outro exemplo: nValor1 =: nValor1 + 1
    nValor1--    //Subtrai 1 na variavel.   Outro exemplo: nValor1 := nValor1 - 1
    nValor1 *= 2 //Multiplica o valor.      Outro exemplo: nValor1 := nValor1 * 2
    nValor1 /= 2 //Divide o valor.          Outro exemplo: nValor1 := nValor1 / 2
    nValor1 += 7 //Soma o valor             Outro exemplo: nValor1 := nValor1 + 7
    nValor1 -= 7 //Subtrai o valor          Outro exemplo: nValor1 := nValor1 - 7

    //Testes
    ConOut("Testes: ")
    ConOut( nValor1 == nValor2 )      //Exatamente igual
    ConOut( !(nValor1 == nValor2) )   //Nega��o de teste
    ConOut( nValor1 != nValor2 )       //Diferente de (tamb�m pode ser usado <>)
    ConOut( cTexto2 $ cTexto1 )       //Est� contigo
    ConOut( nValor1 > nValor2 )       //� maior que (tamb�m pode ser >=, seria maior ou igual)
    ConOut( nValor1 < nValor2 )       //� menor que (tamb�m pode ser <=, seria menor ou igual)

    //Testes compostos
    ConOut("Testes compostos: ")
    ConOut( (1==1) .And. (1!=1) )     //Teste com .And. s� retorna verdadeiro, se todos os testes forem verdadeiro
    ConOut( (1==1) .Or.  (1!=1) )     //Teste com .Or. retorna verdadeiro, se qualquer teste for verdadeiro

    //Macro substitui��o
    &("nValor3 := 8")
    Alert(nValor3)

    RestArea(aArea)

Return
