class ColumnsBirths < ActiveRecord::Migration[5.0]
  def change
    remove_column :births, :girls
    remove_column :births, :boys
    remove_column :births, :in_marriage

    add_column :births, :number, :integer
    add_column :births, :avg_age, :float
  end
end
