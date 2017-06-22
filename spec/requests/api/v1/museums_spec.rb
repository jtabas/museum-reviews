require 'rails_helper'

describe "Museums API", type: :request do
  it 'sends a list of museums' do
    FactoryGirl.create_list(:museum, 10)

    get '/api/v1/museums'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end
