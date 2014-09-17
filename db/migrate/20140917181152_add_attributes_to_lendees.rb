class AddAttributesToLendees < ActiveRecord::Migration
  def change
    add_column :lendees, :first_name, :string
    add_column :lendees, :last_name, :string
    add_column :lendees, :street_address, :string
    add_column :lendees, :city, :string
    add_column :lendees, :state, :string
    add_column :lendees, :zip_code, :string
    add_column :lendees, :date_of_birth, :date
    add_column :lendees, :yearly_individual_income, :float
    add_column :lendees, :yearly_additional_income, :float
    add_column :lendees, :credit_range, :string
    add_column :lendees, :loan_id, :integer
  end
end
