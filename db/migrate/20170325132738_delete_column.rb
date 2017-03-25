class DeleteColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :towns, :cantons_id
  	remove_column :cantons, :counties_id
  end
end
