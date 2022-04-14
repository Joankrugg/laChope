class TastingPlacesController < ApplicationController
  skip_before_action :authenticate_user!
  def create

    @beer = Beer.find(params[:beer_id])
    @tasting_place = TastingPlace.new(tasting_place_params)
    @tasting_place.beer = @beer
    if @tasting_place.save
      redirect_to beer_path(@beer)
    else
      redirect_to beer_path(@beer)
    end
  end

  def edit
    @beer = Beer.find(params[:beer_id])
    @tasting_place = @beer.tasting_places.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:beer_id])
    @tasting_place = @beer.tasting_places.find(params[:id])
    if @tasting_place.update(tasting_place_params)
       @tasting_place.beer = @beer
      redirect_to beer_path(@beer)
    else
      render :edit
    end
  end

  private

  def tasting_place_params
    params.require(:tasting_place).permit(:active, :market_place_id)
  end
end
