# museum model, has many reviews and musuem categories
class Museum < ApplicationRecord
  has_many :reviews
  validates :name, presence: true
  validates :location, presence: true
end
