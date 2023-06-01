plogoff = City.create!(name: 'Plogoff')

# plogoff_itinerary_pictures = [File.open("./images/plogoff1.jpg")]
plogoff_itinerary = Itinerary.new(name: 'La baie des trépassés', subtitle: "Une balade sauvage sur les rivages de la Pointe du Raz",
  distance: 4, category: "Nature", rates: [4], duration: 90, number_of_poi: 4, latitude: 48.03784726601963, longitude: -4.718813432173193, city: plogoff,
                    description: "Sur la côte de la Cornouaille, la baie des Trépassés, au magnifique rivage de sable blanc, nous fait admirer au loin l’archipel de Sein, Depuis toujours, les corps des marins dont les bateaux s’étaient fracassés sur les récifs de la pointe du Raz,
                    pris par les forts courants de marée et les vents dominants, venaient s’échouer sur cette plage, ce qui alimenta les histoires et les contes bretons  Boë an Aon se transforma en Boë an Anao, la « baie des âmes en peine », celles des trépassés.")
# plogoff_itinerary_pictures.each { |file| plogoff_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
plogoff_itinerary.save!
