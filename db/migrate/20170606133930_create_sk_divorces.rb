class CreateSkDivorces < ActiveRecord::Migration[5.0]
  def change
    create_table :divorces do |t|
      t.integer :number
      t.integer :male_petition
      t.integer :female_petition
      t.integer :divorces_number
      t.float :male_average_age
      t.float :female_average_age
      t.float :average_duration
      t.timestamps
    end
    add_reference :divorces, :town, index: true, foreign_key: true
  end
end
