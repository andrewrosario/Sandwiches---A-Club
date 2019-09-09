class SandwichIngredient < ApplicationRecord
    belongs_to :sandwich 
    belongs_to :ingredient

    validates :quantity, presence: true
end
