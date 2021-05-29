//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zOperadores | Autor | Jairo Milagre da Fonseca Jr. | Data | 17.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Exemplo de lacos de repeticao em AdvPL                                 |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zLacos()

    //Declaracao de variaveis e atribuicao de valores
    Local aArea     := GetArea()
    Local nValor    := 1
    Local cNome     := ""

    //Exemplo de For (fazer do valor de 1 a 10)
    For nValor := 1 To 10
    Next
    Alert("For (++): " + cValToChar(nValor))

    //Exemplo de For Inverso (fazer do valor de 10 a 1)
    For nValor := 10 To 1 Step -1
    Next
    Alert("For (--): " + cValToChar(nValor))

    //Exemplo de While (faca enquanto o valor for diferente de 10) ... Também pode ser utilizado o Do While
    nValor := 1
    While nValor != 10
        nValor++
    EndDo
    Alert("While: " + cValToChar(nValor))

    //Exemplo de While composto (mais de 1 teste no laco de repeticao)
    nValor := 1
    While nValor != 10 .And. cNome != "Jairo"
        //Se chegar no meio do laco
        If nValor == 5
            cNome := "Jairo"
        EndIf

        nValor++

    EndDo
    Alert("While composto: " + cValToChar(nValor))

    //Exemplo de quebra de laco de repeticao (fazer do valor de 1 ate 10 incrementando de 2 em 2)
    For nValor := 0 To 10 Step 2
        //Se o valor for igual a 6, diminui um valor (sera 5), e pula o laco
        If nValor == 6
            nValor--
            Loop
        EndIf

        //Se o valor for igual a 7, encerra o laco de repeticao
        If nValor == 7
            Exit
        EndIf

    Next nValor
    Alert("For (Quebra): " + cValToChar(nValor))

    RestArea(aArea)

Return
