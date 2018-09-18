#language: pt
@EditarFeriado
Funcionalidade: Editar Feriado

Eu como usuario do sistema
Quero editar um feriado
Para validar a edição

Contexto:Acessar tela de editar feriado
    Dado que eu esteja na tela de editar feriado

    Cenário: Editar feriado com todos os dados corretos
    Quando eu preencho os campos de Editar feriado com os seguintes dados:
    | descricao | teste feriado |
    Então a seguinte mensagem de Editar feriado deve aparecer "Alteração efetuada com sucesso"
    E excluo o feriado editado criado

    Cenário: Editar feriado com todos os dados corretos
    Quando eu preencho os campos de Editar feriado com os seguintes dados:
    | descricao |      |
    Então a seguinte mensagem de Editar feriado deve aparecer "Descrição"
    E excluo o feriado editado criado

