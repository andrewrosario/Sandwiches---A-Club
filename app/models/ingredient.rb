class Ingredient < ApplicationRecord
    has_many :sandwich_ingredients
    has_many :sandwiches, through: :sandwich_ingredients
    has_one_attached :ingredient_photo

    before_validation :downcase_fields

    validates :name, presence: true
    validates :type_of, inclusion: {in: %w(bread filling condiment) }

    def downcase_fields
        self.type_of.downcase!
    end

    def self.restrict_by_category(category)
        if category == 'All'
            self.all 
        else
            self.select{|s| s.type_of == category.downcase}
        end
    end

    def self.name_search(input)
        string = "%#{input}%"
        self.where("name LIKE ?", string)
    end
end

Ingredient.name_search('ham')
