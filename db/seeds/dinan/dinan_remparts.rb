dinan = City.create!(name: 'Dinan')

dinan_itinerary_pictures = [File.open("db/fixtures/dinan1.jpg")]
dinan_itinerary = Itinerary.new(name: 'Dinan et ses remparts', subtitle: "Au coeur des rues pavées et des remparts",
  distance: 10, rates: [5], duration: 180, number_of_poi: 6, latitude: 48.450866, longitude: -2.044311, city: dinan, category: 'Médiéval')
dinan_itinerary_pictures.each { |file| dinan_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
dinan_itinerary.save!

puts "dinan_remparts_itinerary created"
