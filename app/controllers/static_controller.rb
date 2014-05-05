class StaticController < ApplicationController
  before_action :load_tweet
  caches_page :portfolio, :team, :testimonials, :open_source

  def portfolio
    @projects = PROJECTS.select { |p| p[:display] }
    @keywords = "Synergy Software portfolio, works we have accompolished, #{@projects.collect{|p| p[:title]}.join(", ")}"
    @description = "We work in various industry verticals like Insurance, Manufacturing, Media, eCommerce, Social Sector and Information Technology as long as the work is in Ruby."
    @title = 'Portfolio | Synergy Software Solutions Pte Ltd'
  end

  def team
    @team_members = TEAM_MEMBERS.sort{|x,y| x[:index] <=> y[:index]}.select { |t| t[:display] }
    team =  @team_members.collect{|t| t[:name]}.join(", ")
    @keywords = "The Synergy People, the team, #{team}"
    @description = "The Synergy People, the team behind our success. #{team}"
    @title = 'The Synergy People | Synergy Software Solutions Pte Ltd'
  end

  def home
    @projects = PROJECTS.select { |p| p[:display] }
    @title = 'Ruby on Rails experts in India | Synergy Software Solutions Pte Ltd'
  end

  def testimonials
    @testimonies = TESTIMONIES.select{|e| e[:display]}
    @keywords = "Client testimonials"
    @description = "Nothing certifies our skill other than testimonials, here are the few testimonials from our clients"
    @title = 'Testimonials | Synergy Software Solutions Pte Ltd'
  end

  def open_source
    @open_sources = OPEN_SOURCE.select{|e| e[:display]}
    @keywords = "Open source Friday, open source contribution, open source involvement"
    @description = "Every Friday evening, we do different things - working on an open-source gem, doing open-source projects, learning new things and having fun."
    @title = 'Open source contribution and involvement | Synergy Software Solutions Pte Ltd'
  end

  def ping
    render :text => 'Hello'
  end

  def contact_us
    @title = 'Contact Us | Synergy Software Solutions Pte Ltd'
  end
  
  def about_us
    @title = 'About Us | Synergy Software Solutions Pte Ltd'
    @team_members = TEAM_MEMBERS.sort{|x,y| x[:index] <=> y[:index]}.select { |t| t[:display] }
    team =  @team_members.collect{|t| t[:name]}.join(", ")
    @keywords = "The Synergy People, the team, #{team}"
    @description = "The Synergy People, the team behind our success. #{team}"
  end

  def thankyou
    @title = 'Thank you | Synergy Software Solutions Pte Ltd'
  end

  def news
    @title = 'Josh in News | Synergy Software Solutions Pte Ltd'
    @news = NEWS.select{|n| n[:display]}
    @interviews = INTERVIEWS.select{|i| i[:display]}
    @articles = ARTICLES.select{|a| a[:display]}
  end

  def update_tweet
    # On local 
    #@@latest_tweet = Tweet.latest_tweet if request.remote_ip == request.env['REMOTE_ADDR'] 
    #
    #On production server
    @@latest_tweet = Tweet.latest_tweet if request.remote_ip == ENV['SERVER_ADDR']
    render :nothing => true
  end
end
