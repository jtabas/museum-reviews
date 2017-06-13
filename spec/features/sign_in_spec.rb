require 'rails_helper'

feature 'user signs in' do
  let!(:user) { FactoryGirl.create(:user) }
  scenario 'existing user specifies a valid username and password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'an invalid email and password are supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'user'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'right email with wrong password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'wrong email with right password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'emale'
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    expect(page).to have_content('Invalid Email or password.')
    expect(page).to_not have_content('Signed in successfully.')
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    expect(page).to_not have_content('Sign In')
    expect(page).to have_content('Sign Out')
  end
end
