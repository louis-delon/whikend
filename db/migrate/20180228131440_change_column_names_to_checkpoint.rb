class ChangeColumnNamesToCheckpoint < ActiveRecord::Migration[5.1]
  def change
    rename_column :checkpoints, :lon, :lng
  end
end
