class PagesController < ApplicationController

  def fortune_action
    render "fortune_page.html.erb"
  end

  def fortune
    @title = "The Fortune Teller"
    fortunes = [
                "You're day will be productive.",
                "You will find your true love.",
                "Don't go out today, you will regret it."
               ]
    @new_fortune = fortunes.shuffle.first#[rand(0...fortunes.count - 1)] for an interview or .sample to be simple
    render "fortune_page.html.erb"
  end

  def lotto_action
    winning_numbers = [1, 2, 3, 4, 5]
    @winning_numbers = []
    6.times do 
      @winning_numbers << rand(1..60)
    end
    winning_numbers << rand(1..60)
    
    render "lotto_page.html.erb"
  end

  def count_action
    @count += 1 
    render "count_page.html.erb"
  end 
end
