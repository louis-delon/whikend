class RemoveCheckpointFromSchema < ActiveRecord::Migration[5.1]
  drop_table :checkpoints
end
