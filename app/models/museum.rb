# museum model, has many reviews and musuem categories
class Museum < ApplicationRecord
  has_many :reviews
  has_many :museum_categories
  has_many :categories, through: :museum_categories
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :location, presence: true
end
