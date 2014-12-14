class Calculator < ActiveRecord::Base

  def self.add(num1, num2)
    # add type check?
    num1+num2
  end

  def add(num)
    Calculator.add(self.value, num)
  end

  def add!(num)
    self.value = self.add(num)
  end
end
