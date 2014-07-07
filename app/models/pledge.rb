class Pledge < ActiveRecord::Base
  attr_accessible :campaign_id, :user_id, :amount

  #associations
  belongs_to :campaign, counter_cache: :pledge_count
  belongs_to :user

end
