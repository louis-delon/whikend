class AddDepartmentToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :department, :string
  end
end
