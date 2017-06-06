class CreateSkMarriages < ActiveRecord::Migration[5.0]
  def change
    create_table :marriages do |t|
      t.integer :male_home_number
      t.integer :male_home_first_number
      t.float :male_home_avg_age

      t.integer :female_home_number
      t.integer :female_home_first_number
      t.float :female_home_avg_age

      t.integer :year
      t.timestamps
    end

    add_reference :marriages, :town, index: true, foreign_key: true
  end
end
