class Players
  include Auxiliar

  def buscar_jogadores(url)
    retorno = metodo_get(url, ACESSOS[:rapidapiNba])
  end

  def buscar_todos_jogadores_filtro(url, jogadores)
    query = {'per_page' => jogadores}
    headers = ACESSOS[:rapidapiNba]
    retorno = metodo_get_query(url, headers, query)
  end

  def validar_buscar_todos_jogadores(retorno)
    raise"Falha ao efetuar busca de jogadores, obtido: #{retorno}" if retorno.code != 200
    raise"Nenhum jogador foi encontrado, obtido: #{retorno}" if retorno['data'].empty?
  end

  def selecionar_jogador(retorno)
    escolhido = rand(0..retorno['data'].length - 1)
    idJogador = retorno['data'][escolhido]['id']
    primeiroNome = retorno['data'][escolhido]['first_name']
    ultimoNome = retorno['data'][escolhido]['last_name']
    jogador = {
      'id' => idJogador,
      'primeiroNome' => primeiroNome,
      'ultimoNome' => ultimoNome
    }
  end
end