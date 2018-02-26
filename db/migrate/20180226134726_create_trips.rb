class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.date :date
      t.string :location
      t.references :user, foreign_key: true
      t.references :hike, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
