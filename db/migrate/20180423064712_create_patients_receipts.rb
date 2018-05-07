class CreatePatientsReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :patients_receipts do |t|
      t.references :clinic_card, foreign_key: true	# clinic_cardへの外部キー
      t.date :payday                  				# 支払日
      t.string :payee                 				# 支払った人

      t.timestamps
    end
  end
end
