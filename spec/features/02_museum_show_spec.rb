require 'rails_helper'

feature 'Museums Show' do
  let!(:museum_1) { FactoryGirl.create(:museum) }
  scenario 'User visits Museums path and visit show page through a link' do
    visit museums_path
    click_on museum_1.name
    expect(page.current_path).to eq museum_path museum_1
  end

  scenario 'User visits Museum show page directly' do
    visit museum_path museum_1
    expect(page).to have_content museum_1.name
    expect(page).to have_content museum_1.description
    expect(page).to have_content museum_1.hours
    expect(page).to have_content museum_1.address
    expect(page).to have_content museum_1.admission
  end
end
