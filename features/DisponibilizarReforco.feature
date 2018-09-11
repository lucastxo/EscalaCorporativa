#language: pt
@DisponibilizarReforco
Funcionalidade: Disponibilizar Reforco

Eu como usuario do sistema
Quero disponibilizar um reforco
Para editar posteriormente

Contexto:Acessar tela de Disponibilizar Reforco
    Dado que eu esteja na tela de Disponibilizar Reforco

    Cenário: Disponibilizar Reforco com todos os dados corretos
    Quando eu preencho os campos de Disponibilizar Reforco com os seguintes dados:
    | origem      | C Tel Div Adm Fin |
    | destino     | C Tel             |
    | data        | valida            |
    | PM          | Gustavo           |
    Então a seguinte mensagem de Disponibilizar Reforco deve aparecer "Inclusão efetuada com sucesso."
    E excluo a disponibilizacao criada