class Breeder < ActiveRecord::Base
		belongs_to :type_breeder
		has_many :canines
		# img_uploader
  		mount_uploader :img, BreederUploader
end
