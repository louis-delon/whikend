class AddColumnsToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :seats, :integer
    add_column :trips, :auto_accept, :boolean
    add_column :trips, :title, :string
    add_column :trips, :type, :string
  end
end
