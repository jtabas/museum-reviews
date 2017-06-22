class Review < ApplicationRecord
  belongs_to :museum
  belongs_to :user
  has_many :votes

  validates :rating,
  presence: true,
  numericality: true,
  format: {
    with: /\A[1-5]\z/,
    message: ' is not a valid numeric rating (Must be between 1-5)'
  }
  def score
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end
end
