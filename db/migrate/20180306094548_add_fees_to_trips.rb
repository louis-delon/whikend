class AddFeesToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :fees, :integer
  end
end
