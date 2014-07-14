class CrCampaignsController < FrontendController
  respond_to :html, :json

  def index
    @campaigns_json = []
    Campaign.all.each{|c|
      @campaigns_json <<  as_json(c)
    }
    respond_with @campaigns_json
  end

  def update
    #we are expecting only upvote or cancel-upvote actions in crowd review stage
    campaign = Campaign.find(params[:id]) #todo handle invalid id
    upvotes = campaign.upvotes.where(:user_id => current_user.id)
     if params[:upvoted] && upvotes.size == 0
      campaign.upvotes.create(:user_id => current_user.id)
     elsif !params[:upvoted] && upvotes.size > 0
         upvotes.destroy_all
     end
    respond_with  as_json(campaign.reload)#reload is needed to update the upvote_count.
  end

  def as_json(campaign)
    json = campaign.as_json
    json[:upvoted] = campaign.upvotes.where(:user_id => current_user.id).size() > 0
    json[:researchers] = campaign.researchers.map(&:name).join(", ")
    json
  end

end