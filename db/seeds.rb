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

puts "created #{City.count} cities"

puts '####### Creating Itineraries #############'

st_malo = Itinerary.create!(name: 'Saint-Malo, la cité corsaire', distance: 5, rating: 5, duration: 120, number_of_poi: 3, departure: 'Porte Saint-vincent 35400 Saint-Malo', city_id: City.last.id)
st_michel = Itinerary.create!(name: 'Les secrets du Mont-Saint-Michel', distance: 7, rating: 5, duration: 160, number_of_poi: 4, departure: 'Pont Passerelle du Mont Saint-Michel, 50170 le Mont Saint Michel', city_id: City.last.id)
dinan = Itinerary.create!(name: 'Dinan et ses remparts', distance: 10, rating: 5, duration: 180, number_of_poi: 6, departure: 'Le Vieux Pont 22100 Dinan', city_id: City.last.id)
puts "created #{Itinerary.count} itineraries"

puts '####### Creating Pois #############'

Poi.create!(name: 'La rue du chat qui danse', address: '1 rue du chat qui danse, 35400 Saint-Malo',
            mystery_name: 'rue du chat qui danse', mystery_content: "Les vils Anglois ont tenté de rayer Saint-malo de la carte avec un bateau rempli d'explosifs",
            mystery_image: 'wlecjbcirukxgdhv67wk', clue_image: '?', clue_sentence: 'Je suis un animal domestique, Qui aime les souris et les balles élastiques,
            Mon nom est court et doux à prononcer, Et quand il y a de la musique, je me mets à bouger, Qui suis-je ?')
Poi.create!(name: )
puts "created #{Poi.count} pois"

puts '####### Creating Trips #############'

Trip.create!(proximity_level: 0, content: 'blabla', status: 'running', progress: 1, user: kevin, itinerary: st_malo)
puts "created #{Trip.count} trips"

puts '####### Creating Questions #############'

Question.create!(question_statement: 'Quel etait le surnom de la ville de Saint-Malo ? la cité ... :', itinerary: st_malo)
puts "created #{Question.count} questions"
