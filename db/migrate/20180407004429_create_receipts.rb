class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.references :medical_chart	          # medical_chartへの外部キー
      t.references :user			              # userへの外部キー
      t.references :clinic			            # clinicへの外部キー
      t.date :payday				                # 支払日
      t.integer :payment_method, null: false, default: 0, limit: 3 # 支払方法(0.cash, 1.credit, 2.coupon, 3.point)
      t.string :service				              # サービス名
      t.integer :payment 			              # 支払金額
      t.integer :gained_point		            # 取得ポイント

      t.timestamps
    end
  end
end
