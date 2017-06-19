<<<<<<< HEAD
require 'dotenv-rails'
require 'rest-client'
require 'pry'

Museum.destroy_all
response = RestClient.get 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9524,-75.1636&radius=15000&type=museum&key=#{ENV['GOOGLE_API_KEY']}',
{:content_type => :json, :'Authorization' => ENV['GOOGLE_API_KEY']}
response = JSON.parse(response)
response['results'].each do |result|
  places = RestClient.get 'https://maps.googleapis.com/maps/api/place/details/json?placeid=#{result['place_id']}&key=#{ENV['GOOGLE_API_KEY']}'
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
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
museum = Museum.create(name:'The Franklin Institute', description:'Sweet Sweet IMAX', hours:'9:30am to 5:00pm M,T,W,TH,F,S,SU', location:'222 N 20th St, Philadelphia, PA 19103', admission:'$20.00')
user = User.create(first_name: 'John', last_name: 'Smith', email: 'John.Smith@gmail.com', password: 'Launch', state: 'Pennsylvania', city: 'Philadelphia', username: 'AtTheRealJohnSmith')
>>>>>>> master
