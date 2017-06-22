require 'rails_helper'

xfeature 'Museums Show' do
  let!(:museum) { FactoryGirl.create(:museum, name: "evnewevwunerwpunrpnu") }

  scenario 'User visits Museum show page directly' do
    visit museum_path(museum)
    expect(page).to have_content museum.name
    expect(page).to have_content JSON.parse(museum.hours)[0]
    expect(page).to have_content museum.location
    expect(page).to have_content museum.phone_number
    expect(page).to have_content museum.website
  end
end
