class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.references :user, foreign_key: true	      # userモデルへの外部キー
      t.references :receipt, foreign_key: :true   # receiptへの外部キー
      t.integer :content_id						            # コースID
      t.string :content_name 				         	    # コース名
      t.integer :price							              # 価格
      t.integer :attached_point					          # ポイント
      t.boolean :coupon, default: false           # 回数券?
      t.integer :counting                         # 使用可能回数
      t.integer :validity_period                  # 有効期間　〜日間

      t.timestamps
    end
  end
end
