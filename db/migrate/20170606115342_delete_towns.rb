class DeleteTowns < ActiveRecord::Migration[5.0]
  def change
    drop_table :towns
  end
end
