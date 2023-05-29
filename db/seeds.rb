# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
require "open-uri"

CSV.foreach(Rails.root.join('db', 'seeds', 'witbier_total.csv'), headers: true) do |row|
  beer = Beer.new
  beer.name = row['name']
  beer.alcohol_level = row['alcohol_level']
  beer.design_color = DesignColor.find(row['design_color_id'])
  beer.main_taste = MainTaste.find(row['main_taste_id'])
  beer.user = User.find(row['user_id'])
  beer.beer_family = BeerFamily.find(row['beer_family_id'])
  beer.typical_beer = TypicalBeer.find(row['typical_beer_id'])

  # Attribuer l'image à la bière
  image_url = row['image_url']
  if image_url.present?
    file = URI.open(image_url)
    beer.photo.attach(io: file, filename: "#{beer.name.parameterize}.jpg")
  end

  beer.save!
end



#Category.create({name:'Target'})
#Category.create({name:"La P'tite Chopine"})
#Category.create({name:'Design Featuring'})

#Style.create({name: 'Berliner Weiss'})
#Style.create({name: 'Belgian White'})
#Style.create({name: 'American Wheat'})
#Style.create({name: 'Weizenbier'})
#Style.create({name: 'Dunkelweizen'})
#Style.create({name: 'Weizenbock'})
#Style.create({name: 'Lambic'})
#Style.create({name: 'Gueuze'})
#Style.create({name: 'Faro'})
#Style.create({name: 'Fruit Beer'})
#Style.create({name: 'Flanders Red'})
#Style.create({name: 'Oud Bruin'})
#Style.create({name: 'Belgian Gold'})
#Style.create({name: 'Tripel'})
#Style.create({name: 'Saison'})
#Style.create({name: 'Belgian Pale Ale'})
#Style.create({name: 'Belgian Dark Ale'})
#Style.create({name: 'Dubbel'})
#Style.create({name: 'Pale Ale'})
#Style.create({name: 'American Pale Ale'})
#Style.create({name: 'India Pale Ale'})
#Style.create({name: 'American Amber Ale'})
#Style.create({name: 'Ordinary Bitter'})
#Style.create({name: 'Special Bitter'})
#Style.create({name: 'Extra Special Bitter'})
#Style.create({name: 'Scottish light'})
#Style.create({name: 'Scottish Heavy'})
#Style.create({name: 'Scottish Export'})
#Style.create({name: 'English Mild'})
#Style.create({name: 'American Brown'})
#Style.create({name: 'English Brown'})
#Style.create({name: 'Brown Porter'})
#Style.create({name: 'Robust Porter'})
#Style.create({name: 'Dry Stout'})
#Style.create({name: 'Sweet Stout'})
#Style.create({name: 'Oatmeal Stout'})
#Style.create({name: 'Foreign Extra Stout'})
#Style.create({name: 'Imperial Stout'})
#Style.create({name: 'Russian Imperial Stout'})
#Style.create({name: 'German Pilsner'})
#Style.create({name: 'Bohemian Pilsner'})
#Style.create({name: 'American Pilsner'})
#Style.create({name: 'American light'})
#Style.create({name: 'American Standard'})
#Style.create({name: 'American Premium'})
#Style.create({name: 'American Dark'})
#Style.create({name: 'Munich Helles'})
#Style.create({name: 'Dortmunder'})
#Style.create({name: 'Munich Dunkel'})
#Style.create({name: 'Schwartzbeir'})
#Style.create({name: 'Helles Bock'})
#Style.create({name: 'Doppelbock'})
#Style.create({name: 'Traditional bock'})
#Style.create({name: 'Eisbock'})
#Style.create({name: 'Kölsch'})
#Style.create({name: 'Altbier'})
#Style.create({name: 'Bière de Garde'})
#Style.create({name: 'Oktoberfest'})
#Style.create({name: 'Vienna'})
#Style.create({name: 'Cream Ale'})
#Style.create({name: 'Steam Beer'})
#Style.create({name: 'Rauchbier'})
#Style.create({name: 'Barley Wine'})
#Style.create({name: 'English Old Ale'})
#Style.create({name: 'Scotch Ale'})

#Unit.create({name:'l'})
#Unit.create({name:"cl"})
#Unit.create({name:'g'})
#Unit.create({name:'kg'})

#Action.create({name: 'Faire chauffer'})
#Action.create({name: 'Moudre'})
#Action.create({name: "Mélanger l'eau et "})
#Action.create({name: 'Attendre et Maintenir'})
#Action.create({name: 'Retirer pour décoction '})
#Action.create({name: 'Maintenir'})
#Action.create({name: 'Réintroduire'})
#Action.create({name: 'Filtrer'})
#Action.create({name: 'Rincer'})
#Action.create({name: 'Mesurer la densité'})
#Action.create({name: 'Faire bouillir'})
#Action.create({name: 'Ajouter'})
#Action.create({name: 'Attendre'})
#Action.create({name: 'Dry Hopping'})
#Action.create({name: 'Garde en Bouteille'})
#Action.create({name: 'Faire refroidir'})
#Action.create({name: 'Mise en bouteilles'})
#Action.create({name: 'Éteindre la source de chaleur'})

#DurationUnit.create({name:'Min'})
#DurationUnit.create({name:"Days"})
#DurationUnit.create({name:'Weeks'})
#DurationUnit.create({name:'Months'})

#ProductType.create({name: 'eau'})
#ProductType.create({name: 'houblon'})
#ProductType.create({name: 'malt'})
#ProductType.create({name: 'maische'})
#ProductType.create({name: 'reste de maische'})
#ProductType.create({name: 'maische extraite'})
#ProductType.create({name: 'moût'})
#ProductType.create({name: 'levures'})
#ProductType.create({name: 'sucre'})
#ProductType.create({name: 'épices'})
#ProductType.create({name: 'adjuvants'})
#ProductType.create({name: 'fruit'})
#ProductType.create({name: 'Drêches'})

#Activity.create({name: 'Amateur/trice de bière'})
#Activity.create({name: 'Brasseur/se amateur/e'})
#Activity.create({name: 'Brasseur/se professionnel/le'})
#Activity.create({name: 'Brasseur/se artiste'})
#Activity.create({name: 'Barman/maid'})
#Activity.create({name: 'Cuisinier/ère'})
#Activity.create({name: 'Zytholoque'})
#Activity.create({name: 'Bloggeur/se'})
#Activity.create({name: 'Influenceur/se'})

#AlcoholShape.create({name:'Sans Alcool ≤ 1°'})
#AlcoholShape.create({name:"1° ≤ Légère ≤ 4°"})
#AlcoholShape.create({name:'4° ≤ Classique ≤ 6°'})
#AlcoholShape.create({name:'6°≤ Forte ≤ 9°'})
#AlcoholShape.create({name:'9°≤ Très forte '})

#MainTaste.create({name:'Acide'})
#MainTaste.create({name:'Amère'})
#MainTaste.create({name:'Salée'})
#MainTaste.create({name:'Sucrée'})

#Flavour.create({name: 'Banane'})
#Flavour.create({name: 'Biscuit'})
#Flavour.create({name: 'Boisé'})
#Flavour.create({name: 'Café'})
#Flavour.create({name: 'Caramel'})
#Flavour.create({name: 'Caramel dur'})
#Flavour.create({name: 'Chocolat'})
#Flavour.create({name: 'Empyreumatique'})
#Flavour.create({name: 'Epices'})
#Flavour.create({name: 'Fleurs'})
#Flavour.create({name: 'Foin'})
#Flavour.create({name: 'Fraise'})
#Flavour.create({name: 'Fruits'})
#Flavour.create({name: 'Fruits rouges'})
#Flavour.create({name: 'Fumée'})
#Flavour.create({name: 'Herbacé'})
#Flavour.create({name: 'Madère'})
#Flavour.create({name: 'Malté'})
#Flavour.create({name: 'Orange'})
#Flavour.create({name: 'Pain Grillé'})
#Flavour.create({name: 'Poire'})
#Flavour.create({name: 'Poivre'})
#Flavour.create({name: 'Raisin'})
#Flavour.create({name: 'Réglisse'})
#Flavour.create({name: 'Résineux'})
#Flavour.create({name: 'Torréfaction'})

#DesignColor.create({name: 'Blanche'})
#DesignColor.create({name: 'Jaune pâle'})
#DesignColor.create({name: 'Blonde'})
#DesignColor.create({name: 'Dorée'})
#DesignColor.create({name: 'Ambrée'})
#DesignColor.create({name: 'Rousse'})
#DesignColor.create({name: 'Brune'})
#DesignColor.create({name: 'Ruby'})
#DesignColor.create({name: 'Café'})
#DesignColor.create({name: 'Noire'})

#Feeling.create({name: 'Mousseuse'})
#Feeling.create({name: 'Pétillante'})
#Feeling.create({name: 'Astringeante'})
#Feeling.create({name: 'Fluide'})
#Feeling.create({name: 'Epaisse'})
#Feeling.create({name: 'Ronde'})
#Feeling.create({name: 'Fine'})
#Feeling.create({name: 'Sèche'})
#Feeling.create({name: 'Plate'})

#Balance.create({name:'très maltée'})
#Balance.create({name:'maltée'})
#Balance.create({name:'équilibrée'})
#Balance.create({name:'houblonnée'})
#Balance.create({name:'très houblonnée'})

#Theme.create({name:'Actualité'})
#Theme.create({name:"Note d'intention"})
#Theme.create({name:'Histoire'})
#Theme.create({name:'Technique'})

#Sexe.create({name:"Femme"})
#Sexe.create({name:'Homme'})
#Sexe.create({name:'Non Binaire'})

#Weather.create({name:'Caniculaire'})
#Weather.create({name:'Ensoleillé'})
#Weather.create({name:'Nuageux'})
#Weather.create({name:'Pluvieux'})
#Weather.create({name:'Hivernal'})

#Context.create({name:'Déjeuner'})
#Context.create({name:'Dîner'})
#Context.create({name:'Apéro'})
#Context.create({name:'Soirée'})
#Context.create({name:'Dégustation'})
#Context.create({name:'Soif'})

#BeerFamily.create({name:'Wheat beers'})
#BeerFamily.create({name:'Lambics & Sours'})
#BeerFamily.create({name:'Belgian Ales '})
#BeerFamily.create({name:'Pale Ales'})
#BeerFamily.create({name:'Bitters'})
#BeerFamily.create({name:'Scottish Ales'})
#BeerFamily.create({name:'Brown Ales'})
#BeerFamily.create({name:'Porters'})
#BeerFamily.create({name:'Stouts'})
#BeerFamily.create({name:'Pilsner'})
#BeerFamily.create({name:'American Lager'})
#BeerFamily.create({name:'European Lager'})
#BeerFamily.create({name:'Bock'})
#BeerFamily.create({name:'Alt'})
#BeerFamily.create({name:'French Ale'})
#BeerFamily.create({name:'German Amber'})
#BeerFamily.create({name:'American Special'})
#BeerFamily.create({name:'Smoked Beer'})
#BeerFamily.create({name:'Strong Ale'})


#MarketStyle.create({name:'Bar'})
#MarketStyle.create({name:'Cave'})
#MarketStyle.create({name:'Brasserie'})

#Origin.create({name:'Allemagne'})
#Origin.create({name:'Belgique'})
#Origin.create({name:'Îles Anglo-celtes '})
#Origin.create({name:'U.S.A'})
#Origin.create({name:'Autres'})





