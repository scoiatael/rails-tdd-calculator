require 'test_helper'

class CalculatorTest < ActiveSupport::TestCase

  def random_num
    rand 100
  end

  def randomize_num!
    @num = random_num
  end

  def randomize2_num!
    randomize_num!
    @num2 = random_num
  end

  def initialize_calc!
    randomize_num!
    @calc = Calculator.new value: @num
  end

  test "self.add" do
    10.times do
      randomize2_num!
      assert_equal Calculator.add(@num, @num2), (@num + @num2)
    end
  end

  test "can hold a number" do
    initialize_calc!
    assert_equal @num, @calc.value
  end

  test "&:add" do
    initialize_calc!
    10.times do
      randomize_num!
      assert_equal (@num + @calc.value), @calc.add(@num)
    end
  end

  test "&:add!" do
    10.times do
      initialize_calc!
      randomize_num!
      old_val = @calc.value
      @calc.add! @num
      assert_equal @calc.value, (old_val + @num)
    end
  end
end
