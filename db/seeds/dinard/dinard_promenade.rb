dinard = City.create!(name: 'Dinard')

dinard_itinerary_pictures = [File.open("./images/dinard1.jpg")]
dinard_itinerary = Itinerary.new(name: 'Promenade à Dinard', subtitle: "Un parcours sur les plages et les villas Belle Époque de la perle de la Côte d'Émeraude",
  distance: 4, category: "Urbain", rates: [4], duration: 100, number_of_poi: 4, latitude: 48.634279915731106, longitude:  -2.0548554816140125, city: dinard)
dinard_itinerary_pictures.each { |file| dinard_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinard_itinerary.save!
