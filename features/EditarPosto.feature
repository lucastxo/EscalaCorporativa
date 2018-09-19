#language: pt
@EditarPosto
Funcionalidade: Editar Posto

Eu como usuario do sistema
Quero editar um posto
Para validar a edição

Contexto:Acessar tela de editar posto
    Dado que eu esteja na tela de editar posto

    Cenário: Editar posto com todos os dados corretos
    Quando eu preencho os campos de Editar posto com os seguintes dados:
    | opm       | C Tel Div Adm Fin |
    | descricao | teste posto       |
    Então a seguinte mensagem de Editar posto deve aparecer "Alteração efetuada com sucesso"
    E excluo o posto editado criado

    Cenário: Editar posto com todos os dados corretos
    Quando eu preencho os campos de Editar posto com os seguintes dados:
    | opm       | C Tel Div Adm Fin |
    | descricao |                   |
    Então a seguinte mensagem de Editar posto deve aparecer "Descrição"
    E excluo o posto editado criado