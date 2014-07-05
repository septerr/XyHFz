class CampaignsController < ApplicationController

  respond_to :json, :html

  def show
    @campaign = Campaign.find_by_id params[:id]
  end

  def under_crowdreview
    respond_with Campaign.all
  end

end