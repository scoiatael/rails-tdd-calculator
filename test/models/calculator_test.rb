require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "self.add" do
    10.times do
      number1 = rand 100
      number2 = rand 100
      assert_equal Calculator.add(number1, number2), (number1+number2)
    end
  end
end
