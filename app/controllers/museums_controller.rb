class MuseumsController < ApplicationController
  def index
    @museums = Museum.all
  end

  def show
    @museum = Museum.find(params[:id])
    @reviews = @museum.reviews
    @review = Review.new
    @hours = @museum.hours.split('\\n')

    @rating = if (@museum.rating % 1).zero? then @museum.rating.to_i else @museum.rating.round(1) end
  end
end
