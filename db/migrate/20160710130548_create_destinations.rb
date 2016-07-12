class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :country
      t.date :start_date
      t.date :end_date
      t.string :who
      t.text :purpose
      t.text :favorite_part
      t.text :photos
      t.text :map_link
      t.timestamps null: false
    end
  end
end
