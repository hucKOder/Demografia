class AddIndexToTowns < ActiveRecord::Migration[5.0]
  def change
    add_index :towns, :name
  end
end
