require 'rails_helper'

feature 'User sees edit profile page' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User fills out edit page' do
    sign_in_as(user)
    visit user_path(user)
    click_link 'Edit my Profile'

    expect(page).to have_field('First Name', with: user.first_name)
    expect(page).to have_field('Email', with: user.email)
    expect(page).to have_field('Username', with: user.username)
    expect(page).to have_field('City', with: user.city)
  end

  scenario 'User edits profile successfully' do
    sign_in_as(user)
    visit user_path(user)
    click_link 'Edit my Profile'
    fill_in 'Username', with: 'TheOtherGuy'
    fill_in 'City', with: 'Sacramento'
    fill_in 'Password', with: user.password
    fill_in 'Confirm Password', with: user.password
    click_on 'Update Profile'

    expect(page).to_not have_content user.username
    expect(page).to_not have_content user.city
    expect(page).to have_content 'TheOtherGuy'
    expect(page).to have_content 'Sacramento'
    expect(page).to have_content('Profile Updated')
  end

  scenario 'User unsuccessfully edits profile' do
    sign_in_as(user)
    visit user_path(user)
    click_link 'Edit my Profile'
    fill_in 'Username', with: 'TheOtherGuy'
    click_on 'Update Profile'

    expect(page.current_path).to eq(edit_user_path(user))
    expect(page.current_path).to_not eq(user_path(user))
    expect(page).to have_content('Please enter correct passord to save changes')
    expect(page).to_not have_content('Profile Updated Successfully')
  end
end
