class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @museum = Museum.find(params[:museum_id])
  end

  def create
    @museum = Museum.find(params[:museum_id])
    @review = Review.new(review_params)
    @review.museum = @museum

    @review.user = current_user
    @new_museum_rating = @review.rating.to_f + @museum.rating.to_f
    @museum.reviews.each { |review| @new_museum_rating += review.rating }
    @total_reviews = @museum.reviews.size.to_f + 2
    @new_museum_rating /= @total_reviews

    @museum.update_attribute(:rating, @new_museum_rating)

    if @review.save
      ReviewMailer.new_review(@review).deliver_now
      flash[:notice] = 'Review added successfully'
      redirect_to museum_path(@museum)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render 'museums/show'
    end
  end

  def edit
    @museum = Museum.find(params[:museum_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @museum = Museum.find(params[:museum_id])
    if @review.update(review_params)
      flash[:notice] = "Review Successfully Updated"
      redirect_to museum_path(@museum)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @museum = @review.museum
    @review.destroy
    redirect_to museum_path(@museum)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :user)
  end
end
