require 'test_helper'

class MathControllerTest < ActionController::TestCase
  def raisesParamMissing
    assert_raise ActionController::ParameterMissing, &Proc.new
  end

  test "get add without arguments" do
    raisesParamMissing { get :add }
    raisesParamMissing { get :add, id: 2 }
    raisesParamMissing { get :add, value: 2 }
  end

  test "get add with value arguments" do
    10.times do
      randomize2_num!
      get :add, { value: @num, value2: @num2 }
      assert_equal (@num + @num2), assigns(:value)
    end
  end

  test "get add with id arguments assigns calculator" do
    randomize_num!
    get :add, { value: @num, id: 1 }
    assert_equal Calculator.find(1), assigns(:calculator)
  end

  test "get add with id arguments assigns correct value" do
    10.times do
      randomize_num!
      get :add, { value: @num, id: 1 }
      assert_equal (@num + Calculator.find(1).value), assigns(:value)
    end
  end

  test "post add without arguments" do
    raisesParamMissing { post :add }
    raisesParamMissing { post :add, id: 2 }
    raisesParamMissing { post :add, value: 2 }
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
