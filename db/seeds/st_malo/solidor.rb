st_malo = City.create!(name: 'Saint-Malo')

toursolidor_itinerary_pictures = [File.open("./images/toursolidor1.jpg")]
toursolidor_itinerary = Itinerary.new(name: 'La vigie sur la Rance', subtitle: "L'histoire maritime et une vue imprenable sur la Rance",
  distance: 6, category: "Médiéval", rates: [4], duration: 70, number_of_poi: 2, latitude: 48.650861651302534, longitude: -2.0218998515555895, city: st_malo)
toursolidor_itinerary_pictures.each { |file| toursolidor_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
toursolidor_itinerary.save!

puts "solidor_itinerary created"
