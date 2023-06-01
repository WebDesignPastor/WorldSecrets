porspoder = City.create!(name: 'Porspoder')

dolmen_itinerary_pictures = [File.open("./images/dolmen1.jpg")]
dolmen_itinerary = Itinerary.new(name: "Mégalithes de Kerivoret", subtitle: "Un beau menhir",
  distance: 3, category: "Préhistorique", rates: [4], duration: 60, number_of_poi: 2, latitude: 48.434368115252376, longitude: -4.731447953200586, city: porspoder)
dolmen_itinerary_pictures.each { |file| dolmen_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dolmen_itinerary.save!
