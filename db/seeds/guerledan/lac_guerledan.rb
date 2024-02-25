guerledan = City.create!(name: 'Guerlédan')

guerledan_itinerary_pictures = [File.open("db/seeds/guerledan/images/guerledan1.jpg")]
guerledan_itinerary = Itinerary.new(name: 'Sur le lac de Guerlédan', subtitle: "A la découverte des merveilles naturelles de la Bretagne intérieure",
  distance: 4, category: "Nature", rates: [4], duration: 90, number_of_poi: 4, latitude: 48.20150342522527, longitude: -2.9853168406531725, city: guerledan)
guerledan_itinerary_pictures.each { |file| guerledan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
guerledan_itinerary.save!
