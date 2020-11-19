class CreateDietMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :diet_methods do |t|
      t.string :title,                  null: false
      t.integer :type_id,               null: false
      t.text :explanation,              null: false
      t.integer :ease_of_reduction
      t.integer :ease_of_continuation
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
