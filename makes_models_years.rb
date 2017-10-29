require 'nokogiri'
require 'open-uri'

car_links = []

doc = Nokogiri::HTML(open("https://www.carfax.com/car-research"))

doc.css('.car-research-landing__left-item.hidden-xs a.mod-tile-links__button').each do |make_link|
  puts make_link["href"]
  make_doc = Nokogiri::HTML(open("https://www.carfax.com#{make_link["href"]}"))

  make_doc.css('.car-research__image-series a').each do |model_link|
    puts model_link["href"]
    model_doc = Nokogiri::HTML(open("https://www.carfax.com#{model_link["href"]}"))

    model_doc.css('.car-research-model__year-select-desktop a').each do |year_link|
      car_links << year_link["href"]
    end
  end
end

p car_links


