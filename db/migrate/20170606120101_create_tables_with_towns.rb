class CreateTablesWithTowns < ActiveRecord::Migration[5.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.timestamps
    end

    create_table :cantons do |c|
      c.string :name
      c.timestamps
    end

    create_table :towns do |t|
      t.string :name
      t.integer :citizens
      t.timestamps
    end

    add_reference :cantons, :county, index: true, foreign_key: true
    add_reference :towns, :canton, index: true, foreign_key: true
  end
end
