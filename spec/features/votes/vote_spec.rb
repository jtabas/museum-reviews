require 'rails_helper'

xfeature "User votes" do
  let!(:user) {FactoryGirl.create(:user) }
  let!(:review) {FactoryGirl.create(:review, user: user, museum: museum) }
  let!(:museum) {FactoryGirl.create(:museum) }
  it 'user upvotes another review' do
    sign_in_as(user)
    visit museum_path(museum)
    click_button 'Downvote'
    save_and_open_page

    expect(page).to have_content('Score: -1')
  end
end
