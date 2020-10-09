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
       
        it "Esta rota precisa renderizar o template index" do 
            
            # Chama rotina index
            get :index

            # Verifica se teve o retorno da pagina Index
            expect(response).to render_template("index")

        end

        it "Verifica se o código foi inserido na pagina" do 
            
            # Cria cachorro
            cachorro = Cachorro.create(nome: "Boomer", raca: "Beagle")

            # Chama a rota index
            get :index

            # Verifica se no body existe uma lista de cachorros
            expect(response.body).to match /<ul>.*?<li>/im

        end


    end
end
