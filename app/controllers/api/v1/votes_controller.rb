class Api::V1::VotesController < ApplicationController
  def create
    @vote = @review.vote
    @review = Review.find(params[:review_id])
    @museum = Review.museum
    @user = User.find(params[current_user])
    @vote = Vote.create(review: review, user: current_user, upvote: params[:vote])
    VoteMailer.new_vote(vote).deliver_now
    render json: { score: review.rating }
      if vote.find(params[:review_id, current_user]) == true
        vote.destroy
      else
        vote.update
      end
  end
end
