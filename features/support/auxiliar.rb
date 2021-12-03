module Auxiliar
  def busca_url
    YAML.load_file("#{Dir.pwd}/features/support/config/urls.yml")
  end

  def metodo_get(url, headers)
    HTTParty.get(url, headers: headers)
  end

  def metodo_get_query(url, headers, query)
    HTTParty.get(url, headers: headers, query: query)
  end
end