class Category < ActiveRecord::Base
  attr_accessible :name

  #associations
  has_many :campaign_categories
  has_many :campaigns, through: :campaign_categories
end
