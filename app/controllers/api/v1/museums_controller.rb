class Api::V1::MuseumsController < ApplicationController
  def index
    render json: Museum.all
  end
end
