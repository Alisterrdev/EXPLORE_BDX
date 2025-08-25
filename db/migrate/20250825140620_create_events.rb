class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :date
      t.text :description
      t.string :tags
      t.string :latitude
      t.string :longitude
      t.string :image

      t.timestamps
    end
  end
end
