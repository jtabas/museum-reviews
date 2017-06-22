require 'rails_helper'

describe "Votes API", type: :request do
  it 'creates a vote' do
    FactoryGirl.create(:vote)
    FactoryGirl.create(:museum)
    FactoryGirl.create(:review)

    post "/api/v1/museums/#{museum.id}/reviews/#{review.id}/votes"
    binding.pry
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.length).to eq(10)
  end
end
