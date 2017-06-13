class AddPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :towns, :picture, :string
  end
end
