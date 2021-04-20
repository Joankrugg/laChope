class TypicalBeersController < ApplicationController
  before_action :set_typical_beer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @typical_beers = TypicalBeer.all
    @beers = Beer.all
    @articles = Article.all
  end

  def new
    @user = current_user
    @typical_beer = TypicalBeer.new
  end

  def create
    @user = current_user
    @typical_beer = @user.typical_beers.new(typical_beer_params)
    @typical_beer.user = @user
    if
      @typical_beer.save
      redirect_to typical_beer_path(@typical_beer)
    else
      render :new
    end
  end

  def show
    @articles = Article.all
    @beers = Beer.all
  end

  def edit
  end

  def update
    if @typical_beer.update(typical_beer_params)
      redirect_to typical_beer_path(@typical_beer)
    else
      render :edit
    end
  end

  def destroy
    @typical_beer.destroy
    redirect_to typical_beers_path
  end

  private

  def set_typical_beer
    @typical_beer = TypicalBeer.find(params[:id])
  end

  def typical_beer_params
    params.require(:typical_beer).permit(:name, :style_id, :description, :category_id, :photo)
  end
end
