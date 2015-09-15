class Breeder < ActiveRecord::Base
	
	belongs_to :type_breeder
	has_many :canines, :dependent => :nullify
	validates :type_breeder_id, presence: true 
	# img_uploader
	mount_uploader :img, BreederUploader
end
