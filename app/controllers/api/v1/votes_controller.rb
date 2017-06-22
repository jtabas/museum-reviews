class Api::V1::VotesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    if !Vote.where(user: current_user, review: review).empty?
      old_vote = Vote.where(user: current_user, review: review).first
      if old_vote.upvote.to_s != params[:vote]
        old_vote.update(upvote: params[:vote])
      end
    else
      vote = Vote.create(review: review, user: current_user, upvote: params[:vote])
    end
    # VoteMailer.new_vote(vote).deliver_now
    render json: { score: review.score }
  end
end
