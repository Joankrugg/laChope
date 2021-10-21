class MarketPlacesController < ApplicationController
  before_action :set_market_place, only: [:show, :edit, :update, :destroy]
  def index
    @market_places = MarketPlace.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @market_places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def new
    @market_place = MarketPlace.new
  end

  def create
    @market_place = MarketPlace.new(market_place_params)
    if @market_place.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    @market_place.update(market_place_params)
    if @market_place.save!
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_market_place
    @market_place = MarketPlace.find(params[:id])
  end

  def market_place_params
    params.require(:market_place).permit(:name, :city, :zipcode, :website)
  end
end
