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
    @title = 'Bières de Blé'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Wheat beers' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Bière originaire des États-Unis avec un minimum de 30% de blé / froment et un taux d'alcool assez bas.
        Souvent épicée, elle existe aujourd'hui avec des ajouts comme le citron, le gingembre, la citronnelle, la coriandre, etc."
  end

  def lambics
    @title = 'Lambics et Bières Acides'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Lambics & Sours' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Le lambic est une bière de fermentation spontanée (levures sauvages) en principe exclusivement produite dans la vallée de la Senne (sud de Bruxelles) et dans le Pajottenland (ouest de Bruxelles). C'est une bière plus ou moins acide selon son âge, sans pétillant ni mousse, et titrant environ 5° d'alcool. Elle est consommée telle quelle et sert aussi de base pour la production du faro, de la gueuze et de la kriek."
  end

  def belgian_ales
    @title = 'Ales Belges'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Belgian Ales ' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Les esters fruités faibles à moyens sont équilibrés avec les légers arômes de malt. Un piquant phénolique léger dérivé issu de la levure peut être présent. Le caractère diacétylique et acide ne doit pas être présent. En bref, c'est fin et complexe."
  end

  def pale_ales
    @title = 'Pale Ales'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Pale Ales' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Une pale ale est une Ale : une bière d’inspiration anglaise, à fermentation haute. Brassée au malt pale, la pale ale est un type de bière qui propose généralement un goût caramélisé typique, un corps sucré et un taux d’alcool faible."
  end

  def bitters
    @title = 'Bitters (Bières Amères Anglaises)'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Bitters' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Une légère carbonatation (peu de pétillance) caractérise traditionnellement les versions en fût, mais dans les versions en bouteille, une légère augmentation de la teneur en dioxyde de carbone est acceptable. Les esters fruités sont acceptables. Le diacétyle est généralement absent de ces bières mais peut être présent à de faibles concentrations."
  end

  def scottish_ales
    @title = 'Scottish Ales (Ales Écossaises)'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Scottish Ales' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Des arômes de malts doux et sirupeux caractérise bien la famille des scottish ales."
  end

  def brown_ales
    @title = 'Brown ales (Bières Rousses Anglaises)'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Brown Ales' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La bière brune est un style de bière de couleur ambre foncé ou brune. Le terme a été utilisé pour la première fois par les brasseurs londoniens à la fin du XVIIe siècle pour décrire leurs produits, tels que la bière douce, bien que le terme ait un sens assez différent aujourd'hui."
  end

  def porters
    @title = 'Brown ales (Bières Brunes Anglaises)'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Porters' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Le Porter est un style de bière noire de fermentation haute appartenant à la famille des ales, relativement similaire à un autre type de bière qui est le Stout. Avec ses notes chaleureuses et ne se dégustant pas très fraîche, la bière Porter est idéale par temps froid et se déguste le plus souvent en hiver. Elle se présente dans une belle robe de couleur ébène coiffée d’une épaisse mousse crémeuse."
  end

  def stouts
    @title = 'Stouts'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Stouts' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La stout est une bière brassée à partir d'un moût caractérisé par sa teneur en grains hautement torréfiés. La présence de ces grains bien grillés dans la recette confère la couleur foncée à la bière ainsi qu'un goût de café ou de cacao. Cette bière est devenue une spécialité irlandaise. Son origine première est cependant anglaise par sa filiation avec la porter."
  end

  def pilsners
    @title = 'Pils'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Pilsner' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La pilsner, du nom de la ville de Pilsen en République tchèque, est un type de bière blonde et limpide, de fermentation basse apparenté au type lager. Elle titre environ 5 degrés d'alcool et possède une amertume moyenne, dépendant du type de houblon utilisé.."
  end

  def american_lagers
    @title = 'Lagers américaines'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'American Lager' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La lager américaine ou lager nord-américaine est une lager pâle produite aux États-Unis. La bière de style lager pâle est originaire d'Europe au milieu du 19e siècle et a déménagé aux États-Unis avec des immigrants allemands."
  end

  def european_lagers
    @title = 'Lagers Européennes'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'European Lager' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La pilsner, du nom de la ville de Pilsen en République tchèque, est un type de bière blonde et limpide, de fermentation basse apparenté au type lager. Elle titre environ 5 degrés d'alcool et possède une amertume moyenne, dépendant du type de houblon utilisé."
  end

  def bocks
    @title = 'Bocks'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Bock' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Originaires du nord de l’Allemagne ces bières titrent entre 6,5 et 7° mais ne sont pas très puissantes en goût. Peu d’amertume, peu de malt, peu de corps."
  end

  def alts
    @title = 'Altbiers'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Alt' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La Altbier est une bière de fermentation haute brassée essentiellement dans la région de Düsseldorf en Allemagne. Titrant entre 4,5 et 5 % d'alcool et de couleur cuivre à brun, elle se caractérise par un goût combinant l'amer et le sucré."
  end

  def french_ales
    @title = 'Bières de Garde'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'French Ale' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Généreuses en alcool sans être particulièrement fortes, maltées, mise en garde (stockées), de fermentation haute. Douce et maltées en première bouche puis sèche sur la fin."
  end

  def german_ambers
    @title = 'Allemandes Ambrées'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'German Amber' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Les versions les foncées peuvent inclure des arômes légèrement torréfiés de cacao, caramel ou biscuit. La douceur du malt va de léger à moyen et peut s'équilibrer avec une très légère astringence."
  end

  def american_specials
    @title = 'Américaines spéciales'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'American Special' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Les bières spéciales sont brassées avec des sucres fermentescibles atypiques, des céréales et / ou des amidons qui contribuent à la teneur en alcool. La charactéristique Les bières spéciales réside dans le fait que les attributs distinctifs de ces ingrédients spéciaux doivent être présents dans l'arôme, la saveur et l'équilibre général de la bière. Les exemples pourraient inclure le sirop d'érable, l'agave, les pommes de terre, le riz sauvage ou toute autre source de glucides qui n'est pas couramment utilisée dans les styles de bière modernes."
  end

  def smoked_beers
    @title = 'Bières Fumées'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Smoked Beer' })
    @articles = Article.all
    @beers = Beer.all
    @header = "Les versions les foncées peuvent inclure des arômes légèrement torréfiés de cacao, caramel ou biscuit. La douceur du malt va de léger à moyen et peut s'équilibrer avec une très légère astringence."
  end

  def strong_ales
    @title = 'Ales Fortes'
    @typical_beers = TypicalBeer.joins(:beer_family).where(beer_families: { name: 'Strong Ale' })
    @articles = Article.all
    @beers = Beer.all
    @header = "La Strong ale est un type de bière, entre 7% et 11% vol., Qui couvre un certain nombre de styles de bière, y compris la vieille bière, le vin d'orge et la bière Burton."
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
