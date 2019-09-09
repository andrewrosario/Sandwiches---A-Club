class Ingredient < ApplicationRecord
    has_many :sandwich_ingredients
    has_many :sandwiches, through: :sandwich_ingredients

    validates :name, presence: true
    validates :type_of, inclusion: {in: %w(bread filling condiment)}
end
