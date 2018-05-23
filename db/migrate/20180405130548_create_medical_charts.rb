class CreateMedicalCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_charts do |t|
      t.references :user, foreign_key: true   # userへの外部キー
      t.integer :therapist_id     # カルテ記入者のID
      t.integer :patient_id       # 患者のID
      t.integer :card_number			# 診察券ID
      t.date :visited_at				  # 施術日
      t.string :service           # コース名
      t.string :staff_name				# 担当者
      t.text :cc 						      # 主訴
      t.text :tx_comment				  # 背術内容　
      t.text :comment					    # コメント

      t.timestamps
    end
  end
end
