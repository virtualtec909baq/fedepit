class Feature < ActiveRecord::Base
	belongs_to :canine
	
	validates :insertion_ear, presence: true 
	validates :skull_width, presence: true 
	validates :skull_high, presence: true 
	validates :skull_diameter, presence: true 
	validates :head_length, presence: true 
	validates :skull_length, presence: true 
	validates :muzzle_high, presence: true 
	validates :skull_percentage, presence: true 
	validates :muzzle_percentage, presence: true 
	validates :heah_high, presence: true 
	validates :muzzle_high_skull, presence: true 
	validates :muscular_general, presence: true 
	validates :muscular_masetero, presence: true 
	validates :muscle_parietale, presence: true 
	validates :body_long, presence: true 
	validates :body_raised, presence: true 
	validates :diamter_thorax, presence: true 
end
