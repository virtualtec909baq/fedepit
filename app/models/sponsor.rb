class Sponsor < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  after_create :init
	# default for will_paginate
  self.per_page = 10
  # validates
	validates :name, presence: true 
  validates :image, presence: true
  validates :email, presence: true
  validates :url, presence: true
	# img_uploader
  	mount_uploader :image, SponsorUploader
  def init
  	self.status  ||= true
  end
end
