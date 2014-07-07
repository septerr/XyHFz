class CrUpvotesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def create
    @upvote = Upvote.create(:user_id => current_user.id, :campaign_id => params[:cr_campaign_id])
    respond_with @upvote
  end

  def destroy
    Upvote.where(:user_id => current_user.id, :campaign_id => params[:campaign_id]).destroy_all
    respond_with :head
  end
end