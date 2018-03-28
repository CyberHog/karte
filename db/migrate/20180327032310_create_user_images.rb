class CreateUserImages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_images do |t|
      t.references :user, null: false, foreign_key: true	# 外部キー
      t.binary :data										# 画像データ
      t.string :content_type								# MIMEタイプ

      t.timestamps
    end
  end
end
