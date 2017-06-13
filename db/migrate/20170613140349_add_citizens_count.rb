class AddCitizensCount < ActiveRecord::Migration[5.0]
  def change
    add_column :towns, :citizens, :integer
  end
end
