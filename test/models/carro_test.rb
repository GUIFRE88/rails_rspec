require 'test_helper'

class CarroTest < ActiveSupport::TestCase
  test "A instancia de Carro precisa ser válida" do
 
   assert Carro.new.present? # Verifica se a calsse de carro existe.

  end
end
