class AddColumnsToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :distance, :string
    add_column :hikes, :asc_elevation, :string
    add_column :hikes, :desc_elevation, :string
    add_column :hikes, :alt_min, :string
    add_column :hikes, :alt_max, :string
    add_column :hikes, :difficulty, :string
    add_column :hikes, :type, :boolean
    add_column :hikes, :description, :text
  end
end
