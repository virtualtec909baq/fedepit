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

	def parent_children(id)
		@children = Canine.where(lft: id)
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
	def metter(id)
		@children = children(id)
		@children.each do |child|
			 return child.feaute
		end
	end
end
