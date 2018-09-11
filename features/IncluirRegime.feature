#language: pt
@IncluirRegime
Funcionalidade: Incluir Regime

Eu como usuario do sistema
Quero incluir regime 
Para editar posteriormente

Contexto:Acessar tela de incluir regime
    Dado que eu esteja na tela de incluir regime

    Cenário: Incluir regime com todos os dados corretos
    Quando eu preencho os campos de incluir regime com os seguintes dados:
    | tipo   | 5x2 |
    | horas  | 80  |
    Então a seguinte mensagem de incluir regime deve aparecer "Inclusão efetuada com sucesso."
    Então excluo o regime criado

    Cenário: Incluir regime sem horas
    Quando eu preencho os campos de incluir regime com os seguintes dados:
    | tipo   | 5x2 |
    | horas  | 0   |
    Então a seguinte mensagem de incluir regime deve aparecer "Favor preencher o campo"

