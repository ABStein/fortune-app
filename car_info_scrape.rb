require 'nokogiri'
require 'open-uri'

year_links = ["/acura/ilx/2017", "/acura/ilx/2016", "/acura/mdx/2017", "/acura/mdx/2016", "/acura/nsx/2017", "/acura/rdx/2017", "/acura/rdx/2016", "/acura/rlx/2016", "/acura/tlx/2018", "/acura/tlx/2017", "/acura/tlx/2016", "/acura/tlx/2015", "/alfa-romeo/4c/2016", "/alfa-romeo/4c/2015", "/alfa-romeo/giulia/2017", "/audi/a3/2016", "/audi/a3/2015", "/audi/a3-sportback-e-tron/2016", "/audi/a4/2017", "/audi/a4/2016", "/audi/a5/2018", "/audi/a5/2017", "/audi/a6/2017", "/audi/a6/2016", "/audi/a7/2016", "/audi/allroad/2015", "/audi/q3/2016", "/audi/q3/2015", "/audi/q5/2018", "/audi/q5/2017", "/audi/q5/2015", "/audi/q7/2017", "/audi/r8/2017", "/audi/r8/2015", "/audi/s3/2017", "/audi/tt/2016", "/bmw/3-series/2017", "/bmw/3-series/2016", "/bmw/5-series/2017", "/bmw/7-series/2017", "/bmw/7-series/2016", "/bmw/i8/2017", "/bmw/i8/2015", "/bmw/m3/2017", "/bmw/m3/2016", "/bmw/x3/2017", "/bmw/x4/2017", "/bmw/x4/2015", "/bmw/x5/2017", "/bmw/x5/2016", "/buick/cascada/2016", "/buick/enclave/2018", "/buick/enclave/2017", "/buick/enclave/2016", "/buick/enclave/2014", "/buick/enclave/2013", "/buick/encore/2017", "/buick/encore/2015", "/buick/lacrosse/2017", "/buick/lacrosse/2015", "/buick/regal/2017", "/buick/regal/2016", "/buick/regal/2015", "/cadillac/ats/2015", "/cadillac/ct6/2016", "/cadillac/cts/2017", "/cadillac/cts/2016", "/cadillac/cts/2015", "/cadillac/cts-v/2016", "/cadillac/escalade/2017", "/cadillac/escalade/2016", "/cadillac/escalade/2015", "/cadillac/xt5/2017", "/chevrolet/camaro/2017", "/chevrolet/camaro/2016", "/chevrolet/camaro/2015", "/chevrolet/colorado/2017", "/chevrolet/colorado/2015", "/chevrolet/corvette/2017", "/chevrolet/corvette/2016", "/chevrolet/cruze/2017", "/chevrolet/cruze/2016", "/chevrolet/equinox/2017", "/chevrolet/equinox/2016", "/chevrolet/malibu/2017", "/chevrolet/malibu/2016", "/chevrolet/silverado-1500/2017", "/chevrolet/silverado-1500/2015", "/chevrolet/ss/2015", "/chevrolet/tahoe/2015", "/chevrolet/tahoe/2014", "/chevrolet/traverse/2017", "/chevrolet/trax/2015", "/chevrolet/volt/2017", "/chevrolet/volt/2016", "/chrysler/300/2017", "/chrysler/300/2016", "/chrysler/300/2015", "/chrysler/pacifica/2017", "/chrysler/200/2016", "/chrysler/200/2015", "/dodge/challenger/2017", "/dodge/challenger/2016", "/dodge/challenger/2015", "/dodge/challenger/2014", "/dodge/charger/2017", "/dodge/charger/2016", "/dodge/charger/2015", "/dodge/charger/2013", "/dodge/durango/2017", "/dodge/durango/2016", "/dodge/durango/2015", "/dodge/journey/2017", "/fiat/124-spider/2017", "/fiat/500x/2016", "/ford/edge/2017", "/ford/edge/2016", "/ford/edge/2015", "/ford/escape/2017", "/ford/escape/2016", "/ford/escape/2014", "/ford/expedition/2017", "/ford/expedition/2016", "/ford/expedition/2015", "/ford/explorer/2017", "/ford/explorer/2016", "/ford/explorer/2015", "/ford/explorer/2014", "/ford/explorer/2013", "/ford/f-150/2018", "/ford/f-150/2017", "/ford/f-150/2016", "/ford/f-150/2015", "/ford/f-250/2017", "/ford/flex/2017", "/ford/focus/2017", "/ford/focus/2016", "/ford/focus/2015", "/ford/focus/2014", "/ford/focus/2013", "/ford/focus-rs/2017", "/ford/fusion/2017", "/ford/fusion/2016", "/ford/fusion/2015", "/ford/fusion/2014", "/ford/mustang/2017", "/ford/mustang/2016", "/ford/mustang/2015", "/ford/mustang/2014", "/ford/taurus/2017", "/ford/taurus/2016", "/genesis/g80/2017", "/genesis/g90/2017", "/gmc/acadia/2017", "/gmc/acadia/2014", "/gmc/canyon/2017", "/gmc/canyon/2016", "/gmc/canyon/2015", "/gmc/sierra-1500/2017", "/gmc/sierra-1500/2016", "/gmc/sierra-1500/2015", "/gmc/sierra-2500hd/2015", "/gmc/terrain/2018", "/gmc/terrain/2017", "/gmc/terrain/2016", "/gmc/yukon/2016", "/gmc/yukon/2015", "/gmc/yukon-xl/2016", "/gmc/yukon-xl/2015", "/honda/accord/2017", "/honda/accord/2016", "/honda/accord/2015", "/honda/accord/2014", "/honda/accord/2013", "/honda/civic/2017", "/honda/civic/2016", "/honda/civic/2015", "/honda/cr-v/2017", "/honda/cr-v/2016", "/honda/cr-v/2015", "/honda/fit/2018", "/honda/fit/2016", "/honda/fit/2015", "/honda/hr-v/2017", "/honda/hr-v/2016", "/honda/odyssey/2018", "/honda/odyssey/2017", "/honda/odyssey/2016", "/honda/pilot/2017", "/honda/pilot/2016", "/honda/pilot/2015", "/honda/pilot/2014", "/honda/ridgeline/2017", "/hyundai/azera/2015", "/hyundai/elantra/2017", "/hyundai/elantra/2016", "/hyundai/elantra/2015", "/hyundai/genesis-sedan/2016", "/hyundai/genesis-sedan/2015", "/hyundai/santa-fe/2017", "/hyundai/santa-fe/2015", "/hyundai/santa-fe-sport/2017", "/hyundai/sonata/2018", "/hyundai/sonata/2017", "/hyundai/sonata/2016", "/hyundai/sonata/2015", "/hyundai/sonata/2013", "/hyundai/sonata-hybrid/2016", "/hyundai/tucson/2017", "/hyundai/tucson/2016", "/hyundai/veloster/2017", "/hyundai/veloster/2016", "/infiniti/q50/2018", "/infiniti/q50/2017", "/infiniti/q50/2015", "/infiniti/q60/2017", "/infiniti/qx50/2016", "/infiniti/qx60/2017", "/infiniti/qx60/2015", "/infiniti/qx80/2016", "/infiniti/qx80/2015", "/jaguar/f-type/2017", "/jaguar/f-type/2016", "/jaguar/f-type/2015", "/jaguar/f-pace/2017", "/jaguar/xe/2017", "/jaguar/xf/2017", "/jaguar/xf/2016", "/jaguar/xj/2016", "/jaguar/xj/2015", "/jeep/cherokee/2017", "/jeep/cherokee/2016", "/jeep/cherokee/2015", "/jeep/compass/2017", "/jeep/compass/2016", "/jeep/grand-cherokee/2017", "/jeep/grand-cherokee/2016", "/jeep/grand-cherokee/2015", "/jeep/grand-cherokee/2014", "/jeep/patriot/2017", "/jeep/patriot/2016", "/jeep/renegade/2017", "/jeep/renegade/2016", "/jeep/renegade/2015", "/jeep/wrangler/2017", "/jeep/wrangler/2016", "/jeep/wrangler/2015", "/jeep/wrangler/2014", "/kia/cadenza/2017", "/kia/forte/2017", "/kia/k900/2016", "/kia/k900/2015", "/kia/niro/2017", "/kia/optima/2017", "/kia/optima/2016", "/kia/optima/2015", "/kia/optima/2014", "/kia/optima-hybrid/2017", "/kia/sedona/2017", "/kia/sedona/2016", "/kia/sedona/2015", "/kia/sorento/2017", "/kia/sorento/2016", "/kia/sorento/2015", "/kia/soul/2017", "/kia/soul/2016", "/kia/soul-ev/2016", "/kia/soul-ev/2015", "/kia/sportage/2017", "/kia/sportage/2016", "/land-rover/discovery/2017", "/land-rover/discovery-sport/2017", "/land-rover/discovery-sport/2015", "/land-rover/range-rover/2017", "/land-rover/range-rover/2016", "/land-rover/range-rover/2015", "/land-rover/range-rover-evoque/2016", "/land-rover/range-rover-evoque/2015", "/land-rover/range-rover-sport/2016", "/land-rover/range-rover-sport/2015", "/land-rover/lr4/2016", "/lexus/es/2017", "/lexus/es/2015", "/lexus/es-hybrid/2016", "/lexus/es-hybrid/2014", "/lexus/gs/2017", "/lexus/gs/2016", "/lexus/gs-f/2016", "/lexus/gx/2017", "/lexus/gx/2016", "/lexus/gx/2015", "/lexus/is/2017", "/lexus/is/2016", "/lexus/is/2015", "/lexus/is/2014", "/lexus/ls/2015", "/lexus/lx/2017", "/lexus/lx/2016", "/lexus/lx/2015", "/lexus/nx/2016", "/lexus/nx/2015", "/lexus/nx-hybrid/2016", "/lexus/rc/2016", "/lexus/rc/2015", "/lexus/rc-f/2017", "/lexus/rx/2017", "/lexus/rx/2016", "/lexus/rx-hybrid/2016", "/lexus/rx-hybrid/2015", "/lincoln/continental/2017", "/lincoln/mkc/2016", "/lincoln/mkc/2015", "/lincoln/mkx/2016", "/lincoln/mkz/2017", "/lincoln/mkz/2015", "/lincoln/navigator/2017", "/lincoln/navigator/2015", "/mazda/cx-3/2017", "/mazda/cx-3/2016", "/mazda/cx-5/2017", "/mazda/cx-5/2016", "/mazda/cx-5/2015", "/mazda/cx-9/2017", "/mazda/cx-9/2016", "/mazda/mazda3/2017", "/mazda/mazda3/2016", "/mazda/mazda3/2015", "/mazda/mazda6/2017", "/mazda/mazda6/2016", "/mazda/mx-5-miata/2017", "/mazda/mx-5-miata/2016", "/mazda/mx-5-miata/2015", "/mercedes-benz/amg-gt/2016", "/mercedes-benz/c-class/2017", "/mercedes-benz/gla-class/2015", "/mercedes-benz/gle-coupe/2016", "/mercedes-benz/sl/2017", "/mercedes-benz/slc/2017", "/mini/clubman/2016", "/mini/cooper/2016", "/mitsubishi/i-miev/2016", "/mitsubishi/lancer/2017", "/mitsubishi/lancer/2015", "/mitsubishi/mirage-g4/2017", "/mitsubishi/outlander/2016", "/mitsubishi/outlander/2015", "/mitsubishi/outlander-sport/2016", "/mitsubishi/lancer-evolution/2015", "/nissan/altima/2017", "/nissan/altima/2016", "/nissan/altima/2015", "/nissan/altima/2014", "/nissan/altima/2013", "/nissan/armada/2017", "/nissan/frontier/2017", "/nissan/frontier/2016", "/nissan/frontier/2015", "/nissan/gt-r/2017", "/nissan/gt-r/2016", "/nissan/gt-r/2015", "/nissan/juke/2015", "/nissan/juke/2013", "/nissan/leaf/2016", "/nissan/maxima/2017", "/nissan/maxima/2016", "/nissan/murano/2017", "/nissan/murano/2016", "/nissan/murano/2015", "/nissan/pathfinder/2017", "/nissan/rogue/2017", "/nissan/rogue/2016", "/nissan/rogue/2015", "/nissan/rogue/2014", "/nissan/sentra/2017", "/nissan/sentra/2016", "/nissan/sentra/2015", "/nissan/titan/2017", "/nissan/titan-xd/2016", "/nissan/versa/2015", "/nissan/versa/2014", "/nissan/versa/2013", "/nissan/z/2017", "/nissan/z/2016", "/porsche/911/2017", "/porsche/911/2016", "/porsche/cayenne/2017", "/porsche/cayenne/2016", "/porsche/macan/2017", "/porsche/panamera/2017", "/porsche/panamera/2016", "/ram/1500/2017", "/ram/1500/2016", "/ram/1500/2015", "/scion/fr-s/2016", "/scion/ia/2016", "/scion/im/2016", "/subaru/brz/2017", "/subaru/brz/2016", "/subaru/crosstrek/2018", "/subaru/crosstrek/2017", "/subaru/crosstrek/2016", "/subaru/forester/2018", "/subaru/forester/2017", "/subaru/forester/2016", "/subaru/forester/2014", "/subaru/impreza/2017", "/subaru/impreza/2016", "/subaru/legacy/2017", "/subaru/legacy/2015", "/subaru/outback/2018", "/subaru/outback/2017", "/subaru/outback/2016", "/subaru/outback/2015", "/subaru/wrx/2017", "/subaru/wrx/2016", "/subaru/wrx/2015", "/subaru/xv-crosstrek/2015", "/tesla/model-s/2017", "/toyota/4runner/2017", "/toyota/4runner/2016", "/toyota/4runner/2015", "/toyota/4runner/2014", "/toyota/86/2017", "/toyota/avalon/2017", "/toyota/avalon/2016", "/toyota/avalon/2015", "/toyota/camry/2018", "/toyota/camry/2017", "/toyota/camry/2016", "/toyota/camry/2015", "/toyota/camry/2014", "/toyota/camry-hybrid/2018", "/toyota/camry-hybrid/2016", "/toyota/camry-hybrid/2015", "/toyota/corolla/2017", "/toyota/corolla/2016", "/toyota/corolla/2015", "/toyota/corolla/2014", "/toyota/corolla-im/2017", "/toyota/highlander/2017", "/toyota/highlander/2016", "/toyota/highlander/2015", "/toyota/highlander/2014", "/toyota/land-cruiser/2017", "/toyota/land-cruiser/2016", "/toyota/prius/2017", "/toyota/prius/2016", "/toyota/prius-c/2015", "/toyota/prius-v/2015", "/toyota/rav4/2017", "/toyota/rav4/2016", "/toyota/rav4/2015", "/toyota/rav4-hybrid/2016", "/toyota/sequoia/2017", "/toyota/sienna/2017", "/toyota/sienna/2016", "/toyota/sienna/2015", "/toyota/tacoma/2017", "/toyota/tacoma/2016", "/toyota/tacoma/2015", "/toyota/tundra/2017", "/toyota/tundra/2016", "/toyota/tundra/2015", "/toyota/yaris/2017", "/toyota/yaris/2016", "/toyota/yaris/2015", "/volkswagen/atlas/2018", "/volkswagen/beetle/2016", "/volkswagen/cc/2015", "/volkswagen/golf/2016", "/volkswagen/golf-r/2016", "/volkswagen/golf-r/2015", "/volkswagen/gti/2016", "/volkswagen/gti/2015", "/volkswagen/jetta/2017", "/volkswagen/jetta/2016", "/volkswagen/passat/2017", "/volkswagen/passat/2016", "/volkswagen/passat/2015", "/volkswagen/tiguan/2018", "/volkswagen/tiguan/2017", "/volvo/s60/2016", "/volvo/s60/2015", "/volvo/s90/2017", "/volvo/v60/2015", "/volvo/xc60/2018", "/volvo/xc60/2017", "/volvo/xc60/2016", "/volvo/xc90/2017", "/volvo/xc90/2016"]

year_links.first(3).each do |year_link|

      doc = Nokogiri::HTML(open("https://www.carfax.com#{year_link}/specs"))

      title = doc.css('h1').first.content
      price_range = doc.css('.stats p').first.content.split(':').last
      mpg = doc.css('.stats p').last.content.split(':').last
      split_mpg = mpg.split(" city / ")
      city_mpg = split_mpg.first
      hwy_mpg = split_mpg.last.gsub(" hwy", "")
      style = doc.css('table.vehicle td')[2].content
      engine = doc.css('table.base td')[2].content
      cylinders = doc.css('table.base td')[5].content
      horsepower = doc.css('table.base td')[8].content
      engine_description = "#{engine} #{cylinders} with #{horsepower}"
      drive_type = doc.css('table.drive td')[2].content
      transmission = doc.css('table.drive td')[4].content
      transmission_speed = doc.css('table.drive td')[5].content
      transmission_type = "#{transmission_speed} #{transmission_type}"

      link_split = year_link.split("/")
      make = link_split[0].gsub("-", " ").titleize
      model = link_split[1].gsub("-", " ").titleize
      year = link_split[2]


      stats = {
                make: make,
                model: model,
                year: year,
                style: style,
                title: title.gsub(" Specs", ""),
                city_mpg: city_mpg,
                hwy_mpg: hwy_mpg,
                engine: engine_description,
                drive_type: drive_type,
                transmission_type: transmission_type
              }
      p stats
      car = Car.create(stats)

      price_range.gsub!(" ", "")
      price_range.gsub!("$", "")
      price_range.gsub!(",", "")
      price_split = price_range.split("-")
      prices = []
      pr_low = price_split[0].to_i
      pr_high = price_split[1].to_i
      prices << pr_low
      prices << pr_high

      rand(1..4).times do
        prices << rand(pr_low..pr_high)
      end

      prices.each do |price|
        Bid.create(car_id: car.id, vendor: "CarFax.com", price: price)
      end
end









