class DeleteColumnsTown < ActiveRecord::Migration[5.0]
  def change
    remove_column :towns, :citizens
    remove_column :towns, :canton_id
  end
end
