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
    if @typical_beer.wiki_link.present?
      html_file = RestClient.get(@typical_beer.wiki_link)
      html_doc = Nokogiri::HTML(html_file)
      titles = html_doc.css('h3')
      titles_desc = []
      titles[0..8].each { |title| titles_desc << title.child.child.text}
      contents = html_doc.css('p')
      contents_desc = []
      contents[0..8].each{|content| contents_desc << content.child.text}
      description = []
      description << titles_desc
      description << contents_desc
      @final_description = description.transpose.flatten
      render text: @final_description
    else
      puts 'waiting for wiki'
    end
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
    @typical_beers = TypicalBeer.all
    @articles = Article.all
    @beers = Beer.all
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
