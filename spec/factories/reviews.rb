FactoryGirl.define do
  factory :review do
    rating 3
    body 'this museum was definitely museum-esque. if you want a museum, this is certainly that.'
    user
    museum
  end
  def score
    self.votes.where(upvote: true).count - self.votes.where(upvote: false).count
  end
end
