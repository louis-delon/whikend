class AddPhotosToHike < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :photo, :string
  end
end
