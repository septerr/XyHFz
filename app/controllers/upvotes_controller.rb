class UpvotesController <ApplicationController
respond_to :json
  def create
    @upvote = Upvote.create(:user_id => current_user.id, :campaign_id => params[:campaign_id])
    respond_with(@upvote, :status => (@upvote.save? ? :ok :internal_server_error ))
  end
end