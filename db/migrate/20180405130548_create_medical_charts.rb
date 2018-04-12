class CreateMedicalCharts < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_charts do |t|
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
