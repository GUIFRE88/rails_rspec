require 'rails_helper'

RSpec.describe "Este teste é para a classe de cliente" do
   
    it "Testa a instancia de cliente" do 

        expect(Cliente.new).to be_present

    end

    it "Testa as propriedades da instancia cliente" do 

        cliente = Cliente.new

        # Verifica se os atributos existem
        expect(cliente.respond_to?(:nome)).to be_truthy
        expect(cliente.respond_to?(:telefone)).to be_truthy
        expect(cliente.respond_to?(:cpf)).to be_truthy

    end

end
