class Category < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :topic_categories
  has_many :topics, through: :topic_categories
end
