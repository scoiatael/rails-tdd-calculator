require 'test_helper'

class MathControllerTest < ActionController::TestCase
  def raisesParamMissing
    assert_raise ActionController::ParameterMissing, &Proc.new
  end

  test "get add without arguments" do
    raisesParamMissing { get :add }
    raisesParamMissing { get :add, value: 2 }
    raisesParamMissing { get :add, value2: 2 }
  end

  test "get add with arguments" do
    10.times do
      randomize2_num!
      get :add, { value: @num, value2: @num2 }
      assert_equal (@num + @num2), assigns(:value)
    end
  end

  test "get add_to without arguments" do
    raisesParamMissing { get :add_to }
    raisesParamMissing { get :add_to, value: 2 }
    raisesParamMissing { get :add_to, id: 1 }
  end

  test "get add_to with arguments assigns calculator" do
    randomize_num!
    get :add_to, { value: @num, id: 1 }
    assert_equal Calculator.find(1), assigns(:calculator)
  end

  test "get add_to with arguments assigns correct value" do
    10.times do
      randomize_num!
      get :add_to, { value: @num, id: 1 }
      assert_equal (@num + Calculator.find(1).value), assigns(:value)
    end
  end

  test "post create without arguments assigns new calculator" do
    get :add_to
    assert_equal 3, assigns(:calculator).id
  end

  test "post create without arguments assigns new calculator with value 0" do
    get :add_to
    assert_equal 0, assigns(:calculator).value
  end

  test "post create with arguments assigns new calculator" do
    randomize_num!
    get :add_to, value: @num
    assert_equal 3, assigns(:calculator).id
  end

  test "post create with arguments assigns new calculator with correct value" do
    randomize_num!
    get :add_to, value: @num
    assert_equal @num, assigns(:calculator).value
  end

end
