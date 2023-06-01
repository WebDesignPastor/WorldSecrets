nantes = City.create!(name: 'Nantes')

# nantes_itinerary_pictures = File.open("./images/nantes1.jpg"), File.open("./images/nantes2.jpg")
nantes_itinerary = Itinerary.new(name: 'La balade de la Duchesse Anne', subtitle: "Une balade inoubliable à travers les siècles",
  distance: 4, category: "Médiéval", rates: [4],
                  duration: 90, number_of_poi: 4, latitude: 47.21571680387717, longitude: -1.5505805118652978, city: nantes)
# nantes_itinerary_pictures.each { |file| nantes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
nantes_itinerary.save!
