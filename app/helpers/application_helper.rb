module ApplicationHelper
	include ActionView::Helpers::NumberHelper
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

	def get_characteristic_detail(id, canine_race_id, canine_characteristic_id, age)
		if CharacteristicDetail.exists?(id)
			return CharacteristicDetail.find(id).description
		else
			standards = Standard.where(:race_id =>  canine_race_id, :characteristic_id => canine_characteristic_id)
			unless standards.empty? 
				startd = standards.detect {|n| n.rg_lt <= id and n.rg_gteq >=id}
				unless startd.nil?
					return startd.description
				else 	
					return id
				end 
			else 
			  	return id
			end
		end
	end
	
	def get_ancestor_id(canine)
		@tree_id ||= []
		if !canine.nil?
			@tree_id << get_id(canine)
			get_ancestor_id(get_left(canine))
			get_ancestor_id(get_rgt(canine))
		end
		return @tree_id
	end

	def children(id)
		return @children = Canine.where("(lft = ? OR rgt = ?)", id, id)
	end

	def children_characteristic(canine)
		if canine.gender == 1
			@children = Canine.includes(:canino_characteristics).where("(lft = ?)", canine.id)
		elsif canine.gender == 0
			@children = Canine.includes(:canino_characteristics).where("(rgt = ?)", canine.id)
		end
		return @children
	end

	def has_children(id)
		@children = Canine.where("(lft = ? OR rgt = ?)", id, id)
		if !@children.empty?
			return true
		else
			return false
		end
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

	def children_characteristic_detail(canine)
		@b = Hash.new(0)
		array = []
		children(canine.id).each do |children|
			children.canino_characteristics.each do |characteristic|
				array << "#{get_characteristics(characteristic.characteristic_id)} #{get_characteristic_detail(characteristic.value, characteristic.canine.race_id, characteristic.characteristic_id, 0)}"
			end
		end
		array.each do |v|
			@b[v] += 1
		end
		return @b
	end
	
	def siblings(id)
		lft = Canine.find(id).lft
		rgt = Canine.find(id).rgt
		return @siblings = Canine.where("(lft = ? OR rgt = ?) AND id != ?", lft, rgt, id)
	end

	
	def get_left(canine)
		if Canine.exists?(canine.lft)
			canine_lft = Canine.find(canine.lft)
			return canine_lft
		end
	end
	
	def get_rgt(canine)
		if Canine.exists?(canine.rgt)
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
		if Canine.find(id)
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

	def get_ancestor_level(canine, level)
		@tree_get_ancestors ||= []
		if !canine.nil? and level <= 5
			if canine.gender == 1
				array = ["#{level}/#{nivel_consa(level)}/#{level}-/#CEE2F2", get_canine(canine)]
			else
      			array = ["#{level}/#{nivel_consa(level)}/-#{level}/#FAF0FA", get_canine(canine)]
      		end
      		canine_hash = Hash[*array]
			@tree_get_ancestors <<  canine_hash 
			get_ancestor_level(get_left(canine), level+1)
			get_ancestor_level(get_rgt(canine), level+1)
		end
		return @tree_get_ancestors
	end


	def get_left_hash(canine)
		if Canine.exists?(canine.lft)
			canine_lft = Canine.find(canine.lft)
			array = []
			array <<  "#{canine.name}-#{canine.id}"
			array <<  "#{canine_lft.name}-#{canine_lft.id}" 
			array <<  gender_color(canine_lft.gender)
			return array
		end
	end
	
	def get_rgt_hash(canine)
		if Canine.exists?(canine.rgt)
			canine_rgt = Canine.find(canine.rgt)
			array = []
			array <<  "#{canine.name}-#{canine.id}"
			array <<  "#{canine_rgt.name}-#{canine_rgt.id}" 
			array <<  gender_color(canine_rgt.gender)
			return array
		end
	end

	def get_ancestor_with_hash(canine, level)
		@tree ||= []
		if !canine.nil? and level <= 5
			
			if canine.lft
				@tree << get_left_hash(canine)
			end
			if canine.rgt
				@tree << get_rgt_hash(canine)
			end
			get_ancestor_with_hash(get_left(canine), level+1)
			get_ancestor_with_hash(get_rgt(canine), level+1)
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
		return @graph
	end

	
end









