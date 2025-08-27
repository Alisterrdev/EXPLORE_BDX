class ChangeColumnTypeInEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :longitude
    remove_column :events, :latitude
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float

  end
end
