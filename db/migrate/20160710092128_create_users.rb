class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.date :birthdate
      t.string :current_city
      t.string :fav_destination
      t.text :about_me

      t.timestamps null: false
    end
  end
end
