class MathController < ApplicationController
  def add
    @value = first_arg.to_f + snd_arg.to_f
  end

  def first_arg
    params.require :arg1
  end

  def snd_arg
    params.require :arg2
  end
end
