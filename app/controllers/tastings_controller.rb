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

  def update
  end

  private

  def tasting_params
    params.require(:tasting).permit(:date, :global_rating, flavour_ids:[])
  end


end


