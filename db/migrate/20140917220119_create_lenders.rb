class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :state_residence
      t.timestamps
    end
  end
end
