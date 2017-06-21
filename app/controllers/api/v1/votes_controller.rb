class Api::V1::VotesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    vote = Vote.create(review: review, user: current_user, upvote: params[:vote])
    VoteMailer.new_vote(vote).deliver_now
    render json: { score: review.score }
  end
end
