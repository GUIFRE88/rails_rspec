require 'rails_helper'

RSpec.describe "Este teste é para a classe de cachorro" do
   
    it "Testa a instancia de cachorro" do 

        expect(Cachorro.new).to be_present

    end

    it "Testa as propriedades da instancia cachorro" do 

        cachorro = Cachorro.new

        # Verifica se os atributos existem
        expect(cachorro.respond_to?(:nome)).to be_truthy
        expect(cachorro.respond_to?(:raca)).to be_truthy

    end

    it "Testa o metodo save" do 

        cachorro = Cachorro.new
        cachorro.nome = "Boomer"
        cachorro.raca = "Beagle"

        # Verifica se é possível salvar os dados
        expect(cachorro.save).to be_truthy

    end

    it "Testa o metodo para alterar o registro" do 

        cachorro = Cachorro.new
        cachorro.nome = "Boomer"
        cachorro.raca = "Beagle"
        cachorro.save

        novo_nome = "Boomer " + DateTime.now.to_s
        c2 = Cachorro.find(cachorro.id)
        c2.nome = novo_nome

        # Verifica se é possível salvar os dados
        expect(c2.save).to be_truthy

        # Verifica se o dado está alterado na base de dados
        expect(Cachorro.where(nome: novo_nome).count > 0 ).to be_truthy

    end

    it "Testa o metodo para excluir o registro" do 

        novo_nome = "Boomer - Deletar " + DateTime.now.to_s

        cachorro = Cachorro.new
        cachorro.nome = novo_nome
        cachorro.raca = "Beagle"
        cachorro.save

        # Verifica se o dado existe na base de dados
        expect(Cachorro.where(nome: novo_nome).count > 0 ).to be_truthy

        # Apaga o registro no banco
        cachorro.destroy

        # Verifica se o dado não existe mais ba base de dados
        expect(Cachorro.where(nome: novo_nome).count == 0 ).to be_truthy


    end

end