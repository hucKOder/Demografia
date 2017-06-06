class DeleteTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :births
    drop_table :deaths
    drop_table :divorces
    drop_table :migrations
    drop_table :mariages
  end
end
