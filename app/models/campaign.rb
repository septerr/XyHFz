class Campaign < ActiveRecord::Base
  attr_accessible :name, :title, :excerpt, :summary, :goal, :featured_image, :campaign_status_id, :category_ids, :pledge_count, :comment_count, :upvote_count, :end_date
  #category_ids need to be in the attr_accessible call in order for active_admin to let us associate categories to a campaign via the campaign form.
  #paperclip
  #todo: add missing.png
  has_attached_file :featured_image, :styles => { :medium => '300x300>', :thumb => '100x100>'}, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :featured_image, :content_type => /\Aimage\/.*\Z/

  #associations
  belongs_to :campaign_status
  has_many :campaign_categories
  has_many :categories, through: :campaign_categories
  has_many :pledges, dependent: :destroy
  has_many :backers, through: :pledges, class_name: 'User'
  has_many :upvotes
  has_many :researchers

  #validations
  validates :name, :title, :campaign_status_id, :goal, :end_date, :presence => true
  validates :featured_image, :presence => true, :if => :show_in_carousel?
  validates :excerpt, length: {maximum: 60}, :presence => true
  validates :summary, length: {maximum: 300}, :presence => true


  def validate_image_dimensions
    dimensions = Paperclip::Geometry.from_file(featured_image.queued_for_write[:original].path)
    if dimensions.height < 2000 || dimensions.width < 3000
      errors.add(:featured_image,"Picture must be at least 3000 x 2000px. Provided picture is #{dimensions.width} x #{dimensions.height}.")
    end
  end

 #methods used by controllers / views

  def self.carousel_campaigns
    Campaign.where(show_in_carousel: true).order(:created_at).all
  end

  def pledged_amount
    self.pledges.sum(:amount)
  end

  def met_goal_percentage
    if self.pledged_amount >= self.goal
      100
    else
       (self.pledged_amount / self.goal) * 100
    end
  end

  def unmet_goal_percentage
    100 - self.met_goal_percentage
  end

  def days_left
    if Date.today < self.end_date
      (self.end_date - Date.today).to_i
    else
      0
    end
  end

  def self.campaigns_under_review
    campaigns = []
    CampaignStatus.find_all_by_crowd_reviewable(true).each do |status|
      campaigns << status.campaigns
    end
    campaigns.flatten
  end

  def category_names
    categories.map(&:name)
  end

  def has_user_upvoted?(user_id)
   upvotes.where(:user_id => user_id).size() > 0
  end

end
