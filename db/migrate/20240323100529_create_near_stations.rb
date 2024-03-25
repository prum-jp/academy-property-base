class CreateNearStations < ActiveRecord::Migration[7.0]
  def change
    create_table :near_stations do |t|
      t.references :property, null: false, foreign_key: true
      t.string :line, null: false
      t.string :name, null: false
      t.integer :minute_walk, null: false

      t.timestamps
    end
  end
end
