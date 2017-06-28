class JsonColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :towns, :info, :jsonb
  end
end
