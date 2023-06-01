mt_st_michel = City.create!(name: 'Le Mont-Saint-Michel')

st_michel_itinerary_pictures = [File.open("./images/stmichel1.jpg")]
st_michel_itinerary = Itinerary.new(name: 'Recoins du Mont-Saint-Michel', subtitle: "Une balade envoûtante entre terre et mer",
  distance: 7, rates: [5], duration: 160, number_of_poi: 4, latitude: 48.635125685084546, longitude: -1.5105422764522873,
                      city: mt_st_michel, category: "Urbain")
st_michel_itinerary_pictures.each { |file| st_michel_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_michel_itinerary.save!

puts "st_michel_itinerary created"
