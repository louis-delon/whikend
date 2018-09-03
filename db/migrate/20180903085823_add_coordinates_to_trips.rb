class AddCoordinatesToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :latitude, :float
    add_column :trips, :longitude, :float
  end
end
