require 'test_helper'

class MathControllerTest < ActionController::TestCase
  def raisesParameterMissing
    assert_raise ActionController::ParameterMissing, &Proc.new
  end

  def createsNewCalculator
    old_calc_num = Calculator.all.size
    yield
    assert_equal (old_calc_num + 1), Calculator.all.size
  end

  test "get add without arguments" do
    raisesParameterMissing { get :add }
    raisesParameterMissing { get :add, value: 2 }
    raisesParameterMissing { get :add, value2: 2 }
  end

  test "get add with arguments" do
    10.times do
      randomize2_num!
      get :add, { value: @num, value2: @num2 }
      assert_equal (@num + @num2), assigns(:value)
    end
  end

  test "get add_to without arguments" do
    raisesParameterMissing { get :add_to }
    raisesParameterMissing { get :add_to, value: 2 }
    raisesParameterMissing { get :add_to, id: 1 }
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

  test "post add_to without arguments" do
    raisesParameterMissing { post :add_to }
    raisesParameterMissing { post :add_to, value: 2 }
    raisesParameterMissing { post :add_to, id: 1 }
  end

  test "post add_to with arguments assigns calculator" do
    randomize_num!
    post :add_to, { value: @num, id: 1 }
    assert_equal Calculator.find(1), assigns(:calculator)
  end

  test "post add_to with arguments assigns correct value" do
    10.times do
      randomize_num!
      old_val = Calculator.find(1).value
      post :add_to, { value: @num, id: 1 }
      assert_equal (@num + old_val), Calculator.find(1).value
    end
  end

  test "post create without arguments creates new calculator" do
    createsNewCalculator { post :create }
  end

  test "post create without arguments assigns new calculator with value 0" do
    post :create
    assert_equal 0, assigns(:calculator).value
  end

  test "post create with arguments creates new calculator" do
    randomize_num!
    createsNewCalculator { post :create, value: @num }
  end

  test "post create with arguments assigns new calculator with correct value" do
    randomize_num!
    post :create, value: @num
    assert_equal @num, assigns(:calculator).value
  end

end
