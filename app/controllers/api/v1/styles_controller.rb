class Api::V1::StylesController < ApplicationController
  respond_to :json
  def index
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end
end
