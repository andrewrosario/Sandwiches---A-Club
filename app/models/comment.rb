class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich
    has_many :replies
    validates :title, presence: true, if: :content
    validates :content, presence: true, if: :title
    validate :title_or_rating

    def title_or_rating
        errors.add(:base, "You must give either a comment or a rating") unless (title || rating)
    end


end
