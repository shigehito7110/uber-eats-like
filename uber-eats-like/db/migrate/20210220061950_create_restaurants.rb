class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, comment: 'レストラン店名'
      t.integer :fee, null: false, default: 0, comment: '配送料'
      t.integer :time_required, null: false, comment: '配送時間'
      t.timestamps
    end
  end
end
