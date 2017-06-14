class Museum < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
end
