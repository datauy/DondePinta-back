class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:edit, :update, :destroy]

  def index
    @breweries = Brewery.all
    @brewery = Brewery.new
  end

  def edit
  end

  def create
    @brewery = Brewery.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to breweries_url, notice: 'Brewery was successfully created.' }
      else
        format.html do
          @breweries = Brewery.all
          render :index
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to edit_brewery_url(@brewery), notice: 'Brewery was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @brewery.destroy
    respond_to do |format|
      format.html { redirect_to breweries_url, notice: 'Brewery was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def brewery_params
    params.require(:brewery).permit(:name, :brewery_type, :serves_people, :foursquare_id)
  end
end
