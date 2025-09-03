class AddDetailsTitleToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :details_title, :string
  end
end
