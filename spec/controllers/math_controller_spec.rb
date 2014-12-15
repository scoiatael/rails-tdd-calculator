require 'rails_helper'
require 'test_helper'

RSpec.describe MathController, type: :controller do
  describe "GET #add" do
    context "when called without arguments" do
      it "raises ActionController::ParameterMissing" do
        raisesParameterMissing { get :add }
        raisesParameterMissing { get :add, value: 2 }
        raisesParameterMissing { get :add, value2: 2 }
      end
    end

    context "when called with arguments :value, :value2" do
      it "Adds :value to :value2 when called with such arguments" do
        10.times do
          randomize2_num!
          get :add, { value: @num, value2: @num2 }
          expect(@num + @num2).to eq(assigns(:value))
        end
      end
    end
  end

  describe "GET #add_to" do
    context "when called without arguments" do
      it "raises ActionController::ParameterMissing error" do
        raisesParameterMissing { get :add_to }
        raisesParameterMissing { get :add_to, value: 2 }
        raisesParameterMissing { get :add_to, id: 1 }
      end
    end

    context "when called with arguments :value, :id" do
      it "assigns calculator" do
        randomize_num!
        get :add_to, { value: @num, id: 1 }
        expect(Calculator.find(1)).to eq(assigns(:calculator))
      end

      it "assigns correct value" do
        10.times do
          randomize_num!
          get :add_to, { value: @num, id: 1 }
          expect(@num + Calculator.find(1).value).to eq(assigns(:value))
        end
      end
    end
  end

  describe "POST #add_to" do
    context "when called without arguments" do
      it "raises ActionController::ParameterMissing error" do
        raisesParameterMissing { post :add_to }
        raisesParameterMissing { post :add_to, value: 2 }
        raisesParameterMissing { post :add_to, id: 1 }
      end
    end

    context "when called with arguments :value, :id" do
      it "assigns calculator" do
        randomize_num!
        post :add_to, { value: @num, id: 1 }
        expect(Calculator.find(1)).to eq(assigns(:calculator))
      end

      it "assigns correct value" do
        10.times do
          randomize_num!
          old_val = Calculator.find(1).value
          post :add_to, { value: @num, id: 1 }
          expect(@num + old_val).to eq(Calculator.find(1).value)
        end
      end
    end
  end

  describe "POST #create" do
    context "when called without arguments" do
      it "creates new calculator" do
        createsNewCalculator { post :create }
      end

      it "assigns value 0 to created calculator" do
        post :create
        expect(0).to eq assigns(:calculator).value
      end
    end

    context "when called with argument :value" do
      it "creates new calculator" do
        randomize_num!
        createsNewCalculator { post :create, value: @num }
      end

      it "assigns correct value to created calculator" do
        randomize_num!
        post :create, value: @num
        expect(@num).to eq assigns(:calculator).value
      end
    end
  end

end
