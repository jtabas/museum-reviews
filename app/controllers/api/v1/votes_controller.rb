class Api::V1::VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review.museum = @museum
    vote = Vote.create(review: @review, user: current_user, upvote: params[:vote])
    VoteMailer.new_vote(vote).deliver_now
    render json: { score: review.score }
      if Vote.find(params[:review_id, current_user]) == true
        @vote.destroy
      else
        @vote.update
      end
  end
end
