class MathController < ApplicationController
  def add
    @value = Calculator.add first_arg, snd_arg
  end

  def add!
    @calculator = Calculator.find(id)
    @value = @calculator.add first_arg
  end

  def first_arg
    params.require(:value).to_i
  end

  def snd_arg
    params.require(:value2).to_i
  end

  def id
    params.require(:id).to_i
  end
end
