class AddCoverToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cover, :string
  end
end
