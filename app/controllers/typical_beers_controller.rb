class TypicalBeersController < ApplicationController
  before_action :set_typical_beer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy, :get_wiki]

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

  def wheat_beers
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def lambics
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def belgian_ales
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def pale_ales
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def bitters
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def scottish_ales
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def brown_ales
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def porters
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def stouts
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def pilsners
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def american_lagers
    @title = 'Lagers américaines'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'American Lager' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La lager américaine ou lager nord-américaine est une lager pâle produite aux États-Unis. La bière de style lager pâle est originaire d'Europe au milieu du 19e siècle et a déménagé aux États-Unis avec des immigrants allemands."
  end

  def european_lagers
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def bocks
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def alts
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def french_ales
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def german_ambers
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def american_specials
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
    @header = "Les bières spéciales sont brassées avec des sucres fermentescibles atypiques, des céréales et / ou des amidons qui contribuent à la teneur en alcool. La charactéristique Les bières spéciales réside dans le fait que les attributs distinctifs de ces ingrédients spéciaux doivent être présents dans l'arôme, la saveur et l'équilibre général de la bière. Les exemples pourraient inclure le sirop d'érable, l'agave, les pommes de terre, le riz sauvage ou toute autre source de glucides qui n'est pas couramment utilisée dans les styles de bière modernes."
  end

  def smoked_beers
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def strong_ales
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
  end

  def get_wiki
    @typical_beer = TypicalBeer.find(params[:typical_beer_id])

  end

  private

  def set_typical_beer
    @typical_beer = TypicalBeer.find(params[:id])
  end

  def typical_beer_params
    params.require(:typical_beer).permit(:name, :style_id, :description, :category_id, :photo, :beer_family_id, :wiki_link, :design_color_id, :balance_id, :main_taste_id, :alcohol_shape_id, flavour_ids:[], feeling_ids: [] )
  end
end
