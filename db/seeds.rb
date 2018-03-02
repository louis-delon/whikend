puts "Cleaning database..."
Submission.destroy_all
Message.destroy_all
Review.destroy_all
Trip.destroy_all
User.destroy_all
Hike.destroy_all

# USERS
puts "Creating users..."

louis = User.create!(
  email: 'louis@gmail.com',
  password: 'aaaaaa',
  first_name: 'louis',
  last_name: 'delon',
  description: 'je suis un passionné de montagne',
  age: 40,
  avatar_url: 'http://kitt.lewagon.com/placeholder/users/loulouman34'
)

etienne = User.create!(
  email: 'etienne@gmail.com',
  password: 'aaaaaa',
  first_name: 'etienne',
  last_name: 'delorieux',
  description: 'je suis un passionné de rando',
  age: 27,
  avatar_url: 'http://kitt.lewagon.com/placeholder/users/EtienneDelorieux'
)

30.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.paragraph,
    age: (25..40).to_a.sample,
    avatar_url: 'http://kitt.lewagon.com/placeholder/users/random'
  )
end



# HIKES
require 'open-uri'

class HikeScrap


  def self.departments_list
    site_url = "https://www.visorando.com/"
    randos_list = Nokogiri::HTML(open(site_url))

    @departments_url = []
    @departments_names = []

    randos_list.search('.content-module li a').each do |item|
      @departments_names << item.text.strip
      @departments_url << item.attribute('href').text.strip
    end

    hikes_list
  end


  def self.hikes_list
    @departments_url.each_with_index do |url, index|
      sleep(1)
      department_page = Nokogiri::HTML(open(url).read)
      department_page.search('.rando').take(1).each do |rando|
        if rando.search('.rando-title-sansDetail a').text.strip != ""
          title = rando.search('.rando-title-sansDetail a').text.strip.chomp("PDF")
          department = @departments_names[index]
          link = rando.search('a').attribute('href').value
          hike = Hike.create!(title: title, department: department, link: link)
          puts "Creating a new rando..."
          puts hike.title
          puts hike.department
          puts ""
          hike_info(hike)
        end
      end
    end
  end


  def self.hike_info(hike)
    hike_url = hike.link
    page = Nokogiri::HTML(open(hike_url).read)

    data_1 = page.search(".col50").first.text.strip.split("\n").map{|value| value.split(": ")[1]}.reject(&:nil?).map(&:strip)
    data_2 = page.search(".col50").last.text.strip.split("\n").map{|value| value.split(": ")[1]}.reject(&:nil?).map(&:strip)
    @check_region = page.search(".col50").last.text.strip.include?("Région")

    info_gatherer(hike, data_1, data_2)

    hike.site_id = page.search(".module2 .content-module a").last.attribute('href').value.split("\=").last

    if page.search("div[@itemprop='description']").first.nil?
      hike.description = "Cette randonnée n'a pas de description."
    else
      hike.description = page.search("div[@itemprop='description']").first.search("p").text.strip.gsub("\n", " ")
    end

    unless page.search(".liste-topics-blanc-inner div[@style='padding: 5px 5px 0 5px;'] .clearfix").blank?
      photo_page = page.search(".liste-topics-blanc-inner div[@style='padding: 5px 5px 0 5px;'] .clearfix a").first.attribute("href").value
      photo_page_url = Nokogiri::HTML(open(photo_page).read)
      hike.photo_url = photo_page_url.search(".innerContentVR div[@onclick] a").attribute("href").value
      hike.save
    end

    puts ""
    puts "---------------"
    puts ""

    checkpoints_gatherer(hike)
    p hike
  end


  def self.info_gatherer(hike, data_1, data_2)
    hike.duration        = data_1[0].split("[")[0]
    hike.distance        = data_1[1]
    hike.asc_elevation   = data_1[2]
    hike.desc_elevation  = data_1[3]
    hike.alt_min         = data_1[4]
    hike.alt_max         = data_1[5]
    hike.difficulty      = data_2[0]
    hike.hike_type       = data_2[1]
    @check_region ? hike.location = data_2[3] : hike.location  = data_2[2]
    hike.save
  end

  def self.checkpoints_gatherer(hike)
    coordinates_result = Nokogiri::HTML(open("https://www.visorando.com/index.php?component=ajax&task=getChartDataFileOptimise&idRandonnee=#{hike.site_id}").read)

    coordinates_hash = JSON.parse(coordinates_result)

    coordinates = []

    coordinates_hash["result"].each_with_index do |checkpoint, index|
      coordinates << {lat: checkpoint["l"], lng: checkpoint["g"]}
    end
    hike.coordinates = coordinates
    hike.save
  end


end


# COMMENT THIS LINE AFTER FIRST SEED
HikeScrap.departments_list



# TRIPS
puts "Creating trips..."
TRIP_TYPES = ["Sportive", "Détente", "Photo", "Amicale"]

#creation of a trip by Louis
trip = Trip.create!(
  title: "Rando dans le vercors",
  description: "j'organise une rando dans le vercors",
  start_location: "Lyon",
  hike_id: ((Hike.first.id)..(Hike.last.id)).to_a.sample,
  user_id: louis.id,
  date: [Date.today,Date.today+(1),Date.today+(3),Date.today+(7)].sample,
  trip_type: TRIP_TYPES.sample,
  seats: (2..6).to_a.sample,
  auto_accept: true
)

20.times do
  Trip.create!(
    title: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    start_location: Faker::Address.city,
    hike_id: ((Hike.first.id)..(Hike.last.id)).to_a.sample,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    date: Date.today,
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

36.times do
  Submission.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample,
    accepted: true
  )
end

14.times do
  Submission.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample,
    accepted: false
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

50.times do
  Message.create!(
    content: Faker::Hipster.paragraph,
    user_id: ((User.first.id)..(User.last.id)).to_a.sample,
    trip_id: ((Trip.first.id)..(Trip.last.id)).to_a.sample
  )
end

