st_malo = City.create!(name: 'Saint-Malo')

# cathedrale_itinerary_pictures = [File.open("db/fixtures/cathedrale1.jpg")]
cathedrale_itinerary = Itinerary.new(name: 'Autour de St-Vincent', subtitle: "A travers l'histoire et l'architecture de l'un des joyaux religieux de la ville corsaire",
                                  distance: 6, category: "Urbain", rates: [4], duration: 90, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
# cathedrale_itinerary_pictures.each { |file| cathedrale_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
cathedrale_itinerary.save!

puts "cathedrale_itinerary created"
