feature "Set an Avatar" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user signs up with an avatar" do
    visit root_path
    click_link 'Create Account'
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'Jerry.Sanchez@gmail.com'
    fill_in 'Username', with: 'AtTheRealJohnSmith'
    fill_in 'Password', with: 'Launch'
    fill_in 'Confirm Password', with: 'Launch'
    attach_file 'Avatar', "#{Rails.root}/spec/support/images/art-museum.jpg"
    click_button 'Create Account'
    click_link 'My Profile'

    expect(page).to have_css("img[src*='art-museum.jpg']")
  end

  scenario 'user edits profile to have avatar' do
    sign_in_as(user)
    click_link 'My Profile'
    click_link 'Edit my Profile'
    fill_in 'Password', with: user.password
    fill_in 'Confirm Password', with: user.password
    attach_file 'Avatar', "#{Rails.root}/spec/support/images/art-museum.jpg"
    click_button 'Update Profile'

    expect(page).to have_css("img[src*='art-museum.jpg']")
  end
end
