require'dotenv'
require 'pry'
require 'json'
require 'http'

client_id =ENV["YELP_CLIENT_ID"]
client_secret =ENV["YELP_CLIENT_SECRET"]

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
TOKEN_PATH = "/oauth2/token"
GRANT_TYPE = "client_credentials"


DEFAULT_BUSINESS_ID = "yelp-philadelphia"
DEFAULT_TERM = "museum"
DEFAULT_LOCATION = "Philadelphia, PA"
SEARCH_LIMIT = 5
# class Yelp
#   attr_reader :yelp
#   def initialize(latitude, longitude)
#     get_weather(latitude, longitude)
#   end
#
#   def get_weather(latitude, longitude)
#     key =ENV["DARK_SKY_KEY"]
#     response = HTTParty.get("https://api.darksky.net/forecast/#{key}/#{latitude},#{longitude}")
#     parsed_response = JSON.parse(response.to_s)
#     @yelp = parsed_response["currently"]["summary"]
#   end
# end
