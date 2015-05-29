class Image < ActiveRecord::Base
	belongs_to :canine
	# img_uploader
  	mount_uploader :file, ArticleUploader
end
