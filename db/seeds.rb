puts "Cleaning database..."
Submission.destroy_all
Message.destroy_all
Review.destroy_all
Trip.destroy_all
User.destroy_all
Hike.destroy_all

# RANDO SOLUTRE

# Solutre - User generation

puts "Creating Solutre..."

francois = User.create!(
  email: 'francois@whikend.com',
  password: 'aaaaaa',
  first_name: 'francois',
  last_name: 'mitterand',
  description: 'Rejoignez moi pour une petit rando Monsieur le Premier Ministre',
  age: 103,
  remote_avatar_url: 'https://cache.20minutes.fr/photos/2014/12/31/president-francois-mitterrand-lors-9633-diaporama.jpg'
  )

roger = User.create!(
  email: 'roger@whikend.com',
  password: 'aaaaaa',
  first_name: 'roger',
  last_name: 'hanin',
  description: 'Je suis le beauf de Tonton',
  age: 87,
  remote_avatar_url: 'http://md1.libe.com/photo/715188-france-bio-hanin.jpg?modified_at=1423671399&width=960'
  )

jack = User.create!(
  email: 'jack@whikend.com',
  password: 'aaaaaa',
  first_name: 'jack',
  last_name: 'lang',
  description: 'Vive la musique en rando!',
  age: 87,
  remote_avatar_url: 'https://www.ina.fr/images_v2/620x349/CPC88007257.jpeg'
  )

jacques = User.create!(
  email: 'jacques@whikend.com',
  password: 'aaaaaa',
  first_name: 'jacques',
  last_name: 'attali',
  description: 'J\'ai seule boussole qui indique toujours le sud',
  age: 87,
  remote_avatar_url: 'http://s2.lemde.fr/image/2016/08/26/644x0/4988464_6_e89b_jacques-attali-alors-conseiller-special-de_42e000872eb903b70c800c81e1ede3ae.jpg'
  )

hike_solutre = Hike.create!
UniScrapper.new(hike_solutre, "https://www.visorando.com/randonnee-sur-les-pas-de-tonton/")

# Solutre - Trip creation
trip_solutre = Trip.create!(
  title: "Ascension de La Roche de Solutré - sur les pas de Tonton",
  description: "Pélerinage annuel pour rendre hommage aux résitants de Solutré",
  start_location: "Paris",
  hike_id: hike_solutre.id,
  user_id: francois.id,
  date: Date.today+(1),
  trip_type: "Détente",
  seats: 5,
  auto_accept: true
)

# Solutre - Submission creation
Submission.create!(
    content: "Youhou",
    user_id: roger.id.to_i,
    trip_id: trip_solutre.id.to_i,
    accepted: true
  )

Submission.create!(
    content: "Hate d'y etre",
    user_id: jacques.id.to_i,
    trip_id: trip_solutre.id.to_i,
    accepted: true
  )

Submission.create!(
    content: "C'est la fete",
    user_id: jack.id.to_i,
    trip_id: trip_solutre.id.to_i,
    accepted: true
  )

############################################

# RANDO CORSE

puts "Creating Corse GR20..."

# Corse - User generation
benoit = User.create!(
  email: 'benoit@whikend.com',
  password: 'aaaaaa',
  first_name: 'benoit',
  last_name: 'poelvoorde',
  description: 'Pigeon, oiseau à la grise robe, dans l\'enfer des villes, à mon regard tu te dérobes, tu es vraiment le plus﻿ agile.',
  age: 53,
  remote_avatar_url: 'https://www.quizz.biz/uploads/quizz/896950/15_ky785.jpg'
  )

vincent = User.create!(
  email: 'vincent@whikend.com',
  password: 'aaaaaa',
  first_name: 'vincent',
  last_name: 'elbaz',
  description: "C\'est la fete quand meme",
  age: 47,
  remote_avatar_url: 'https://www.notrecinema.com/images/usercontent/star/vincent-elbaz-photo_35923_14761.jpg'
  )

karine = User.create!(
  email: 'karine@whikend.com',
  password: 'aaaaaa',
  first_name: 'karine',
  last_name: 'viard',
  description: 'Vive la musique en rando!',
  age: 52,
  remote_avatar_url: 'https://sacrenathalie.files.wordpress.com/2015/08/randonneurs-1997-15-g.jpg'
  )

hike_corse = Hike.create!
UniScrapper.new(hike_corse, "https://www.visorando.com/randonnee-gr20-de-bibi/")

# CORSE - Trip creation
trip_corse = Trip.create!(
  title: "Sentier de Grande randonnée 20",
  description: "Grosse rando sympa avec Benoit le Belge",
  start_location: "Bastia",
  hike_id: hike_corse.id,
  user_id: benoit.id,
  date: Date.today+(2),
  trip_type: "Sportive",
  seats: 4,
  auto_accept: false
)

# CORSE - Submission creation
Submission.create!(
    content: "Mega chaud",
    user_id: vincent.id.to_i,
    trip_id: trip_corse.id.to_i,
    accepted: true
  )

Submission.create!(
    content: "On va bien se marrer",
    user_id: karine.id.to_i,
    trip_id: trip_corse.id.to_i,
    accepted: true
  )

# USERS
puts "Creating users..."

louis = User.create!(
  email: 'louis@gmail.com',
  password: 'aaaaaa',
  first_name: 'louis',
  last_name: 'delon',
  description: 'je suis un passionné de montagne',
  age: 40,
  remote_avatar_url: 'http://kitt.lewagon.com/placeholder/users/loulouman34'
  )

etienne = User.create!(
  email: 'etienne@gmail.com',
  password: 'aaaaaa',
  first_name: 'etienne',
  last_name: 'delorieux',
  description: 'je suis un passionné de rando',
  age: 27,
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/EtienneDelorieux'
)

alex = User.create!(
  email: 'alex@gmail.com',
  password: 'aaaaaa',
  first_name: 'alexandre',
  last_name: 'bertrand',
  description: 'je suis un vrai pro de la rando',
  age: 32,
  remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/alexandrebk'
)

1.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    age: (25..40).to_a.sample,
    remote_avatar_url: 'https://kitt.lewagon.com/placeholder/users/random'
  )
end


# HIKES
# COMMENT THIS LINE FOR SHORT SEED
MultiScrapper.departments_list



# TRIPS
puts "Creating trips..."
TRIP_TYPES = ["Sportive", "Détente", "Photo", "Amicale"]

#creation of a trip by Louis
hike_louis = (Hike.first.id..Hike.last.id).to_a.sample
trip = Trip.create!(
  description: "j'organise une rando dans le vercors",
  start_location: "Lyon",
  hike_id: hike_louis,
  title: Hike.find(hike_louis).title,
  user_id: louis.id,
  date: Date.today+(1),
  trip_type: TRIP_TYPES.sample,
  seats: (2..6).to_a.sample,
  auto_accept: true
)

#creation of a trip by Etienne
trip1 = Trip.create!(
  title: "Rando sur le plateau des Glières",
  description: "J'organise une rando au départ de Lyon Confluence ce samedi. J'ai 3 places dans ma Tesla. Inscrivez-vous vite, y'aura bientôt plus de places.",
  start_location: "Lyon",
  hike_id: ((Hike.first.id)..(Hike.last.id)).to_a.sample,
  user_id: etienne.id,
  date: Date.today+(1),
  trip_type: TRIP_TYPES.sample,
  seats: 3,
  auto_accept: true
)

trip1 = Trip.create!(
  title: "Rando dans les Pyrénées et le Pays Basque",
  description: "J'organise une rando au départ de Bayonne mardi prochain. Je ramène du jambon de Bayonne pour le pic-nic :). J'ai un combi Volkswagen",
  start_location: "Bayonne",
  hike_id: ((Hike.first.id)..(Hike.last.id)).to_a.sample,
  user_id: ((User.first.id)..(User.last.id)).to_a.sample,
  date: Date.today+(3),
  trip_type: TRIP_TYPES.sample,
  seats: 6,
  auto_accept: true
)

20.times do
  hike = (Hike.first.id..Hike.last.id).to_a.sample
  Trip.create!(
    description: Faker::Hipster.paragraph,
    start_location: Faker::Address.city,
    hike_id: hike,
    title: Hike.find(hike).title,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    date: [Date.today-(7),Date.today+(1),Date.today+(3),Date.today+(7)].sample,
    trip_type: TRIP_TYPES.sample,
    seats: (2..5).to_a.sample,
    auto_accept: [true, false].sample
  )
end



# SUBMISSIONS
puts "Creating submissions..."

#etienne make a submission request to louis which is accepted
Submission.create!(
    content: "je suis tres interessé par votre randonnée",
    user_id: etienne.id.to_i,
    trip_id: trip.id.to_i,
    accepted: true
  )

Submission.create!(
    content: "reste t-il des places?",
    user_id: alex.id.to_i,
    trip_id: trip.id.to_i,
    accepted: true
  )

36.times do
  Submission.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.last(10).sample,
    accepted: true
  )
end

14.times do
  Submission.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.first(10).sample,
    accepted: nil
  )
end



# REVIEWS
puts "Creating reviews..."

#Etienne add a review to louis
Review.create!(
    content: "mec super cool, super balade",
    rating: 5,
    sender_id: etienne.id.to_i,
    receiver_id: louis.id.to_i,
    trip_id: trip.id.to_i
  )

Review.create!(
    content: "j'ai adoré, merci!",
    rating: 4,
    sender_id: alex.id.to_i,
    receiver_id: louis.id.to_i,
    trip_id: trip.id.to_i
  )

10.times do
  Review.create!(
    content: Faker::Hipster.paragraph,
    rating: (1..5).to_a.sample,
    sender_id: ((User.first.id)..(User.last.id)).to_a.first(5).sample,
    receiver_id: ((User.first.id)..(User.last.id)).to_a.last(5).sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample
  )
end



# MESSAGES
puts "Creating messages..."

Message.create!(
    content: "bonjour je suis super content d'avoir été accepté à votre rando",
    user_id: etienne.id,
    trip_id: trip.id
  )

Message.create!(
    content: "bonjour à quelle heure se fait le depart",
    user_id: alex.id,
    trip_id: trip.id
  )

50.times do
  Message.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample
  )
end


