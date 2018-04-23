class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.references :patients_receipt, foreign_key: true
                                      # patients_receiptへの外部キー
      t.date :payday                  # 支払日
      t.string :service               # サービス名
      t.integer :payment              # 支払金額
      t.integer :gained_point         # 取得ポイント
      t.string :payee                 # 支払った人
      t.integer :payment_method, null: false, default: 0, limit: 3
                     # 支払方法(0.cash, 1.credit, 2.coupon, 3.point)

      t.timestamps
    end
  end
end
