class CreateClinicCards < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_cards do |t|
      t.references :user, foreign_key: true		  # userへの外部キー
      t.references :clinic, foreign_key: true	  # clinicへの外部キー
      t.integer :publisher_id                   # カード発行者のID
      t.integer :holder_id                      # カード所持者のID
      t.integer :holding_point, default: 0      # 保有ポイント
      t.string :number, default: ""				      # 診察券番号

      t.timestamps
    end
  end
end
