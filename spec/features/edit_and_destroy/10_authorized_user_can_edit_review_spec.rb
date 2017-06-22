require 'rails_helper'
feature 'Only authorized user can edit a review' do
  let!(:museum) { FactoryGirl.create(:museum, name: "IN Unifrom and Evening Dress") }
  let!(:review) { FactoryGirl.create(:review, museum: museum) }
  let!(:real_user) { review.user }
  let!(:user) { FactoryGirl.create(:user, email: 'something@something.com') }
  let!(:user2) { FactoryGirl.create(:user, email: 'NotJohnSmith@gmail.com') }

  scenario 'User cannot edit a review if not signed in' do
    visit museum_path(museum)

    expect(page).to_not have_link('Edit This Review')
  end

  scenario 'User can only edit a review that does belongs to that user' do
    sign_in_as(real_user)
    visit museum_path(museum)

    expect(page).to have_link('Edit This Review')
  end

  scenario 'User cannot edit a review that does not belong to that user' do
    binding.pry
    sign_in_as(user2)
    visit museum_path(museum)

    expect(page).to have_no_link('Edit This Review')
  end
end
