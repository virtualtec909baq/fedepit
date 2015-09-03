module ApplicationHelper
	
	def gender(gender)
		if gender == 1
			return "Macho"
		else
			return "Hembra"
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
	
	def get_ancestors(canine)
		@tree ||= []
		if !canine.nil?
			@tree << get_id(canine)
			get_ancestors(get_left(canine))
			get_ancestors(get_rgt(canine))
			return @tree
		end
	end

	def get_ancestors_2(canine)
		@tree ||= []
		if !canine.nil?
			@tree << get_id(canine)
			get_ancestors_2(get_left(canine))
			get_ancestors_2(get_rgt(canine))
			return @tree
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
				get_nivel(get_left(canine),data,level +1)
				get_nivel(get_rgt(canine),data, level +1)
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









