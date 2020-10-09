require 'test_helper'

class ClienteTest < ActiveSupport::TestCase

    test "A instancia de cliente precisa ser válida" do
 
        assert Cliente.new.present? # Verifica se a calsse de cliente existe.
 
    end

    test "Verificando propriedades do Objeto Cliente" do
 
        # Cria instância do modelo Cliente
        cliente = Cliente.new

        # Verifica se tem todos os campos dentro do modelo
        campos = cliente.respond_to?(:nome) && cliente.respond_to?(:telefone) && cliente.respond_to?(:cpf)

        assert campos
 
    end

end
