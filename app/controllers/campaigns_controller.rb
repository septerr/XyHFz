class CampaignsController < ApplicationController

  respond_to :json, :html

 def under_crowdreview
    respond_with Campaign.all
  end

end