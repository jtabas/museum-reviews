require "rails_helper"
feature "Museums Index" do
  let!(:museum_1) { FactoryGirl.create(:museum) }
  let!(:museum_2) { FactoryGirl.create(:museum) }

  scenario "User visits root path and sees a list of museums" do
    visit root_path

    expect(page).to have_content "Museums"
    expect(page).to have_content museum_1.name
    expect(page).to have_content museum_2.name
  end
  scenario "User visits Museum index page directly" do
    visit museums_path

    expect(page).to have_content "Museums"
    expect(page).to have_content museum_1.name
    expect(page).to have_content museum_2.name
  end
end
