class AddTownAsForeignKey < ActiveRecord::Migration[5.0]
  def change
  	add_reference :migrations, :town, index: true, foreign_key: true
  	add_reference :births, :town, index: true, foreign_key: true
  	add_reference :deaths, :town, index: true, foreign_key: true
  	add_reference :mariages, :town, index: true, foreign_key: true
  	add_reference :divorces, :town, index: true, foreign_key: true
  end
end
