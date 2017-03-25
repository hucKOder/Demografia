class CreateDeaths < ActiveRecord::Migration[5.0]
  def change
    create_table :deaths do |t|
      t.integer :year
      t.integer :age
      t.integer :count
      t.string :gender

      t.timestamps
    end
  end
end
