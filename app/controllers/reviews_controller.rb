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
    @review.save
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to museum_path(@museum)
    else
      flash[:notice] = @review.errors.full_messages.to_sentence
      render 'museums/show'
    end

    def edit
      @museum = Museum.find(params[:museum_id])
      @review = Review.find(params[:id])
    end

    def update
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to review_path(@review)
      else
        render :edit
      end
    end

    def destroy
      @review = review.find(params[:id])
      @review.destroy
      redirect_to museums_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :user)
  end
end
