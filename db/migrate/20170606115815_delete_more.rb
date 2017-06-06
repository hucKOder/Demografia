class DeleteMore < ActiveRecord::Migration[5.0]
  def change
    drop_table :cantons
    drop_table :counties
  end
end
