#language: pt
@IncluirFuncao
Funcionalidade: Incluir Funcao

Eu como usuario do sistema
Quero incluir uma funcao
Para editar posteriormente

Contexto:Acessar tela de incluir Funcao
    Dado que eu esteja na tela de incluir funcao

    Cenário: Incluir funcao com todos os dados corretos
    Quando eu preencho os campos de incluir funcao com os seguintes dados:
    | funcao | teste funcao |
    Então a seguinte mensagem de incluir funcao deve aparecer "Inclusão efetuada com sucesso"
    E excluo a funcao criada

    Cenário: Incluir funcao sem funcao
    Quando eu preencho os campos de incluir funcao com os seguintes dados:
    | funcao |     |
    Então a seguinte mensagem de incluir funcao deve aparecer "Favor preencher"