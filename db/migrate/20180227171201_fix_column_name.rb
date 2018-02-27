class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :trips, :location, :start_location
  end
end
