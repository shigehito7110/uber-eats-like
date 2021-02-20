class CreateLineFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :line_foods do |t|
      t.references :food, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :count, null: false, default: true
      t.boolean :active, null: false, defautl: false
      t.timestamps
    end
  end
end
