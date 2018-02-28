class CreateCheckpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :checkpoints do |t|
      t.float :lat
      t.float :lon
      t.float :ele
      t.integer :order
      t.references :hike, foreign_key: true

      t.timestamps
    end
  end
end
