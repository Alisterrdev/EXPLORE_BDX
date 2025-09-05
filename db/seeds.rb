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
puts "Avant nettoyage, nombre de users : #{User.count}"

User.destroy_all

puts "Après nettoyage, nombre de users : #{User.count}"

puts "Avant nettoyage, nombre d'évenements : #{Event.count}"

Event.destroy_all

puts "Après nettoyage, nombre d'évenements : #{Event.count}"

User.create(
  email: "test@test.com",
  password: "123456",
  address: "107 Cr Balguerie Stuttenberg, 33300 Bordeaux, France"
)


Event.create(
  name: "Atelier peinture intuitive",
  address: " 29 Rue Fernand Marin, 33000 Bordeaux, France",
  date: Date.parse("2 septembre 2025"),
  details: "Jonathan Parcelare est artiste-peintre ainsi qu'éducateur spécialisé, il décide de partager sa passion et laisser les curieux s'exprimer sur la toile.",
  image: "https://images.unsplash.com/photo-1541961017774-22349e4a1262?q=80&w=758&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Exprimez-vous sans contrainte ! Un atelier où pinceaux, couleurs et émotions s'entremêlent. Aucune compétence requise.",
  tags: "Creatif"
)

Event.create(
  name: "Grand destockage au Comptoir des Quartiers",
  address: "Le Comptoir des Quartiers – 1 rue Marc Gauthier, 33130 Villenave d'Ornon, France",
  date: Date.parse("3 septembre 2025"),
  description: "Ce déstockage à Villenave d’Ornon n’a rien d’une braderie classique : ici, chaque édition réserve son lot de surprises. On y déniche des vêtements de marques neuves, des accessoires tendance, des bijoux stylés et même des sandales parfaites pour l’été.",
  details: "Avec des prix allant de 5 € à 50 € et des réductions jusqu’à -70 %, c’est le plan shopping idéal pour refaire sa garde-robe sans exploser son budget. Et comme les collections changent à chaque édition, impossible de repartir bredouille.",
  tags: "Chill",
  image: "https://images.unsplash.com/photo-1512663251984-863560ec3985?q=80&w=1122&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Randonnée contée au bois de Bordeaux",
  address: "All. du Bois, 33300 Bordeaux, 33000 Bordeaux, France",
  date: Date.parse("4 septembre 2025"),
  description: "Une promenade forestière ponctuée d'histoires racontées par des conteurs passionnés. Une immersion nature & légendes.",
  details: "Existant depuis cinq ans, plongez au coeur des nombreuses légendes bordelaises. Cet évènement revient pour faire rêver les petits comme les grands",
  image: "https://images.unsplash.com/photo-1506545733010-83bc7e37fcc2?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  tags: "Nature"
)

event = Event.create(
  name: "Demo Day",
  address: "107 Cr Balguerie Stuttenberg, 33300 Bordeaux, France",
  date: Date.parse("5 septembre 2025"),
  description_title: "Le grand dévoilement",
  description: "Après 9 semaines intensives de travail et de créativité, les élèves du Wagon sont enfin prêts à vous dévoiler leurs projets tech.
          Rendez-vous dans les locaux du Wagon pour une soirée exceptionnelle, placée sous le signe de la convivialité et du partage.
          Vous découvrirez en avant-première les applications et solutions innovantes imaginées et développées par nos élèves – le fruit de leur passion, de leur persévérance et de leur esprit d’équipe.",
  details_title: "La fête continue",
  details:"Après les démonstrations, place à la célébration : nous vous donnons rendez-vous au cœur de l’Engrenage, pour prolonger la fête autour de musique, de belles rencontres et de moments inoubliables. Une soirée unique pour s’inspirer, échanger et célébrer ensemble la créativité et l’audace des talents de demain.",

  tags: "Festif",
  image: "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?q=80&w=1112&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
)

4.times do |time|
  file = "app/assets/images/mood-pic/#{event.tags.downcase}/#{event.name.split[0].downcase}/#{event.name.split[0].downcase}-#{time + 1}.jpg"
  puts file
  event.files.attach(io: File.open(file), filename: event.name, content_type: "image/jpg")
end

Event.create(
  name: "Pique-nique musical au Jardin Public",
  address: "Jardin Public, 33000 Bordeaux, France",
  date: Date.parse("6 septembre 2025"),
  details: "Venez vous joindre au groupe et partager un moment convivial avec les musiciens. Un moment à partager en famille ou entre amis sans modération.",
  image: "https://images.unsplash.com/photo-1592753054398-9fa298d40e85?q=80&w=765&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Un midi tout doux dans l'herbe avec des musiciens acoustiques, des paniers pique-nique locaux et une ambiance détendue.",
  tags: "Chill"
)

Event.create(
  name: "Improvisation théâtrale sous les étoiles",
  address: "Parc Rivière, 33000 Bordeaux, France",
  date: Date.parse("6 septembre 2025"),
  details: "En compagnie de Jérôme et de la troupe Cosmorire, attachez vos ceintures pour un voyage intergalactique improbable où sciences et humour se combinent à la perfection.",
  image: "https://images.unsplash.com/photo-1611956425642-d5a8169abd63?q=80&w=1211&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Un spectacle unique où rien n’est écrit d’avance. Rires et surprises garantis dans un cadre verdoyant.",
  tags: "Culturel"
)

Event.create(
  name: "Danse libre au miroir d'eau",
  address: "Place de la Bourse, 33000 Bordeaux, France",
  date: Date.parse("7 septembre 2025"),
  details: "Présents depuis de nombreuses années, le collectif DDE (Danse Des Eaux) revient encore plus fort avec un événement accès sur la découverte de soi par la danse ainsi que le tambour traditionnel malais.",
  image: "https://images.unsplash.com/photo-1598976702854-b7130d73ca18?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Rejoignez un cercle de danse spontanée, pieds nus sur le miroir d’eau. Musique live et liberté de mouvement au programme.",
  tags: "Creatif"
)

Event.create(
  name: "Sunset yoga et smoothies",
  address: "Quai des Marques, 33300 Bordeaux, France",
  date: Date.parse("8 septembre 2025"),
  details: "Débutants ou confirmés sont les bienvenus pour faire profiter de ce moment détente revigorant.",
  image: "https://images.unsplash.com/photo-1611458181521-5fafe4a31995?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Une session de yoga face au coucher de soleil, suivie de smoothies frais et bio. Apportez votre tapis !",
  tags: "Chill"
)

Event.create(
  name: "Soirée salsa en plein air",
  address: "Place des Quinconces, 33000 Bordeaux, France",
  date: Date.parse("9 septembre 2025"),
  details: "Juan et Linda vont vous aider à ambiancer votre soirée. Organisateurs emblématiques de l'événement, ils n'hésiteront pas à partager un petit verre en compagnie de leurs mouvements.",
  image: "https://images.unsplash.com/photo-1575448913281-98e9e5d3f193?q=80&w=688&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Ambiance caliente sous les étoiles avec initiation gratuite, danse libre et musique cubaine en live.",
  tags: "Festif"
)

Event.create(
  name: "Visite guidée de la ville de Bordeaux",
  address: "Office du Tourisme de Bordeaux, 33000 Bordeaux, France",
  date: Date.parse("9 septembre 2025"),
  description: "Visiteurs de passage à Bordeaux, simple curieux ou connaisseurs de la région, venez découvrir Bordeaux.",
  details: "Visites guidées classiques, présentant l’histoire et le patrimoine de la ville, visites insolites, ou en petit train, en tuk-tuk, mais aussi croisières fluviales… Trouvez la visite qui vous convient que vous soyez seul, en couple ou en famille.",
  tags: "Culturel",
  image: "https://www.bordeaux-tourisme.com/sites/bordeaux_tourisme/files/styles/sit_main_image/public/externals/f22840cf5b9f365f9bcaa505ec518134.jpg.webp?itok=pL_45h0g"
)

Event.create(
  name: "Marche méditative au lever du jour",
  address: "Parc Bordelais, 33000 Bordeaux, France",
  date: Date.parse("10 septembre 2025"),
  details: "Accompagnez Veronique dans sa quête spirituelle du bien-être ultime et laisser la vous guider vers l'éveil de nouveaux sens.",
  image: "https://images.unsplash.com/reserve/YEc7WB6ASDydBTw6GDlF_antalya-beach-lulu.jpg?q=80&w=1301&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Une expérience de reconnexion à soi dans le silence du matin. Respiration, pas lents et contemplation.",
  tags: "Nature"
)

Event.create(
  name: "Atelier de cuisine du monde",
  address: "13 All. Jean Giono, 33100 Bordeaux, France",
  date: Date.parse("11 septembre 2025"),
  details: "Une cuisine riche, des épices savoureuses et une équipe aux petits oignons. Nos gourmets mettront à rude épreuve les talents culinaires de nos invités.",
  image: "https://images.unsplash.com/photo-1661607775751-dc9efc8f3a9c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  description: "Préparez et dégustez des recettes venues d'ailleurs dans une ambiance conviviale. Venez avec vos papilles !",
  tags: "Foodies"
)

event = Event.create(
  name: "Beer Fest Bordeaux",
  address: "Place du Parlement, 33000 Bordeaux, France",
  date: Date.parse("5 septembre 2025"),
  description_title: "Le grand brassage",
  description: "Pendant tout un week-end, partez à la rencontre de brasseurs venus d’ici et d’ailleurs et laissez-vous surprendre par la richesse de la bière artisanale. Blonde, ambrée ou IPA, chaque dégustation sera l’occasion de découvrir des saveurs nouvelles et des histoires passionnantes. Un moment unique pour explorer la diversité d’un savoir-faire authentique, porté par la passion et la créativité des artisans.",
  details_title: "La soirée s’anime",
  details: "Quand les verres se vident, la fête continue : concerts, ateliers de brassage et rencontres conviviales viendront rythmer la soirée. Venez partager un moment chaleureux autour de la bière, échanger avec d’autres passionnés et célébrer ensemble l’esprit festif et convivial de ce festival incontournable.",
  tags: "Festif",
  image: "https://images.unsplash.com/photo-1649798558791-bf0edbc98e6b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
)

  4.times do |time|
  file = "app/assets/images/mood-pic/#{event.tags.downcase}/#{event.name.split[0].downcase}/#{event.name.split[0].downcase}-#{time + 1}.jpg"
  puts file
  event.files.attach(io: File.open(file), filename: event.name, content_type: "image/jpg")
end

Event.create(
  name: "Fête des couleurs indiennes",
  address: "Place de la Victoire, 33000 Bordeaux, France",
  date: Date.parse("3 octobre 2025"),
  description: "Plongez dans l'ambiance vibrante des festivals indiens.",
  details: "Pour célébrer l'esprit des fêtes traditionnelles indiennes, participez à une journée colorée de danses, de musiques et de repas typiques. Découvrez des marchés artisanaux, des ateliers de danse Bollywood et bien plus.",
  tags: "Festif",
  image: "https://images.unsplash.com/photo-1698810127193-0c8dc6b91c9f?q=80&w=728&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Marché de créateurs locaux",
  address: "Esplanade des Quinconces, 33000 Bordeaux, France",
  date: Date.parse("10 octobre 2025"),
  description: "Un marché dédié aux créateurs locaux où se mêlent art, artisanat et design.",
  details: "Venez rencontrer les créateurs locaux : bijoux, vêtements, objets décoratifs, et bien d'autres. Ce marché est aussi l'occasion de découvrir des ateliers créatifs et de participer à des démonstrations de savoir-faire.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1566636741346-7bc0510fdaa5?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Festival de la gastronomie française",
  address: "Place Pey Berland, 33000 Bordeaux, France",
  date: Date.parse("17 octobre 2025"),
  description: "Un événement qui célèbre la cuisine hexagonale sous toutes ses formes.",
  details: "Venez goûter aux spécialités des régions françaises avec des chefs locaux. Au programme : dégustations, ateliers culinaires, et conférences autour de la culture gastronomique française.",
  tags: "Foodies",
  image: "https://plus.unsplash.com/premium_photo-1687975124229-e3ae49ea2c20?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Ciné-concert : Musique et cinéma muet",
  address: "Cinéma Utopia, 33000 Bordeaux, France",
  date: Date.parse("30 octobre 2025"),
  description: "Revivez les classiques du cinéma muet avec une performance musicale en live.",
  details: "Profitez d'un moment unique où des musiciens interpréteront la bande-son en direct pendant la projection de films muets comme *Le Cabinet du Dr. Caligari* et *Nosferatu*.",
  tags: "Culturel",
  image: "https://images.unsplash.com/photo-1710988486897-e933e4b0f72c?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Yoga et brunch au parc",
  address: "Parc Bordelais, 33000 Bordeaux, France",
  date: Date.parse("1er novembre 2025"),
  description: "Commencez votre dimanche avec une séance de yoga en plein air suivie d'un brunch bio.",
  details: "Un moment détente et bien-être : pratiquez le yoga au cœur du parc avec un professeur expérimenté, puis régalez-vous avec un brunch healthy composé de produits locaux et bio.",
  tags: "Chill",
  image: "https://images.unsplash.com/photo-1608405059861-b21a68ae76a2?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Exposition photographique : Les Visages du Monde",
  address: "Musée des Beaux-Arts, 33000 Bordeaux, France",
  date: Date.parse("15 novembre 2025"),
  description: "Une exposition unique sur la diversité humaine à travers le regard de grands photographes.",
  details: "Parcourez des images saisissantes capturées aux quatre coins du monde. L'exposition explore les histoires de vie, les émotions et les cultures à travers les portraits pris par des photographes du monde entier.",
  tags: "Culturel",
  image: "https://images.unsplash.com/photo-1647709825916-200da934eff0?q=80&w=1231&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Cours de cuisine végétarienne",
  address: "Pl. des Capucins, 33800 Bordeaux, France",
  date: Date.parse("28 novembre 2025"),
  description: "Apprenez à cuisiner des plats végétariens savoureux et équilibrés.",
  details: "Un chef vous guidera dans la préparation de recettes végétariennes simples, mais gourmandes. Parfait pour ceux qui veulent explorer la cuisine végétarienne tout en découvrant des ingrédients de saison.",
  tags: "Foodies",
  image: "https://images.unsplash.com/photo-1615366105533-5b8f3255ea5d?q=80&w=1167&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Bourse aux livres et objets vintage",
  address: "Halle des Chartrons, 33300 Bordeaux, France",
  date: Date.parse("6 decembre 2025"),
  description: "Un marché pour les amoureux de livres anciens et d'objets vintage.",
  details: "Parcourez les étals de livres d'occasion, de vinyles rares et d'objets rétro. L'occasion de dénicher des trésors tout en discutant avec les passionnés qui les vendent.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1631888722728-1578b7ba6dee?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Atelier de sérigraphie",
  address: "La Maison de la Création, 33000 Bordeaux, France",
  date: Date.parse("12 decembre 2025"),
  description: "Initiez-vous à l'art de la sérigraphie et créez vos propres affiches.",
  details: "Un atelier interactif où vous apprendrez les bases de la sérigraphie tout en créant vos propres œuvres imprimées sur différents supports. Repartez avec votre poster personnalisé.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1663433541063-ddab084d1126?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Soirée contes et légendes",
  address: "La Cité du Vin, 33300 Bordeaux, France",
  date: Date.parse("18 decembre 2025"),
  description: "Une soirée immersive autour des contes et légendes du vin et des terroirs.",
  details: "Venez écouter des histoires fascinantes et mystérieuses autour du vin, racontées par des conteurs passionnés. Une expérience à la fois éducative et divertissante dans un cadre unique.",
  tags: "Culturel",
  image: "https://plus.unsplash.com/premium_photo-1682308189385-38a9b49f6027?q=80&w=1315&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Marché de Noël des créateurs",
  address: "Place des Grands Hommes, 33000 Bordeaux, France",
  date: Date.parse("22 decembre 2025"),
  description: "Un marché de Noël réunissant les créations artisanales locales pour offrir un Noël unique.",
  details: "Des artisans locaux exposent leurs œuvres et créations pour vos cadeaux de fin d'année. Décoration, mode, bijoux, et bien d'autres produits faits main pour un Noël original et solidaire.",
  tags: "Creatif",
  image: "https://images.unsplash.com/photo-1512663251984-863560ec3985?q=80&w=1122&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)

Event.create(
  name: "Concert de Noël : Musiques du monde",
  address: "Auditorium de Bordeaux, 33000 Bordeaux, France",
  date: Date.parse("25 decembre 2025"),
  description: "Un concert de Noël avec des chants et instruments du monde entier.",
  details: "Ce concert spécial Noël vous invite à découvrir des musiques de Noël traditionnelles des quatre coins du monde. Une soirée féérique et solennelle pour célébrer les fêtes en musique.",
  tags: "Festif",
  image: "https://images.unsplash.com/photo-1700931676493-1ea7739bd6aa?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
)


puts "Après création, nombre d'évenements : #{Event.count}"

puts "Après création, nombre de users : #{User.count}"
