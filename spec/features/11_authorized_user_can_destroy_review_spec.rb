require 'rails_helper'
feature 'Only authorized user can destroy a review' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:review) { FactoryGirl.create(:review, museum: museum, user: user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, email: 'NotJohnSmith@gmail.com') }

  scenario 'User cannot destroy a review if not signed in' do
    visit museum_path(museum)

    expect(page).to_not have_link('Delete This Review')
  end

  scenario 'User can only destroy a review that does belongs to that user' do
    sign_in_as(user)
    visit museum_path(museum)

    expect(page).to have_link('Delete This Review')
  end

  scenario 'User cannot destroy a review that does not belong to that user' do

    sign_in_as(user2)
    visit museum_path(museum)

    expect(page).to have_no_link('Delete This Review')
  end
end
