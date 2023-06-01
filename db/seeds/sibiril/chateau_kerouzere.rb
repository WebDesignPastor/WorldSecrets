sibiril = City.create!(name: 'Sibiril')

# kerouzere_itinerary_pictures = [File.open("./images/kerouzere1.png")]
kerouzere_itinerary = Itinerary.new(name: "Un château figé", subtitle: "Un beau chateau ma foi", distance: 12,
  category: "Nature", rates: [3], duration: 180, number_of_poi: 4, latitude: 48.672698259366555, longitude: -4.069653969144087, city: sibiril)
# kerouzere_itinerary_pictures.each { |file| kerouzere_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
kerouzere_itinerary.save!
