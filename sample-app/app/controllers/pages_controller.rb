class PagesController < ApplicationController
  def hello_action
    @title = "Hi mom"
    render "hello_page.html.erb"
  end

  def viking_action
    @title = "By oden's beard"
    render 'viking_page.html.erb'
  end
    
  def panda_action
    render 'panda_page.html.erb'
  end

  def ninja_action
    render "ninja_page.html.erb"
  end

  def toy_action
    render "toy_page.html.erb"
  end
    
  def time_action
    @title = "I'm late"
    @current_time = Time.now.strftime('%l:%M %p').downcase
    render 'time_page.html.erb'
  end
end
