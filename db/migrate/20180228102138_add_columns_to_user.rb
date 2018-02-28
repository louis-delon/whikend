class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :avatar_url, :string
  end
end
