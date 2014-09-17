class CreateLendees < ActiveRecord::Migration
  def change
    create_table :lendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.date :date_of_birth
      t.float :yearly_individual_income
      t.string :credit_range
      t.timestamps
    end
  end
end
