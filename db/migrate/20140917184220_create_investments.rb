class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :lender
      t.references :loan
      t.float :amount
      t.float :expected_return
      t.timestamps
    end
  end
end
