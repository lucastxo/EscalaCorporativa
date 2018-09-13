#language: pt
@IncluirPosto
Funcionalidade: Incluir Posto

Eu como usuario do sistema
Quero incluir um Posto
Para selecionar posteriormente

Contexto:Acessar tela de incluir posto
    Dado que eu esteja na tela de incluir posto

    Cenário: Incluir posto com todos os dados corretos
    Quando eu preencho os campos de Incluir posto com os seguintes dados:
    | opm       | C Tel Div Adm Fin |
    | descricao | teste posto       |
    Então a seguinte mensagem de Incluir posto deve aparecer "Inclusão efetuada com sucesso."
    E excluo o posto criado

    Cenário: Incluir posto sem descricao
    Quando eu preencho os campos de Incluir posto com os seguintes dados:
    | opm       | C Tel Div Adm Fin |
    | descricao |                   |
    Então a seguinte mensagem de Incluir posto deve aparecer "A Descrição é obrigatória"