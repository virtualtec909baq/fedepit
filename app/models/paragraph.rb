class Paragraph < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	validates :description, presence: true 
  	belongs_to :article
	# img_uploader
  	mount_uploader :img, ArticleUploader
end