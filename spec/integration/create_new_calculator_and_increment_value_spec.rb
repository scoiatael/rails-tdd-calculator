require 'test_helper'

class CreateNewCalculatorAndIncrementValueTest < ActionDispatch::IntegrationTest
  test "run" do
    randomize2_num!
    post 'math/create', value: @num
    id = assigns(:calculator).id
    assert_response :success

    post 'math/add_to', { id: id, value: @num2 }

    assert_response :success
    assert_equal (@num + @num2), assigns(:value)
    assert_equal (@num + @num2), assigns(:calculator).value
  end
end
