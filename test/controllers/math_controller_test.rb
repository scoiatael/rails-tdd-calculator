require 'test_helper'

class MathControllerTest < ActionController::TestCase
  test "get add without arguments" do
    assert_raise ActionController::ParameterMissing do
      get :add
    end
  end

  test "get add with value arguments" do
    10.times do
      num1 = rand(100)
      num2 = rand(100)
      get :add, { value: num1, value2: num2 }
      assert_equal (num1+num2), assigns(:value)
    end
  end

  test "get add with id arguments" do
  end

  test "post add with id arguments" do
  end

  test "post add with value arguments" do
  end

  test "post create without arguments" do
  end

  test "post create with arguments" do
  end

end
