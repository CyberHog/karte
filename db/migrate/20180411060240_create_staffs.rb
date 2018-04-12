class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.references :clinic, foreign_key: true			# clinicへの外部キー
      t.references :medical_chart, foreign_key: true	# MedicalChartへの外部キー
      t.integer :staff_number, null: false						# スタッフID
      t.string :staff_name, null: false							# スタッフ名
      t.boolean :staff_suspension, null: false, default: false	# スタッフ使用停止						

      t.timestamps
    end
  end
end
