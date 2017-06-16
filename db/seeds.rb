require "dotenv-rails"
require "rest-client"
require 'pry'

Museum.destroy_all
response = RestClient.get "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.9524,-75.1636&radius=15000&type=museum&key=#{ENV['GOOGLE_API_KEY']}",
{:content_type => :json, :'Authorization' => ENV['GOOGLE_API_KEY']}
response = JSON.parse(response)
response["results"].each do |result|
  places = RestClient.get "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{result["place_id"]}&key=#{ENV['GOOGLE_API_KEY']}"
  places = JSON.parse(places)
  museum = places["result"]

  Museum.create!(
  name: museum["name"],
  location: museum["formatted_address"],
  hours: museum["opening_hours"]["weekday_text"].join("\n"),
  website: museum["website"],
  phone_number: museum["formatted_phone_number"],
  rating: result["rating"]
  )
end
