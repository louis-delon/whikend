class FixData < ActiveRecord::Migration[5.1]
  def change
    change_column :hikes, :duration, :string
    add_column :hikes, :title, :string
    add_column :hikes, :link, :string
    add_column :hikes, :photo_url, :string
    add_column :hikes, :site_id, :integer
  end
end
