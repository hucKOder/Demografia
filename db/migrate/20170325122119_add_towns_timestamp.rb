class AddTownsTimestamp < ActiveRecord::Migration[5.0]
  def change
  	  add_column(:towns, :created_at, :datetime)
      add_column(:towns, :updated_at, :datetime)
  end
end
