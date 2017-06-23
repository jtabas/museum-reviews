require 'rails_helper'

feature 'User visits user show page' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User visits profile' do
    sign_in_as(user)
    visit root_path
    click_link 'My Profile'

    expect(page).to have_content user.first_name
    expect(page).to have_content user.last_name
    expect(page).to have_content user.email
    expect(page).to have_content user.username
    expect(page).to have_content user.city
    expect(page).to have_content user.state
  end

  scenario 'User cannot visit profile if not signed in' do
    visit root_path

    expect(page).to_not have_link 'My Profile'
  end
end
