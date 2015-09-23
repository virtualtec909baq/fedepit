class ImgRace < ActiveRecord::Base
	belongs_to :race
	# img_uploader
	mount_uploader :img, ImageUploader
end
