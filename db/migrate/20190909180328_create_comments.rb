class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.float :rating
      t.string :content
      t.integer :user_id
      t.integer :sandwich_id

      t.timestamps
    end
  end
end
