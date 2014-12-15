ENV['RAILS_ENV'] ||= 'test'

def random_num
  rand 100
end

def randomize_num!
  @num = random_num
end

def randomize2_num!
  randomize_num!
  @num2 = random_num
end

def initialize_calc!
  randomize_num!
  @calc = Calculator.new value: @num
end

def raisesParameterMissing
  expect(&Proc.new).to raise_error(ActionController::ParameterMissing)
end

def createsNewCalculator
  old_calc_num = Calculator.all.size
  yield
  expect(old_calc_num + 1).to  equal(Calculator.all.size)
end
