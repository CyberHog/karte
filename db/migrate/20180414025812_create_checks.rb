class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.references :receipt, foreign_key: true	# receiptへの外部キー
      t.references :menu, foreign_key: true		# menuへの外部キー

      t.timestamps
    end
  end
end
