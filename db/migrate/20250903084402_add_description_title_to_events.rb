class AddDescriptionTitleToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :description_title, :string
  end
end
