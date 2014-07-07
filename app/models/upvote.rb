class Upvote < ActiveRecord::Base
  attr_accessible :campaign_id, :user_id
  belongs_to :campaign, :counter_cache => :upvote_count
  belongs_to :user
end
