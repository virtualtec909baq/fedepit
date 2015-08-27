class Paragraph < ActiveRecord::Base
	validates :description, presence: true 
  	belongs_to :article
	# img_uploader
  	mount_uploader :img, ArticleUploader
end