class CreateDivorces < ActiveRecord::Migration[5.0]
  def change
    create_table :divorces do |t|
      t.integer :year
      t.integer :women_age
      t.integer :man_age
      t.integer :count
      t.integer :duration
      t.string :gender_file_a_petition
      t.text :verdict

      t.timestamps
    end
  end
end
