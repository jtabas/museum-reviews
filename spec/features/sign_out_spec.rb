require 'rails_helper'

feature 'user signs out' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'signed-in user successfully signs out' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).to have_content('Create Account')
  end

  scenario 'unauthenticated user cannot succesfully sign out' do
    visit root_path

    expect(page).to_not have_content('Sign Out')
  end
end
