# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Event.create(
  name: "BDC fait son show !",
  address: "Quai des Queyries, Bordeaux",
  date: "26 août 2025",
  description: "Après une année passée à répéter, semmêler les pieds et se relever avec le sourire, les danseurs de BDC montent enfin sur scène. Le spectacle de fin dannée, cest loccasion de voir les plus petits, les grands, les passionnés et même les “je danse pour le fun” partager la même énergie. Au menu : des chorégraphies décalées, des costumes qui accrochent la lumière et un final surprise dont personne ne sortira indifférent. Dès 20h",
  tags: "Creatif",
  latitude: "44.863238",
  longitude: "-0.5854411",
)

Event.create(
  name: "Bal des pompiers !",
  address: "Pey Berland, Bordeaux",
  date: "28 août 2025",
  description: "Après une année passée à répéter, semmêler les pieds et se relever avec le sourire, les danseurs de BDC montent enfin sur scène. Le spectacle de fin dannée, cest loccasion de voir les plus petits, les grands, les passionnés et même les “je danse pour le fun” partager la même énergie. Au menu : des chorégraphies décalées, des costumes qui accrochent la lumière et un final surprise dont personne ne sortira indifférent. Dès 20h",
  tags: "Festif",
  latitude: "20.863238",
  longitude: "-2.5854411",
)

Event.create(
  name: "DJ Set et détente chez Calicéo",
  address: "8 Rue Jean Pommiès, 33520 Bruges",
  date: "29 août 2025",
  description: "Imaginez les bassins de Calicéo Bordeaux transformés en dancefloor aquatique. Les jeudis 21 et 28 août, les Soirées Bulles dÉté mêlent détente et musique : DJ set en live, jeux de lumières colorées, vapeurs du hammam et cascades deau. Une façon décalée de prolonger lété, que vous veniez entre amis ou pour souffler en solo.",
  tags: "Festif" "Creatif",
  latitude: "44.8757135",
  longitude: "-0.5852175",
)
