class CreateSkBirths < ActiveRecord::Migration[5.0]
  def change
    create_table :births do |t|
      t.integer :boys
      t.integer :girls
      t.integer :in_marriage
      t.integer :death
      t.integer :year
      t.timestamps
    end

    add_reference :births, :town, index: true, foreign_key: true
  end
end
