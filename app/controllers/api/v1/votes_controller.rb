class Api::V1::VotesController < ApplicationController
  def create
    @museum = Museum.find(params[:museum_id])
    @review = Review.find(params[:review_id])
    @vote = Vote.create(review: review, user: current_user, upvote: params[:vote])
    VoteMailer.new_vote(vote).deliver_now
    render json: { score: review.rating }
      if @vote.find(params[:vote_id])
        vote.destroy
      else
        @vote.update
      end
  end
end
