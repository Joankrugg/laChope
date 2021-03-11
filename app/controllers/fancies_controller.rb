class FanciesController < ApplicationController
  def create
    @fancy = Fancy.new(fancy_params)
    @beer = Beer.find(params[:beer_id])
    @fancy.beer = @beer
    @fancy.user = current_user
    if @fancy.save
      redirect_to beer_path(@beer)
    else
      render 'beers/show'
    end
  end

  private

  def fancy_params
    params.require(:fancy).permit(:heart)
  end
end
