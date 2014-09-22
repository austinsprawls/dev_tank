class AddAttributesToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :state_of_residence, :string
    add_column :lenders, :funds, :float, default: 0.0
  end
end
