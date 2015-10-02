class Paragraph < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: ->(controller, model) { controller && controller.current_user }
	# validates
	validates :description, presence: true
	validates_length_of :description, :maximum => 2000
    belongs_to :article
	# img_uploader
  	mount_uploader :img, ArticleUploader
end