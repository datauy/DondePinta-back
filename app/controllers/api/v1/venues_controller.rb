class Api::V1::VenuesController < ApplicationController
  def index
    @venues = Venue.all.includes(:beers, :open_hours)
    render json: @venues
  end

  def show
    @venue = Venue.find(params[:id])
    render json: @venue
  end
end
