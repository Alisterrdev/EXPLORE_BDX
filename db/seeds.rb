# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 10 latitudes entre 44.7876737782253 et 44.860225750269116
CORDONATES_LAT = [
  44.7876737782253,
  44.79652857205071,
  44.80538336587612,
  44.81423815970153,
  44.82309295352694,
  44.83194774735235,
  44.84080254117776,
  44.84965733500317,
  44.85851212882859,
  44.860225750269116
]

# 10 longitudes entre -0.6772759625754721 et -0.5044430287804741
CORDONATES_LONG = [
  -0.6772759625754721,
  -0.6582506343941971,
  -0.6392253062129221,
  -0.6201999780316471,
  -0.6011746498503721,
  -0.5821493216690971,
  -0.5631239934878221,
  -0.5440986653065471,
  -0.5250733371252721,
  -0.5044430287804741
]


puts "Avant nettoyage, nombre d'évenements : #{Event.count}"

Event.destroy_all

puts "Après nettoyage, nombre d'évenements : #{Event.count}"

Event.create(
  name: "BDC fait son show !",
  address: "Quai des Queyries, Bordeaux",
  date: "26 août 2025",
  description: "Après une année passée à répéter, semmêler les pieds et se relever avec le sourire, les danseurs de BDC montent enfin sur scène. Le spectacle de fin dannée, cest loccasion de voir les plus petits, les grands, les passionnés et même les “je danse pour le fun” partager la même énergie. Au menu : des chorégraphies décalées, des costumes qui accrochent la lumière et un final surprise dont personne ne sortira indifférent. Dès 20h",
  # tags: "Creatif" "Plus de 40 euros",
  tags: Event::TAGS.sample
)

Event.create(
  name: "Bal des pompiers !",
  address: "Pey Berland, Bordeaux",
  date: "28 août 2025",
  description: "Après une année passée à répéter, semmêler les pieds et se relever avec le sourire, les danseurs de BDC montent enfin sur scène. Le spectacle de fin dannée, cest loccasion de voir les plus petits, les grands, les passionnés et même les “je danse pour le fun” partager la même énergie. Au menu : des chorégraphies décalées, des costumes qui accrochent la lumière et un final surprise dont personne ne sortira indifférent. Dès 20h",
  # tags: ["Festif", "Gratuit"],,
  tags: "Festif"
)

Event.create(
  name: "DJ Set et détente chez Calicéo",
  address: "8 Rue Jean Pommiès, 33520 Bruges, Bordeaux",
  date: "29 août 2025",
  description: "Imaginez les bassins de Calicéo Bordeaux transformés en dancefloor aquatique. Les jeudis 21 et 28 août, les Soirées Bulles dÉté mêlent détente et musique : DJ set en live, jeux de lumières colorées, vapeurs du hammam et cascades deau. Une façon décalée de prolonger lété, que vous veniez entre amis ou pour souffler en solo.",
  # tags: ["Festif", "Creatif", "Entre 0 et 40 euros"],
  tags: "Creatif"
)

Event.create(
  name: "Balade nocturne au parc floral",
  address: "Parc Floral, Bordeaux",
  date: "27 août 2025",
  description: "À la tombée de la nuit, rejoignez-nous pour une promenade guidée dans les allées illuminées du parc floral. L'occasion parfaite de découvrir la faune et la flore locales sous un autre angle.",
  tags: "Nature"
)

Event.create(
  name: "Apéro jazz au bord de la Garonne",
  address: "Hangar Darwin, Bordeaux",
  date: "29 août 2025",
  description: "Un moment chill avec vue sur le fleuve, un verre à la main et une playlist jazz en live. Ambiance décontractée garantie.",
  tags: "Chill"
)

Event.create(
  name: "Marché gourmand des quais",
  address: "Quais de Bordeaux, Bordeaux",
  date: "30 août 2025",
  description: "Un rassemblement de food trucks, producteurs locaux et artisans du goût. Venez goûter, flâner, et remplir votre panier !",
  tags: Event::TAGS.sample
)

Event.create(
  name: "Nuit des arts de la rue",
  address: "Place Saint-Michel, Bordeaux",
  date: "31 août 2025",
  description: "Des jongleurs, des conteurs, des échassiers et des musiciens prennent d'assaut les rues pour un soir magique à ciel ouvert.",
  tags: "Culturel"
)

Event.create(
  name: "Festival Écume Electronique",
  address: "Base sous-marine, Bordeaux",
  date: "1er septembre 2025",
  description: "Un festival électro dans un lieu unique. DJs internationaux, installations lumineuses et vibes festives toute la nuit.",
  tags: "Festif"
)

Event.create(
  name: "Atelier peinture intuitive",
  address: "Espace 29, 33000 Bordeaux, France",
  date: "2 septembre 2025",
  description: "Exprimez-vous sans contrainte ! Un atelier où pinceaux, couleurs et émotions s'entremêlent. Aucune compétence requise.",
  tags: "Creatif"
)

Event.create(
  name: "Pique-nique musical au Jardin Public",
  address: "Jardin Public, 33000 Bordeaux, France",
  date: "3 septembre 2025",
  description: "Un midi tout doux dans l'herbe avec des musiciens acoustiques, des paniers pique-nique locaux et une ambiance détendue.",
  tags: "Chill"
)

Event.create(
  name: "Randonnée contée au bois de Bordeaux",
  address: "Bois de Bordeaux, 33000 Bordeaux, France",
  date: "4 septembre 2025",
  description: "Une promenade forestière ponctuée d'histoires racontées par des conteurs passionnés. Une immersion nature & légendes.",
  tags: "Nature"
)

Event.create(
  name: "Fête de la bière artisanale",
  address: "Cour Mably, Bordeaux",
  date: "5 septembre 2025",
  description: "Dégustations, brassage en direct, concerts et street food. Le paradis des amateurs de houblon !",
  tags: "Foodies"
)

Event.create(
  name: "Improvisation théâtrale sous les étoiles",
  address: "Parc Rivière, Bordeaux",
  date: "6 septembre 2025",
  description: "Un spectacle unique où rien n’est écrit d’avance. Rires et surprises garantis dans un cadre verdoyant.",
  tags: "Culturel"
)

Event.create(
  name: "Danse libre au miroir d'eau",
  address: "Place de la Bourse, Bordeaux",
  date: "7 septembre 2025",
  description: "Rejoignez un cercle de danse spontanée, pieds nus sur le miroir d’eau. Musique live et liberté de mouvement au programme.",
  tags: "Creatif"
)

Event.create(
  name: "Sunset yoga et smoothies",
  address: "Quai des Marques, Bordeaux",
  date: "8 septembre 2025",
  description: "Une session de yoga face au coucher de soleil, suivie de smoothies frais et bio. Apportez votre tapis !",
  tags: "Chill"
)

Event.create(
  name: "Soirée salsa en plein air",
  address: "Place des Quinconces, Bordeaux",
  date: "9 septembre 2025",
  description: "Ambiance caliente sous les étoiles avec initiation gratuite, danse libre et musique cubaine en live.",
  tags: "Festif"
)

Event.create(
  name: "Marche méditative au lever du jour",
  address: "Parc Bordelais, Bordeaux",
  date: "10 septembre 2025",
  description: "Une expérience de reconnexion à soi dans le silence du matin. Respiration, pas lents et contemplation.",
  tags: "Nature"
)

Event.create(
  name: "Atelier de cuisine du monde",
  address: "Maison de quartier Bastide, 33000 Bordeaux, France",
  date: "11 septembre 2025",
  description: "Préparez et dégustez des recettes venues d'ailleurs dans une ambiance conviviale. Venez avec vos papilles !",
  tags: "Foodies"
)

puts "Après création, nombre d'évenements : #{Event.count}"
