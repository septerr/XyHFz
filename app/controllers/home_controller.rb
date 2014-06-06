class HomeController < ApplicationController
  layout 'dashboard'
  def index
  @carousel_campaigns = Campaign.carousel_campaigns
  end
end