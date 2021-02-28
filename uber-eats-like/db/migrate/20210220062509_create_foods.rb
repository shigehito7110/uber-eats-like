class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.references :restaurant, null: false, foreign_key: true, comment: 'レストラン外部キー'
      t.string :name, null: false, comment: '料理名'
      t.integer :price, null: false, comment: '料金'
      t.text :description, null: false, comment: '料理説明'
      t.timestamps
    end
  end
end
