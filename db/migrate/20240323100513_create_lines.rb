class CreateLines < ActiveRecord::Migration[7.0]
  def change
    create_table :lines do |t|
      t.integer :line_cd
      t.integer :company_cd
      t.string :line_name
      t.string :line_name_k
      t.string :line_name_h
      t.string :line_color_c
      t.string :line_color_t
      t.string :line_type
      t.float :lon
      t.float :lat
      t.integer :zoom
      t.integer :e_status
      t.integer :e_sort
      
      t.timestamps
    end
  end
end
