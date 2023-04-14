class Post < ApplicationRecord
  validates :word, presence: true
  validates :mean, presence: true 
end
