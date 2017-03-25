class AddCantonIdToTown < ActiveRecord::Migration[5.0]
  def change
  	add_column :towns, :canton_id, :integer, foreign_key :true
  end
end
