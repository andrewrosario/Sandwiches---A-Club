class Sandwich < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :replies, through: :comments
    has_many :sandwich_ingredients
    has_many :ingredients, through: :sandwich_ingredients

    validates :title, presence: true

    def new
        @sandwich = Sandwich.new
    end

    def create

    end

    def show
        @sandwich = Sandwich.find(params[:id])
    end
    
end
