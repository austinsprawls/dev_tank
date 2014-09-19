class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :lendee
      t.float :amount
      t.float :amount_funded, default: 0
      t.boolean :funded?, default: false
      t.string :rate
      t.integer :term
      t.date :expiration_date
      t.timestamps
    end
  end
end
