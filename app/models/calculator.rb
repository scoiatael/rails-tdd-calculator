class Calculator < ActiveRecord::Base

  def self.add(num1, num2)
    num1 = 0 unless num1.is_a? Integer
    num2 = 0 unless num2.is_a? Integer
    num1+num2
  end

  def add(num)
    Calculator.add(self.value, num)
  end

  def add!(num)
    self.value = self.add(num)
    self.save!
    self.value
  end
end
