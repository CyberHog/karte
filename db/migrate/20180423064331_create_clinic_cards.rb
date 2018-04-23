class CreateClinicCards < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_cards do |t|
      t.references :clinic, foreign_key: true	# clinicへの外部キー
      t.references :patient, foreign_key: true	# patientへの外部キー
      t.integer :number							# 診察券番号

      t.timestamps
    end
  end
end
