pont_croix = City.create!(name: 'Pont-Croix')

# pont_croix_itinerary_pictures = [File.open("./images/pontcroix1.jpg")]
pont_croix_itinerary = Itinerary.new(name: 'Pont-Croix, joyau bigouden', subtitle: "Le charme authentique d'un joyau médiéval Breton",
  distance: 4, rates: [4], duration: 60, number_of_poi: 3, latitude: 48.041038049838775, longitude: -4.487834673212698, city: pont_croix, category: 'Médiéval')
# pont_croix_itinerary_pictures.each { |file| pont_croix_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
pont_croix_itinerary.save!

puts "joyau_bigouden_itinerary created"
