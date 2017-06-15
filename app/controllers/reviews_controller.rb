class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @museum = Museum.find(params[:museum_id])
  end

  def create
    @museum = Museum.find(params[:museum_id])
    @review = Review.create(review_params)
    @review.museum = @museum
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to museum_path(@museum)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

private

  def review_params
     params.require(:museum).permit(:rating, :body)
  end
end
