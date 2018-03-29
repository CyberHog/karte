# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # User Information    
      t.boolean :business, null: false, default: false  # 所属(0:個人,1:ビジネス)
      t.string :user_name, null: false                  # ユーザーネーム
      t.string :last_name, null: false, dafault: ""     # 苗字
      t.string :first_name, null: false, default: ""    # 名前
      t.string :phone                                   # 電話番号
      t.date :birthday                                  # 誕生日
      t.integer :gender, null: false, default: 0        # 性別 (0:男,1:女)
      t.boolean :account_suspension, null: false,       # アカウント停止
                  default: false                                     
      t.date :suspended_at                              # 退会日
      t.string :avatar                                  # ユーザー画像

      # SNS
      t.string :uid, null: false, default: ""           # SNSのユーザーID
      t.string :provider, null: false, default: ""      # プロバイダ名
      t.string :username                                # SNSのユーザー名
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
