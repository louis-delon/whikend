class AddCoordinatesColumnToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :coordinates, :text
  end
end
