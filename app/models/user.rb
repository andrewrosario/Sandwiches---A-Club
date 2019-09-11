class User < ApplicationRecord
    has_many :comments
    has_many :sandwiches
    has_many :replies

    has_one_attached :avatar

    validates :username, presence: true
    validates :username, uniqueness: true
    has_secure_password
    validates :display_name, presence: true
    validates :age, numericality: {min: 13}
    validates :email, presence: true
    validates :email, uniqueness: true
    validate :no_spaces
    def no_spaces
        errors.add(:username, 'may not contain spaces') if /\s/.match(username)
    end

    def email_is_valid
        errors.add(:email, 'is not a valid e-mail address') unless /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i.match(email)
    end
end
