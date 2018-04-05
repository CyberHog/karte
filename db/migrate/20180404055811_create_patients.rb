class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.references :user, foreign_key: true		# userモデルへの外部キー
      t.integer :holding_point, default: 0		# 保有ポイント

      t.timestamps
    end
  end
end
