st_malo = City.create!(name: 'Saint-Malo')

# memorial_itinerary_pictures = [File.open("db/fixtures/memorial1.jpg")]
memorial_itinerary = Itinerary.new(name: 'Terrés dans le Bunker', subtitle: "La cité d'Aleth et ses galeries de bunkers",
  distance: 6, category: "Nature", rates: [4], duration: 95, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
# memorial_itinerary_pictures.each { |file| memorial_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
memorial_itinerary.save!

puts "memorial_itinerary created"
