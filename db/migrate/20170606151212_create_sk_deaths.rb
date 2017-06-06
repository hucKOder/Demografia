class CreateSkDeaths < ActiveRecord::Migration[5.0]
  def change
    create_table :deaths do |t|
      t.integer :male
      t.integer :female
      t.integer :year
      t.timestamps
    end

    add_reference :deaths, :town, index: true, foreign_key: true
  end
end
