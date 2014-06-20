class HomeController < ApplicationController
  layout 'frontend'
  def index
  @carousel_campaigns = Campaign.carousel_campaigns
  end
end