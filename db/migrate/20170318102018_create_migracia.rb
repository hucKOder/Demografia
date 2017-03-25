class CreateMigracia < ActiveRecord::Migration[5.0]
  def change
    create_table :migracia do |t|
      t.integer :year
      t.integer :age
      t.integer :emigrants
      t.integer :imigrants
      t.text :reason
      t.string :gender

      t.timestamps
    end
  end
end
