class DeleteTownColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_column :towns, :deaths_id
  	remove_column :towns, :divorces_id
  	remove_column :towns, :mariages_id
  	remove_column :towns, :migrations_id
  end
end
