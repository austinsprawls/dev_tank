class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :lendee
      t.float :amount
      t.boolean :funded?, default: false
      t.date :expiration_date
      t.timestamps
    end
  end
end
