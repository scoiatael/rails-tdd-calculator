class MathController < ApplicationController
  def add
    @value = first_arg.to_f + snd_arg.to_f
  end

  def first_arg
    params.require :value
  end

  def snd_arg
    params.require :value2
  end
end
