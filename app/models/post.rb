class Post < ApplicationRecord
  validates :word, presence: { message: "単語を入力して下さい" }
  validates :mean, presence: { message: "意味を入力して下さい" }
end
