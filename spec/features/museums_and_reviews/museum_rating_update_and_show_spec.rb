require 'rails_helper'
xfeature 'user update a musem\'s rating' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: 'email@email.com') }
  let!(:review) { FactoryGirl.create(:review, museum: museum, user: user1) }

  scenario 'User posts a new review which changes the rating' do
    sign_in_as(user2)
    visit museum_path(museum)
    fill_in 'Rating', with: 4
    click_button 'Create Review'
    expect(page).to have_content("Rating: 3.3")
  end
end
