require 'rails_helper'
xfeature 'Museum\'s Reviews Create' do
  let!(:user) { FactoryGirl.create(:user, email: 'firefly@aol.com') }
  let!(:museum) { FactoryGirl.create(:museum, name: "Please") }

  scenario 'User creates a review' do
    sign_in_as(user)
    visit museum_path(museum)
    fill_in 'Rating', with: 5
    fill_in 'Your Review', with: 'Awesome Museum!!!...JK'

    click_button 'Create Review'

    expect(page).to have_content(5)
    expect(page).to have_content('Awesome Museum!!!...JK')
  end

  scenario 'User tries to create a review with empty fields' do
    sign_in_as(user)
    visit museum_path(museum)
    fill_in 'Rating', with: ''
    fill_in 'Your Review', with: ''
    click_button 'Create Review'

    expect(page).to have_content('Rating can\'t be blank')
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content('Rating is not a valid numeric rating (Must be between 1-5)')
  end
end
