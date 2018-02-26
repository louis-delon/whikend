class CreateHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :hikes do |t|
      t.time :duration
      t.string :location

      t.timestamps
    end
  end
end
