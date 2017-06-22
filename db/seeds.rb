require 'dotenv-rails'
require 'rest-client'

Museum.destroy_all
Review.destroy_all
User.destroy_all
Vote.destroy_all
key = ENV['GOOGLE_API_KEY']

response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9524,-75.1636&radius=15000&type=museum&key=#{key}",
{:content_type => :json, :'Authorization' => ENV['GOOGLE_API_KEY'] }
response = JSON.parse(response)

response['results'].each do |result|
  places = RestClient.get "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{result['place_id']}&key=#{key}"
  places = JSON.parse(places)
  museum = places['result']
  Museum.create!(
  name: museum['name'],
  location: museum['formatted_address'],
  hours: museum['opening_hours']['weekday_text'].join('-'),
  website: museum['website'],
  phone_number: museum['formatted_phone_number'],
  rating: result['rating']
  )
end

user = User.create(first_name: 'David', last_name: 'MacMurtrie', email: 'dave.m@gmail.com', password: 'launch', state: 'Pennsylvania', city: 'Philadelphia', username: 'davedave', admin: true)
