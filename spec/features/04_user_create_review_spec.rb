require 'rails_helper'
feature 'Museum\'s Reviews Create' do
  let!(:user) { FactoryGirl.create(:user, email: 'firefly@aol.com') }
  let!(:museum) { FactoryGirl.create(:museum, name: "Please") }
  let!(:review) { FactoryGirl.create(:review, museum: museum, user: user) }

  scenario 'User creates a review' do
    sign_in_as(user)
    visit museum_path(museum)

    fill_in 'Rating', with: 5
    fill_in 'Body', with: 'Awesome Museum!!!...JK'

    click_button 'Create Review'

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)

  end
  binding.pry
  scenario 'User tries to create a review with empty fields' do
    binding.pry
    sign_in_as(user)
    visit museum_path(museum)
    fill_in 'Rating', with: ''
    fill_in 'Body', with: ''
    click_button 'Create Review'

    expect(page).to have_content('Rating can\'t be blank')
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content('Rating is not a valid numeric rating (Must be between 1-5)')
  end

end
