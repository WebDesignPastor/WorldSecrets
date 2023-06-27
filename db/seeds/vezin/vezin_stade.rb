vezin = City.create!(name: 'Vezin-le-Coquet')

prison_vezin = Poi.create!(name: 'Le Bas-vezin', mystery_name: 'Ferme du Bas-Vezin', latitude: 48.115383000768574, longitude: -1.7568778017389504,
  mystery_content: "Autrefois isolée au sud du village, cette ancienne ferme est maintenant englobée dans l'agglomération de Vezin.
  Implantée sur le site d'un manoir disparu, elle est datée de la fin du 18e siècle et présente un ensemble de bâtiments remarquables. L'aile ouest a été transformée en logements.",
  mystery_image: 'pois/vezin/prison_vezin.jpg', clue_image: 'pois/vezin/prison_vezin_clue.png', clue_sentence: 'Je suis un lieu de détention, je suis situé à Vezin-le-Coquet, je suis un lieu historique')

mairie_vezin = Poi.create!(name: 'Manoir de la Derouetière', latitude: 48.12240978803061, longitude: -1.7502067154248528, mystery_name: 'Manoir de la Derouetière',
  mystery_content: 'La mairie de Vezin-le-Coquet est un bâtiment situé dans la commune de Vezin-le-Coquet, en Ille-et-Vilaine.',
  mystery_image: 'pois/vezin/mairie_vezin.jpg', clue_image: 'pois/vezin/mairie_vezin_clue.jpg', clue_sentence: 'Je suis un lieu de pouvoir, je suis situé à Vezin-le-Coquet, je suis un lieu historique')


vezin_itinerary_pictures = [File.open("db/seeds/vezin/images/vezin1.jpg")]
vezin_itinerary = Itinerary.new(name: 'Vezin et son stade', subtitle: "Le joyau de la Flume", distance: 10, rates: [5],
  duration: 180, number_of_poi: 2,  latitude: 48.119235, longitude: -1.753901, city: vezin, category: 'Urbain',
description: "Vezin est le sang de la veine de l'Ille-et-Vilaine. Venez vous installer dans cette bourgade de l'extrême
où les générations s'entendent si bien entre elles.", quiz_name: "Vezin pour la vie")
vezin_itinerary_pictures.each { |file| vezin_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vezin_itinerary.save!

ItineraryPoi.create!(poi_order: 1, itinerary: vezin_itinerary, poi: mairie_vezin)
ItineraryPoi.create!(poi_order: 2, itinerary: vezin_itinerary, poi: prison_vezin)
# ItineraryPoi.create!(poi_order: 3, itinerary: st_malo_itinerary, poi: chiens_du_guet)
puts "created #{ItineraryPoi.count} ItineraryPois"


Question.create!(question_statement: "Quel est le nom de la rue principale de Vezin ?", itinerary: vezin_itinerary,
  answer_statement: ["Rue de la République", "Rue de la Liberté", "Rue de Rennes", "Rue de la Réunification"], good_answer: "Rue de Rennes")
Question.create!(question_statement: "Quel est le nom de la prison de Vezin ?", itinerary: vezin_itinerary,
  answer_statement: ["Prison de Vezin", "Prison de Pacé", "Prison de Rennes", "Prison de Vitré"], good_answer: "Prison de Vezin")
Question.create!(question_statement: "Quel est le nom de la mairie de Vezin ?", itinerary: vezin_itinerary,
  answer_statement: ["Mairie de Vezin", "Mairie de Pacé", "Mairie de Rennes", "Mairie de Vitré"], good_answer: "Mairie de Vezin")
Question.create!(question_statement: "Quel est du supermarché de Vezin ?", itinerary: vezin_itinerary,
  answer_statement: ["Supermarché de Vezin", "Supermarché de Pacé", "Supermarché de Rennes", "Supermarché de Vitré"], good_answer: "Supermarché de Vezin")
Question.create!(question_statement: "Quel est du stade de Vezin ?", itinerary: vezin_itinerary,
  answer_statement: ["Stade de Vezin", "Stade de Pacé", "Stade de Rennes", "Stade de Vitré"], good_answer: "Stade de Vezin")

puts "vezin_itinerary created"
