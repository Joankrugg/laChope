class TastingsController < ApplicationController
  def create

    @beer = Beer.find(params[:beer_id])
    @tasting = Tasting.new(tasting_params)
    @tasting.beer = @beer
    @tasting.user = current_user
    if @tasting.save
      redirect_to beer_path(@beer)
    else
      render 'beers/show'
    end
  end

  def edit
    @beer = Beer.find(params[:beer_id])
    @tasting = @beer.tastings.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:beer_id])
    @tasting = @beer.tastings.find(params[:id])
    if @tasting.update(tasting_params)
       @tasting.beer = @beer
      redirect_to beer_path(@beer)
    else
      render :edit
    end
  end

  private

  def tasting_params
    params.require(:tasting).permit(:date, :balance_id, :main_taste_id, :weather_id, :context_id, :design_color_id, :global_rating, flavour_ids:[], feeling_ids:[])
  end


end


