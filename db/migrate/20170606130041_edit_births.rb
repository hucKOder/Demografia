class EditBirths < ActiveRecord::Migration[5.0]
  def change
    remove_column :births, :death
  end
end
