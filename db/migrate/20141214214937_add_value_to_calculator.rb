class AddValueToCalculator < ActiveRecord::Migration
  def change
    add_column :calculators, :value, :integer
  end
end
