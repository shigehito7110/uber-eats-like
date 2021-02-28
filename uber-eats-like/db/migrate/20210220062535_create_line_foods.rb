class CreateLineFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :line_foods do |t|
      t.references :food, null: false, foreign_key: true, comment: '料理外部キー'
      t.references :restaurant, null: false, foreign_key: true, comment: 'レストラン外部キー'
      t.references :order, foreign_key: true, comment: '注文外部キー'
      t.integer :count, null: false, default: true, comment: '選択個数'
      t.boolean :active, null: false, defautl: false, comment: '有効無効フラグ'
      t.timestamps
    end
  end
end
