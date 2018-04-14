class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true     # userモデルへの外部キー
      t.string :postcode                        # 郵便番号
      t.string :prefecture                      # 都道府県
      t.string :city                            # 市区町村
      t.string :street                       		# 番地
      t.string :building                     		# 建物名/号室

      t.timestamps
    end
  end
end
