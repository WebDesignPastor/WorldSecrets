vannes = City.create!(name: 'Vannes')

vannes_itinerary_pictures = [File.open("db/seeds/vannes/images/vannes1.jpg")]
vannes_itinerary = Itinerary.new(name: 'Les remparts de Vannes', subtitle: "Une balade entre patrimoine historique et culturel",
  distance: 6, rates: [3], duration: 90, number_of_poi: 4, latitude: 47.651478734914, longitude: -2.7588130285536847, city: vannes, category: 'Médiéval')
vannes_itinerary_pictures.each { |file| vannes_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vannes_itinerary.save!

puts "vannes_remparts_itinerary created"
