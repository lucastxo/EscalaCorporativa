#language: pt
@EscalaEfetiva
Funcionalidade: Escala Efetiva

Eu como usuario do sistema
Quero criar uma escala efetiva
Para editar posteriormente

Contexto:Acessar tela de Escala efetiva
    Dado que eu esteja na tela de escala efetiva

    Cenário: Criar Escala efetiva com todos os dados corretos
    Quando eu preencho os campos de criar escala efetiva com os seguintes dados:
    | opm          | C Tel Div Op                |
    | horario      | teste (Operacional)         |
    | posto        | teste                       |
    | pm           | MAJ PM 876243A TOCACELLI    |
    | funcao       | Chefe de Subseção           |
    | viatura      | 12-95                       |
    | policiamento | FORÇA TÁTICA                | 
    Então a seguinte mensagem de Escala efetiva deve aparecer "Inclusão efetuada com sucesso."
    E excluo a Escala efetiva criada

    Esquema do Cenario: Campos obrigatórios

    Quando eu preencho os campos de criar escala efetiva com os seguintes dados:
    | opm          | C Tel Div Op                |
    | horario      | <horario>                   |
    | posto        | <posto>                     |
    | pm           | MAJ PM 876243A TOCACELLI    |
    | funcao       | <funcao>                    |
    | viatura      | 12-95                       |
    | policiamento | FORÇA TÁTICA                | 
    Então a seguinte mensagem de Escala efetiva deve aparecer "<saida>"

    Exemplos:
    | horario                | posto       | funcao            | saida              |
    |                        | teste       | Chefe de Subseção | Horário/Equipe     |
    | teste (Operacional)    | teste       |                   | Função             | 