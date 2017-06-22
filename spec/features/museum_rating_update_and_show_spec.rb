require 'rails_helper'
feature 'user update a musem\'s rating' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User can get to the edit feature' do
    sign_in_as(user)
    visit museum_path(museum)

    fill_in 'Rating', with: 4
    click_button 'Create Review'

    fill_in 'Rating', with: 3
    click_button 'Create Review'

    expect(page).to have_content("Rating: 3.5")
  end
end
