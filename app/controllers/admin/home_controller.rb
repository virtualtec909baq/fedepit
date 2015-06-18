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
				$rest_array_4 = Array.new(42)
				$rest_array ||= []
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
						puts child.id
						array_2 << child.feature.as_json
					end
				end
				
				array_2.each_with_index do |(value),index_1|
					value.each_with_index do |(key,value_hash),index|
						if index > 0 and index < 27
							if $rest_array_3[index] == nil 
								$rest_array_3[index] = 0
							end
						end
						if (index > 1 and index < 27) and value_hash == true
							@cont = $rest_array_3[index]+=1
							@percent = ((@cont.to_f/@total_canine_2) *100)
							@a = ["#{key}", "#{@percent}"]
							@h = Hash[*@a]

							puts @h.inspect
						end
					end
					# $rest_array << @h
				end
				

				format.html { redirect_to admin_realizarcruce_path(:status => true), notice: 'Se Creado un Metter'}
				else
				format.html { redirect_to admin_realizarcruce_path() , notice: 'no se puede crear metter'}
				end
			end
		end
	end
end
