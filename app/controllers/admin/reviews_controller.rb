module Admin
  class ReviewsController < ApplicationController
    def destroy
      @review = Review.find(params[:id])
      if current_user.admin
        @review.destroy
        flash[:notice] = "Review has been deleted"
        redirect_to museums_path
      end
    end
  end
end
