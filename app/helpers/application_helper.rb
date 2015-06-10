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
end
