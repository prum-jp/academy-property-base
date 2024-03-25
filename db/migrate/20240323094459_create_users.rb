class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :auth0_ID, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.string :phone_number, null: false
      t.string :password_digest, null: false
      t.string :reset_digest
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :users, :auth0_ID, unique: true
    add_index :users, :email, unique: true
  end
end
