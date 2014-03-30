class CampaignCategory < ActiveRecord::Base
  attr_accessible :campaign_id, :category_id
  belongs_to :campaign
  belongs_to :category

end
