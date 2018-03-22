dependencies = %w(Review Submission Message Trip User Hike)

level_seed = (ENV['LEVEL_SEED'] || "Trip")

tables = dependencies[0, dependencies.index(level_seed) + 1]

p tables

def create_hikes
  hike_solutre = Hike.create!
  hike_vercors = Hike.create!
  hike_corse = Hike.create!
  hike_wagon = Hike.create!
  UniScrapper.new(hike_solutre, "https://www.visorando.com/randonnee-sur-les-pas-de-tonton/")
  UniScrapper.new(hike_vercors, "https://www.visorando.com/randonnee-sur-les-sentiers-des-gorges-de-l-ardeche/")
  UniScrapper.new(hike_corse, "https://www.visorando.com/randonnee-gr20-de-bibi/")
  UniScrapper.new(hike_wagon, "https://www.visorando.com/randonnee-/1008103")
  hike_wagon.update(photo_url: "https://kitt.lewagon.com/placeholder/cities/lyon")
  hike_wagon.update(distance: "101km")
  MultiScrapper.departments_list
end

def create_users

  User.create!(
    email: 'francois@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Francois',
    last_name: 'Mitterand',
    description: 'Résistant, Homme de lettre passionné par les livres',
    age: 101,
    remote_avatar_url: 'https://cache.20minutes.fr/photos/2014/12/31/president-francois-mitterrand-lors-9633-diaporama.jpg'
  )

  User.create!(
    email: 'roger@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Roger',
    last_name: 'Hanin',
    description: 'Je suis le beauf de Tonton',
    age: 93,
    remote_avatar_url: 'http://md1.libe.com/photo/715188-france-bio-hanin.jpg?modified_at=1423671399&width=960'
  )

  User.create!(
    email: 'jack@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Jack',
    last_name: 'Lang',
    description: 'Vive la musique en rando!',
    age: 78,
    remote_avatar_url: 'https://www.ina.fr/images_v2/620x349/CPC88007257.jpeg'
  )

  User.create!(
    email: 'jacques@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Jacques',
    last_name: 'Attali',
    description: 'J\'ai la seule boussole qui indique toujours le sud',
    age: 87,
    remote_avatar_url: 'http://s2.lemde.fr/image/2016/08/26/644x0/4988464_6_e89b_jacques-attali-alors-conseiller-special-de_42e000872eb903b70c800c81e1ede3ae.jpg'
  )

  User.create!(
    email: 'benoit@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Benoit',
    last_name: 'Poelvoorde',
    description: 'Chaque pas est une planche, chaque planche est un pas, concentré sur le bout du pont... Je suis le bout du pont ...',
    age: 53,
    remote_avatar_url: 'https://www.quizz.biz/uploads/quizz/896950/15_ky785.jpg'
  )

  User.create!(
    email: 'vincent@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Vincent',
    last_name: 'Elbaz',
    description: "La vérité si je mens",
    age: 47,
    remote_avatar_url: 'https://www.notrecinema.com/images/usercontent/star/vincent-elbaz-photo_35923_14761.jpg'
  )

  User.create!(
    email: 'karine@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Karine',
    last_name: 'Viard',
    description: 'J\'adore les béliers',
    age: 52,
    remote_avatar_url: 'https://sacrenathalie.files.wordpress.com/2015/08/randonneurs-1997-15-g.jpg'
  )

###########################

  User.create!(
    email: 'etienne.delorieux@gmail.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Etienne',
    last_name: 'Delorieux',
    description: 'Go le Canada',
    age: 27,
    remote_avatar_url: 'http://kitt.lewagon.com/placeholder/users/EtienneDelorieux'
  )

  User.create!(
    email: 'lorenzo@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Lorenzo',
    last_name: 'Del Castillo Detoeuf',
    description: 'Yo',
    age: 25,
    remote_avatar_url: 'http://kitt.lewagon.com/placeholder/users/ldeld'
  )

  User.create!(
    email: 'louis@holdies.com',
    admin: true,
    password: 'aaaaaa',
    first_name: 'Louis',
    last_name: 'Delon',
    description: 'Vous voulez un grand ecran?',
    age: 40,
    remote_avatar_url: 'http://kitt.lewagon.com/placeholder/users/louleman34'
  )

  User.create!(
    email: 'alexandre.b2506@gmail.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Alexandre',
    last_name: 'Bouvier',
    description: "Un Parisien a Lyon",
    age: 30,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/alexandrebk'
  )

  User.create!(
    email: 'sebastien@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Sebastien',
    last_name: 'Balas',
    description: "La Suisse me manque :(",
    age: 24,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/sebbbalas'
  )

  User.create!(
    email: 'isabelle@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Isabelle',
    last_name: 'Pontoizeau',
    description: 'Une binouze - une rando - la belle vie',
    age: 32,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/IsaPontoizeau'
  )

  User.create!(
    email: 'antoine@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Antoine',
    last_name: 'Giret',
    description: "A mort les agences",
    age: 32,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/agiret'
  )

  User.create!(
    email: 'alix@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Alix',
    last_name: 'Peyrot',
    description: "Besoin d'une voiture",
    age: 32,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/AlixPS'
  )

  User.create!(
    email: 'maxime@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Maxime',
    last_name: 'Personnic',
    description: "La Bourgogne c'est sympa pour les randos",
    age: 27,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/maxime12345'
  )

  User.create!(
    email: 'joseph@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Joseph',
    last_name: 'Blanchard',
    description: "Allez on fait les fifous",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/jpheos'
  )

  User.create!(
    email: 'kevin@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Kevin',
    last_name: 'Chavanne',
    description: "Allez l'OL",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/kevcha'
  )

  User.create!(
    email: 'matthieu@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Matthieu',
    last_name: 'Cartiller',
    description: "Comment y va?",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/cartosnet'
  )

  User.create!(
    email: 'lahbib@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Lahbib',
    last_name: 'Belhaddad',
    description: "Danza Kuduro",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/lahbibSBK'
  )

  User.create!(
    email: 'mathieu@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Mathieu',
    last_name: 'Nicolas',
    description: "La Thailande ma poule",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/matni94'
  )

  User.create!(
    email: 'mathilde@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Mathilde',
    last_name: 'Lesauvage',
    description: "A mort les agences",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/mathildelesau'
  )

  User.create!(
    email: 'mohamed@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Mohamed',
    last_name: 'Diop',
    description: "Il fait froid non?",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/MuhammadDiop'
  )

  User.create!(
    email: 'romain@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Romain',
    last_name: 'Duthel',
    description: "Ce site est-il Open Source?",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/rduthel'
  )

  User.create!(
    email: 'theo@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Theo',
    last_name: 'Nazon',
    description: "Moyen de randonner en velo?",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/theolal'
  )

  User.create!(
    email: 'thomas@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Thomas',
    last_name: 'Jouvel',
    description: "Mr. Replique",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/ThomasJoujou'
  )

  User.create!(
    email: 'christophe@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Christophe',
    last_name: 'Gachet',
    description: "Yo",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/crionline38'
  )

  User.create!(
    email: 'guillaume@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Guillaume',
    last_name: 'Noireaux',
    description: "Yo",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/gnoireaux'
  )

  User.create!(
    email: 'benoitw@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Benoit',
    last_name: 'Duvignaud',
    description: "Yo",
    age: 34,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/bduvignaud'
  )

#############################

  User.create!(
    email: 'kylian@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Kylian',
    last_name: 'Jornet',
    description: "Ma chaime bien malcher et coulil",
    age: 32,
    remote_avatar_url: "http://celebhealthy.com/wp-content/uploads/2017/07/Kilian-Jornet-Burgada-celebhealthy_com-300x200.jpg"
  )

  User.create!(
    email: 'mike@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Mike',
    last_name: 'Horn',
    description: "The Boss",
    age: 51,
    remote_avatar_url: "http://www.gqmagazine.fr/uploads/images/thumbs/201724/9f/mike_horn_9071.jpeg_north_640x312_transparent.jpg"
  )

    User.create!(
    email: 'francoisho@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Flamby',
    last_name: 'Hollande',
    description: "Mais euh, on part marcher?",
    age: 63,
    remote_avatar_url: "https://static.businessinsider.com/image/545e8bececad044b521c9423/image.jpg"
  )

    User.create!(
    email: 'meryem@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Meryem',
    last_name: 'OK',
    description: "Je suis pas venue pour souffrir okay?",
    age: 33,
    remote_avatar_url: "http://francais-express.com/upload/images/real/2017/09/19/j-suis-pas-venue-ici-pour-souffrir-ok-meryem-nouvelle-chroniqueuse-de-tpmp__668443_.jpg"
  )

    User.create!(
    email: 'jchirac@whikend.com',
    admin: false,
    password: 'aaaaaa',
    first_name: 'Jacques',
    last_name: 'Chirac',
    description: "Vive la Republique, Vive la France",
    age: 33,
    remote_avatar_url: "https://www.thefamouspeople.com/profiles/images/jacques-chirac-10.jpg"
  )

end

def create_trips
  puts "creation trips"
  trip_types = ["Chill", "Heavy walk", "Challenge", "Leisure", "Activities"]
  trip_start = ["Paris", "Lyon", "Saint-Etienne", "Marseille", "Rouen", "Grenoble", "Chambery", "Toulouse", "Annecy", "Metz", "Auray"]

  francois = User.find_by(email: "francois@whikend.com")
  francoisho = User.find_by(email: "francoisho@whikend.com")
  roger = User.find_by(email: "roger@whikend.com")
  jack = User.find_by(email: "jack@whikend.com")
  jacques = User.find_by(email: "jacques@whikend.com")
  benoit = User.find_by(email: "benoit@whikend.com")
  meryem = User.find_by(email: "meryem@whikend.com")
  vincent = User.find_by(email: "vincent@whikend.com")
  karine = User.find_by(email: "karine@whikend.com")
  louis = User.find_by(email: "louis@holdies.com")
  etienne = User.find_by(email: "etienne.delorieux@gmail.com")
  joseph = User.find_by(email: "joseph@whikend.com")
  kevin = User.find_by(email: "kevin@whikend.com")
  alexandre = User.find_by(email: "alexandre.b2506@gmail.com")
  matthieu = User.find_by(email: "matthieu@whikend.com")



  hikes_tmp = Hike.all.sample(2)

  hike_solutre = Hike.find_by(site_id: 523281)
  hike_corse = Hike.find_by(site_id: 2867)
  hike_vercors = Hike.find_by(site_id: 552975)
  hike_wagon = Hike.find_by(site_id: 1008103)
  hike_etienne = hikes_tmp[1]

  Trip.create!(
    description: "Venez découvrir le grand GR10 - Au programme : effort ",
    start_location: "Lyon",
    hike_id: hike_corse.id,
    title: "Grand départ pour le GR10",
    user_id: louis.id,
    date: Date.today+(1),
    trip_type: trip_types.sample,
    seats: 2,
    auto_accept: false,
    fees: (2..7).to_a.sample
  )

  Trip.create!(
    title: "A la découverte du Vercors!",
    description: "Grosse rando sympa dans la bonne humeur. Venez si vous voulez décompresser de la ville, de ses bruits et de ses pigeons.",
    start_location: "Lyon",
    hike_id: hike_vercors.id,
    user_id: benoit.id,
    date: Date.today+(1),
    trip_type: "Sportive",
    seats: 5,
    auto_accept: false,
    fees: (2..7).to_a.sample
  )

  Trip.create!(
    title: "Ascension de La Roche de Solutré - sur les pas de Tonton",
    description: "Pélerinage annuel pour honorer une promesse faite aux anciens résistants de la roche de Solutré après la Seconde Guerre Mondiale. Venez nombreux, tout le monde est bienvenue surtout si vous êtes journalistes, le rythme sera détendu",
    start_location: "Lyon",
    hike_id: hike_solutre.id,
    user_id: francois.id,
    date: Date.today+(1),
    trip_type: "Détente",
    seats: 8,
    auto_accept: true,
    fees: (2..7).to_a.sample
  )

  puts "creation of a trip by Etienne"

  hike_etienne = ((Hike.first.id)..(Hike.last.id)).to_a.sample

  Trip.create!(
    title: Hike.find(hike_etienne).title,
    description: "J'organise une rando au départ de Lyon Confluence ce samedi. J'ai 3 places dans ma Tesla. Inscrivez-vous vite, y'aura bientôt plus de places.",
    start_location: "Lyon",
    hike_id: hike_etienne,
    user_id: etienne.id,
    date: Date.today+(2),
    trip_type: trip_types.sample,
    seats: 3,
    auto_accept: true,
    fees: (2..7).to_a.sample
  )

  Trip.create!(
    title: "Rando dans les Pyrénées et le Pays Basque",
    description: "J'organise une rando au départ de Bayonne mardi prochain. Je ramène du jambon de Bayonne pour le pic-nic :). J'ai un combi Volkswagen",
    start_location: "Bayonne",
    hike_id: (((Hike.first.id)..(Hike.last.id)).to_a - [hike_wagon.id] - [hike_vercors.id] - [hike_corse.id] - [hike_solutre.id]).sample,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    date: Date.today+(3),
    trip_type: trip_types.sample,
    seats: 6,
    auto_accept: true,
    fees: (2..7).to_a.sample
  )

  20.times do
    hike = (((Hike.first.id)..(Hike.last.id)).to_a - [hike_wagon.id] - [hike_vercors.id] - [hike_corse.id] - [hike_solutre.id]).sample
    Trip.create!(
      description: "N'hésitez pas en cas de questions - description détaillée ci-dessous",
      start_location: trip_start.sample,
      hike_id: hike,
      title: Hike.find(hike).title,
      user_id: (((User.first.id)..(User.last.id)).to_a - [jacques.id] - [jack.id] - [francoisho.id] - [francois.id] - [vincent.id] - [karine.id] - [alexandre.id]).sample,
      date: [Date.today-(7),Date.today+(3),Date.today+(7)].sample,
      trip_type: trip_types.sample,
      seats: (2..5).to_a.sample,
      auto_accept: [true, false].sample,
      fees: (2..7).to_a.sample
    )
  end

  Trip.create!(
    title: "La Tres Grande Rando du Wagon Lyon",
    description: "Un grand merci à Matthieu, Kevin, Joseph ######### aux TAs Lorenzo / Christophe / Benoit / Guillaume ######### et au batch #121 : Alex, Alix, Antoine, Etienne, Isabelle, Lahbib, Louis, Mathieu, Mathilde, Maxime, Mohamed, Romain, Sebastien, Theo & Thomas !",
    start_location: "Lyon",
    hike_id: hike_wagon.id,
    user_id: matthieu.id,
    date: Date.today+(3),
    trip_type: "Challenge",
    seats: 21,
    auto_accept: true,
    fees: 5500
  )

end

def create_submissions
  puts "creation submissions"
  francois = User.find_by(email: "francois@whikend.com")
  francoisho = User.find_by(email: "francoisho@whikend.com")
  roger = User.find_by(email: "roger@whikend.com")
  jack = User.find_by(email: "jack@whikend.com")
  jacques = User.find_by(email: "jacques@whikend.com")
  benoit = User.find_by(email: "benoit@whikend.com")
  vincent = User.find_by(email: "vincent@whikend.com")
  karine = User.find_by(email: "karine@whikend.com")
  meryem = User.find_by(email: "meryem@whikend.com")
  ############
  wagon_tab = []
  ###
  joseph = User.find_by(email: "joseph@whikend.com")
  wagon_tab << joseph.id
  kevin = User.find_by(email: "kevin@whikend.com")
  wagon_tab << kevin.id
  matthieu = User.find_by(email: "matthieu@whikend.com")
  ###
  etienne = User.find_by(email: "etienne.delorieux@gmail.com")
  wagon_tab << etienne.id
  louis = User.find_by(email: "louis@holdies.com")
  wagon_tab << louis.id
  alexandre = User.find_by(email: "alexandre.b2506@gmail.com")
  theo = User.find_by(email: "theo@whikend.com")
  wagon_tab << theo.id
  sebastien = User.find_by(email: "sebastien@whikend.com")
  wagon_tab << sebastien.id
  antoine = User.find_by(email: "antoine@whikend.com")
  wagon_tab << antoine.id
  maxime = User.find_by(email: "maxime@whikend.com")
  wagon_tab << maxime.id
  mathilde = User.find_by(email: "mathilde@whikend.com")
  wagon_tab << mathilde.id
  isabelle = User.find_by(email: "isabelle@whikend.com")
  wagon_tab << isabelle.id
  mohamed = User.find_by(email: "mohamed@whikend.com")
  wagon_tab << mohamed.id
  lahbib = User.find_by(email: "lahbib@whikend.com")
  wagon_tab << lahbib.id
  mathieu = User.find_by(email: "mathieu@whikend.com")
  wagon_tab << mathieu.id
  alix = User.find_by(email: "alix@whikend.com")
  wagon_tab << alix.id
  romain = User.find_by(email: "romain@whikend.com")
  wagon_tab << romain.id
  thomas = User.find_by(email: "thomas@whikend.com")
  wagon_tab << thomas.id

  lorenzo = User.find_by(email: "lorenzo@whikend.com")
  wagon_tab << lorenzo.id
  christophe = User.find_by(email: "christophe@whikend.com")
  wagon_tab << christophe.id
  guillaume = User.find_by(email: "guillaume@whikend.com")
  wagon_tab << guillaume.id
  benoitw = User.find_by(email: "benoitw@whikend.com")
  wagon_tab << benoitw.id
  ############
  trip_solutre = Trip.find_by(title: "Ascension de La Roche de Solutré - sur les pas de Tonton")
  trip_vercors = Trip.find_by(title: "A la découverte du Vercors!")
  trip_corse = Trip.find_by(title: "Grand départ pour le GR10")
  trip_wagon = Trip.find_by(title: "La Tres Grande Rando du Wagon Lyon")

  wagon_tab.each do |alumni|
    Submission.create!(
    user_id: alumni,
    trip_id: trip_wagon.id.to_i,
    accepted: true
  )
  end

  Submission.create!(
    user_id: roger.id.to_i,
    trip_id: trip_solutre.id.to_i,
    accepted: true
  )

  Submission.create!(
    user_id: jacques.id.to_i,
    trip_id: trip_solutre.id.to_i,
    accepted: true
  )

  Submission.create!(
    user_id: jack.id.to_i,
    trip_id: trip_solutre.id.to_i,
    accepted: true
  )

  Submission.create!(
    user_id: vincent.id.to_i,
    trip_id: trip_vercors.id.to_i,
    accepted: true
  )

  Submission.create!(
    user_id: karine.id.to_i,
    trip_id: trip_vercors.id.to_i,
    accepted: true
  )

  Submission.create!(
    user_id: etienne.id.to_i,
    trip_id: trip_corse.id.to_i,
    accepted: true
  )

  Submission.create!(
    user_id: meryem.id.to_i,
    trip_id: trip_corse.id.to_i,
    accepted: true
  )

  26.times do
    user_id = (((User.first.id)..(User.last.id)).to_a - [alexandre.id]).sample
    trip_id = ((Trip.first.id..Trip.last.id).to_a - [trip_solutre.id] - [trip_vercors.id] - [trip_corse.id] - [trip_wagon.id]).sample
    accepted = Submission.where(trip_id: trip_id).count < Trip.find(trip_id).seats

    Submission.create!(
      user_id: user_id,
      trip_id: trip_id,
      accepted: accepted
    )
  end

  14.times do
    Submission.create!(
      user_id: (((User.first.id)..(User.last.id)).to_a - [alexandre.id]).sample,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_solutre.id] - [trip_vercors.id] - [trip_corse.id] - [trip_wagon.id]).sample,
      accepted: nil
    )
  end
end

def create_messages
  puts "creation messages"
  francois = User.find_by(email: "francois@whikend.com")
  francoisho = User.find_by(email: "francoisho@whikend.com")
  roger = User.find_by(email: "roger@whikend.com")
  jack = User.find_by(email: "jack@whikend.com")
  jacques = User.find_by(email: "jacques@whikend.com")
  benoit = User.find_by(email: "benoit@whikend.com")
  vincent = User.find_by(email: "vincent@whikend.com")
  karine = User.find_by(email: "karine@whikend.com")
  louis = User.find_by(email: "louis@holdies.com")
  etienne = User.find_by(email: "etienne.delorieux@gmail.com")
  joseph = User.find_by(email: "joseph@whikend.com")
  kevin = User.find_by(email: "kevin@whikend.com")
  meryem = User.find_by(email: "meryem@whikend.com")
  chirac = User.find_by(email: "jchirac@whikend.com")
  alexandre = User.find_by(email: "alexandre.b2506@gmail.com")
  isabelle = User.find_by(email: "isabelle@whikend.com")


  trip_solutre = Trip.find_by(title: "Ascension de La Roche de Solutré - sur les pas de Tonton")
  trip_vercors = Trip.find_by(title: "A la découverte du Vercors!")
  trip_corse = Trip.find_by(title: "Grand départ pour le GR10")
  trip_wagon = Trip.find_by(title: "La Tres Grande Rando du Wagon Lyon")

  messages = ["Quel est le temps prévu pour ce weekend?", "Pour les connaisseurs, une idée de quelques indispensables pour cette rando?", "Je vais faire un tour au Vieux Campeur - je peux prendre des trucs si vous voulez, n'hésitez pas", "Hâte d'y être!", "Comment on s'organise pour le départ?", "C'est possible de changer la date de depart?", "Le parcours a l'air super", "Je prends ma camera!!", "Quelqu'un a une paire de chaussettes du 42?", "J'ai perdu ma gourde - dépannage possible?", "Je suis dispo pour conduire sur une partie du trajet", "N'oubliez pas vos lunettes de soleil", "Attention - grosse chaleur prévue ce weekend", "Pensez bien à la creme solaire", "Je prends un jeu de carte pour se faire une petite coinche à la fraiche", "Un Ricard?", "Un saucisson, du pinard, je suis prêt pour le grand départ", "Je peux ramener un +1?", "C'est quel modèle ta voiture?", "On fait les courses sur la route si vous êtes ok?"]

  Message.create!(
    content: "Bonjour je suis super content d'avoir été accepté à votre rando",
    user_id: etienne.id,
    trip_id: trip_corse.id
  )

  Message.create!(
    content: "Bravo à tous mes chers amis",
    user_id: chirac.id,
    trip_id: trip_wagon.id
  )
  Message.create!(
    content: "Ce soir on se mettrait pas la PIRE RACE?",
    user_id: isabelle.id,
    trip_id: trip_wagon.id
  )


  Message.create!(
    content: "Plaisir partagé :) - on attend de nouveaux compagnons et c'est parti",
    user_id: louis.id,
    trip_id: trip_corse.id
  )

  Message.create!(
    content: "Je constate avec bonheur que les habitués sont bien présents",
    user_id: francois.id,
    trip_id: trip_solutre.id
  )

  Message.create!(
    content: "Of course, toujours au rendez-vous Tonton! On va s'amuser #lol",
    user_id: jack.id,
    trip_id: trip_solutre.id
  )

  Message.create!(
    content: "Ca veut dire quoi #lol?",
    user_id: jacques.id,
    trip_id: trip_solutre.id
  )

  Message.create!(
    content: "Mangez des pommes!",
    user_id: chirac.id,
    trip_id: trip_solutre.id
  )

  Message.create!(
    content: "Une place pour moi?",
    user_id: francoisho.id,
    trip_id: trip_solutre.id
  )

  Message.create!(
    content: "Non.",
    user_id: francois.id,
    trip_id: trip_solutre.id
  )

  Message.create!(
    content: "Benoit, quel est l'esprit de la rando? ",
    user_id: karine.id,
    trip_id: trip_vercors.id
  )

  Message.create!(
    content: "On va mettre le feu, comme Johnny au Stade de France!",
    user_id: benoit.id,
    trip_id: trip_vercors.id
  )

  Message.create!(
    content: "Ok. Et sinon, quid de la faune locale?",
    user_id: vincent.id,
    trip_id: trip_vercors.id
  )

  Message.create!(
    content: "Pigeon, oiseau à la grise robe dans l’enfer des villes à mon regard tu te dérobes... Tu es vraiment le plus agile.",
    user_id: benoit.id,
    trip_id: trip_vercors.id
  )

  Message.create!(
    content: "...",
    user_id: karine.id,
    trip_id: trip_vercors.id
  )

  25.times do
    Message.create!(
      content: messages.sample,
      user_id: (((User.first.id)..(User.last.id)).to_a - [francois.id] - [roger.id] - [jack.id] - [jacques.id] - [benoit.id] - [karine.id] - [vincent.id] - [alexandre.id]).sample,
      trip_id: (((Trip.first.id)..(Trip.last.id)).to_a - [trip_solutre.id] - [trip_corse.id] - [trip_vercors.id] - [trip_wagon.id]).sample
    )
  end
end

def create_reviews

  puts "creation reviews"
  francois = User.find_by(email: "francois@whikend.com")
  francoisho = User.find_by(email: "francoisho@whikend.com")
  roger = User.find_by(email: "roger@whikend.com")
  jack = User.find_by(email: "jack@whikend.com")
  jacques = User.find_by(email: "jacques@whikend.com")
  benoit = User.find_by(email: "benoit@whikend.com")
  vincent = User.find_by(email: "vincent@whikend.com")
  karine = User.find_by(email: "karine@whikend.com")
  louis = User.find_by(email: "louis@holdies.com")
  etienne = User.find_by(email: "etienne.delorieux@gmail.com")
  joseph = User.find_by(email: "joseph@whikend.com")
  kevin = User.find_by(email: "kevin@whikend.com")
  alix = User.find_by(email: "alix@whikend.com")
  meryem = User.find_by(email: "meryem@whikend.com")
  maxime = User.find_by(email: "maxime@whikend.com")
  antoine = User.find_by(email: "antoine@whikend.com")
  kevin = User.find_by(email: "kevin@whikend.com")
  joseph = User.find_by(email: "joseph@whikend.com")
  alexandre = User.find_by(email: "alexandre.b2506@gmail.com")

  trip_solutre = Trip.find_by(title: "Ascension de La Roche de Solutré - sur les pas de Tonton")
  trip_vercors = Trip.find_by(title: "A la découverte du Vercors!")
  trip_corse = Trip.find_by(title: "Grand départ pour le GR10")

  reviews_generator = ["Vraiment une belle rando - je recommande", "Toujours le même plaisir", "Vraiment pas mal", "Au top", "Je recommande à fond", "N'hésitez pas", "Belles rigolades, belle marche - que du bonheur", "Merci Whikend pour cet extraordinaire rando", "Que demandez de plus?", "Le petit rouge au sommet fait plaisir", "Le roi du matos pour la reine des randos - parfait", "Une descente de Ricard que j'aimerais pas remonter en velo", "Hyper intense - le Kylian Jornet du dimanche"]

  Review.create!(
    content: "Mec super cool, super balade",
    rating: 5,
    sender_id: etienne.id.to_i,
    receiver_id: louis.id.to_i,
    trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_solutre.id]).sample
  )

  Review.create!(
      content: "Homme très érudit, pas avare d'anedoctes sur ses amis comme ses ennemis.",
      rating: 5,
      sender_id: jack.id.to_i,
      receiver_id: francois.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_solutre.id]).sample
    )

  Review.create!(
      content: "Bon vivant et très très marrant malgré un fort accent belge - cette rando en Corse était légendaire",
      rating: 5,
      sender_id: vincent.id.to_i,
      receiver_id: benoit.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Un original, amusant",
      rating: 4,
      sender_id: francois.id.to_i,
      receiver_id: benoit.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Je suis pas venue pour souffrir okay?",
      rating: 3,
      sender_id: meryem.id.to_i,
      receiver_id: benoit.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Top, un dandy marcheur",
      rating: 4,
      sender_id: etienne.id.to_i,
      receiver_id: jack.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Un grand connoisseur des montagnes - savoir infini",
      rating: 3,
      sender_id: karine.id.to_i,
      receiver_id: jacques.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Il sait toujours où il va - très rassurant",
      rating: 4,
      sender_id: maxime.id.to_i,
      receiver_id: francois.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Une bonne humeur permanente!",
      rating: 5,
      sender_id: vincent.id.to_i,
      receiver_id: karine.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Quel humour!",
      rating: 4,
      sender_id: alix.id.to_i,
      receiver_id: vincent.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Un peu donneur de leçon mais très bon marcheur",
      rating: 4,
      sender_id: antoine.id.to_i,
      receiver_id: jacques.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "C'était cool? Grave cool",
      rating: 5,
      sender_id: kevin.id.to_i,
      receiver_id: benoit.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "C'était cool? Grave cool",
      rating: 4,
      sender_id: kevin.id.to_i,
      receiver_id: jack.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Ca m'a rappelé mes années d'accrobranche! Super bol d'air",
      rating: 4,
      sender_id: joseph.id.to_i,
      receiver_id: benoit.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )

  Review.create!(
      content: "Un peu trop serieux - faut faire le fifou un peu",
      rating: 3,
      sender_id: joseph.id.to_i,
      receiver_id: francois.id.to_i,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_vercors.id]).sample
    )


  10.times do
    Review.create!(
      content: reviews_generator,
      rating: (3..5).to_a.sample,
      sender_id: (((User.first.id)..(User.last.id)).to_a.first(5) - [alexandre.id]).sample,
      receiver_id: ((User.first.id)..(User.last.id)).to_a.last(5).sample,
      trip_id: ((Trip.first.id..Trip.last.id).to_a - [trip_solutre.id] - [trip_vercors.id]).sample
    )
  end
end


puts "Clean db..."
tables.each do |table|
  puts "delete table #{table}..."
  table.constantize.destroy_all
end

puts "Create data"
tables.reverse.each do |table|
  puts "

  "
  puts "Creation of #{table}"
  send("create_#{table.constantize.table_name.to_sym}")
end
