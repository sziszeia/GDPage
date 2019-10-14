class Post < ApplicationRecord
    validates :username, presence: true
    validates :body, presence: true
end
