class Museum < ApplicationRecord
  has_many :reviews
  validates_associated :reviews

  validates :name, presence: true
  validates :address, presence: true
end
