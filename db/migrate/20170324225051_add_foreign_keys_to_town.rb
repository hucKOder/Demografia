class AddForeignKeysToTown < ActiveRecord::Migration[5.0]
  def change
  	add_reference :towns, :migrations, index: true, foreign_key: true
  	add_reference :towns, :births, index: true, foreign_key: true
  	add_reference :towns, :deaths, index: true, foreign_key: true
  	add_reference :towns, :mariages, index: true, foreign_key: true
  	add_reference :towns, :divorces, index: true, foreign_key: true
  end
end
