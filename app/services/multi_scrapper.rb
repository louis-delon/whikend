puts "Scrapping hike page..."

require 'open-uri'

class MultiScrapper

  def self.departments_list
    site_url = "https://www.visorando.com/"
    randos_list = Nokogiri::HTML(open(site_url))

    @departments_url = []
    @departments_names = []
    puts "je rentre dans une boucle"
    randos_list.search('.content-module li a').each do |item|
      @departments_names << item.text.strip
      @departments_url << item.attribute('href').text.strip
      p @departments_url
      p @departments_names
    end

    hikes_list
  end


  def self.hikes_list
    @departments_url.each_with_index do |url, index|
      sleep(1)
      department_page = Nokogiri::HTML(open(url).read)
      department_page.search('.rando').take(4).each do |rando|
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
    puts "je bug ou pas???"
    page     = Nokogiri::HTML(open(hike_url).read)
    puts "je bug ou pas???"

    data_1   = page.search(".col50").first.text.strip.split("\n").map{|value| value.split(": ")[1]}.reject(&:nil?).map(&:strip)
    data_2   = page.search(".col50").last.text.strip.split("\n").map{|value| value.split(": ")[1]}.reject(&:nil?).map(&:strip)
    @check_region = page.search(".col50").last.text.strip.include?("Région")

    info_gatherer(hike, data_1, data_2)

    hike.site_id = page.search(".module2 .content-module a").last.attribute('href').value.split("\=").last

    if page.search("div[@itemprop='description']").first.nil?
      hike.description = "Cette randonnée n'a pas de description."
    else
      hike.description = page.search("div[@itemprop='description']").first.search("p").text.strip
      end

    unless page.search(".liste-topics-blanc-inner div[@style='padding: 5px 5px 0 5px;'] .clearfix").blank?
      photo_page = page.search(".liste-topics-blanc-inner div[@style='padding: 5px 5px 0 5px;'] .clearfix a").first.attribute("href").value
      photo_page_url = Nokogiri::HTML(open(photo_page).read)
      hike.photo_url = photo_page_url.search(".innerContentVR div[@onclick] a").attribute("href").value
      if hike.photo_url.nil?
        hike.update(photo_url: "https://images.unsplash.com/photo-1444405406630-ac78b6e0b1fb?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=582c342742b3be84cff0face43d3c13d&auto=format&fit=crop&w=2088&q=80")
      end
      hike.save
    end

    puts ""
    puts "---------------"
    puts ""

    checkpoints_gatherer(hike)
  end


  def self.info_gatherer(hike, data_1, data_2)
    hike.duration        = data_1[0].split("[")[0]
    hike.distance        = data_1[1]
    hike.asc_elevation   = data_1[2]
    hike.desc_elevation  = data_1[3]
    hike.alt_min         = data_1[5]
    hike.alt_max         = data_1[4]
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
