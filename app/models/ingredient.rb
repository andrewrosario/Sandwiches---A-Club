class Ingredient < ApplicationRecord
    has_many :sandwich_ingredients
    has_many :sandwiches, through: :sandwich_ingredients

    before_validation :downcase_fields

    validates :name, presence: true
    validates :type_of, inclusion: {in: %w(bread filling condiment) }

    def downcase_fields
        self.type_of.downcase!
    end
end
