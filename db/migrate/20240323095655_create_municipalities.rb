class CreateMunicipalities < ActiveRecord::Migration[7.0]
  def change
    create_table :municipalities do |t|
      t.integer :code
      t.string :name
      t.integer :prefecture_id
      t.string :prefecture_name

      t.timestamps
    end
  end
end
