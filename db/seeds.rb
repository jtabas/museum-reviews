require 'dotenv-rails'
require 'rest-client'
require 'pry'

Museum.destroy_all
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
  hours: museum['opening_hours']['weekday_text'].join('\n'),
  website: museum['website'],
  phone_number: museum['formatted_phone_number'],
  rating: result['rating']
  )
end

# user = User.create(first_name: 'John', last_name: 'Smith', email: 'John.Smith@gmail.com', password: 'Launch', state: 'Pennsylvania', city: 'Philadelphia', username: 'AtTheRealJohnSmith')
