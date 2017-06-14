FactoryGirl.define do
  factory :review do
    rating 3
    body 'this museum was definitely museum-esque. if you want a museum, this is certainly that.'

    museum
  end
end
