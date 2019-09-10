class Sandwich < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :replies, through: :comments
    has_many :sandwich_ingredients
    has_many :ingredients, through: :sandwich_ingredients

    validates :title, presence: true

    def average_rating
        sum = self.comments.average(:rating)
    end

    def is_vegan?
        if !self.ingredients.where('is_meat = true').empty? || !self.ingredients.where('is_dairy_or_egg = true').empty?
            return false
        else 
            return true
        end
    end

    def is_vegetarian?
        if !self.ingredients.where('is_meat = true').empty?
            return false
        else 
            return true
        end
    end

    def is_gluten_free?
        if self.ingredients.where('is_gluten_free = true').empty?
            return false
        else 
            return true
        end
    end

    def is_kosher?


    end

    def name_search(input)
        string = "%#{input}%"
        self.where("title LIKE ?", string)
    end

    def description_search(input)
        string = "%#{input}%"
        self.where("description LIKE ?", string)
    end
    
    def ingredient_search(input)
        string = "%#{input}%"
        self.joins(:ingredients).where("name LIKE ?", string)
    end

    def consolidate_searches(input)
        byebug
        new_array = []
        new_array << self.name_search(input)
        new_array << self.description_search(input)
        new_array << self.ingredient_search(input)
        array = new_array.flatten.uniq
    end

    def self.restrict_by_category(category)
        case category
        when "Vegan"
            Sandwich.all.select{|s| s.is_vegan?}
        when "Vegetarian"
            Sandwich.all.select{|s| s.is_vegetarian?}
        when "Gluten-Free"
            Sandwich.all.select{|s| s.is_gluten_free?}
        else
            Sandwich.all
        end
    end

end
