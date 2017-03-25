class DeleteTIndex < ActiveRecord::Migration[5.0]
  def change
  	remove_column :towns, :births_id
  end
end
