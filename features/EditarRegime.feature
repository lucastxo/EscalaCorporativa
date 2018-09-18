#language: pt
@EditarRegime
Funcionalidade: Editar Regime

Eu como usuario do sistema
Quero editar um regime
Para validar a edição

Contexto:Acessar tela de editar regime
    Dado que eu esteja na tela de editar regime

    Cenário: Editar Regime com todos os dados corretos
    Quando eu preencho os campos de Editar Regime com os seguintes dados:
    | tipo   | 5x2 |
    | horas  | 80  |
    Então a seguinte mensagem de Editar Regime deve aparecer "Alteração efetuada com sucesso"
    E excluo o regime editado criada

    Cenário: Editar Regime sem horas
    Quando eu preencho os campos de Editar Regime com os seguintes dados:
    | tipo   | 5x2 |
    | horas  |     |
    Então a seguinte mensagem de Editar Regime deve aparecer "Quantidade mínima horas semana"
    E excluo o regime editado criada
