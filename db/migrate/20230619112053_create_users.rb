class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      # ログイン時にemailからユーザを特定するため、indexを貼って検索速度を上げ、
      # unique: trueとしてメールアドレスの一意性が保たれるようにします。
      t.index :email, unique: true
    end
  end
end
