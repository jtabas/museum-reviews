FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Smith'
    sequence(:email) { |n| "john#{n}@gmail.com" }
    password 'Launch'
    state 'Pennsylvania'
    city 'Philadelphia'
    username 'AtTheRealJohnSmith'
    admin false
  end
end
