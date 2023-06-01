st_malo = City.create!(name: 'Saint-Malo')

# grandbe_itinerary_pictures = [File.open("./images/GrandBe1.jpg")]
grandbe_itinerary = Itinerary.new(name: 'La tombe de Chateaubriand', subtitle: "Une promenade entre mer et histoire",
  distance: 4, category: "Nature", rates: [3], duration: 70, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
# grandbe_itinerary_pictures.each { |file| grandbe_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
grandbe_itinerary.save!

puts "grandbe_itinerary created"
