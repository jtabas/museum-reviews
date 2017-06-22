class Museum < ApplicationRecord
  has_many :reviews
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :location, presence: true
end
