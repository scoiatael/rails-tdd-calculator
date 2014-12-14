ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
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

end
