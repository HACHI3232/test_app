class Category < ApplicationRecord
  with_options presence: true do
    validates :name
  end

  has_many :posts
end
