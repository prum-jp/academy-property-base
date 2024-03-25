class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.references :property, null: false, foreign_key: true
      t.boolean :parking, null: false
      t.boolean :bath, null: false, default: false
      t.boolean :wash_machine, null: false, default: false
      t.boolean :aircon, null: false, default: false
      t.boolean :lock, null: false, default: false
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
