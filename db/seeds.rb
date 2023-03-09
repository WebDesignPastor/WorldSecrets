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

City.create!(name: 'Saint-Malo')
City.create!(name: 'Le Mont-Saint-Michel')
City.create!(name: 'Dinan')
City.create!(name: 'Pont-Croix')
City.create!(name: 'Vannes')
City.create!(name: 'Josselin')
City.create!(name: 'Fougères')
City.create!(name: 'Vitré')
City.create!(name: 'Sarzeau')

puts "created #{City.count} cities"

puts '####### Creating Pois #############'
# Pois uniquement pour st malo (demo-day)
chat_qui_danse = Poi.create!(name: 'La rue du chat qui danse', address: '1 rue du chat qui danse, 35400 Saint-Malo',
            mystery_name: 'rue du chat qui danse', mystery_content: "Les vils Anglois ont tenté de rayer Saint-malo de la carte avec un bateau rempli d'explosifs",
            mystery_image: 'wlecjbcirukxgdhv67wk', clue_image: '?', clue_sentence: 'Je suis un animal domestique, Qui aime les souris et les balles élastiques,
            Mon nom est court et doux à prononcer, Et quand il y a de la musique, je me mets à bouger, Qui suis-je ?')
puts "created #{Poi.count} pois !"

puts '####### Creating Itineraries #############'

st_malo_pictures = File.open("db/fixtures/saint-malo1.jpg"), File.open("db/fixtures/saint-malo2.jpg"), File.open("db/fixtures/saint-malo3.jpg")
st_malo = Itinerary.new(name: 'Saint-Malo, la cité corsaire', distance: 5, rating: 5, duration: 120, number_of_poi: 3, departure: 'Porte Saint-vincent 35400 Saint-Malo', city_id: City.last.id, category: "Médiéval", description: "Entendez-moi, noble compagnie, car je vais vous raconter l'histoire d'une cité corsaire bâtie sur les flots tumultueux de l'océan, la ville imprenable de Saint-Malo.
  Enveloppée par les vagues impitoyables de l'Atlantique, cette ville est un joyau resplendissant dans l'histoire de la Bretagne. Avec ses fortifications massives, ses édifices majestueux et ses rues pavées envoûtantes, elle a connu des siècles de guerres, de commerce et d'aventures épiques.
  Ses remparts s'élèvent fièrement dans le ciel, défiant l'océan et protégeant la ville des ennemis. Les clochers de ses églises imposantes atteignent les nuages, témoins de la foi et de la détermination des habitants de la ville.
  Mais c'est surtout l'histoire des corsaires de Saint-Malo qui a marqué les esprits de toutes les générations. Ces guerriers intrépides naviguaient sur des navires rapides et puissants, bravant les tempêtes les plus violentes et les flots les plus déchaînés pour protéger leur ville et leur liberté.
  Leurs batailles légendaires contre les ennemis, qu'ils soient Anglais, Espagnols ou autres, sont restées gravées dans l'histoire. Les canons tonnent, les sabres s'entrechoquent, les flammes embrasent les navires ennemis, mais les corsaires de Saint-Malo tiennent bon, animés par un courage inébranlable et une ferveur indomptable.
  Aujourd'hui encore, la ville de Saint-Malo continue de fasciner et d'inspirer tous ceux qui la visitent. Les rues pavées résonnent de l'histoire de ses ancêtres valeureux, les remparts gardent jalousement leurs secrets et l'océan murmure à l'oreille de ceux qui sont prêts à écouter.
  Que la légende de Saint-Malo perdure dans les siècles à venir, comme un symbole de la bravoure et de la liberté de ceux qui ont osé affronter les flots les plus impitoyables et les ennemis les plus redoutables.")
st_malo_pictures.each { |file| st_malo.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_malo.save!

st_michel_pictures = File.open("db/fixtures/stmichel1.jpg"), File.open("db/fixtures/stmichel2.jpg"), File.open("db/fixtures/stmichel3.jpg")
st_michel = Itinerary.new(name: 'Les secrets du Mont-Saint-Michel', distance: 7, rating: 5, duration: 160, number_of_poi: 4, departure: 'Pont Passerelle du Mont Saint-Michel, 50170 le Mont Saint Michel', city_id: City.last.id)
st_michel_pictures.each { |file| st_michel.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_michel.save!

dinan_pictures = File.open("db/fixtures/dinan1.jpg"), File.open("db/fixtures/dinan2.jpg"), File.open("db/fixtures/dinan3.jpg")
dinan = Itinerary.new(name: 'Dinan et ses remparts', distance: 10, rating: 5, duration: 180, number_of_poi: 6, departure: 'Le Vieux Pont 22100 Dinan', city_id: City.last.id)
dinan_pictures.each { |file| dinan.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinan.save!

pont_croix_pictures = [File.open("db/fixtures/pontcroix1.jpg")]
pont_croix = Itinerary.new(name: 'Pont-Croix, à la croisée des chemins', distance: 4, rating: 4, duration: 60, number_of_poi: 3, departure: 'Pont de la Rue Voltaire', city_id: City.last.id)
pont_croix_pictures.each { |file| pont_croix.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
pont_croix.save!

vannes_pictures = [File.open("db/fixtures/vannes1.jpg")]
vannes = Itinerary.new(name: 'Les remparts de Vannes', distance: 6, rating: 3, duration: 90, number_of_poi: 4, departure: 'Rue de la Porte Prison, 56000 Vannes', city_id: City.last.id)
vannes_pictures.each { |file| vannes.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vannes.save!
puts "created #{Itinerary.count} itineraries"

puts '####### Creating Itinerary_pois #############'

ItineraryPoi.create!(poi_order: 1, itinerary: st_malo, poi: chat_qui_danse)
puts "created #{ItineraryPoi.count} ItineraryPois"

puts '####### Creating Trips #############'

Trip.create!(proximity_level: 0, content: 'blabla', status: 'running', progress: 1, user: kevin, itinerary: st_malo)
puts "created #{Trip.count} trips"

puts '####### Creating Questions #############'

Question.create!(question_statement: 'Quel etait le surnom de la ville de Saint-Malo ? la cité ... :', itinerary: st_malo)
puts "created #{Question.count} questions"

puts '####### Creating trip_answers #############'
