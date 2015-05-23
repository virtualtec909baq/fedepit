class Sponsor < ActiveRecord::Base
	after_initialize :init
	# default for will_paginate
  self.per_page = 10
  # validates
	validates :name, presence: true 
  validates :image, presence: true
  validates :url, presence: true
	# img_uploader
  	mount_uploader :image, SponsorUploader
  def init
  	self.status  ||= false
  end
end
