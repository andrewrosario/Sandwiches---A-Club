class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :sandwich
    has_many :replies
    validate :title, if: :content
    validate :content, if: :title
    validate :title_or_rating

    def title_or_rating
        #comments may have only a title and content or only a rating, or they may have all 3. However, if they have a title they must have content.
    end


end
