//Bibliotecas
#Include "Protheus.ch"

/*/
+------------------------------------------------------------------------------------+
| Rotina    | zPessoa | Autor | Jairo Milagre da Fonseca Jr.     | Data | 20.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Criacao da classe Pessoa                                               |
+------------------------------------------------------------------------------------+
| Uso       | Para treinamento e capacitacao.                                        |
+------------------------------------------------------------------------------------+
/*/

Class zPessoa

    //Atributos
    Data cNome
    Data nIdade
    Data dNascimento

    //Metodos
    Method New() CONSTRUCTOR
    Method MostraIdade()

EndClass

/*/
+------------------------------------------------------------------------------------+
| Rotina    | New | Autor | Jairo Milagre da Fonseca Jr.         | Data | 20.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Metodo que cria a instancia com a classe zPessoa                       |
+------------------------------------------------------------------------------------+
| Params.   | cNome, Caracter, Nome da pessoa                                        |
|           | dNascimento, Data, Data de nascimento da pessoa                        |
+------------------------------------------------------------------------------------+
| Exemplo   | oObjeto := zPessoa():New("Joao", sToD("19800712"))                     |
+------------------------------------------------------------------------------------+
/*/

Method New(cNome, dNascimento) Class zPessoa

    //Atribuindo valores nos atributos dos objeto instanciado
    ::cNome         := cNome
    ::dNascimento   := dNascimento
    ::nIdade        := fCalcIdade(dNascimento)

Return Self

/*/
+------------------------------------------------------------------------------------+
| Rotina    | New | Autor | Jairo Milagre da Fonseca Jr.         | Data | 20.04.2021 |
+------------------------------------------------------------------------------------+
| Descricao | Metodo que mostra a idade da pessoa                                    |
+------------------------------------------------------------------------------------+
| Exemplo   | oObjeto := MostraIdade()                                               |
+------------------------------------------------------------------------------------+
/*/

Method MostraIdade() Class zPessoa

    Local cMsg := ""

    //Criando e mostrando a mensagem
    cMsg :=     "A <b>pessoa</b> " + ::cNome + " tem " + cValToChar(::nIdade) + " anos!"
    MsgInfo(cMsg, "Atenção")

Return

/*--------------------------------------------------------------+
| Funcao   : fCalcIdade                                         |
| Autor    : Jairo Milagre da Fonseca Jr                        |
| Data     : 20/04/2021                                         |
| Descricao: Funcao que calcula a idade da pessoa               |
+--------------------------------------------------------------*/

Static Function fCalcIdade(dNascimento)

    Local nIdade

    //Chamando a funcao YearSub para subtrair os anos de uma data
    nIdade := DateDiffYear(Date(), dNascimento)

Return nIdade
