class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich
    has_many :replies
    validate :title, if: :content
    validate :content, if: :title
    validate :title_or_rating

    def title_or_rating
        errors.add(:base, "You must give either a comment or a rating") unless (title || rating)
    end
end
