class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :display_name
      t.integer :age
      t.string :bio
      t.string :img_url, default: 'splat.png'
      t.string :email

      t.timestamps
    end
  end
end
