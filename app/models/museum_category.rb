class MuseumCategory < ApplicationRecord
  belongs_to :museum
  belongs_to :category
end
