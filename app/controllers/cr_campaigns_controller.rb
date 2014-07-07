class CrCampaignsController < ApplicationController
  respond_to :html, :json

  def index
    @campaigns_json = as_json(Campaign.all)
    respond_with @campaigns_json
  end

  def as_json(campaigns)
   campaigns.map { |campaign|
    json = campaign.as_json
    json[:upvoted] = campaign.upvotes.where(:user_id => current_user.id).size() > 0
    json[:researchers] = campaign.researchers.map(&:name).join(", ")
    json
   }
  end

end