require 'rails_helper'

feature 'Admin access admin functions' do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user1) { FactoryGirl.create(:user, email: 'mugmug@phone.table') }
  let!(:user2) { FactoryGirl.create(:user, email: 'this_is@my.email') }
  let!(:user3) { FactoryGirl.create(:user, email: 'email.email@email.email') }


  scenario 'Admin sees users link' do
    sign_in_as(admin)
    visit user_path(admin)
    expect(page).to have_content 'Admin Features'
    expect(page).to have_link 'See All Users'
  end

  scenario 'Admin visits users link' do
    sign_in_as(admin)
    visit user_path(admin)
    click_link 'See All Users'

    expect(page).to have user1.first_name
    expect(page).to have user2.first_name
    expect(page).to have user3.first_name
  end
end
