class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :about_me_body

      t.timestamps null: false
    end
  end
end
