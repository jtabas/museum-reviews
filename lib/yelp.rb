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
