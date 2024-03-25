class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.references :property, null: false, foreign_key: true
      t.string :prefecture, null: false
      t.string :city

      t.timestamps
    end
  end
end
