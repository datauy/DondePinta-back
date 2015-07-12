class Api::V1::BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all.includes(:beers, :open_hours)
    render json: @breweries
  end

  def show
    @brewery = Brewery.find(params[:id])
    render json: @brewery
  end
end
