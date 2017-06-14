class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
  end

  def new
    @museum = Museum.new
  end

  def show
    @museum = Museum.find(params[:id])
    @reviews = @museum.reviews
    @review = Review.new
  end
end
