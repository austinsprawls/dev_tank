class AddAttributesToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :state_of_residence, :string
  end
end
