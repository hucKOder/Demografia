class AddTownAsForeignKey < ActiveRecord::Migration[5.0]
  def change
  	add_reference :migrations, :towns, index: true, foreign_key: true
  	add_reference :births, :towns, index: true, foreign_key: true
  	add_reference :deaths, :towns, index: true, foreign_key: true
  	add_reference :mariages, :towns, index: true, foreign_key: true
  	add_reference :divorces, :towns, index: true, foreign_key: true
  end
end
