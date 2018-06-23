class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.references :user, foreign_key: true	      # userモデルへの外部キー
      t.integer :content_id						            # コースID
      t.string :content_name 				         	    # コース名
      t.integer :price							              # 価格
      t.integer :attached_point					          # ポイント
      t.boolean :coupon, default: false           # 回数券?
      t.integer :coupon_number                    # 利用対象クーポンのID
      t.integer :counting                         # 使用可能回数
      t.integer :validity_period                  # 有効期間　〜日間
      t.integer :usage, null: false, default: 0   # 用途 (0:購入, 1:使用)

      t.timestamps
    end
  end
end
