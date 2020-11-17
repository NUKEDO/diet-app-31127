class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.date :date,                 null: false
      t.float :weight_at_the_day,   null: false
      t.integer :method_id,         null: false
      t.text :memo
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
