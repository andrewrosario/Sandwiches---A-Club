class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :type_of
      t.string :img_url, default: 'banana.jpg'
      t.boolean :is_meat, default: false
      t.boolean :is_dairy_or_egg, default: false
      t.boolean :is_gluten_free, default: false

      t.timestamps
    end
  end
end
