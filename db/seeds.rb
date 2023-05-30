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

require_relative './seeds/vezin/vezin_stade'
require_relative './seeds/st_malo/cite_corsaire'
require_relative './seeds/st_malo/grand_be'
require_relative './seeds/st_malo/cathedrale'
require_relative './seeds/st_malo/memorial'
require_relative './seeds/mt_st_michel/recoins_st_michel'
require_relative './seeds/dinan/dinan_remparts'
require_relative './seeds/pont_croix/joyau_bigouden'
require_relative './seeds/vannes/remparts_vannes'

nantes = City.create!(name: 'Nantes')
guerledan = City.create!(name: 'Guerlédan')
plogoff = City.create!(name: 'Plogoff')
vitre = City.create!(name: 'Vitré')
dinard = City.create!(name: 'Dinard')
sibiril = City.create!(name: 'Sibiril')
porspoder = City.create!(name: 'Porspoder')

puts "created #{City.count} cities"

puts '####### Creating Users #############'

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Fanch')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Rico')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Kevin')

puts "created #{User.count} users"

puts "created #{Poi.count} pois !"

puts "created #{Itinerary.count} itineraries"

puts "created #{Question.count} questions"

# dinard_itinerary_pictures = [File.open("db/fixtures/dinard1.jpg")]
# dinard_itinerary = Itinerary.new(name: 'Promenade à Dinard', subtitle: "Un parcours sur les plages et les villas Belle Époque de la perle de la Côte d'Émeraude",
#   distance: 4, category: "Urbain", rates: [4], duration: 100, number_of_poi: 4, latitude: 48.634279915731106, longitude:  -2.0548554816140125, city: dinard)
# dinard_itinerary_pictures.each { |file| dinard_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# dinard_itinerary.save!

# kerouzere_itinerary_pictures = [File.open("db/fixtures/kerouzere1.png")]
# kerouzere_itinerary = Itinerary.new(name: "Un château figé", subtitle: "Un beau chateau ma foi", distance: 12,
#   category: "Nature", rates: [3], duration: 180, number_of_poi: 4, latitude: 48.672698259366555, longitude: -4.069653969144087, city: sibiril)
# kerouzere_itinerary_pictures.each { |file| kerouzere_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# kerouzere_itinerary.save!



# nantes_itinerary_pictures = File.open("db/fixtures/nantes1.jpg"), File.open("db/fixtures/nantes2.jpg")
# nantes_itinerary = Itinerary.new(name: 'La balade de la Duchesse Anne', subtitle: "Une balade inoubliable à travers les siècles",
#   distance: 4, category: "Médiéval", rates: [4],
#                   duration: 90, number_of_poi: 4, latitude: 47.21571680387717, longitude: -1.5505805118652978, city: nantes)
# nantes_itinerary_pictures.each { |file| nantes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# nantes_itinerary.save!

# guerledan_itinerary_pictures = [File.open("db/fixtures/guerledan1.jpg")]
# guerledan_itinerary = Itinerary.new(name: 'Sur le lac de Guerlédan', subtitle: "A la découverte des merveilles naturelles de la Bretagne intérieure",
#   distance: 4, category: "Nature", rates: [4], duration: 90, number_of_poi: 4, latitude: 48.20150342522527, longitude: -2.9853168406531725, city: guerledan)
# guerledan_itinerary_pictures.each { |file| guerledan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# guerledan_itinerary.save!

# plogoff_itinerary_pictures = [File.open("db/fixtures/plogoff1.jpg")]
# plogoff_itinerary = Itinerary.new(name: 'La baie des trépassés', subtitle: "Une balade sauvage sur les rivages de la Pointe du Raz",
#   distance: 4, category: "Nature", rates: [4], duration: 90, number_of_poi: 4, latitude: 48.03784726601963, longitude: -4.718813432173193, city: plogoff,
#                     description: "Sur la côte de la Cornouaille, la baie des Trépassés, au magnifique rivage de sable blanc, nous fait admirer au loin l’archipel de Sein, Depuis toujours, les corps des marins dont les bateaux s’étaient fracassés sur les récifs de la pointe du Raz,
#                     pris par les forts courants de marée et les vents dominants, venaient s’échouer sur cette plage, ce qui alimenta les histoires et les contes bretons  Boë an Aon se transforma en Boë an Anao, la « baie des âmes en peine », celles des trépassés.")
# plogoff_itinerary_pictures.each { |file| plogoff_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# plogoff_itinerary.save!

# vitre_itinerary_pictures = [File.open("db/fixtures/vitre1.jpg")]
# vitre_itinerary = Itinerary.new(name: 'Dans les recoins de Vitré', subtitle: "L'histoire et l'architecture médiévale de l'un des plus beaux châteaux de Bretagne",
#                                 distance: 4, category: "Médiéval", rates: [4], duration: 80, number_of_poi: 4, latitude: 48.122936838268764, longitude: -1.2123730430010646, city: vitre)
# vitre_itinerary_pictures.each { |file| vitre_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# vitre_itinerary.save!

# dolmen_itinerary_pictures = [File.open("db/fixtures/dolmen1.jpg")]
# dolmen_itinerary = Itinerary.new(name: "Mégalithes de Kerivoret", subtitle: "Un beau menhir",
#   distance: 3, category: "Préhistorique", rates: [4], duration: 60, number_of_poi: 2, latitude: 48.434368115252376, longitude: -4.731447953200586, city: porspoder)
# dolmen_itinerary_pictures.each { |file| dolmen_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
# dolmen_itinerary.save!
