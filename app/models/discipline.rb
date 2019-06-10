class Discipline < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: :grade }
  belongs_to :grade
  has_many :discipline_topics
  has_many :topics, through: :discipline_topics
end
