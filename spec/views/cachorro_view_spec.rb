require 'rails_helper'

RSpec.describe CachorrosController, type: :controller do 
  
    describe "GET index test view" do
       
        # Determina que será renderizado o HTML da página
        render_views

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

        it "Verifica se existe um cachorro determinado" do 
            
            # Cria cachorro
            cachorro01 = Cachorro.create(nome: "Boomer 01", raca: "Beagle")
            cachorro02 = Cachorro.create(nome: "Boomer 02", raca: "Beagle")

            # Chama a rota index
            get :index

            # Faz a verificação utilizando Nokogiri
            html = Nokogiri::XML(response.body)

            # Como foi cadastrado 2 itens anteriormente, verifica se esses 2 itens existem em tela
            expect( html.css("li").size > 0 ).to be_truthy 

            # Verifica se os valores existem nas linhas
            expect( html.css("li")[0].text).to eq("Boomer 01")
            expect( html.css("li")[1].text).to eq("Boomer 02")


            # Verifica se no body existe uma lista de cachorros
            #expect(response.body).to match /Boomer 01/im
            #expect(response.body).to match /Boomer 02/im

        end

    end

end
