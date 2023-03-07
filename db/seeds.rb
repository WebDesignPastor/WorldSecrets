# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts '####### Cleaning database #######'

User.destroy_all
Poi.destroy_all
Itinerary.destroy_all
City.destroy_all
Trip.destroy_all
Question.destroy_all
Itinerary.destroy_all

puts '####### Creating Users #############'

User.create!(email: 'test1@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Fanch')
User.create!(email: 'test2@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Rico')
User.create!(email: 'test3@test.com', password: 'password', password_confirmation: 'password', nickname: 'Jean-Kevin')
puts User.count

puts '####### Creating Cities #############'

City.create(name: 'Saint-Malo')
puts City.count

puts '####### Creating Itineraries #############'

Itinerary.create!(name: 'Saint-Malo', distance: 5, rating: 5, duration: 120, number_of_poi: 3, departure: 'Porte Saint-vincent 35400 Saint-Malo', city_id: City.last.id)
puts Itinerary.count

puts '####### Creating Pois #############'

Poi.create(name: 'Saint-Malo, la cité corsaire', address: 'rue du chat qui danse, 35400 Saint-Malo',
           mystery_name: 'rue du chat qui danse', mystery_content: "Les vils Anglois ont tenté de rayer Saint-malo de la carte avec un bateau rempli d'explosifs",
           mystery_image: 'wlecjbcirukxgdhv67wk', clue_image: '?', clue_sentence: 'Je suis un animal domestique, Qui aime les souris et les balles élastiques,
           Mon nom est court et doux à prononcer, Et quand il y a de la musique, je me mets à bouger, Qui suis-je ?')
puts Poi.count


puts '####### Creating Trips #############'

Trip.create(proximity_level: 0, content: 'blabla', status: '')
puts Trip.count

puts '####### Creating Questions #############'

puts Question.count

