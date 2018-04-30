class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.integer :follower_id
      t.integer :following_id

      t.timestamps
    end
  end
end
