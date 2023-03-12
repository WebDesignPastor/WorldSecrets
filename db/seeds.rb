# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

puts '####### Cleaning database #######'

User.destroy_all
Poi.destroy_all
Itinerary.destroy_all
City.destroy_all
Trip.destroy_all
Question.destroy_all
Itinerary.destroy_all

puts 'database cleaned'
puts '####### Creating Users #############'

fanch = User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Fanch')
rico = User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Rico')
kevin = User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Kevin')
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
City.create!(name: 'Fougères')
City.create!(name: 'Sarzeau')
City.create!(name: 'Josselin')

puts "created #{City.count} cities"

puts '####### Creating Pois #############'
# Pois uniquement pour st malo (demo-day)
chat_qui_danse = Poi.create!(name: 'La rue du chat qui danse', address: '1 rue du chat qui danse, 35400 Saint-Malo',
            mystery_name: 'rue du chat qui danse', mystery_content: "Les Anglois ont tenté de rayer Saint-malo de la
            carte avec un bateau rempli d'explosifs, helas pour eux, le bateau finit par s'échouer loin des enceintes
            et ne fut qu'une victime, un chat ! Pour moquer les Anglois, les malouins rebaptisèrent cette rue, la rue du chat qui danse",
            mystery_image: 'rue_du_chat_qui_danse.jpg', clue_image: '?', clue_sentence: 'Je suis un animal domestique,
            Qui aime les souris et les balles élastiques, Mon nom est court à prononcer,
            Et quand il y a de la musique, je me mets à bouger, Qui suis-je ?')
la_grand_porte = Poi.create!(name: 'La Grand Porte', address: "Grand Porte 35400 Saint-Malo", mystery_name: "la grand porte",
                mystery_content: "La Grand Porte est la plus ancienne de Saint-Malo. Pendant plusieurs siècles,
                elle fut l’entrée principale qui desservait le port. Au-dessus de l’entrée, vous pouvez admirer Notre-Dame de la Grand’Porte, une statue de la Vierge à l’Enfant.
                Des marins auraient trouvé cette statue de marbre flottant sur la mer.
                Également surnommée « Notre-Dame des Miracles », la légende raconte qu’en 1661, elle se serait dressée face aux flammes qui ravageaient la ville et aurait stoppé l’incendie.")
puts "created #{Poi.count} pois !"

puts '####### Creating Itineraries #############'

st_malo_itinerary_pictures = File.open("db/fixtures/saint-malo1.jpg"), File.open("db/fixtures/saint-malo2.jpg"), File.open("db/fixtures/saint-malo3.jpg")
st_malo_itinerary = Itinerary.new(name: 'Saint-Malo, la cité corsaire', distance: 5, rating: 5, duration: 120, number_of_poi: 3, departure: 'Porte Saint-vincent 35400 Saint-Malo', city: st_malo, category: "Médiéval", description: "Entendez-moi, noble compagnie, car je vais vous raconter l'histoire d'une cité corsaire bâtie sur les flots tumultueux de l'océan, la ville imprenable de Saint-Malo.
  Enveloppée par les vagues impitoyables de l'Atlantique, cette ville est un joyau resplendissant dans l'histoire de la Bretagne. Avec ses fortifications massives, ses édifices majestueux et ses rues pavées envoûtantes, elle a connu des siècles de guerres, de commerce et d'aventures épiques.
  Ses remparts s'élèvent fièrement dans le ciel, défiant l'océan et protégeant la ville des ennemis. Les clochers de ses églises imposantes atteignent les nuages, témoins de la foi et de la détermination des habitants de la ville.
  Mais c'est surtout l'histoire des corsaires de Saint-Malo qui a marqué les esprits de toutes les générations. Ces guerriers intrépides naviguaient sur des navires rapides et puissants, bravant les tempêtes les plus violentes et les flots les plus déchaînés pour protéger leur ville et leur liberté.
  Leurs batailles légendaires contre les ennemis, qu'ils soient Anglais, Espagnols ou autres, sont restées gravées dans l'histoire. Les canons tonnent, les sabres s'entrechoquent, les flammes embrasent les navires ennemis, mais les corsaires de Saint-Malo tiennent bon, animés par un courage inébranlable et une ferveur indomptable.
  Aujourd'hui encore, la ville de Saint-Malo continue de fasciner et d'inspirer tous ceux qui la visitent. Les rues pavées résonnent de l'histoire de ses ancêtres valeureux, les remparts gardent jalousement leurs secrets et l'océan murmure à l'oreille de ceux qui sont prêts à écouter.
  Que la légende de Saint-Malo perdure dans les siècles à venir, comme un symbole de la bravoure et de la liberté de ceux qui ont osé affronter les flots les plus impitoyables et les ennemis les plus redoutables.")
st_malo_itinerary_pictures.each { |file| st_malo_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_malo_itinerary.save!

st_michel_itinerary_pictures = File.open("db/fixtures/stmichel1.jpg"), File.open("db/fixtures/stmichel2.jpg"), File.open("db/fixtures/stmichel3.jpg")
st_michel_itinerary = Itinerary.new(name: 'Les secrets du Mont-Saint-Michel', distance: 7, rating: 5, duration: 160, number_of_poi: 4, departure: 'Pont Passerelle, Le Mont-Saint-Michel',
                      city: mt_st_michel, category: "Urbain")
st_michel_itinerary_pictures.each { |file| st_michel_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_michel_itinerary.save!

dinan_itinerary_pictures = File.open("db/fixtures/dinan1.jpg"), File.open("db/fixtures/dinan2.jpg"), File.open("db/fixtures/dinan3.jpg")
dinan_itinerary = Itinerary.new(name: 'Dinan et ses remparts', distance: 10, rating: 5, duration: 180, number_of_poi: 6, departure: 'Le Vieux Pont Dinan', city: dinan, category: 'Médieval')
dinan_itinerary_pictures.each { |file| dinan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinan_itinerary.save!

pont_croix_itinerary_pictures = [File.open("db/fixtures/pontcroix1.jpg")]
pont_croix_itinerary = Itinerary.new(name: 'Pont-Croix, à la croisée des chemins', distance: 4, rating: 4, duration: 60, number_of_poi: 3, departure: 'pont-croix Rue Voltaire', city: pont_croix, category: 'Médieval')
pont_croix_itinerary_pictures.each { |file| pont_croix_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
pont_croix_itinerary.save!

vannes_itinerary_pictures = [File.open("db/fixtures/vannes1.jpg")]
vannes_itinerary = Itinerary.new(name: 'Les remparts de Vannes', distance: 6, rating: 3, duration: 90, number_of_poi: 4, departure: 'Remparts de Vannes', city: vannes, category: 'Médieval')
vannes_itinerary_pictures.each { |file| vannes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vannes_itinerary.save!

carnac_itinerary_pictures = File.open("db/fixtures/carnac1.jpg"), File.open("db/fixtures/carnac2.jpg")
carnac_itinerary = Itinerary.new(name: 'Secrets des pierres de Carnac', distance: 8, category: "Préhistorique", rating: 2,
                  duration: 150, number_of_poi: 4, departure: 'Le Menec, Carnac', city: carnac)
carnac_itinerary_pictures.each { |file| carnac_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
carnac_itinerary.save!

nantes_itinerary_pictures = File.open("db/fixtures/nantes1.jpg"), File.open("db/fixtures/nantes2.jpg")
nantes_itinerary = Itinerary.new(name: 'La ballade de la Duchesse Anne', distance: 4, category: "Médiéval", rating: 4.5,
                  duration: 90, number_of_poi: 4, departure: 'Château des ducs de Bretagne, Nantes', city: nantes)
nantes_itinerary_pictures.each { |file| nantes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
nantes_itinerary.save!

guerledan_itinerary_pictures = [File.open("db/fixtures/guerledan1.jpg")]
guerledan_itinerary = Itinerary.new(name: 'Sur les traces de la bête du lac de Guerlédan', distance: 4, category: "Nature", rating: 4.5, duration: 90, number_of_poi: 4, departure: 'Lac de Guerlédan', city: guerledan)
guerledan_itinerary_pictures.each { |file| guerledan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
guerledan_itinerary.save!

plogoff_itinerary_pictures = [File.open("db/fixtures/plogoff1.jpg")]
plogoff_itinerary = Itinerary.new(name: 'Rencontre avec les trépassés de la Baie', distance: 4, category: "Nature", rating: 4.5, duration: 90, number_of_poi: 4, departure: 'Baie des trépassés, Plogoff', city: plogoff)
plogoff_itinerary_pictures.each { |file| plogoff_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
plogoff_itinerary.save!

vitre_itinerary_pictures = [File.open("db/fixtures/vitre1.jpg")]
vitre_itinerary = Itinerary.new(name: 'Entre château et rues anciennes à Vitré', distance: 4, category: "Médiéval", rating: 4.5, duration: 90, number_of_poi: 4, departure: 'Château de Vitré', city: vitre)
vitre_itinerary_pictures.each { |file| vitre_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vitre_itinerary.save!

dinard_itinerary_pictures = [File.open("db/fixtures/dinard1.jpg")]
dinard_itinerary = Itinerary.new(name: 'Promenade avec Picasso à Dinard', distance: 4, category: "Urbain", rating: 4.5, duration: 90, number_of_poi: 4, departure: 'Mairie de Dinard', city: dinard)
dinard_itinerary_pictures.each { |file| dinard_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinard_itinerary.save!

grandbe_itinerary_pictures = [File.open("db/fixtures/GrandBe1.jpg")]
grandbe_itinerary = Itinerary.new(name: 'La tombe de Chateaubriand', distance: 4, category: "Nature", rating: 3.5, duration: 70, number_of_poi: 2, departure: 'Grand-Bé, Saint-Malo', city: st_malo)
grandbe_itinerary_pictures.each { |file| grandbe_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
grandbe_itinerary.save!

toursolidor_itinerary_pictures = [File.open("db/fixtures/toursolidor1.jpg")]
toursolidor_itinerary = Itinerary.new(name: 'La vigie sur la Rance', distance: 6, category: "Médiéval", rating: 4, duration: 70, number_of_poi: 2, departure: 'Tour Solidor', city: st_malo)
toursolidor_itinerary_pictures.each { |file| toursolidor_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
toursolidor_itinerary.save!

memorial_itinerary_pictures = [File.open("db/fixtures/memorial1.jpg")]
memorial_itinerary = Itinerary.new(name: 'Terrés dans le Bunker', distance: 6, category: "Nature", rating: 4, duration: 90, number_of_poi: 2, departure: 'Memorial 1939-1945, Saint-Malo', city: st_malo)
memorial_itinerary_pictures.each { |file| memorial_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
memorial_itinerary.save!

cathedrale_itinerary_pictures = [File.open("db/fixtures/cathedrale1.jpg")]
cathedrale_itinerary = Itinerary.new(name: 'Autour de St-Vincent', distance: 6, category: "Urbain", rating: 4, duration: 90, number_of_poi: 2, departure: 'Cathédrale Saint-Vincent de Saint-Malo', city: st_malo)
cathedrale_itinerary_pictures.each { |file| cathedrale_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
cathedrale_itinerary.save!

puts "created #{Itinerary.count} itineraries"

puts '####### Creating Itinerary_pois #############'

ItineraryPoi.create!(poi_order: 1, itinerary: st_malo_itinerary, poi: chat_qui_danse)
ItineraryPoi.create!(poi_order: 2, itinerary: st_malo_itinerary, poi: la_grand_porte)
puts "created #{ItineraryPoi.count} ItineraryPois"

puts '####### Creating Trips #############'

Trip.create!(proximity_level: 0, content: 'Vous approchez !', status: 'running', progress: 1, user: kevin, itinerary: st_malo_itinerary)
puts "created #{Trip.count} trips"

puts '####### Creating Questions #############'

Question.create!(question_statement: 'Dans quel département se situe Saint-Malo ?', itinerary: st_malo_itinerary, answer_statement: ["22", "44", "35", "56"], good_answer: "35")
Question.create!(question_statement: 'Quel etait le surnom de la ville de Saint-Malo ? la cité ... :', itinerary: st_malo_itinerary, answer_statement: ["Corsaire", "Pirate", "des vieux loups d'mer", "engloutie"], good_answer: "Corsaire")
Question.create!(question_statement: "Saint-Malo fut pendant 4 années une republique independante. C'était au : ", itinerary: st_malo_itinerary, answer_statement: ["Xeme siècle", "XIIeme siècle", "XIVeme siècle", "XVIeme siècle"], good_answer: "XVIeme siècle")
Question.create!(question_statement: "Lequel de ces marins n'est pas né à Saint-malo ?", itinerary: st_malo_itinerary, answer_statement: ["Jean Bart", "Robert Surcouf", "Duguay-Trouin", "Jacques Cartier"], good_answer: "Jean Bart")
Question.create!(question_statement: "Quel peuple, autrefois ennemi de la France, a attaqué plusieurs fois le port de Saint-Malo ?", itinerary: st_malo_itinerary, answer_statement: ["Les Portuguais", "Les Espagnols", "Les Anglais", "Les Russes"], good_answer: "Les Anglais")
puts "created #{Question.count} questions"

puts '####### Creating trip_answers #############'

# TripAnswer.create!(answer: "A/ 22 B/ 44 C/ 35 D/ 56", question_id: Question.last.id, trip_id: Trip.last.id)
# TripAnswer.create!(answer: "A/ Corsaire  B/ Pirate C/ des vieux loups d'mer  D/ engloutie", question_id: Question.last.id, trip_id: Trip.last.id)
# TripAnswer.create!(answer: "A/ Xeme siècle B/ XIIeme siècle C/ XIVeme siècle D/ XVIeme siècle", question_id: Question.last.id, trip_id: Trip.last.id)
# TripAnswer.create!(answer: "A/ Jean Bart B/ Robert Surcouf C/ Duguay-Trouin D/ Cousteau", question_id: Question.last.id, trip_id: Trip.last.id)
# TripAnswer.create!(answer: "A/ Les Portuguais B/ Les Espagnols C/ Les Anglais D/ Les Russes", question_id: Question.last.id, trip_id: Trip.last.id)
# puts "created #{TripAnswer.count} trip_answers"
