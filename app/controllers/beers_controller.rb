require 'csv'

class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy, :toggle_favorite]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :import, :toggle_favorite]
  def index
    if params[:search].present?
      @beers = Beer.global_search(params[:search]).paginate(page: params[:page], per_page: 12)
      @articles = Article.all
      @typical_beers = TypicalBeer.all
      @fancy = Fancy.new
      @rating = Rating.new
    elsif params[:color_search].present?
      @beers = Beer.color_search(params[:color_search]).paginate(page: params[:page], per_page: 12)
      @articles = Article.all
      @typical_beers = TypicalBeer.all
      @fancy = Fancy.new
      @rating = Rating.new
    else
      @beers = Beer.all.paginate(page: params[:page], per_page: 12)
      @articles = Article.all
      @typical_beers = TypicalBeer.all
      @fancy = Fancy.new
      @rating = Rating.new
    end
  end


  def toggle_favorite
    current_user.favorited?(@beer)  ?current_user.unfavorite(@beer) : current_user.favorite(@beer)
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

  def other
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
    file = params[:file]
    if file.nil?
      flash[:error] = "Aucun fichier n'a été téléchargé."
      redirect_to beers_path
    else
      CSV.foreach(file.path, headers: true) do |row|
        user = User.find_or_create_by(id: row['user_id']) do |c|
          c.beer.name = row[1]
          c.beer.beer_family_id = row[2]
          c.beer.typical_beer_id= row[3]
          c.beer.photo = URI.parse(row[4]).open
          c.beer.user = user
          c.beer.save!
        end
      end
      redirect_to root_path
    end
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :style_id, :alcohol_level, :color, :file, :design_color_id, :balance_id, :main_taste_id, :alcohol_shape_id, :beer_family_id, :bitterness, :description, :photo, :category_id, :target, :typical_beer_id, flavour_ids:[], feeling_ids:[])
  end
end
