class ComputersController < ApplicationController



  def computer_action
    @computer = one_computer_page.html.erb
end
