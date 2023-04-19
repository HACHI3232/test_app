class Post < ApplicationRecord
  validates :word, presence: true
  validates :mean, presence: true 

  belongs_to :category
end
