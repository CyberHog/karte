class CreateClinics < ActiveRecord::Migration[5.1]
  def change
    create_table :clinics do |t|
      t.references :user, foreign_key: true		# userモデルへの外部キー
      t.string :name, null: false, default: ""	# クリニック名

      t.timestamps
    end
  end
end
