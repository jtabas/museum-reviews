require 'rails_helper'
feature 'Museum\'s Reviews Show' do
  let!(:user) { FactoryGirl.create(:user, email: "Something@gmail.com") }
  let!(:museum) { FactoryGirl.create(:museum, name: "Ugh") }
  let!(:review) { FactoryGirl.create(:review, museum: museum, user: user) }
  let!(:review_no_body) { FactoryGirl.create(:review, rating: 1, museum: museum, body: nil, user: user) }
  let!(:reviews_sans_body) { FactoryGirl.create(:review, rating: 2, museum: museum, body: '', user: user) }

  scenario 'User visits Museum path and sees all reviews' do
    visit museum_path(museum)

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
    expect(page).to have_content("Rating: #{review_no_body.rating}")
    expect(page).to have_content("Rating: #{reviews_sans_body.rating}")
  end
end
