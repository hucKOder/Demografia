class OneStepBack < ActiveRecord::Migration[5.0]
  def change
    remove_column :births, :number, :integer
    remove_column :births, :avg_age, :float

    add_column :births, :girls, :integer
    add_column :births, :boys, :integer
    add_column :births, :in_marriage, :integer
  end
end
