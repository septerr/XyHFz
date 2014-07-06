class Researcher < ActiveRecord::Base
  attr_accessible :bio, :institute, :name, :title
  belongs_to :campaign
end
