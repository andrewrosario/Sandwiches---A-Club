class CreateSandwichIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :sandwich_ingredients do |t|
      t.integer :sandwich_id
      t.integer :ingredient_id
      t.string :quantity

      t.timestamps
    end
  end
end
