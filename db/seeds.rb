# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Avant nettoyage, nombre d'évenements : #{Event.count}"

Event.destroy_all

puts "Après nettoyage, nombre d'évenements : #{Event.count}"

Event.create(
  name: "Fête des couleurs indiennes",
  address: "Place de la Victoire, Bordeaux",
  date: "3 octobre 2025",
  description: "Plongez dans l'ambiance vibrante des festivals indiens.",
  details: "Pour célébrer l'esprit des fêtes traditionnelles indiennes, participez à une journée colorée de danses, de musiques et de repas typiques. Découvrez des marchés artisanaux, des ateliers de danse Bollywood et bien plus.",
  tags: "Festif",
  image: "https://images.unsplash.com/photo-1698810127193-0c8dc6b91c9f?q=80&w=728&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8417",
  longitude: "-0.5745"
)

Event.create(
  name: "Marché de créateurs locaux",
  address: "Esplanade des Quinconces, Bordeaux",
  date: "10 octobre 2025",
  description: "Un marché dédié aux créateurs locaux où se mêlent art, artisanat et design.",
  details: "Venez rencontrer les créateurs locaux : bijoux, vêtements, objets décoratifs, et bien d'autres. Ce marché est aussi l'occasion de découvrir des ateliers créatifs et de participer à des démonstrations de savoir-faire.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1566636741346-7bc0510fdaa5?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8500",
  longitude: "-0.5728"
)

Event.create(
  name: "Festival de la gastronomie française",
  address: "Place Pey Berland, Bordeaux",
  date: "17 octobre 2025",
  description: "Un événement qui célèbre la cuisine hexagonale sous toutes ses formes.",
  details: "Venez goûter aux spécialités des régions françaises avec des chefs locaux. Au programme : dégustations, ateliers culinaires, et conférences autour de la culture gastronomique française.",
  tags: "Foodies",
  image: "https://plus.unsplash.com/premium_photo-1687975124229-e3ae49ea2c20?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8381",
  longitude: "-0.5720"
)

Event.create(
  name: "Randonnée au sommet des Pyrénées",
  address: "Parc National des Pyrénées",
  date: "25 octobre 2025",
  description: "Un week-end d'aventure et de nature, entre montagnes et paysages spectaculaires.",
  details: "Accompagné par un guide expert, partez en randonnée pour découvrir les panoramas à couper le souffle du parc national. Au programme : marche, bivouac, et découverte de la faune et flore montagnarde.",
  tags: "Nature",
  image: "https://images.unsplash.com/photo-1667063134108-4eb9d1f7a6e7?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "42.7853",
  longitude: "0.4148"
)

Event.create(
  name: "Ciné-concert : Musique et cinéma muet",
  address: "Cinéma Utopia, Bordeaux",
  date: "30 octobre 2025",
  description: "Revivez les classiques du cinéma muet avec une performance musicale en live.",
  details: "Profitez d'un moment unique où des musiciens interpréteront la bande-son en direct pendant la projection de films muets comme *Le Cabinet du Dr. Caligari* et *Nosferatu*.",
  tags: "Culturel",
  image: "https://images.unsplash.com/photo-1710988486897-e933e4b0f72c?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8432",
  longitude: "-0.5735"
)

Event.create(
  name: "Yoga et brunch au parc",
  address: "Parc Bordelais, Bordeaux",
  date: "1er novembre 2025",
  description: "Commencez votre dimanche avec une séance de yoga en plein air suivie d'un brunch bio.",
  details: "Un moment détente et bien-être : pratiquez le yoga au cœur du parc avec un professeur expérimenté, puis régalez-vous avec un brunch healthy composé de produits locaux et bio.",
  tags: "Chill",
  image: "https://images.unsplash.com/photo-1608405059861-b21a68ae76a2?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8695",
  longitude: "-0.5678"
)

Event.create(
  name: "Exposition photographique : Les Visages du Monde",
  address: "Musée des Beaux-Arts, Bordeaux",
  date: "15 novembre 2025",
  description: "Une exposition unique sur la diversité humaine à travers le regard de grands photographes.",
  details: "Parcourez des images saisissantes capturées aux quatre coins du monde. L'exposition explore les histoires de vie, les émotions et les cultures à travers les portraits pris par des photographes du monde entier.",
  tags: "Culturel",
  image: "https://images.unsplash.com/photo-1647709825916-200da934eff0?q=80&w=1231&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8396",
  longitude: "-0.5770"
)

Event.create(
  name: "Fête de la bière artisanale",
  address: "Place du Parlement, Bordeaux",
  date: "20 novembre 2025",
  description: "Un événement pour découvrir la bière artisanale locale et internationale.",
  details: "Venez rencontrer des brasseurs passionnés, découvrir leurs créations et participer à des dégustations. Vous pourrez aussi assister à des ateliers sur la fabrication de la bière.",
  tags: "Festif",
  image: "https://images.unsplash.com/photo-1600788886242-5c96aabe3757?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8371",
  longitude: "-0.5779"
)

Event.create(
  name: "Cours de cuisine végétarienne",
  address: "Le Comptoir Local, Bordeaux",
  date: "28 novembre 2025",
  description: "Apprenez à cuisiner des plats végétariens savoureux et équilibrés.",
  details: "Un chef vous guidera dans la préparation de recettes végétariennes simples, mais gourmandes. Parfait pour ceux qui veulent explorer la cuisine végétarienne tout en découvrant des ingrédients de saison.",
  tags: "Foodies",
  image: "https://images.unsplash.com/photo-1615366105533-5b8f3255ea5d?q=80&w=1167&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8400",
  longitude: "-0.5741"
)

Event.create(
  name: "Bourse aux livres et objets vintage",
  address: "Halle des Chartrons, Bordeaux",
  date: "5 décembre 2025",
  description: "Un marché pour les amoureux de livres anciens et d'objets vintage.",
  details: "Parcourez les étals de livres d'occasion, de vinyles rares et d'objets rétro. L'occasion de dénicher des trésors tout en discutant avec les passionnés qui les vendent.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1631888722728-1578b7ba6dee?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8633",
  longitude: "-0.5689"
)

Event.create(
  name: "Atelier de sérigraphie",
  address: "La Maison de la Création, Bordeaux",
  date: "12 décembre 2025",
  description: "Initiez-vous à l'art de la sérigraphie et créez vos propres affiches.",
  details: "Un atelier interactif où vous apprendrez les bases de la sérigraphie tout en créant vos propres œuvres imprimées sur différents supports. Repartez avec votre poster personnalisé.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1663433541063-ddab084d1126?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8399",
  longitude: "-0.5723"
)

Event.create(
  name: "Soirée contes et légendes",
  address: "La Cité du Vin, Bordeaux",
  date: "18 décembre 2025",
  description: "Une soirée immersive autour des contes et légendes du vin et des terroirs.",
  details: "Venez écouter des histoires fascinantes et mystérieuses autour du vin, racontées par des conteurs passionnés. Une expérience à la fois éducative et divertissante dans un cadre unique.",
  tags: "Culturel",
  image: "https://plus.unsplash.com/premium_photo-1682308189385-38a9b49f6027?q=80&w=1315&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8602",
  longitude: "-0.5743"
)

Event.create(
  name: "Marché de Noël des créateurs",
  address: "Place des Grands Hommes, Bordeaux",
  date: "22 décembre 2025",
  description: "Un marché de Noël réunissant les créations artisanales locales pour offrir un Noël unique.",
  details: "Des artisans locaux exposent leurs œuvres et créations pour vos cadeaux de fin d'année. Décoration, mode, bijoux, et bien d'autres produits faits main pour un Noël original et solidaire.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1512663251984-863560ec3985?q=80&w=1122&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8395",
  longitude: "-0.5729"
)

Event.create(
  name: "Concert de Noël : Musiques du monde",
  address: "Auditorium de Bordeaux, Bordeaux",
  date: "25 décembre 2025",
  description: "Un concert de Noël avec des chants et instruments du monde entier.",
  details: "Ce concert spécial Noël vous invite à découvrir des musiques de Noël traditionnelles des quatre coins du monde. Une soirée féérique et solennelle pour célébrer les fêtes en musique.",
  tags: "Festif",
  image: "https://images.unsplash.com/photo-1700931676493-1ea7739bd6aa?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  latitude: "44.8577",
  longitude: "-0.5742"
)
puts "Après création, nombre d'évenements : #{Event.count}"
