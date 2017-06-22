scenario "review a museum" do
  museum = FactoryGirl.create(:museum)
  user = FactoryGirl.create(:user)

  sign_in_as(user)

  visit museum_path(museum)

  fill_in "Rating", with: "1"
  fill_in "Review", with: "Total garbage."
  click_button "Submit Review"

  expect(page).to have_content("Total garbage.")
  expect(ActionMailer::Base.deliveries.count).to eq(1)
end
