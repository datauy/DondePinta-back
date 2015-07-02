class Api::V1::BeersController < ApplicationController
  def index
    @beers = Beer.all
    render json: @beers
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer
  end
end
