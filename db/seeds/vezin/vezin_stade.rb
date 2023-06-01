vezin = City.create!(name: 'Vezin-le-Coquet')

prison_vezin = Poi.create!(name: 'La prison de Vezin', mystery_name: 'La prison oubliée', latitude: 48.115967991535825,  longitude: -1.7548595057641405,
  mystery_content: 'La prison de Vezin-le-Coquet est une ancienne prison située dans la commune de Vezin-le-Coquet, en Ille-et-Vilaine.
  Construite en 1860, elle est fermée en 1952. Elle est inscrite au titre des monuments historiques depuis le 28 décembre 1992.',
  mystery_image: 'prison_vezin.jpg', clue_image: 'prison_vezin_clue.png', clue_sentence: 'Je suis un lieu de détention, je suis situé à Vezin-le-Coquet, je suis un lieu historique')

mairie_vezin = Poi.create!(name: 'La mairie de Vezin', latitude: 48.11695603596252, longitude: -1.7539228302209222, mystery_name: 'La mairie de Vezin',
  mystery_content: 'La mairie de Vezin-le-Coquet est un bâtiment situé dans la commune de Vezin-le-Coquet, en Ille-et-Vilaine.',
  mystery_image: 'mairie_vezin.jpg', clue_image: 'mairie_vezin_clue.jpg', clue_sentence: 'Je suis un lieu de pouvoir, je suis situé à Vezin-le-Coquet, je suis un lieu historique')


# vezin_itinerary_pictures = [File.open("./images/vezin1.jpg")]
vezin_itinerary = Itinerary.new(name: 'Vezin et son stade', subtitle: "Le joyau de la Flume", distance: 10, rates: [5], duration: 180, number_of_poi: 2,  latitude: 48.119235, longitude: -1.753901, city: vezin, category: 'Urbain',
description: "Vezin est le sang de la veine de l'Ille-et-Vilaine. Venez vous installer dans cette bourgade de l'extrême où les générations s'entendent si bien entre elles.")
# vezin_itinerary_pictures.each { |file| vezin_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vezin_itinerary.save!

ItineraryPoi.create!(poi_order: 1, itinerary: vezin_itinerary, poi: mairie_vezin)
ItineraryPoi.create!(poi_order: 2, itinerary: vezin_itinerary, poi: prison_vezin)
# ItineraryPoi.create!(poi_order: 3, itinerary: st_malo_itinerary, poi: chiens_du_guet)
puts "created #{ItineraryPoi.count} ItineraryPois"


Question.create!(question_statement: "Quel est le nom de la rue principale de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Rue de la République", "Rue de la Liberté", "Rue de Rennes", "Rue de la Réunification"], good_answer: "Rue de Rennes")
Question.create!(question_statement: "Quel est le nom de la prison de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Prison de Vezin", "Prison de Pacé", "Prison de Rennes", "Prison de Vitré"], good_answer: "Prison de Vezin")
Question.create!(question_statement: "Quel est le nom de la mairie de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Mairie de Vezin", "Mairie de Pacé", "Mairie de Rennes", "Mairie de Vitré"], good_answer: "Mairie de Vezin")
Question.create!(question_statement: "Quel est du supermarché de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Supermarché de Vezin", "Supermarché de Pacé", "Supermarché de Rennes", "Supermarché de Vitré"], good_answer: "Supermarché de Vezin")
Question.create!(question_statement: "Quel est du stade de Vezin ?", itinerary: vezin_itinerary, answer_statement: ["Stade de Vezin", "Stade de Pacé", "Stade de Rennes", "Stade de Vitré"], good_answer: "Stade de Vezin")

puts "vezin_itinerary created"
