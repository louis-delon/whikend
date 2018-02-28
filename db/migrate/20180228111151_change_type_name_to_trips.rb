class ChangeTypeNameToTrips < ActiveRecord::Migration[5.1]
  def change
    rename_column :trips, :type, :trip_type
    rename_column :hikes, :type, :hike_type
  end
end
