#language: pt

@jogadores
Funcionalidade: Validar consultas de jogadores
  Eu como QA
  Desejo validar o funcionamento da sessao de jogadores na api free nba

@jogadores_todos
  Cenario: Valida busca de todos jogadores
    Dado a url de consulta de jogadores
    Quando envio a requisicao de consulta de jogadores
    Entao efetuo a requisicao de consulta de jogadores com sucesso

@jogadores_todos_filtro
  Esquema do Cenario: Valida busca de todos jogadores com filtro
    Dado a url de consulta de jogadores
    Quando envio a requisicao filtrando <quantidadeJogadores> jogadores por pagina
    Entao efetuo a requisicao com sucesso e tenho <quantidadeJogadores> jogadores por pagina
    Exemplos:
    | quantidadeJogadores |
    | 21                  |
    | 1                   |
    | 4                   |

  @jogador
  Cenario: Valida busca de todos jogadores
    Dado que realizo a busca de jogadores
    Quando seleciono um jogador e envio a requisicao
    Entao efetuo a requisicao de consulta de jogador com sucesso