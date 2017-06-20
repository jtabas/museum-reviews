FactoryGirl.define do
  factory :museum do
    name 'The Franklin Institute'
    description 'Sweet Sweet IMAX'
    hours '9:30am to 5:00pm M,T,W,TH,F,S,SU'
    address '222 N 20th St'
    admission 20.0

    factory :museum_skips_validate do
      to_create {|instance| instance.save(validate: false) }
    end

  end
end
