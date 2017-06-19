require 'rails_helper'
feature 'User can edit a review' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:review) { FactoryGirl.create(:review, museum: museum, user: user ) }
  let!(:review2) { FactoryGirl.create(:review, museum: museum, user: user ) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User can get to the edit feature' do
    sign_in_as(user)
    visit museum_path(museum)
    click_link('Edit This Review', :match => :first)
    expect(page).to have_field('Rating', with: 3)
    expect(page).to have_content(review.body)
    expect(page).to have_button('Update Review')
  end
end
