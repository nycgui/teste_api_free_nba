Dado('a url de consulta de jogadores') do
  @host = busca_url['host']['api_nba']
  path = busca_url['path']['players']
  @url = @host + path
end

Quando('envio a requisicao de consulta de jogadores') do
  @retorno = players.buscar_jogadores(@url)
end

Entao('efetuo a requisicao de consulta de jogadores com sucesso') do
  players.validar_buscar_todos_jogadores(@retorno)
end

Quando('envio a requisicao filtrando {int} jogadores por pagina') do |jogadores|
  @retorno = players.buscar_todos_jogadores_filtro(@url, jogadores)
end

Entao('efetuo a requisicao com sucesso e tenho {int} jogadores por pagina') do |jogadores|
  players.validar_buscar_todos_jogadores(@retorno)
  expect(@retorno['meta']['per_page']).to eql(jogadores)
  expect(@retorno['data'].length).to eql(jogadores)
end

Dado('que realizo a busca de jogadores') do
  steps %(
    Dado a url de consulta de jogadores
    Quando envio a requisicao de consulta de jogadores
    Entao efetuo a requisicao de consulta de jogadores com sucesso
  )
end

Quando('seleciono um jogador e envio a requisicao') do
  @jogadorSelecionado = players.selecionar_jogador(@retorno)
  path = busca_url['path']['player'].gsub("{{idJogador}}", @jogadorSelecionado['id'].to_s)
  url = @host + path
  @retornoJogador = players.buscar_jogadores(url)
end

Entao('efetuo a requisicao de consulta de jogador com sucesso') do
  expect(@retornoJogador.code).to eql(200)
  expect(@retornoJogador['id']).to be == @jogadorSelecionado['id']
  expect(@retornoJogador['first_name']).to be == @jogadorSelecionado['primeiroNome']
  expect(@retornoJogador['last_name']).to be == @jogadorSelecionado['ultimoNome']
end