class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :lender
      t.references :lendee
      t.float :amount
      t.float :amount_paid, default: 0.0
      t.boolean :paid?, default: false
      t.date :due_date, default: Date.today + 1.month
      t.timestamps
    end
  end
end
