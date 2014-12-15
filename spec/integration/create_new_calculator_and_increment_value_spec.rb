require 'test_helper'

RSpec.describe "Math API", type: :request do
  it "can create and update calculator" do
    randomize2_num!
    post 'math/create', value: @num
    id = assigns(:calculator).id
    assert_response :success

    post 'math/add_to', { id: id, value: @num2 }

    assert_response :success
    expect(@num + @num2).to eq assigns(:value)
    expect(@num + @num2).to eq assigns(:calculator).value
  end
end
