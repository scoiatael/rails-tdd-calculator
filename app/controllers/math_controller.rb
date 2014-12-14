class MathController < ApplicationController
  def add
    @value = Calculator.add first_arg, snd_arg
  end

  def add_to
    @calculator = Calculator.find(id)
    if request.post?
      @value = @calculator.add! first_arg
    else
      @value = @calculator.add first_arg
    end
    @value
  end

  def create
    first = params.permit(:value)["value"]
    first_num = if first.nil? then 0 else first.to_i end
    @calculator = Calculator.create value: first_num
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
