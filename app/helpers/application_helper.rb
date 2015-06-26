module ApplicationHelper
	
	def gender(gender)
		if gender == 1
			return "Macho"
		else
			return "Hembra"
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

	def has_parent?(id)
		if !Canine.find(id).lft.nil?
			return true
		else
			return false
		end	
	end

	def has_parent?(id)
		if !Canine.find(id).lft.nil?
			return true
		else
			return false
		end	
	end

	def parent(id)
		parent_id ||= []
		if Canine.exists?(id: id)
			@canine = Canine.find(id).lft
			parent_id.push("tree")
			parent(@canine)
		end
		return parent_id
	end
	
	def parent_children(id)
		return @children = Canine.where(lft: id)
	end

	def mother_children(id)
		@children = Canine.where(rgt: id)
	end

	def root(id)
		@canine = Canine.find(id)
		if @canine.lft.nil? or @canine.rgt.nil?
			return true
		else
			return false
		end
	end
	def root_lft(id)
		@canine = Canine.find(id)
		if @canine.lft.nil?
			return true
		else
			return false
		end
	end
	def metter(id)
		@children = children(id)
		@children.each do |child|
			 return child.feaute
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
					@array_child_features << child.feature.as_json(except: [:id, :created_at, :updated_at, :insertion_ear, :title_work, :championsihp_true, :test_dog_safe,:recommendation, :ectropion, :defect_tail, :problem_conduct, :displacia_hip, :displacia_elbow, :ectropion, :postponement,:lack_dental,:defects_bite, :test_dog_safe, :test_strength])
					$total_children = @array_child_features.count
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
					@features_count["#{key}_#{value}"] += 1
				end
        	end

			if !@array_prom_features.empty?
				@features_count = @features_count.sort_by {|key, value| key}
				return @features_count
			end
		end
	end
end








