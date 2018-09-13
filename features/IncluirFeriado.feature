#language: pt
@IncluirFeriado
Funcionalidade: Incluir Feriado

Eu como usuario do sistema
Quero incluir um feriado
Para editar posteriormente

Contexto:Acessar tela de incluir feriado
    Dado que eu esteja na tela de incluir feriado

    Cenário: Incluir feriado com todos os dados corretos
    Quando eu preencho os campos de incluir feriado com os seguintes dados:
    | data        | valida        |
    | descricao   | teste feriado |
    | abrangencia | Nacional      |
    | tipo        | Data Móvel    |
    | entrada     | 0700          |
    | horaSaida   | 0800          |
    Então a seguinte mensagem de incluir feriado deve aparecer "Inclusão efetuada com sucesso."
    E excluo o feriado criado

   Esquema do Cenario: Campos obrigatórios

        Quando eu preencho os campos de incluir feriado com os seguintes dados:
        | data        | <data>        |
        | descricao   | <descricao>   |
        | abrangencia | <abrangencia> |
        | tipo        | <tipo>        |
        | entrada     | <entrada>     |
        | horaSaida   | <horaSaida>   |
        Então a seguinte mensagem de incluir feriado deve aparecer "<saida>"

        Exemplos: 
        | data   | descricao     | abrangencia | tipo       | entrada | horaSaida | saida                                              |
        |        | teste feriado | Nacional    | Data Móvel | 0700   | 0800       | Favor preencher                                    |
        | valida |               | Nacional    | Data Móvel | 0700   | 0800       | Favor preencher                                    |
        | valida | teste feriado |             | Data Móvel | 0700   | 0800       | Favor preencher                                    |
        | valida | teste feriado | Nacional    |            | 0700   | 0800       | Favor preencher                                    |
        | valida | teste feriado | Nacional    | Data Móvel | 0700   | 0600       | Hora de entrada é maior ou igual que Hora de saída |


