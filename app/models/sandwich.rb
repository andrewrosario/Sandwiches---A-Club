class Sandwich < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :replies, through: :comments
    has_many :sandwich_ingredients
    has_many :ingredients, through: :sandwich_ingredients

    validates :title, presence: true
    
end
