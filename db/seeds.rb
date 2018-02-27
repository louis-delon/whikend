# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Submission.destroy_all
Message.destroy_all
Review.destroy_all
Trip.destroy_all
Hike.destroy_all
User.destroy_all

puts "Creating users..."

louis = User.create!(
  email: 'louis@gmail.com',
  password: 'aaaaaa',
  first_name: 'louis',
  last_name: 'delon',
  description: 'je suis un passionné de montagne',
  )

etienne = User.create!(
  email: 'etienne@gmail.com',
  password: 'aaaaaa',
  first_name: 'etienne',
  last_name: 'delorieux',
  description: 'je suis un passionné de rando',
  )


10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
  )
end

puts "Creating hikes..."

10.times do
  Hike.create!(
    duration: [1..10].sample,
    location: Faker::Address.city
  )
end

puts "Creating trips..."
10.times do
  Trip.create!(
    # title: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    location: Faker::Address.city,
    hike_id: ((Hike.first.id)..(Hike.last.id)).to_a.sample,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    date: Date.today
  )
end

puts "Creating reviews..."

10.times do
  Review.create!(
    content: Faker::Hipster.paragraph,
    rating: (1..5).to_a.sample,
    sender_id: ((User.first.id)..(User.last.id)).to_a.sample,
    receiver_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample
  )
end

puts "Creating messages..."

100.times do
  Message.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample
  )
end

puts "Creating submissions..."

66.times do
  Submission.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample,
    accepted: true
  )
end

34.times do
  Submission.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample,
    accepted: false
  )
end



