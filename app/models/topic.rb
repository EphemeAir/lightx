class Topic < ApplicationRecord
  validates :name, :wiki_name, presence: true
  validates  :name, :wiki_name, uniqueness: true

  has_many :discipline_topics
  has_many :topic_categories
  has_many :categories, through: :topic_categories
  has_many :video_topics
  has_many :videos, through: :video_topics
end
