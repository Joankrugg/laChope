class FanciesController < ApplicationController
  before_action :get_beer, except: [:destroy]
  before_action :set_fancy, only: [:show, :edit, :update]
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

  def edit
    @fancy = @beer.fancies.find(params[:id])
  end

  def update
    if @fancy.update(fancy_params)
       @fancy.beer = @beer
      redirect_to beer_path(@beer)
    else
      render :edit
    end
  end

  private

  def get_beer
    @beer = Beer.find(params[:beer_id])
  end

  def set_fancy
    @fancy = @beer.fancies.find(params[:id])
  end

  def fancy_params
    params.require(:fancy).permit(:heart)
  end
end
