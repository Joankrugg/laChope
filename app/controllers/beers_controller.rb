class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @beers = Beer.all
  end

  def new
    @user = current_user
    @beer = Beer.new
  end

  def create
    @user = current_user
    @beer = @user.beers.new(beer_params)
    @beer.user = @user
    if
      @beer.save
      redirect_to beer_path(@beer)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @beer.update(beer_params)
      redirect_to beer_path(@beer)
    else
      render :edit
    end
  end

  def destroy
    @beer.destroy
    redirect_to beers_path
  end

  def target
    @beers = Beer.where(category: 'Target')
  end

  def spring
    @beers = Beer.where(category: "Collection Printemps/été")
  end

  def autumn
    @beers = Beer.where(category: 'Collection Automne/Hiver')
  end

  def featuring
    @beers = Beer.where(category: 'Featuring')
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :style_id, :alcohol_level, :color, :bitterness, :description, :photo, :category_id)
  end
end
