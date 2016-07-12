class AddLatAndLongToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :latitude, :float
    add_column :destinations, :longitude, :float
    add_column :destinations, :trip_synopsis, :text
    add_column :destinations, :must_see, :text
    add_column :destinations, :must_do, :text
    add_column :destinations, :must_eat, :text
  end
end
