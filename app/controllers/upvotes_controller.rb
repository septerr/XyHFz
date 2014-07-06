class UpvotesController < ApplicationController
respond_to :json
before_filter :authenticate_user!

  def create
    @upvote = Upvote.create(:user_id => current_user.id, :campaign_id => params[:campaign_id])
    respond_with({:upvoteCount => @upvote.campaign.upvotes.count}, :location => nil, :status => (@upvote.persisted? ? :ok : :internal_server_error ))
  end
end