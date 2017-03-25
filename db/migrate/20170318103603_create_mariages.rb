class CreateMariages < ActiveRecord::Migration[5.0]
  def change
    create_table :mariages do |t|
      t.integer :year
      t.integer :bride_age
      t.integer :fiance_age
      t.integer :count
      t.text :mariage_count

      t.timestamps
    end
  end
end
