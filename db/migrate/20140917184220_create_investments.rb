class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :lender
      t.references :loan
      t.timestamps
    end
  end
end
