require 'rails_helper'
feature 'User recieves an email' do
  scenario "once they review a museum they get an email confirming that they did so" do
    museum = FactoryGirl.create(:museum)
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit museum_path(museum)

    fill_in "Rating", with: "1"
    fill_in "Body", with: "Total garbage."
    click_button "Submit Review"

    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
