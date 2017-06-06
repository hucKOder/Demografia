class CreateSkMigrations < ActiveRecord::Migration[5.0]
  def change
    create_table :migrations do |t|
      t.integer :male_imigrants
      t.integer :female_imigrants
      t.integer :sr_imigrants
      t.integer :foreign_imigrants

      t.integer :male_emigrants
      t.integer :female_emigrants
      t.integer :sr_emigrants
      t.integer :foreign_imigrants

      t.integer :year
      t.timestamps
    end

    add_reference :migrations, :town, index: true, foreign_key: true
  end
end
