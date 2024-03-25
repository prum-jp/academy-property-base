class CreateInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :inquiries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.integer :inquiry_type, null: false, default: 0
      t.string :contents
      t.boolean :is_replied, null: false, default: 0
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
