class BeersController < ApplicationController
  before_action :set_beer, only: [:edit, :update, :destroy]

  def index
    @beers = Beer.all
    @beer = Beer.new
  end

  def edit
  end

  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to beers_url, notice: 'Beer was successfully created.' }
      else
        format.html do
          @beers = Beer.all
          render :index
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to edit_beer_url(@beer), notice: 'Beer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beer
    @beer = Beer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def beer_params
    params.require(:beer).permit(:brewery_id, :brand, :style, :color, :alcohol, :bitterness, :size, :draft)
  end
end
