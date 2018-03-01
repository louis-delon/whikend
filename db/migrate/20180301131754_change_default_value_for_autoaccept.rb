class ChangeDefaultValueForAutoaccept < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :auto_accept, :boolean, default: false
  end
end
