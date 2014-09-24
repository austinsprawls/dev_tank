class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :lender
      t.references :lendee
      t.float :amount
      t.timestamps
    end
  end
end
