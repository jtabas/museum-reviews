module Admin
  class ReviewsController < ApplicationController
    def destroy
      binding.pry
      @review = Review.find(params[:id])
      if current_user.admin
        @review.destroy
        flash[:notice] = "Review has been deleted"
        redirect_to museums_path
      else
        flash[:notice] = "You don't have access to this page!"
      end
    end

    private

    def review_params
      params.require(:review).permit(:rating, :body, :user)
    end
  end
end
