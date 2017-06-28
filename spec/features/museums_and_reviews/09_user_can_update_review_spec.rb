require 'rails_helper'
xfeature 'User can edit their own review' do
  let!(:museum) { FactoryGirl.create(:museum, name: "The Curtain Rises") }
  let!(:review) { FactoryGirl.create(:review, museum: museum) }
  let!(:review2) { FactoryGirl.create(:review, museum: museum) }
  let!(:user) { review.user }
  let!(:user2) { user }
  scenario 'User successfully edits a review' do
    sign_in_as(user)
    visit museum_path(museum)

    click_link('Edit Review', match: :first)

    fill_in 'Rating', with: 4
    fill_in 'Your Review', with: "Actually it\'s better because now they have dinosaurs."
    click_button 'Update Review'
    expect(page).to have_content('Patron Rating: 3')
    expect(page).to have_content("Actually it\'s better because now they have dinosaurs.")
    expect(page).to have_content('Review Successfully Updated')
  end

  scenario 'User unsuccessfully edits a review' do
    sign_in_as(user)
    visit museum_path(museum)
    click_link('Edit Review', match: :first)

    fill_in 'Rating', with: ''
    fill_in 'Your Review', with: ''
    click_button 'Update Review'
    expect(page).to_not have_content('Rating: 3')
    expect(page).to_not have_content(review.body)
    expect(page).to_not have_content('Review Successfully Updated')
    expect(page).to have_content('Rating can\'t be blank')
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content('Rating is not a valid numeric rating (Must be between 1-5)')
  end
end
