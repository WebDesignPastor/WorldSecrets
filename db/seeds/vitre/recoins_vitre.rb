vitre = City.create!(name: 'Vitré')

vitre_itinerary_pictures = [File.open("db/seeds/vitre/images/vitre1.jpg")]
vitre_itinerary = Itinerary.new(name: 'Dans les recoins de Vitré', subtitle: "L'histoire et l'architecture médiévale de l'un des plus beaux châteaux de Bretagne",
                                distance: 4, category: "Médiéval", rates: [4], duration: 80, number_of_poi: 4, latitude: 48.122936838268764, longitude: -1.2123730430010646, city: vitre)
vitre_itinerary_pictures.each { |file| vitre_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vitre_itinerary.save!
