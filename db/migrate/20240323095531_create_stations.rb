class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.integer :station_cd
      t.integer :station_g_cd
      t.string :station_name
      t.string :station_name_k
      t.string :station_name_r
      t.integer :line_cd
      t.integer :pref_cd
      t.string :post
      t.string :address
      t.float :lon
      t.float :lat
      t.date :open_ymd
      t.date :close_ymd
      t.integer :e_statu
      t.integer :e_sort

      t.timestamps
    end
  end
end
