#language: pt
@EscalaDiaria
Funcionalidade: Escala Diaria

Eu como usuario do sistema
Quero criar uma escala diaria
Para editar posteriormente

Contexto:Acessar tela de Escala Diaria
    Dado que eu esteja na tela de escala diaria

    Cenário: Criar Escala Diaria com todos os dados corretos
    Quando eu preencho os campos de criar escala diaria com os seguintes dados:
    | opm         | C Tel Div Adm Fin      |
    | regime      | 5x2 40h                |
    | descricao   | teste escala           |
    | horaEntrada | 09:00                  |
    | horaSaida   | 18:00                  |
    | folga       | Sábado                 |   
    Então a seguinte mensagem de Escala Diaria deve aparecer "Inclusão efetuada com sucesso."
    E excluo a Escala Diaria criada

    Esquema do Cenario: Campos obrigatórios

    Quando eu preencho os campos de criar escala diaria com os seguintes dados:
    | opm         | C Tel Div Adm Fin      |
    | regime      | 5x2 40h                |
    | descricao   | <descricao>            |
    | horaEntrada | <horaEntrada>          |
    | horaSaida   | <horaSaida>            |
    | folga       | <folga>                |   
    Então a seguinte mensagem de Escala Diaria deve aparecer "<saida>"

    Exemplos:
    | descricao    | horaEntrada | horaSaida | folga       | saida              |
    |              | 09:00       | 18:00     | Sábado      | Descrição          | 
    | teste escala |             | 18:00     | Sábado      | Horário de entrada | 
    | teste escala | 09:00       |           | Sábado      | Horário de saída   | 
    | teste escala | 09:00       | 18:00     |             | 1º Folga           | 