require 'rails_helper'

feature 'Admin access admin functions' do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user1) { FactoryGirl.create(:user, email: 'mugmug@phone.table') }
  let!(:user2) { FactoryGirl.create(:user, email: 'myyyyy@email.yay') }
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:review) { FactoryGirl.create(:review, museum: museum, user: user1) }


  scenario 'Admin sees link to delete review' do
    sign_in_as(admin)
    visit museum_path(museum)
    expect(page).to have_link 'Delete as Admin'
  end

  scenario 'Non-admin does not see link to delete review' do
    sign_in_as(user1)

    visit museum_path(museum)
    expect(page).to_not have_link 'Delete as Admin'
  end

  scenario 'Admin deletes a review' do
    sign_in_as(admin)
    visit museum_path(museum)
    click_link 'Delete as Admin'

    expect(page.current_path).to eq(museums_path)
    expect(Review.all).to be_empty
  end
end
