//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zCadPessoa | Autor | Jairo Milagre da Fonseca Jr.  | Data | 20.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Funcao que testa a classe Pessoa                                       |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

User Function zCadPessoa()

    Local oPessoa
    Local cNome         := "José"
    Local dNascimento   := sToD("19850712")

    //Instanciando o objeto atraves da classe Pessoa
    oPessoa := zPessoa():New(cNome, dNascimento)

    //Chamando um metodo da classe
    oPessoa:MostraIdade()

Return
