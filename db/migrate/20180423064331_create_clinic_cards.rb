class CreateClinicCards < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_cards do |t|
      t.references :clinic, foreign_key: true	# clinicへの外部キー
      t.references :patient, foreign_key: true	# patientへの外部キー
      t.string :number, default: ""				# 診察券番号
      t.integer :holding_point, default: ""		# 保有ポイント

      t.timestamps
    end
  end
end
