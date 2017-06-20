# class Api::V1::VotesController < ApplicationController
#   def create
#     review = Review.find(params[:review_id])
#     Vote.create(review: review, user: current_user, upvote: params[:vote])
#     render json: { rating: review.rating}
#   end
# end
