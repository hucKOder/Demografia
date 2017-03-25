class CreateBirths < ActiveRecord::Migration[5.0]
  def change
    create_table :births do |t|
      t.integer :year
      t.integer :mother_age
      t.integer :count
      t.string :gender

      t.timestamps
    end
  end
end
