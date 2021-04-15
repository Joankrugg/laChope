class RatingsController < ApplicationController
  def create

    @rating = Rating.new(rating_params)
    @beer = Beer.find(params[:beer_id])
    @rating.beer = @beer
    @rating.user = current_user
    if @rating.save
      redirect_to beer_path(@beer)
    else
      render 'beers/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:stars)
  end
end
