module ApplicationHelper
	
	def gender(gender)
		if gender == 1
			return "Macho"
		else
			return "Hembra"
		end
	end

	def siblings(id)
		lft = Canine.find(id).lft
		rgt = Canine.find(id).rgt
		@siblings = Canine.where("(lft = ? OR rgt = ?) AND id != ?", lft, rgt, id)
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
end
