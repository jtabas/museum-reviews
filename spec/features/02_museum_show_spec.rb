require 'rails_helper'

feature 'Museums Show' do
  let!(:museum) { FactoryGirl.create(:museum, name: "evnewevwunerwpunrpnu") }

  scenario 'User visits Museum show page directly' do
    visit museum_path(museum)
    expect(page).to have_content museum.name
    expect(page).to have_content museum.description
    expect(page).to have_content museum.hours
    expect(page).to have_content museum.address
    expect(page).to have_content museum.admission
  end
end
