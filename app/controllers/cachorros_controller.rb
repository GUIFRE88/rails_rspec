class CachorrosController < ApplicationController

    def index

     # Cria o cachorro
    @cachorros = Cachorro.all

    end

end
