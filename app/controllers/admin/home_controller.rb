class Admin::HomeController < ApplicationController
	before_action :authenticate_user!
	include ApplicationHelper

	def index
	end
	
	def realizarcruce
    	@canine = Canine.new
	end

	def enviar_cruce
		@canine_1 = Canine.find(params[:merge][:canine_id])
		@canine_2 = Canine.find(params[:merge][:canine_id_2])
		respond_to do |format|
		if has_children(@canine_1.id) and has_children(@canine_1.id)
			@children_canine_1 = children(@canine_1.id)
			@children_canine_2 = children(@canine_2.id)
			if  !@children_canine_1.empty? and !@children_canine_2.empty?
			array_1 ||= []
			array_2 ||= []
			$rest_array_3 = Array.new(42) 
			rest_array_4 = Array.new(42)
			i = 0
			j = 0
			
			@total_canine_1 = @children_canine_1.count
			@total_canine_2 = @children_canine_2.count
			
			@children_canine_1.each do |child|
				if child.feature
				array_1 << child.feature.as_json
				end
			end

			@children_canine_2.each do |child|
				if child.feature
					array_2 << child.feature.as_json
				end
			end
			array_2.each do |value|
				value.each_with_index do |(key,value),index|
					if index > 0 and index < 43
						if $rest_array_3[index] == nil 
							$rest_array_3[index] = 0
						else
							if (index > 28 and index < 43) and value == true
							$rest_array_3[index] = (($rest_array_3[index]+=1/@total_canine_1)*100)
							a = ["#{key}", "#{$rest_array_3[index]}"]
							h = Hash[*a]
							$rest_array_3  << h
							end
							end
						end
					end
				end
			end
			format.html { redirect_to admin_realizarcruce_path(:status => true), notice: 'Se Creado un Metter'}
			else
			format.html { redirect_to admin_realizarcruce_path() , notice: 'no se puede crear metter'}
			end
			end
		end
	end
