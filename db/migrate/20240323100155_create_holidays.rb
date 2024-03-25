class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.references :agent, null: false, foreign_key: true
      t.boolean :mon, null: false, default: false
      t.boolean :tue, null: false, default: false
      t.boolean :wed, null: false, default: false
      t.boolean :thu, null: false, default: false
      t.boolean :fri, null: false, default: false
      t.boolean :sat, null: false, default: false
      t.boolean :sun, null: false, default: false
      t.boolean :national_holiday, default: false

      t.timestamps
    end
  end
end
