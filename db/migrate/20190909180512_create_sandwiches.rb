class CreateSandwiches < ActiveRecord::Migration[5.2]
  def change
    create_table :sandwiches do |t|
      t.string :title
      t.string :instructions
      t.string :description
      t.string :img_url, default: 'sandwich.jpg'

      t.timestamps
    end
  end
end
