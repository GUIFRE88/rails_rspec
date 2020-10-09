json.extract! carro, :id, :nome, :descricao, :created_at, :updated_at
json.url carro_url(carro, format: :json)
