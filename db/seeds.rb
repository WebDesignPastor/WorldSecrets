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

require_relative './seeds/vezin/vezin_stade'
require_relative './seeds/st_malo/cite_corsaire'
require_relative './seeds/rennes/pans_de_bois'
require_relative './seeds/rennes/odorico'
# require_relative './seeds/st_malo/grand_be'
# require_relative './seeds/st_malo/cathedrale'
# require_relative './seeds/st_malo/memorial'
# require_relative './seeds/mt_st_michel/recoins_st_michel'
# require_relative './seeds/dinan/dinan_remparts'
# require_relative './seeds/pont_croix/joyau_bigouden'
# require_relative './seeds/vannes/remparts_vannes'
# require_relative './seeds/dinard/dinard_promenade'
# require_relative './seeds/sibiril/chateau_kerouzere'
# require_relative './seeds/nantes/nantes_chateau'
# require_relative './seeds/guerledan/lac_guerledan'
# require_relative './seeds/plogoff/baie_trepasses'
# require_relative './seeds/vitre/recoins_vitre'
# require_relative './seeds/porsporder/kerivoret_menhir'

puts "created #{City.count} cities"

puts '####### Creating Users #############'

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password')

puts "created #{User.count} users"

puts "created #{Poi.count} pois !"

puts "created #{Itinerary.count} itineraries"

puts "created #{Question.count} questions"
