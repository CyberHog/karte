class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :patient, foreign_key: true	# patientモデルへの外部キー
      t.references :clinic, foreign_key: true	# clinicモデルへの外部キー
      t.references :menu, foreign_key: true		# menuモデルへの外部キー
      t.integer :remaining						# 残り回数

      t.timestamps
    end
  end
end
