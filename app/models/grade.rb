class Grade < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :users
  has_many :disciplines

end
