require 'rails_helper'
feature 'user can add a review' do
  let!(:museum) {FactoryGirl.create(:museum)}

  scenario 'user can add a new review' do
    body = "Man do I love this place, it is such a place! People, Places, and of course, Things! Nouns, Guys!"
    visit museum_path(museum)
    fill_in "Rating", with: 3
    fill_in "Body", with: body
    click_button "Create Review"

    expect(page).to have_content("Rating: 3")
    expect(page).to have_content(body)
  end

  scenario 'user can add a new review without a body' do
    visit museum_path(museum)
    fill_in "Rating", with: 1
    click_button "Create Review"

    expect(page).to have_content("Rating: 1")
  end

  scenario 'user cannot add a new review without a body' do
    visit museum_path(museum)
    fill_in "Rating", with: 40
    click_button "Create Review"

    expect(page).to have_content("Rating is not a valid numeric rating (Must be between 1-5)")
  end
end
