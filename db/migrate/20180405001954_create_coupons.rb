class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :user, foreign_key: true	# userモデルへの外部キー
      t.references :patients_receipt, foreign_key: true # PatientsReceiptへの外部キー
      t.references :menu, foreigh_key: true # menuモデルへの外部キー
      t.integer :seller_id					        # クーポン発行者のID
      t.integer :buyer_id					          # クーポン購入者のID
      t.string :coupon_name                 # クーポン名
      t.integer :remaining					        # 残り回数
      t.datetime :expiration_date           # 有効期限 年月日

      t.timestamps
    end
  end
end
