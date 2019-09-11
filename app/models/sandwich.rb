class Sandwich < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :replies, through: :comments
    has_many :sandwich_ingredients
    has_many :ingredients, through: :sandwich_ingredients

    has_one_attached :sandwich_photo

    validates :title, presence: true

    accepts_nested_attributes_for :ingredients

    def average_rating
        sum = self.comments.average(:rating)
        !sum ? 0 : sum.truncate(3)
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

    def self.restrict_by_category(category)
        case category
        when "Vegan"
            self.select{|s| s.is_vegan?}
        when "Vegetarian"
            self.select{|s| s.is_vegetarian?}
        when "Gluten-Free"
            self.select{|s| s.is_gluten_free?}
        when "All"
            self.all
        end
    end

    def self.name_search(input)
        string = "%#{input}%"
        self.where("title LIKE ?", string)
    end

    def self.description_search(input)
        string = "%#{input}%"
        self.where("description LIKE ?", string)
    end
    
    def self.ingredient_search(input)
        string = "%#{input}%"
        self.joins(:ingredients).where("name LIKE ?", string)
    end

    def self.consolidate_searches(input)
        new_array = []
        new_array << self.name_search(input)
        new_array << self.description_search(input)
        new_array << self.ingredient_search(input)
        array = new_array.flatten.uniq
    end

    def ingredient_quantity(id)
        ingredient = Ingredient.find(id)
        relation = SandwichIngredient.where('sandwich_id LIKE ? AND ingredient_id LIKE ?', self.id, ingredient.id)
        relation.first.quantity if !relation.empty?
    end

    def num_comments
        Comment.where('sandwich_id LIKE ?', self.id).count
    end

    def self.sort_by_commented
        # lowest is 0 highest is -1
        array = Sandwich.all.sort_by{|s| s.num_comments}
    end

    def self.most_commented
        com = Comment.group(:sandwich_id).count
        id = com.key(com.values.max)
        Sandwich.find(id)
    end

    def self.sort_by_rating
        # lowest is 0 highest is -1
        Sandwich.all.sort_by{|s| s.average_rating}
    end

    def self.highest_rated
        Sandwich.max_by{|s| s.average_rating}
    end


end
