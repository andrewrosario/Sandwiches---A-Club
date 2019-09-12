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

    def num_replies
        Reply.where('comment_id LIKE ?', self.id).count
    end

    def self.sort_by_replied
        # lowest is 0 highest is -1
        array = Comment.all.sort_by{|c| c.num_replies}
    end

    def self.most_replied
        self.sort_by_replied[-1]
    end

end
