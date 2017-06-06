class EditDivorces < ActiveRecord::Migration[5.0]
  def change
    add_column :divorces, :year, :integer
  end
end
