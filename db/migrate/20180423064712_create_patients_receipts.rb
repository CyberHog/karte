class CreatePatientsReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :patients_receipts do |t|
      t.references :user, foreign_key: true			    # userへの外部キー
      t.references :clinic_card, foreign_key: true	# clinic_cardへの外部キー
      t.integer :seller_id							         # レシート発行者のID
      t.integer :buyer_id							           # レシート受取人のID
      t.date :payday                  				   # 支払日
      t.string :payer                 				   # 支払った人

      t.timestamps
    end
  end
end
