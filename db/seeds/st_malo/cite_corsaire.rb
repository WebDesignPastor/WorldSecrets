st_malo = City.create!(name: 'Saint-Malo')

chat_qui_danse = Poi.create!(
  name: 'La rue du chat qui danse',
  latitude: 48.650662,
  longitude:  -2.027407,
  mystery_name: 'Rue du chat qui danse',
  mystery_content: "Les Anglois ont tenté de rayer Saint-malo de la
  carte avec un bateau rempli d'explosifs, hélas pour eux, le bateau finit par s'échouer loin des enceintes de la ville.
  Il ne fit qu'une victime, un chat ! Pour les moquer, les malouins rebaptisèrent cette rue, la rue du chat qui danse",
  mystery_image: 'pois/st-malo/rue_du_chat_qui_danse.jpg',
  clue_image: 'pois/st-malo/cat_dance.gif',
  clue_sentence: 'Je suis un animal,
  qui aime les balles élastiques, mon nom est court à prononcer, quand il y a de la musique, je me mets à bouger')
la_grand_porte = Poi.create!(
  name: "La Grand'Porte",
  latitude: 48.648962,
  longitude: -2.023744,
  mystery_name: "La Grand'porte",
  mystery_content: "La Grand Porte est la plus ancienne porte de Saint-Malo. Pendant plusieurs siècles, elle fut l’entrée principale qui desservait le port.
  Au-dessus de l’entrée, vous pouvez admirer Notre-Dame de la Grand’Porte, une statue de la Vierge à l’Enfant. Des marins auraient trouvé cette statue de marbre flottant sur la mer.
  Également surnommée « Notre-Dame des Miracles », la légende raconte qu’en 1661, elle se serait dressée face aux flammes qui ravageaient la ville et aurait stoppé l’incendie.",
  mystery_image: "pois/st-malo/la_grand_porte.jpg",
  clue_image: "pois/st-malo/clue_grand_porte.jpg",
  clue_sentence: "Je suis une entrée majestueuse de la ville de Saint-Malo, ornée de sculptures et de motifs baroques. Témoin de l'histoire de la cité corsaire. Qui suis-je ?")

st_malo_itinerary_pictures = [File.open("db/seeds/st_malo/images/saint-malo1.jpg")]
st_malo_itinerary = Itinerary.new(name: 'Saint-Malo, la cité corsaire', subtitle: "Plongez dans les secrets des remparts d'Intra-Muros", distance: 5,
  rates: [5], duration: 60, number_of_poi: 3, latitude: 48.650861651302534, longitude: -2.0218998515555895,  city: st_malo, category: "Médiéval",
  description: "Entendez-moi, noble compagnie, car je vais vous raconter l'histoire d'une cité corsaire bâtie sur les
  flots tumultueux de la mer, la ville imprenable de Saint-Malo.
  Enveloppée par les vagues impitoyables de la Manche, cette ville est un joyau resplendissant dans l'histoire de la
  Bretagne.Avec ses fortifications massives, ses édifices majestueux et ses rues pavées envoûtantes,
  elle a connu des siècles de guerres, de commerce et d'aventures épiques.
  Ses remparts s'élèvent fièrement dans le ciel, défiant l'océan et protégeant la ville de ses ennemis.
  Mais c'est surtout l'histoire des corsaires de Saint-Malo qui a marqué les esprits de toutes les générations.
  Ces guerriers intrépides naviguaient sur des navires rapides et puissants, bravant les tempêtes les plus violentes
  et les flots les plus déchaînés pour protéger leur ville et leur liberté.
  Leurs batailles légendaires contre les ennemis, qu'ils soient Anglais, Espagnols ou autres, sont restées gravées
  dans l'histoire.
  Les canons tonnent, les sabres s'entrechoquent, les flammes embrasent les navires ennemis, mais les corsaires de
  Saint-Malo tiennent bon, animés par un courage inébranlable et une ferveur indomptable.
  Aujourd'hui encore, la ville de Saint-Malo continue de fasciner et d'inspirer tous ceux qui la visitent. Les rues pavées
  résonnent de l'histoire de ses ancêtres valeureux, les remparts gardent jalousement leurs secrets et l'océan murmure à l'oreille de ceux qui sont prêts à écouter.
  Que la légende de Saint-Malo perdure dans les siècles à venir, comme un symbole de la bravoure et de la liberté de ceux
  qui ont osé affronter les flots les plus impitoyables et les ennemis les plus redoutables.", quiz_name:"Quiz de la cité corsaire")
st_malo_itinerary_pictures.each { |file| st_malo_itinerary.photos.attach(io: file, filename: "nes.png", content_type: "image/png") }
st_malo_itinerary.save!


ItineraryPoi.create!(poi_order: 1, itinerary: st_malo_itinerary, poi: chat_qui_danse)
ItineraryPoi.create!(poi_order: 2, itinerary: st_malo_itinerary, poi: la_grand_porte)

Question.create!(question_statement: 'Dans quel département se situe Saint-Malo ?', itinerary: st_malo_itinerary, answer_statement: ["22", "44", "35", "56"], good_answer: "35")
Question.create!(question_statement: 'Quel était le surnom de la ville de Saint-Malo ? La cité ... :', itinerary: st_malo_itinerary, answer_statement: ["Corsaire", "Pirate", "Des vieux loups d'mer", "Engloutie"], good_answer: "Corsaire")
Question.create!(question_statement: "Saint-Malo fut pendant 4 années une république indépendante. C'était au : ", itinerary: st_malo_itinerary, answer_statement: ["Xe siècle", "XIIe siècle", "XIVe siècle", "XVIe siècle"], good_answer: "XVIe siècle")
Question.create!(question_statement: "Lequel de ces marins n'est pas né à Saint-Malo ?", itinerary: st_malo_itinerary, answer_statement: ["Jean Bart", "Robert Surcouf", "Duguay-Trouin", "Jacques Cartier"], good_answer: "Jean Bart")
Question.create!(question_statement: "Quel peuple, autrefois ennemi de la France, a attaqué plusieurs fois le port de Saint-Malo ?", itinerary: st_malo_itinerary, answer_statement: ["Les Portuguais", "Les Espagnols", "Les Anglais", "Les Russes"], good_answer: "Les Anglais")

puts "corsaire_itinerary created"
