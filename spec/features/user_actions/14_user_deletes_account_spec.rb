require 'rails_helper'

feature 'User deletes account' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'User sees and clicks delete' do
    sign_in_as(user)
    visit user_path(user)
    click_link 'Delete my Account'

    expect(User.all).to be_empty
    expect(page.current_path).to eq(museums_path)
  end
end
