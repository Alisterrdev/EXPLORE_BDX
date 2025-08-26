class ChangeTypeForLongitude < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :longitude, :float
  end
end
