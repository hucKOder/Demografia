class CreateTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :towns do |t|
      t.belongs_to :canton, index: true
      t.string :name
      t.integer :citizens

      t.timestamps
    end
  end
end
