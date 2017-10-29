class ReportCardsController < ApplicationController
  def index
    @report_cards = Unirest.get('https://data.cityofchicago.org/resource/5tiy-yfrg.json').body
  end
end
