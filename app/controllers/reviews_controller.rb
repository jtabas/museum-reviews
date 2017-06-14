class ReviewsController < ApplicationController

  def create
    @museum = Museum.find(params[:museum_id])
    @review = Review.new(review_params)
    @review.museum = @museum

    if @review.save
      flash[:notice] = "Museum Saved Successfully"
      redirect_to museum_path(@museum)
    else
      flash[:alert] = @review.errors.full_messages.to_sentence
      render "museums/show.html.erb"
    end
  end

private

def review_params
  params.require(:review).permit(
    :rating,
    :body,
    :museum
  )
  end
end
