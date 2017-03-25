class AddCantonTownFk < ActiveRecord::Migration[5.0]
  def change
  	add_reference :cantons, :county, index: true, foreign_key: true
  	add_reference :towns, :canton, index: true, foreign_key: true
  end
end
