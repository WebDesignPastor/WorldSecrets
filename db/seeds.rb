# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

puts '####### Cleaning database #######'
Bookmark.destroy_all
User.destroy_all
Poi.destroy_all
Itinerary.destroy_all
City.destroy_all
Trip.destroy_all
Question.destroy_all
Itinerary.destroy_all

puts 'database cleaned'
puts '####### Creating Users #############'

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Fanch')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Rico')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Kevin')
puts "created #{User.count} users"

puts '####### Creating Cities #############'

st_malo = City.create!(name: 'Saint-Malo')
mt_st_michel = City.create!(name: 'Le Mont-Saint-Michel')
dinan = City.create!(name: 'Dinan')
pont_croix = City.create!(name: 'Pont-Croix')
vannes = City.create!(name: 'Vannes')
carnac = City.create!(name: 'Carnac')
nantes = City.create!(name: 'Nantes')
guerledan = City.create!(name: 'Guerlédan')
plogoff = City.create!(name: 'Plogoff')
vitre = City.create!(name: 'Vitré')
dinard = City.create!(name: 'Dinard')
sibiril = City.create!(name: 'Sibiril')
porspoder = City.create!(name: 'Porspoder')
City.create!(name: 'Fougères')
City.create!(name: 'Sarzeau')
City.create!(name: 'Josselin')
vezin = City.create!(name: 'Vezin-le-Coquet')

puts "created #{City.count} cities"

puts '####### Creating Pois #############'
# Pois uniquement pour st malo (demo-day)
chat_qui_danse = Poi.create!(name: 'La rue du chat qui danse', latitude: 48.650662, longitude:  -2.027407,
            mystery_name: 'Rue du chat qui danse', mystery_content: "Les Anglois ont tenté de rayer Saint-malo de la
            carte avec un bateau rempli d'explosifs, hélas pour eux, le bateau finit par s'échouer loin des enceintes de la ville.
            Il ne fit qu'une victime, un chat ! Pour les moquer, les malouins rebaptisèrent cette rue, la rue du chat qui danse",
            mystery_image: 'rue_du_chat_qui_danse.jpg', clue_image: 'cat_dance.gif', clue_sentence: 'Je suis un animal,
            qui aime les balles élastiques, mon nom est court à prononcer, quand il y a de la musique, je me mets à bouger')
la_grand_porte = Poi.create!(name: "La Grand'Porte", latitude: 48.648962, longitude: -2.023744, mystery_name: "La Grand'porte",
                mystery_content: "La Grand Porte est la plus ancienne porte de Saint-Malo. Pendant plusieurs siècles,
                elle fut l’entrée principale qui desservait le port. Au-dessus de l’entrée, vous pouvez admirer Notre-Dame de la Grand’Porte, une statue de la Vierge à l’Enfant. Des marins auraient trouvé cette statue de marbre flottant sur la mer.
                Également surnommée « Notre-Dame des Miracles », la légende raconte qu’en 1661, elle se serait dressée face aux flammes qui ravageaient la ville et aurait stoppé l’incendie.", mystery_image: "la_grand_porte.jpg", clue_image: "clue_grand_porte.jpg",
                clue_sentence: "Je suis une entrée majestueuse de la ville de Saint-Malo, ornée de sculptures et de motifs baroques. Témoin de l'histoire de la cité corsaire. Qui suis-je ?")


# Pois pour les autres villes

prison_vezin = Poi.create!(name: 'La prison de Vezin', mystery_name: 'La prison oubliée', latitude: 48.115967991535825,  longitude: -1.7548595057641405,
  mystery_content: 'La prison de Vezin-le-Coquet est une ancienne prison située dans la commune de Vezin-le-Coquet, en Ille-et-Vilaine.
  Construite en 1860, elle est fermée en 1952. Elle est inscrite au titre des monuments historiques depuis le 28 décembre 1992.',
  mystery_image: 'prison_vezin.jpg', clue_image: 'prison_vezin_clue.png', clue_sentence: 'Je suis un lieu de détention, je suis situé à Vezin-le-Coquet, je suis un lieu historique')

mairie_vezin = Poi.create!(name: 'La mairie de Vezin', latitude: 48.11695603596252, longitude: -1.7539228302209222, mystery_name: 'La mairie de Vezin',
  mystery_content: 'La mairie de Vezin-le-Coquet est un bâtiment situé dans la commune de Vezin-le-Coquet, en Ille-et-Vilaine.',
  mystery_image: 'mairie_vezin.jpg', clue_image: 'mairie_vezin_clue.jpg', clue_sentence: 'Je suis un lieu de pouvoir, je suis situé à Vezin-le-Coquet, je suis un lieu historique')

puts "created #{Poi.count} pois !"

puts '####### Creating Itineraries #############'

vezin_itinerary_pictures = [File.open("db/fixtures/vezin1.jpg")]
vezin_itinerary = Itinerary.new(name: 'Vezin et son stade', subtitle: "Le joyau de la Flume", distance: 10, rates: [5], duration: 180, number_of_poi: 2,  latitude: 48.119235, longitude: -1.753901, city: vezin, category: 'Urbain',
description: "Vezin est le sang de la veine de l'Ille-et-Vilaine. Venez vous installer dans cette bourgade de l'extrême où les générations s'entendent si bien entre elles.")
vezin_itinerary_pictures.each { |file| vezin_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vezin_itinerary.save!

dinan_itinerary_pictures = [File.open("db/fixtures/dinan1.jpg")]
dinan_itinerary = Itinerary.new(name: 'Dinan et ses remparts', subtitle: "Au coeur des rues pavées et des remparts", distance: 10, rates: [5], duration: 180, number_of_poi: 6, latitude: 48.450866, longitude: -2.044311, city: dinan, category: 'Médiéval')
dinan_itinerary_pictures.each { |file| dinan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinan_itinerary.save!

st_malo_itinerary_pictures = [File.open("db/fixtures/saint-malo1.jpg")]
st_malo_itinerary = Itinerary.new(name: 'Saint-Malo, la cité corsaire', subtitle: "Plongez dans les secrets des remparts d'Intra-Muros", distance: 5,
  rates: [5], duration: 60, number_of_poi: 3, latitude: 48.650861651302534, longitude: -2.0218998515555895,  city: st_malo, category: "Médiéval",
  description: "Entendez-moi, noble compagnie, car je vais vous raconter l'histoire d'une cité corsaire bâtie sur les flots tumultueux de la mer, la ville imprenable de Saint-Malo.
  Enveloppée par les vagues impitoyables de la Manche, cette ville est un joyau resplendissant dans l'histoire de la Bretagne.
  Avec ses fortifications massives, ses édifices majestueux et ses rues pavées envoûtantes, elle a connu des siècles de guerres, de commerce et d'aventures épiques.
  Ses remparts s'élèvent fièrement dans le ciel, défiant l'océan et protégeant la ville de ses ennemis.
  Mais c'est surtout l'histoire des corsaires de Saint-Malo qui a marqué les esprits de toutes les générations.
  Ces guerriers intrépides naviguaient sur des navires rapides et puissants, bravant les tempêtes les plus violentes et les flots les plus déchaînés pour protéger leur ville et leur liberté.
  Leurs batailles légendaires contre les ennemis, qu'ils soient Anglais, Espagnols ou autres, sont restées gravées dans l'histoire.
  Les canons tonnent, les sabres s'entrechoquent, les flammes embrasent les navires ennemis, mais les corsaires de Saint-Malo tiennent bon, animés par un courage inébranlable et une ferveur indomptable.
  Aujourd'hui encore, la ville de Saint-Malo continue de fasciner et d'inspirer tous ceux qui la visitent. Les rues pavées résonnent de l'histoire de ses ancêtres valeureux, les remparts gardent jalousement leurs secrets et l'océan murmure à l'oreille de ceux qui sont prêts à écouter.
  Que la légende de Saint-Malo perdure dans les siècles à venir, comme un symbole de la bravoure et de la liberté de ceux qui ont osé affronter les flots les plus impitoyables et les ennemis les plus redoutables.")
st_malo_itinerary_pictures.each { |file| st_malo_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_malo_itinerary.save!

pont_croix_itinerary_pictures = [File.open("db/fixtures/pontcroix1.jpg")]
pont_croix_itinerary = Itinerary.new(name: 'Pont-Croix, joyau bigouden', subtitle: "Le charme authentique d'un joyau médiéval Breton", distance: 4, rates: [4], duration: 60, number_of_poi: 3, latitude: 48.041038049838775, longitude: -4.487834673212698, city: pont_croix, category: 'Médiéval')
pont_croix_itinerary_pictures.each { |file| pont_croix_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
pont_croix_itinerary.save!

dinard_itinerary_pictures = [File.open("db/fixtures/dinard1.jpg")]
dinard_itinerary = Itinerary.new(name: 'Promenade à Dinard', subtitle: "Un parcours sur les plages et les villas Belle Époque de la perle de la Côte d'Émeraude",
  distance: 4, category: "Urbain", rates: [4], duration: 100, number_of_poi: 4, latitude: 48.634279915731106, longitude:  -2.0548554816140125, city: dinard)
dinard_itinerary_pictures.each { |file| dinard_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinard_itinerary.save!

vannes_itinerary_pictures = [File.open("db/fixtures/vannes1.jpg")]
vannes_itinerary = Itinerary.new(name: 'Les remparts de Vannes', subtitle: "Une balade entre patrimoine historique et culturel",
  distance: 6, rates: [3], duration: 90, number_of_poi: 4, latitude: 47.651478734914, longitude: -2.7588130285536847, city: vannes, category: 'Médiéval')
vannes_itinerary_pictures.each { |file| vannes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vannes_itinerary.save!

kerouzere_itinerary_pictures = [File.open("db/fixtures/kerouzere1.png")]
kerouzere_itinerary = Itinerary.new(name: "Un château figé", subtitle: "Un beau chateau ma foi", distance: 12,
  category: "Nature", rates: [3], duration: 180, number_of_poi: 4, latitude: 48.672698259366555, longitude: -4.069653969144087, city: sibiril)
kerouzere_itinerary_pictures.each { |file| kerouzere_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
kerouzere_itinerary.save!

st_michel_itinerary_pictures = [File.open("db/fixtures/stmichel1.jpg")]
st_michel_itinerary = Itinerary.new(name: 'Recoins du Mont-Saint-Michel', subtitle: "Une balade envoûtante entre terre et mer",
  distance: 7, rates: [5], duration: 160, number_of_poi: 4, latitude: 48.635125685084546, longitude: -1.5105422764522873,
                      city: mt_st_michel, category: "Urbain")
st_michel_itinerary_pictures.each { |file| st_michel_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_michel_itinerary.save!

carnac_itinerary_pictures = [File.open("db/fixtures/carnac1.jpg")]
carnac_itinerary = Itinerary.new(name: 'Secrets des pierres de Carnac', subtitle: "Un parcours mystique au coeur des mégalithes bretons",
  distance: 8, category: "Préhistorique", rates: [2], duration: 150, number_of_poi: 4, latitude: 47.59161943288755, longitude: -3.08241748073342, city: carnac)
carnac_itinerary_pictures.each { |file| carnac_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
carnac_itinerary.save!

grandbe_itinerary_pictures = [File.open("db/fixtures/GrandBe1.jpg")]
grandbe_itinerary = Itinerary.new(name: 'La tombe de Chateaubriand', subtitle: "Une promenade entre mer et histoire",
  distance: 4, category: "Nature", rates: [3], duration: 70, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
grandbe_itinerary_pictures.each { |file| grandbe_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
grandbe_itinerary.save!

nantes_itinerary_pictures = File.open("db/fixtures/nantes1.jpg"), File.open("db/fixtures/nantes2.jpg")
nantes_itinerary = Itinerary.new(name: 'La balade de la Duchesse Anne', subtitle: "Une balade inoubliable à travers les siècles",
  distance: 4, category: "Médiéval", rates: [4],
                  duration: 90, number_of_poi: 4, latitude: 47.21571680387717, longitude: -1.5505805118652978, city: nantes)
nantes_itinerary_pictures.each { |file| nantes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
nantes_itinerary.save!

toursolidor_itinerary_pictures = [File.open("db/fixtures/toursolidor1.jpg")]
toursolidor_itinerary = Itinerary.new(name: 'La vigie sur la Rance', subtitle: "L'histoire maritime et une vue imprenable sur la Rance",
  distance: 6, category: "Médiéval", rates: [4], duration: 70, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
toursolidor_itinerary_pictures.each { |file| toursolidor_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
toursolidor_itinerary.save!

guerledan_itinerary_pictures = [File.open("db/fixtures/guerledan1.jpg")]
guerledan_itinerary = Itinerary.new(name: 'Sur le lac de Guerlédan', subtitle: "A la découverte des merveilles naturelles de la Bretagne intérieure",
  distance: 4, category: "Nature", rates: [4], duration: 90, number_of_poi: 4, latitude: 48.20150342522527, longitude: -2.9853168406531725, city: guerledan)
guerledan_itinerary_pictures.each { |file| guerledan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
guerledan_itinerary.save!

memorial_itinerary_pictures = [File.open("db/fixtures/memorial1.jpg")]
memorial_itinerary = Itinerary.new(name: 'Terrés dans le Bunker', subtitle: "La cité d'Aleth et ses galeries de bunkers",
  distance: 6, category: "Nature", rates: [4], duration: 95, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
memorial_itinerary_pictures.each { |file| memorial_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
memorial_itinerary.save!

plogoff_itinerary_pictures = [File.open("db/fixtures/plogoff1.jpg")]
plogoff_itinerary = Itinerary.new(name: 'La baie des trépassés', subtitle: "Une balade sauvage sur les rivages de la Pointe du Raz",
  distance: 4, category: "Nature", rates: [4], duration: 90, number_of_poi: 4, latitude: 48.03784726601963, longitude: -4.718813432173193, city: plogoff,
                    description: "Sur la côte de la Cornouaille, la baie des Trépassés, au magnifique rivage de sable blanc, nous fait admirer au loin l’archipel de Sein, Depuis toujours, les corps des marins dont les bateaux s’étaient fracassés sur les récifs de la pointe du Raz,
                    pris par les forts courants de marée et les vents dominants, venaient s’échouer sur cette plage, ce qui alimenta les histoires et les contes bretons  Boë an Aon se transforma en Boë an Anao, la « baie des âmes en peine », celles des trépassés.")
plogoff_itinerary_pictures.each { |file| plogoff_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
plogoff_itinerary.save!

cathedrale_itinerary_pictures = [File.open("db/fixtures/cathedrale1.jpg")]
cathedrale_itinerary = Itinerary.new(name: 'Autour de St-Vincent', subtitle: "A travers l'histoire et l'architecture de l'un des joyaux religieux de la ville corsaire",
                                  distance: 6, category: "Urbain", rates: [4], duration: 90, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
cathedrale_itinerary_pictures.each { |file| cathedrale_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
cathedrale_itinerary.save!

vitre_itinerary_pictures = [File.open("db/fixtures/vitre1.jpg")]
vitre_itinerary = Itinerary.new(name: 'Dans les recoins de Vitré', subtitle: "L'histoire et l'architecture médiévale de l'un des plus beaux châteaux de Bretagne",
                                distance: 4, category: "Médiéval", rates: [4], duration: 80, number_of_poi: 4, latitude: 48.122936838268764, longitude: -1.2123730430010646, city: vitre)
vitre_itinerary_pictures.each { |file| vitre_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vitre_itinerary.save!

dolmen_itinerary_pictures = [File.open("db/fixtures/dolmen1.jpg")]
dolmen_itinerary = Itinerary.new(name: "Mégalithes de Kerivoret", subtitle: "Un beau menhir",
  distance: 3, category: "Préhistorique", rates: [4], duration: 60, number_of_poi: 2, latitude: 48.434368115252376, longitude: -4.731447953200586, city: porspoder)
dolmen_itinerary_pictures.each { |file| dolmen_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dolmen_itinerary.save!

puts "created #{Itinerary.count} itineraries"

puts '####### Creating Itinerary_pois #############'

ItineraryPoi.create!(poi_order: 1, itinerary: st_malo_itinerary, poi: chat_qui_danse)
ItineraryPoi.create!(poi_order: 2, itinerary: st_malo_itinerary, poi: la_grand_porte)

ItineraryPoi.create!(poi_order: 1, itinerary: vezin_itinerary, poi: mairie_vezin)
ItineraryPoi.create!(poi_order: 2, itinerary: vezin_itinerary, poi: prison_vezin)
# ItineraryPoi.create!(poi_order: 3, itinerary: st_malo_itinerary, poi: chiens_du_guet)
puts "created #{ItineraryPoi.count} ItineraryPois"

puts '####### Creating Questions #############'

Question.create!(question_statement: 'Dans quel département se situe Saint-Malo ?', itinerary: st_malo_itinerary, answer_statement: ["22", "44", "35", "56"], good_answer: "35")
Question.create!(question_statement: 'Quel était le surnom de la ville de Saint-Malo ? La cité ... :', itinerary: st_malo_itinerary, answer_statement: ["Corsaire", "Pirate", "Des vieux loups d'mer", "Engloutie"], good_answer: "Corsaire")
Question.create!(question_statement: "Saint-Malo fut pendant 4 années une république indépendante. C'était au : ", itinerary: st_malo_itinerary, answer_statement: ["Xe siècle", "XIIe siècle", "XIVe siècle", "XVIe siècle"], good_answer: "XVIe siècle")
Question.create!(question_statement: "Lequel de ces marins n'est pas né à Saint-Malo ?", itinerary: st_malo_itinerary, answer_statement: ["Jean Bart", "Robert Surcouf", "Duguay-Trouin", "Jacques Cartier"], good_answer: "Jean Bart")
Question.create!(question_statement: "Quel peuple, autrefois ennemi de la France, a attaqué plusieurs fois le port de Saint-Malo ?", itinerary: st_malo_itinerary, answer_statement: ["Les Portuguais", "Les Espagnols", "Les Anglais", "Les Russes"], good_answer: "Les Anglais")

Question.create!(question_statement: "Quel est le nom de la rue principale de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Rue de la République", "Rue de la Liberté", "Rue de Rennes", "Rue de la Réunification"], good_answer: "Rue de Rennes")
Question.create!(question_statement: "Quel est le nom de la prison de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Prison de Vezin", "Prison de Pacé", "Prison de Rennes", "Prison de Vitré"], good_answer: "Prison de Vezin")
Question.create!(question_statement: "Quel est le nom de la mairie de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Mairie de Vezin", "Mairie de Pacé", "Mairie de Rennes", "Mairie de Vitré"], good_answer: "Mairie de Vezin")
Question.create!(question_statement: "Quel est du supermarché de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Supermarché de Vezin", "Supermarché de Pacé", "Supermarché de Rennes", "Supermarché de Vitré"], good_answer: "Supermarché de Vezin")
Question.create!(question_statement: "Quel est du stade de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Stade de Vezin", "Stade de Pacé", "Stade de Rennes", "Stade de Vitré"], good_answer: "Stade de Vezin")
puts "created #{Question.count} questions"
