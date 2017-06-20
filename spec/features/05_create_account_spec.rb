require 'rails_helper'

feature 'user signs up' do
  scenario 'specifying valid and require information' do
    visit museums_path
    click_link 'Create Account'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'Jerry.Sanchez@gmail.com'
    fill_in 'Username', with: 'AtTheRealJohnSmith'
    fill_in 'Password', with: 'Launch'
    fill_in 'Confirm Password', with: 'Launch'
    fill_in 'Home City', with: 'Philadelphia'
    fill_in 'State', with: 'Pennsylvania'
    click_button 'Create Account'
    expect(page).to have_content('Account succesfully created')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Create Account'
    click_button 'Create Account'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'Password confirmation does not match password' do
    visit root_path
    click_link 'Create Account'
    fill_in 'Password', with: 'Launch'
    fill_in 'Confirm Password', with: 'Lanch'
    click_button 'Create Account'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
