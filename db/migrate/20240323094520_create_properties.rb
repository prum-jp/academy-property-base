class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :agent, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :rent, null: false
      t.integer :deposit, null: false
      t.integer :honorarium, null: false
      t.integer :management_fee, null: false
      t.string :layout, null: false
      t.integer :property_type, null: false, default: 0
      t.date :build_date, null: false
      t.datetime :discarded_at
      
      t.timestamps
    end
  end
end
