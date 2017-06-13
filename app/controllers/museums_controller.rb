class MuseumsController < ApplicationController
  def index
<<<<<<< HEAD
=======
    @museums = Museum.all
  end

  def show
    @museum = Museum.find(params[:id])
>>>>>>> master
  end
end
