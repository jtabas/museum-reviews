FactoryGirl.define do
  factory :vote do
    association :user
    association :review
    upvote true
  end
end
