require 'rails_helper'
feature 'Museum\'s Reviews Show' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:review) { FactoryGirl.create(:review, museum: museum) }
  let!(:review_no_body) { FactoryGirl.create(:review, rating: 1, museum: museum, body: nil) }
  let!(:reviews_sans_body) { FactoryGirl.create(:review, rating: 2, museum: museum, body: '') }


  scenario 'User visits Museum path and sees all reviews' do
      visit museum_path(museum)

      expect(page).to have_content(review.rating)
      expect(page).to have_content(review.body)

      expect(page).to have_content('Rating: ' + review_no_body.rating.to_s)

      expect(page).to have_content(review_no_body.body)
  end
end
