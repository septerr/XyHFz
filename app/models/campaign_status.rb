class CampaignStatus < ActiveRecord::Base
  attr_accessible :name, :crowd_reviewable
  has_many :campaigns
end
