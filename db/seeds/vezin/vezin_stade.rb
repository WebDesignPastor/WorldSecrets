vezin = City.create!(name: 'Vezin-le-Coquet')

ferme_vezin = Poi.create!(name: 'Le Bas-vezin', mystery_name: 'Ferme du Bas-Vezin', latitude: 48.11499531094043, longitude: -1.7552324935050911,
  mystery_content: "Autrefois isolée au sud du village, cette ancienne ferme est maintenant englobée dans l'agglomération de Vezin.
  Implantée sur le site d'un manoir disparu, elle est datée de la fin du 18e siècle et présente un ensemble de bâtiments remarquables. L'aile ouest a été transformée en logements.",
  mystery_image: 'pois/vezin/ferme_bas_vezin.png', clue_image: 'pois/vezin/ferme_bas_vezin_clue.png', clue_sentence: 'Je suis un lieu de détention, je suis situé à Vezin-le-Coquet, je suis un lieu historique')

chateau_vezin = Poi.create!(name: 'Château de la Derouetière', latitude: 48.12240978803061, longitude: -1.7502067154248528, mystery_name: 'Château de la Derouetière',
  mystery_content: "Le château de la Derouetière, rebaptisé depuis une trentaine d'années le Haut-Jussé en souvenir de l'un de ses occupants, l'historien Pocquet du Haut-Jussé, est une demeure érigée
  dans le style néo-toscan vraisemblablement au cours du 2e quart du 19e siècle. Jusqu'à la fin des années 1960, le bâtiment comportait une tour carrée de deux niveaux surmontée d'un lanternon au-dessus d'un toit plat couvert de zinc.",
  mystery_image: 'pois/vezin/chateau_haut_jusse.png', clue_image: 'pois/vezin/chateau_drouetiere.png', clue_sentence: "Pas visible depuis l'entrée de la propriété, je vais devoir m'éloigner pour mieux l'apercevoir")

vezin_itinerary_pictures = [File.open("db/seeds/vezin/images/vezin1.jpg")]
vezin_itinerary = Itinerary.new(name: 'Curiosités vezinoises', subtitle: "Balade dans le passé de Vezin le Coquet", distance: 10, rates: [5],
  duration: 180, number_of_poi: 2,  latitude: 48.119235, longitude: -1.753901, city: vezin, category: 'Urbain',
description: "Écoutez-moi, chers auditeurs, car je vais vous narrer l'histoire d'une bourgade paisible, lovée dans les douces courbes des terres bretonnes,
la petite mais fière cité de Vezin-le-Coquet. Bercée par les flots clairs de la Flume, cette ville est un diamant discret dans l'écrin de l'histoire de la Bretagne.
Avec ses demeures rustiques, ses édifices historiques et ses charmantes ruelles, elle a connu des siècles de travail, de communauté et de vies simples mais remplies.
Ses modestes bâtisses se dressent avec fierté, contrastant avec le ciel, et abritant ses habitants des intempéries. Mais c'est surtout l'histoire des paysans de Vezin-le-Coquet
qui a marqué les esprits de toutes les générations. Ces vaillants travailleurs, armés de leurs outils et de leur savoir, bravant les saisons les plus rigoureuses et les terres les plus
récalcitrantes pour nourrir leur village et maintenir leur mode de vie. Leurs luttes quotidiennes contre les éléments, qu'ils soient orages, sécheresses ou hivers rudes,
sont restées gravées dans l'histoire. Les outils s'agitent, les sueurs perlent, les récoltes s'épanouissent sous le soleil, mais les paysans de Vezin-le-Coquet tiennent bon,
animés par une détermination inébranlable et une passion indomptable. Aujourd'hui encore, le village de Vezin-le-Coquet continue de charmer et d'inspirer tous ceux qui le visitent.
Les ruelles paisibles résonnent de l'histoire de ses ancêtres travailleurs, les vieilles maisons gardent jalousement leurs secrets et la Flume murmure à l'oreille de ceux qui sont prêts à écouter.
Que la légende de Vezin-le-Coquet perdure dans les siècles à venir, comme un symbole de la ténacité et de la simplicité de ceux qui ont osé affronter les terres les plus ingrates
et les saisons les plus impitoyables.", quiz_name: "Un tour à Vezin le Coquet")
vezin_itinerary_pictures.each { |file| vezin_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
vezin_itinerary.save!

ItineraryPoi.create!(poi_order: 1, itinerary: vezin_itinerary, poi: ferme_vezin)
ItineraryPoi.create!(poi_order: 2, itinerary: vezin_itinerary, poi: chateau_vezin)
# ItineraryPoi.create!(poi_order: 3, itinerary: st_malo_itinerary, poi: chiens_du_guet)
puts "created #{ItineraryPoi.count} ItineraryPois"


Question.create!(question_statement: "De quand date la ferme du Bas-Vezin  ?", itinerary: vezin_itinerary,
  answer_statement: ["Milieu du 19ème siècle", "Début du 16ème siècle", "Fin du 18ème siècle", "Fin du 17ème siècle"], good_answer: "Fin du 18ème siècle")
Question.create!(question_statement: "Qu'est-ce qui existait à l'endroit de la ferme du Bas-Vezin ?", itinerary: vezin_itinerary,
  answer_statement: ["Un manoir", "Un pénitencier", "Une chapelle", "Un monastère "], good_answer: "Un manoir")
Question.create!(question_statement: "Quel est le nouveau nom du Château de la Derouetière ?", itinerary: vezin_itinerary,
  answer_statement: ["Château des Champs Bleus", "Château du Haut Jussé", "Château du Moulin à vent", "Château du Lion d'or"], good_answer: "Château du Haut Jussé")
Question.create!(question_statement: "Dans quel style est-il construit ?", itinerary: vezin_itinerary,
  answer_statement: ["Gréco-romain", "Gothique", "Baroque", "Néo-Toscan"], good_answer: "Néo-Toscan")
Question.create!(question_statement: "Quel était le métier de Poquet du Haut-Jussé, qui vécut dans le château et lui donna son nouveau nom ?", itinerary: vezin_itinerary,
  answer_statement: ["Écrivain", "Journaliste", "Député", "Historien"], good_answer: "Historien")

puts "vezin_itinerary created"
