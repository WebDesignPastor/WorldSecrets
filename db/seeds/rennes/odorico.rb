rennes = City.create!(name: 'Rennes')

poirier = Poi.create!(
  name: 'Place du Champ Jacquet',
  mystery_name: "L'immeuble Poirier",
  latitude: 48.10895199432893,
  longitude: -1.6736565807233568,
  mystery_content: "Appréciez les magnifiques tesselles dorées. Si l’immeuble à l’architecture typiquement Art déco porte le nom de l’entrepreneur Jean Poirier,
  les mosaïques elles sont bien signées Odorico. Elles datent de 1928 et ont été restaurées en 2016-2017 par la famille Patrizio, originaire du même village que les Odorico",
  mystery_image: 'pois/rennes/poirier.jpg',
  clue_image: 'pois/rennes/poirier_clue.png',
  clue_sentence: "Elevez votre regard... ou vous manquerez ce secret",
)

dupont = Poi.create!(
  name: 'Place du Champ Jacquet',
  mystery_name: "31 rue Dupont des Loges",
  latitude: 48.10920826229957,
  longitude: -1.6707543920324979,
  mystery_content: "C’est dans ce quartier que l’activité de la famille Odorico a commencé, comme en témoigne plusieurs décors dans les commerces.
  Vous pouvez admirer la façade de ce numéro 31, mais n'hésitez pas à flâner dans cette rue pour découvrir d'autres mosaïques.",
  mystery_image: 'pois/rennes/dupont.jpg',
  clue_image: 'pois/rennes/dupont_clue.png',
  clue_sentence: "Cette façade sera du côté impair de la rue",
)

odorico_itinerary_pictures = [File.open("db/seeds/rennes/images/odorico.jpg")]
odorico_itinerary = Itinerary.new(
  name: 'Splendeur des Odorico',
  subtitle: "Découvrez les magnifiques mosaïques cachées dans les rues rennaises",
  distance: 7,
  rates: [5],
  duration: 180,
  number_of_poi: 2,
  latitude: 48.115245900734365,
  longitude: -1.6809570012529582,
  city: rennes,
  category: 'Urbain',
  description: "Embarquez pour une exploration unique à travers Rennes, suivant les traces des mosaïques d'Odorico.
  Cet itinéraire vous guidera à travers la richesse artistique et culturelle de la ville, en vous dévoilant les splendeurs des œuvres d'Odorico.
  Chaque mosaïque, avec ses motifs délicats et ses couleurs vibrantes, raconte une histoire, témoigne d'une époque et reflète le talent incontesté des maîtres mosaïstes.
  De bâtiments emblématiques à des coins moins connus, préparez-vous à être surpris et émerveillé par ces chefs-d'œuvre de l'art décoratif rennais. Un voyage fascinant
  qui illumine la beauté cachée de Rennes vous attend.")
 odorico_itinerary_pictures.each { |file| odorico_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
 odorico_itinerary.save!

ItineraryPoi.create!(poi_order: 1, itinerary: odorico_itinerary, poi: poirier)
ItineraryPoi.create!(poi_order: 2, itinerary: odorico_itinerary, poi: dupont)
# ItineraryPoi.create!(poi_order: 3, itinerary: odorico_itinerary, poi: hotel_noue)
# ItineraryPoi.create!(poi_order: 4, itinerary: odorico_itinerary, poi: rue_chapitre)

puts "created #{ItineraryPoi.count} ItineraryPois"
