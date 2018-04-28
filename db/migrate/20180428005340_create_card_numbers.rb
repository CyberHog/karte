class CreateCardNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :card_numbers do |t|
      t.references :clinic_card, foreign_key: true	# clinic_cardへの外部キー
      t.string :number, default: ""					# 診察券番号

      t.timestamps
    end
  end
end
