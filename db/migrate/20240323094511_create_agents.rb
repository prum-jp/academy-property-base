class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.integer :auth0_ID
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :reset_digest, null: false
      t.time :start_at, null: false
      t.time :end_at, null: false
      t.datetime :discarded_at

      t.timestamps
    end
    add_index :agents, :name, unique: true
    add_index :agents, :email, unique: true
  end
end
