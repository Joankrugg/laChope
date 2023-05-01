require 'csv'

class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    if params[:search].present?
      @beers = Beer.global_search(params[:search])
      @articles = Article.all
      @typical_beers = TypicalBeer.all
      @fancy = Fancy.new
      @rating = Rating.new
    elsif params[:color_search].present?
      @beers = Beer.color_search(params[:color_search])
      @articles = Article.all
      @typical_beers = TypicalBeer.all
      @fancy = Fancy.new
      @rating = Rating.new
    else
      @beers = Beer.all
      @articles = Article.all
      @typical_beers = TypicalBeer.all
      @fancy = Fancy.new
      @rating = Rating.new
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
    @tasting_place = TastingPlace.new
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
  def spontaneous
    @beers = Beer.all
    @articles = Article.all
  end

  def white
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def gold
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def amber
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def brown
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def ruby
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def black
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def alcohol_free
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def light
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def regular
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def strong
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end

  def very_strong
    @beers = Beer.all
    @articles = Article.all
    @typical_beers = TypicalBeer.all
  end
  def import
    Beer.import(params[:file])
  end
  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :style_id, :alcohol_level, :color, :file, :design_color_id, :balance_id, :main_taste_id, :alcohol_shape_id, :beer_family_id, :bitterness, :description, :photo, :category_id, :target, :typical_beer_id, flavour_ids:[], feeling_ids:[])
  end
end
