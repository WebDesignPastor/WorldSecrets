rennes = City.create!(name: 'Rennes')

champ_jacquet = Poi.create!(
  name: 'Place du Champ Jacquet',
  mystery_name: 'Le Mystère du Champ Jacquet',
  latitude: 48.11296045739125,
  longitude: -1.6802686925760535,
  mystery_content: "La Place du Champ Jacquet est le cœur historique de Rennes. Entourée de majestueuses maisons à pans de bois, c'est un témoignage vivant de l'architecture médiévale de la ville.",
  mystery_image: 'pois/rennes/champ_jacquet.jpg',
  clue_image: 'pois/rennes/champ_jacquet_clue.jpg',
  clue_sentence: 'Je suis une place historique, située à Rennes, je suis entourée de maisons à pans de bois'
)

maison_ti_coz = Poi.create!(
  name: 'Maison Ti-Coz',
  mystery_name: 'L’Énigme de la Maison Ti-Koz',
  latitude: 48.111917459769366,
  longitude: -1.6828873899832573,
  mystery_content: "La Maison Ti-Koz est une des plus anciennes maisons de Rennes. Avec ses pans de bois et son histoire riche, elle est un monument incontournable de l'architecture rennaise.",
  mystery_image: 'pois/rennes/ti_koz.jpg',
  clue_image: 'pois/rennes/ti_koz_clue.jpg',
  clue_sentence: 'Je suis une maison historique, située à Rennes, je suis connue pour mon architecture traditionnelle'
)

hotel_noue = Poi.create!(
  name: 'Hôtel de la Noue',
  mystery_name: 'Le Secret de l’Hôtel de la Noue',
  latitude: 48.113150564525625,
  longitude: -1.683421737408113,
  mystery_content: "L'Hôtel de la Noue est un ancien hôtel particulier, véritable bijou de l'architecture du 16ème siècle. Il illustre parfaitement le style des maisons à pans de bois de l'époque.",
  mystery_image: 'pois/rennes/hotel_noue.jpg',
  clue_image: 'pois/rennes/hotel_noue_clue.png',
  clue_sentence: "Je suis un hôtel particulier historique."
)

rue_chapitre = Poi.create!(
  name: 'Rue du Chapitre',
  mystery_name: 'La Rue du Chapitre Cachée',
  latitude: 48.11109279196616,
  longitude:  -1.6821388782010451,
  mystery_content: "La Rue du Chapitre, bordée de maisons à pans de bois, est un des plus beaux exemples de rues médiévales de Rennes. Elle offre une plongée dans le temps et l'histoire de la ville.",
  mystery_image: 'pois/rennes/rue_chapitre.png',
  clue_image: 'pois/rennes/rue_chapitre_clue.png',
  clue_sentence: 'Je suis une rue historique, située à Rennes, je suis connue pour mes maisons médiévales'
)

pans_de_bois_itinerary_pictures = [File.open("db/seeds/rennes/images/pans_de_bois.png")]
pans_de_bois_itinerary = Itinerary.new(name: 'Maisons à Pans de Bois de Rennes', subtitle: "Une promenade architecturale dans le cœur historique de Rennes", distance: 4, rates: [5],
  duration: 180, number_of_poi: 4,  latitude: 48.115245900734365, longitude: -1.6809570012529582, city: rennes, category: 'Médiéval',
description: "Plongez dans l'histoire captivante de Rennes avec cet itinéraire qui vous guidera à travers les plus remarquables maisons à pans de bois de la ville.
Ces joyaux architecturaux reflètent le savoir-faire d'artisans d'antan et l'histoire riche et colorée de Rennes. Votre promenade vous emmènera à travers des rues étroites et pittoresques,
des places animées et des coins tranquilles, chaque arrêt révélant une nouvelle maison à pans de bois à admirer. Préparez-vous pour une aventure inoubliable qui vous transportera à travers le temps,
 vous offrant un aperçu du charme et du caractère uniques de la Bretagne médiévale.", quiz_name: "Expert en charpente rennaise")
 pans_de_bois_itinerary_pictures.each { |file| pans_de_bois_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
 pans_de_bois_itinerary.save!

ItineraryPoi.create!(poi_order: 1, itinerary: pans_de_bois_itinerary, poi: champ_jacquet)
ItineraryPoi.create!(poi_order: 2, itinerary: pans_de_bois_itinerary, poi: maison_ti_coz)
ItineraryPoi.create!(poi_order: 3, itinerary: pans_de_bois_itinerary, poi: hotel_noue)
ItineraryPoi.create!(poi_order: 4, itinerary: pans_de_bois_itinerary, poi: rue_chapitre)
# ItineraryPoi.create!(poi_order: 3, itinerary: st_malo_itinerary, poi: chiens_du_guet)

puts "created #{ItineraryPoi.count} ItineraryPois"


Question.create!(
  question_statement: "Quelle place est au cœur historique de Rennes ?",
  itinerary: pans_de_bois_itinerary,
  answer_statement: ["Place de la Mairie", "Place du Champ Jacquet", "Place des Lices", "Place Sainte-Anne"],
  good_answer: "Place du Champ Jacquet"
)

Question.create!(
  question_statement: "Quelle est une des plus anciennes maisons de Rennes ?",
  itinerary: pans_de_bois_itinerary,
  answer_statement: ["Maison du Champ Jacquet", "Maison Ti-Coz", "Maison de la Rue du Chapitre", "Maison de l'Hôtel de la Noue"],
  good_answer: "Maison Ti-Coz"
)

Question.create!(
  question_statement: "Quel hôtel particulier est un bijou de l'architecture du 16ème siècle à Rennes ?",
  itinerary: pans_de_bois_itinerary,
  answer_statement: ["Hôtel de Blossac", "Hôtel de la Noue", "Hôtel de ville de Rennes", "Hôtel Dieu"],
  good_answer: "Hôtel de la Noue"
)

Question.create!(
  question_statement: "Quelle rue de Rennes est un des plus beaux exemples de rues médiévales ?",
  itinerary: pans_de_bois_itinerary,
  answer_statement: ["Rue de la Monnaie", "Rue du Chapitre", "Rue Saint-Michel", "Rue Vasselot"],
  good_answer: "Rue du Chapitre"
)

Question.create!(
  question_statement: "Quel type d'architecture est caractéristique de la Place du Champ Jacquet à Rennes ?",
  itinerary: pans_de_bois_itinerary,
  answer_statement: ["Architecture contemporaine", "Architecture gothique", "Architecture à pans de bois", "Architecture haussmannienne"],
  good_answer: "Architecture à pans de bois"
)

puts "vezin_itinerary created"
