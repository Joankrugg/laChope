class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @beers = Beer.global_search(params[:search])
      @articles = Article.all
      @typical_beers = TypicalBeer.all
    elsif params[:color_search].present?
      @beers = Beer.color_search(params[:color_search])
      @articles = Article.all
      @typical_beers = TypicalBeer.all
    else
      @beers = Beer.all
      @articles = Article.all
      @typical_beers = TypicalBeer.all
    end
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
    @fancy = Fancy.new
    @rating = Rating.new
    @tasting = Tasting.new
    @beers = Beer.all
    @typical_beers = TypicalBeer.all

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
    @beers = Beer.where(target: true)
    @articles = Article.all
  end

  def spring
    @beers = Beer.where(spring_collection: true)
    @articles = Article.all
  end

  def autumn
    @beers = Beer.where(autumn_collection: true)
    @articles = Article.all
  end

  def lagers
    @beers = Beer.all
    @articles = Article.all
  end

  def ales
    @beers = Beer.all
    @articles = Article.all

  end

  def mixed
    @beers = Beer.all
    @articles = Article.all
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :style_id, :alcohol_level, :color, :beer_family_id, :bitterness, :description, :photo, :category_id, :target, :typical_beer_id)
  end
end
