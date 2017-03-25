class AddForeignKeysToCanton < ActiveRecord::Migration[5.0]
  def change
  	add_reference :cantons, :counties, index: true, foreign_key: true
  	add_reference :towns, :cantons, index: true, foreign_key: true
  end
end
