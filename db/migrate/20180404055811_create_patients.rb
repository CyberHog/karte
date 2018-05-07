class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.references :user, foreign_key: true		# userモデルへの外部キー

      t.timestamps
    end
  end
end
