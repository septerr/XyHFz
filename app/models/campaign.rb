class Campaign < ActiveRecord::Base
  attr_accessible :name, :carousel_image, :show_in_carousel, :title, :carousel_description,
                  :video_embed_code, :goal, :end_date, :backer_count, :author_name, :author_photo,
                  :author_description_md, :author_description_html, :description_markdown, :description_html,
                  :funds_description_md, :funds_description_html, :campaign_status_id, :category_ids
  #category_ids need to be in the attr_accessible call in order for active_admin to let us associate categories
  #to a campaign via the campaign form.


  #paperclip
  #todo: add missing.png
  has_attached_file :carousel_image, :styles => { :medium => '300x300>', :thumb => '100x100>'}, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :carousel_image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :author_photo, :styles => { :medium => '200x200>', :thumb => '100x100>'}, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :carousel_image, :content_type => /\Aimage\/.*\Z/



  #associations
  belongs_to :campaign_status
  has_many :campaign_categories
  has_many :categories, through: :campaign_categories
  has_many :pledges, dependent: :destroy
  has_many :backers, through: :pledges, class_name: 'User'

  #validations
  validates :name, :title, :campaign_status_id, :description_markdown, :author_description_md, :funds_description_md, :video_embed_code, :goal, :end_date, :presence => true
  validates :carousel_image, :carousel_description, :presence => true, :if => :show_in_carousel?

  #callbacks
  before_save :convert_markdown

  def validate_image_dimensions
    dimensions = Paperclip::Geometry.from_file(carousel_image.queued_for_write[:original].path)
    if dimensions.height < 2000 || dimensions.width < 3000
      errors.add(:carousel_image,"Picture must be at least 3000 x 2000px. Provided picture is #{dimensions.width} x #{dimensions.height}.")
    end
  end

  #callback methods
  def convert_markdown
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    self.description_html = renderer.render(self.description_markdown)
    self.author_description_html = renderer.render(self.author_description_md)
    self.funds_description_html = renderer.render(self.funds_description_md)
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


end
