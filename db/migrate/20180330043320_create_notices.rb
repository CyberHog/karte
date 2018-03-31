class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.references :user, null: false, foreign_key: true	# 外部キー
      t.string :title, null: false							          # タイトル
      t.text :body											                  # 本文
      t.date :released_at, null: false						        # 掲載日
      t.date :expired_at                          				# 掲載終了日
      t.string :status, null: false, default: "draft"	  	# 状態

      t.timestamps null: false
    end
  end
end
