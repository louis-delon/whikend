puts "Scrapping hike page..."

# HIKES
require 'open-uri'

class UniScrapper

  def initialize(hike, url)
    @page = Nokogiri::HTML(open(url).read)
    # @hike = Hike.create!(title: "temp", department: "temp", link: url)
    @hike = hike
    @url = url
    hike_info
  end

  def hike_info
    @hike.title = @page.search("h1[@itemprop='name']").text.strip
    @hike.department = @page.search('ol li:nth-child(3)').text.strip
    @hike.link = @url

    data_1 = @page.search(".col50").first.text.strip.split("\n").map{|value| value.split(": ")[1]}.reject(&:nil?).map(&:strip)
    data_2 = @page.search(".col50").last.text.strip.split("\n").map{|value| value.split(": ")[1]}.reject(&:nil?).map(&:strip)
    @check_region = @page.search(".col50").last.text.strip.include?("Région")

    info_gatherer(@hike, data_1, data_2)

    @hike.site_id = @page.search(".module2 .content-module a").last.attribute('href').value.split("\=").last

    if @page.search("div[@itemprop='description']").first.nil?
      @hike.description = "Cette randonnée n'a pas de description."
    else
      @hike.description = @page.search("div[@itemprop='description']").first.search("p").text.strip.gsub("\n", " ")
    end

    unless @page.search(".liste-topics-blanc-inner div[@style='padding: 5px 5px 0 5px;'] .clearfix").blank?
      photo_page = @page.search(".liste-topics-blanc-inner div[@style='padding: 5px 5px 0 5px;'] .clearfix a").first.attribute("href").value
      photo_page_url = Nokogiri::HTML(open(photo_page).read)
      @hike.photo_url = photo_page_url.search(".innerContentVR div[@onclick] a").attribute("href").value
    end

    puts ""
    puts "---------------"
    puts ""

    checkpoints_gatherer(@hike)
     @hike.save
     @hike
  end


  def info_gatherer(hike, data_1, data_2)
    @hike.duration        = data_1[0].split("[")[0]
    @hike.distance        = data_1[1]
    @hike.asc_elevation   = data_1[2]
    @hike.desc_elevation  = data_1[3]
    @hike.alt_min         = data_1[5]
    @hike.alt_max         = data_1[4]
    @hike.difficulty      = data_2[0]
    @hike.hike_type       = data_2[1]
    @check_region ? @hike.location = data_2[3] : @hike.location  = data_2[2]
  end

  def checkpoints_gatherer(hike)
    coordinates_result = Nokogiri::HTML(open("https://www.visorando.com/index.php?component=ajax&task=getChartDataFileOptimise&idRandonnee=#{@hike.site_id}").read)
    coordinates_hash = JSON.parse(coordinates_result)
    coordinates = []

    coordinates_hash["result"].each_with_index do |checkpoint, index|
      coordinates << {lat: checkpoint["l"], lng: checkpoint["g"]}
    end

    @hike.coordinates = coordinates
  end
end
