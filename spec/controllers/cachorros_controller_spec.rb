require 'rails_helper'

RSpec.describe CachorrosController, type: :controller do 
  
    describe "GET index" do
       
        # Determina que será renderizado o HTML da página
        render_views

        it "Precisa ter a variavel de classe @cachorros" do
           
            # Exclui todos os cachorros
            Cachorro.destroy_all

            # Cria o cachorro
            cachorro = Cachorro.create(nome: "Boomer", raca: "Beagle")
           
            # Chama rota index
            get :index
           
            # Verifica se o valor existe
            expect(assigns(:cachorros)).to eq([cachorro])
        
            # Verifica se está renderizando corretamente a view
            expect(response.status).to eq(200)

        end

    end
    
end
