require 'test_helper'

class MathControllerTest < ActionController::TestCase
  test "add without arguments" do
    assert_raise ActionController::ParameterMissing do
      get :add
    end
  end

  test "add with arguments" do
    num1 = rand(100)
    num2 = rand(100)
    get :add, { arg1: num1, arg2: num2 }
    assert_equal (num1+num2), assigns(:value)
  end

end
