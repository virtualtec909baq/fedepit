module ApplicationHelper

	def ihash(h)
		h.each_pair do |k,v|
			if v.is_a?(Hash)
				puts "key: #{k} recursing..."
				ihash(v)
			else
	      	# MODIFY HERE! Look for what you want to find in the hash here
	      	puts "key: #{k} value: #{v}"
	  		end
		end
	end

	def get_show(spectacle_id)
		if Spectacle.exists?(spectacle_id)
			return Spectacle.find(spectacle_id).name
		else
			return "Show sin nombre"
		end
	end
	
	def get_breeder(breeder_id)
		if Breeder.exists?(breeder_id)
			return Breeder.find(breeder_id).name
		else
			return "Criador sin nombre"
		end
	end

	def get_show(spectacle_id)
		if Spectacle.exists?(spectacle_id)
			return Spectacle.find(spectacle_id).name
		else
			return "Show sin nombre"
		end
	end

	def pic_canine(canine)
		if canine.images.first.blank?
          	photo =  ActionController::Base.helpers.asset_path("placeholder2.png")
        else
          	photo = canine.images.first.file.url
        end
        return photo
	end
	
	def get_race(race_id)
		if Race.exists?(race_id)
			return Race.find(race_id).name
		else
			return "Raza sin nombre"
		end
	end

	def get_variety(variety_id)
		if Variety.exists?(variety_id)
			return Variety.find(variety_id).name
		else
			return "Variedad sin nombre"
		end
	end

	def get_category(category_id)
		if Category.exists?(category_id)
			return Category.find(category_id).name
		else
			return "Categoria sin nombre"
		end
	end

	def get_tournament(tournament_id)
		if Tournament.exists?(tournament_id)
			return Tournament.find(tournament_id).name
		else
			return "Campeonato sin nombre"
		end
	end

	def gender(gender)
		if gender == 1
			return "Macho"
		else
			return "Hembra"
		end
	end

	def gender_color(gender)
		if gender == 1
			return "#3F9FEB"
		else
			return "pink"
		end
	end
	
	def get_characteristics(id)
		if Characteristic.exists?(id)
			return Characteristic.find(id).name
		else
			return "Characteristica sin nombre"
		end
	end

	def get_characteristic_detail(id)
		if CharacteristicDetail.exists?(id)
			return CharacteristicDetail.find(id).description
		else
			return id
		end
	end

	def children(id)
		return @children = Canine.where("(lft = ? OR rgt = ?)", id, id)
	end

	def has_children(id)
		@children = Canine.where("(lft = ? OR rgt = ?)", id, id)
		if !@children.empty?
			return true
		else
			return false
		end
	end
	
	def siblings(id)
		lft = Canine.find(id).lft
		rgt = Canine.find(id).rgt
		return @siblings = Canine.where("(lft = ? OR rgt = ?) AND id != ?", lft, rgt, id)
	end

	
	def get_left(canine)
		if canine.lft
			canine_lft = Canine.find(canine.lft)
			return canine_lft
		end
	end
	
	def get_rgt(canine)
		if canine.rgt
			canine_rgt = Canine.find(canine.rgt)
			return canine_rgt
		end
	end
	
	def get_id(canine)
		if !canine.nil?
			id = canine.id
			return id
		end
	end

	def get_canine(id)
		if Canine.exists?(id) 
			return  Canine.find(id)
		end
	end
	
	def get_ancestors(canine)
		@tree ||= []
		if !canine.nil?
			@tree << get_id(canine)
			get_ancestors(get_left(canine))
			get_ancestors(get_rgt(canine))
		end
		return @tree
	end

	def get_ancestors_levels(canine, level)
		@tree ||= []
		@tree_2 ||= []
		if !canine.nil?
			@tree << "#{get_id(canine)} #{level}"
			get_ancestors_levels(get_left(canine), level+1)
			get_ancestors_levels(get_rgt(canine), level+1)
		end
		return @tree
	end

	def get_left_hash(canine)
		if canine.lft
			canine_lft = Canine.find(canine.lft)
			array = []
			array <<  "#{canine.name}-#{canine.id}"
			array <<  "#{canine_lft.name}-#{canine_lft.id}" 
			array <<  gender_color(canine_lft.gender)
			return array
		end
	end
	
	def get_rgt_hash(canine)
		if canine.rgt
			canine_rgt = Canine.find(canine.rgt)
			array = []
			array <<  "#{canine.name}-#{canine.id}"
			array <<  "#{canine_rgt.name}-#{canine_rgt.id}" 
			array <<  gender_color(canine_rgt.gender)
			return array
		end
	end

	def get_ancestor_with_hash(canine)
		@tree ||= []
		if !canine.nil?
			
			if canine.lft
				@tree << get_left_hash(canine)
			end
			if canine.rgt
				@tree << get_rgt_hash(canine)
			end
			get_ancestor_with_hash(get_left(canine))
			get_ancestor_with_hash(get_rgt(canine))
			@tree = @tree.uniq
			return @tree
		end
	end

	def get_left_canine(canine)
		if canine.lft
			array = []
			array <<  canine
			array <<  Canine.find(canine.lft)
			return array
		end
	end
	
	def get_rgt_canine(canine)
		if canine.rgt
			array = []
			array <<  canine
			array <<  Canine.find(canine.rgt)
			return array
		end
	end

	def get_ancestor_canine(canine)
		@tree ||= []
		if !canine.nil?
			if canine.rgt
				@tree << get_rgt_canine(canine)
			end
			if canine.lft
				@tree << get_left_canine(canine)
			end
			get_ancestor_canine(get_left(canine))
			get_ancestor_canine(get_rgt(canine))
			return @tree
		end
	end

	def get_pedigree_left_canine(canine, level)
		array = []
		if canine.lft
			canine_left = Canine.find(canine.lft)
			array << "#{canine_left.id}#{level}#{canine_left.try(:lft)}#{canine_left.try(:rgt)}"
			array << "#{canine.id}#{level-1}#{canine.try(:lft)}#{canine.try(:rgt)}"
			array << canine_left.name
			array << canine_left.lof
			array << gender(canine_left.gender)
			if canine_left.images.first.blank?
          		array << ActionController::Base.helpers.asset_path("placeholder2.png")
        	else
          		array << canine_left.images.first.file.url
        	end
        	return array
		end
	end
	
	def get_pedigree_rgt_canine(canine, level)
		array = []
		if canine.rgt
			canine_rgt = Canine.find(canine.rgt)
			array << "#{canine_rgt.id}#{level}#{canine_rgt.try(:lft)}#{canine_rgt.try(:rgt)}"
			array << "#{canine.id}#{level-1}#{canine.try(:lft)}#{canine.try(:rgt)}"
			array << canine_rgt.name
			array << canine_rgt.lof
			array << gender(canine_rgt.gender)
			if canine_rgt.images.first.blank?
          		array << ActionController::Base.helpers.asset_path("placeholder2.png")
        	else
          		array << canine_rgt.images.first.file.url
        	end
			return array
		end
	end

	def get_pedigree_canine(canine, level)
		@tree ||= []
		if !canine.nil?
			if canine.lft
				@tree << get_pedigree_left_canine(canine, level)
			end
			if canine.rgt
				@tree << get_pedigree_rgt_canine(canine, level)
			end
			get_pedigree_canine(get_left(canine), level +1)
			get_pedigree_canine(get_rgt(canine), level +1)
		end
		return @tree

	end

	def get_api_pedigree_rgt_canine(canine, level)
		if canine.rgt
			canine_rgt = Canine.find(canine.rgt)
			array = ["level","#{level}","race","#{get_race(canine_rgt.race_id)}","from", "#{canine.id}" ,"to", "#{canine_rgt.id}", "nombre", "#{canine_rgt.name}", "img", "#{pic_canine(canine_rgt)}", "sex", "#{canine_rgt.gender}"]
      		canine_hash = Hash[*array]
			return canine_hash
		end
	end

	def get_api_pedigree_lft_canine(canine, level)
		if canine.lft
			canine_lft = Canine.find(canine.lft)
			array = ["level","#{level}","race","#{get_race(canine_lft.race_id)}","from","#{canine.id}" ,"to", "#{canine_lft.id}" ,"nombre", "#{canine_lft.name}", "img", "#{pic_canine(canine_lft)}", "sex", "#{canine_lft.gender}"]
      		canine_hash = Hash[*array]
			return canine_hash
		end
	end



	def get_api_pedigree_canine(canine, level)
		@tree ||= []
		if !canine.nil?
			if canine.lft
				@tree << get_api_pedigree_lft_canine(canine, level)
			end
			if canine.rgt
				@tree << get_api_pedigree_rgt_canine(canine, level)
			end
			get_api_pedigree_canine(get_left(canine), level + 1)
			get_api_pedigree_canine(get_rgt(canine), level + 1)
			return @tree
		end
	end

	def get_api_pedigree_canine_complex(canine, level)
		@tree_2 ||= []
		if !canine.nil?
			if canine.lft
				@tree_2 << get_api_pedigree_lft_canine(canine, level)
			end
			if canine.rgt
				@tree_2 << get_api_pedigree_rgt_canine(canine, level)
			end
			get_api_pedigree_canine_complex(get_left(canine), level + 1)
			get_api_pedigree_canine_complex(get_rgt(canine), level + 1)
			return @tree_2
		end
	end

	def nivel(canine, data)
		get_nivel(canine,data, 0)
	end

	def get_nivel(canine,data, level)
		if get_id(canine) == data
			$level = level
			return $level
		else
			if !canine.nil?
				get_nivel(get_left(canine), data,level +1)
				get_nivel(get_rgt(canine), data, level +1)
			end
		end
	end

	 	def nivel_consa(level)
		@count = 100
		i = 1
		for i in i..level
			@count =  @count.to_f/2.to_f
		end
		return @count
	end

	def count_of_element array, element
  		array.inject(0) { |count, e| count += 1 if e == element; count }
	end

	def cor(array)
		@graph = Graph.new
		array.each do |a|
			canine = Canine.find(a)
			if canine.lft and canine.rgt
				@graph.addEdge(a.to_s,canine.lft.to_s)
				@graph.addEdge(a.to_s,canine.rgt.to_s)
			elsif canine.lft
				@graph.addEdge(a.to_s,canine.lft.to_s)
			elsif canine.rgt
				@graph.addEdge(a.to_s,canine.rgt.to_s)
			end
		end
		return @graph.inspect
	end

	def count_children(canine)
		@canine = canine
		if has_children(@canine)
			@total_children = @children.count
			return @total_children
		else
			return 0 
		end
	end



	def enviar_cruce(canine)
		@canine = canine
		if has_children(@canine)
			@array_child_features = []
			@array_prom_features = []	
			@children = children(@canine)
			@array_count_features = []
			@features_count = Hash.new(0)
			@newhash ||= []
			
			@children.each do |child|
				if child.feature
					feature_json = child.feature.as_json(except: [:id, :created_at, :updated_at, :canine_id, :canine_name])
					feature_json.each do |key , value|
						if !value.nil?
							create_json = [key, value]	
							@hash_to_json = Hash[*create_json]
							@array_child_features << @hash_to_json
						end
					end
					$total_children = @children.count
				end
			end
			@array_child_features.each do |array_feature|
				array_feature.each do |key,value_hash|
					create_hash_whit_values_matriz = [key, value_hash]
					hash_hash_whit_values_matriz = Hash[*create_hash_whit_values_matriz]
					@array_prom_features << hash_hash_whit_values_matriz
				end
			end
			@array_prom_features.each do |key|
				key.each do |key, value|
					@features_count["#{key}-#{value}"] += 1
				end
        	end
        	if !@array_prom_features.empty?
				@features_count = @features_count.sort_by {|key, value| key}
				return @features_count
			end
		end
	end
end









