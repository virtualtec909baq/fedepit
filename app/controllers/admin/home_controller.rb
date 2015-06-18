class Admin::HomeController < ApplicationController
	before_action :authenticate_user!
	include ApplicationHelper
	include ActionView::Helpers::NumberHelper

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
				
				$hash = Hash.new
				@array_num = []
				@newhash ||= []
				@b = Hash.new(0)
				$array_float = []
				
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
							$hash[index] = @h
						elsif (index > 1 and index < 27) and value_hash == false
							@cont = $rest_array_3[index]
							@percent = ((@cont.to_f/@total_canine_2) *100)
							@a = ["#{key}", "#{@percent}"]
							@h = Hash[*@a]
							$hash[index] = @h
						elsif index > 29 and index < 46 
							@create_array_float = ["#{key}", "#{value_hash}"]
							@hash_float = Hash[*@create_array_float]
							@newhash << @hash_float
						end
					end
				end
				@newhash.each do |v|
					@b[v] += 1
				end 
				@b.each do |k, v|
					average = (v.to_f/@total_canine_2) * 100
					k.map {|k,str|$array_float << ["#{k} #{str}:", "#{number_to_percentage(average, precision: 0)}"]}
				end
				format.html { redirect_to admin_realizarcruce_path(:status => true), notice: 'Se Creado un Metter'}
				else
				format.html { redirect_to admin_realizarcruce_path() , notice: 'no se puede crear metter'}
				end
			end
		end
	end
end
