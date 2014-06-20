class HomeController < ApplicationController

  def index
  @carousel_campaigns = Campaign.carousel_campaigns
  end
end