require 'rails_helper'
require 'test_helper'

RSpec.describe Calculator, type: :model do

  describe "self.add" do
    it "adds 2 numbers" do
      10.times do
        randomize2_num!
        expect( Calculator.add(@num, @num2) ).to equal(@num + @num2)
      end
    end
  end

  it "can hold a number" do
    initialize_calc!
    expect(@num).to equal(@calc.value)
  end

  describe "&:add" do
    it "adds value to memoized number" do
      initialize_calc!
      10.times do
        randomize_num!
        expect(@num + @calc.value).to eq @calc.add(@num)
      end
    end
  end

  describe "&:add!" do
    it "adds value to memoized number and saves it" do
      10.times do
        initialize_calc!
        randomize_num!
        old_val = @calc.value
        @calc.add! @num
        expect(@calc.value).to eq(old_val + @num)
      end
    end
  end
end
