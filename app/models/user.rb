class User < ApplicationRecord
    has_many :comments
    has_many :sandwiches
    has_many :replies

    validates :username, presence: true
    validates :username, uniqueness: true
    # has_secure_password
    validates :display_name, presence: true
    validates :age, numericality: {min: 13}
    validates :email, presence: true
    validates :email, uniqueness: true
end
