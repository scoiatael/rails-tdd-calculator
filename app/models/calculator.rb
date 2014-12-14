class Calculator < ActiveRecord::Base

  def self.add(num1, num2)
    # add type check?
    num1+num2
  end
end
