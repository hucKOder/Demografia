class EditMigrations < ActiveRecord::Migration[5.0]
  def change
    add_column :migrations, :foreign_emigrants, :integer
  end
end
