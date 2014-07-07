class Comment < ActiveRecord::Base
  attr_accessible :campaign_id, :comment_text, :user_id
  belongs_to :campaign, :counter_cache => :comment_count
  belongs_to :user
end
