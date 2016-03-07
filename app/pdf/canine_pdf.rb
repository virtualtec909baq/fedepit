class CaninePdf< Prawn::Document
	include ApplicationHelper

	def initialize(canine)
		super(:page_size => 'A4', page_layout: :landscape)
		@canine = canine
		
		# array pedigree
		@array_canine_level = []
		ancestor = get_ancestors(@canine, 0)
		ancestor.each do |canine|
			@array_canine_level << canine
		end
		
		# first page 
	    move_down 45
	    # image open("http://www.sabiask.com/images/Image/perro.jpg")

	    bounding_box([470,430],:width =>400,:height =>450) do 
	    	transparent(0) { stroke_bounds }
	    	text "#{}"
	    	move_down 40
	    	text "	NOMBRE : #{@canine.name.upcase}", :size => 13
	    	move_down 15
	    	text "RAZA : #{@canine.race.name.upcase}", :size => 13
	    	move_down 15
	    	text "SEXO : #{gender(@canine.gender)}", :size => 13
	    	move_down 15
	    	text "COLOR : #{@canine.color}", :size => 13
	    	move_down 15
	    	text "NACIMIENTO : #{@canine.birth}", :size => 13
	    	if @canine.kind == "0"
		    	move_down 15
		    	text "LOF : #{@canine.lof}", :size => 13
		    else
		    	move_down 15
		    	text "# OTRO REGISTRO : #{@canine.new_register}", :size => 13
		    end
	    	move_down 15
	    	text "PROPIETARIO : #{@canine.propietary}", :size => 13
	    	move_down 15
	    	text "CRIADOR : #{@canine.breeder.name.upcase}", :size => 13
	    	move_down 15
	    	text "MICROCHIP : #{@canine.chip}", :size => 13
	    	move_down 15
	    	text "FECHA DE REGISTRO : #{@canine.created_at.strftime("%m-%d-%Y")}", :size => 13
	    end
		
		# second page
		start_new_page(:size => "A4", :layout => :landscape)

		# pedigree lines 
		line [10,380],[10,458]
		stroke
		line [10,458],[22,458]
		stroke
		line [250,420],[250,505]
		stroke
		line [250,420],[260,420]
		stroke
		line [250,505],[260,505]
		stroke

		line [520,470],[520,520]
		stroke
		line [520,520],[535,520]
		stroke
		line [520,470],[535,470]
		stroke

		line [520,350],[520,410]
		stroke
		line [520,410],[535,410]
		stroke
		line [520,350],[535,350]
		stroke

		line [10,118],[10,210]
		stroke
		line [10,118],[22,118]
		stroke

		line [250,90],[250,170]
		stroke
		line [250,170],[260,170]
		stroke
		line [250,90],[260,90]
		stroke
		
		line [520,211],[520,264]
		stroke
		line [520,264],[535,264]
		stroke
		line [520,211],[535,211]
		stroke

		line [520,80],[520,133]
		stroke
		line [520,133],[535,133]
		stroke
		line [520,80],[535,80]
		stroke
		
		bounding_box([10,360],:width =>350,:height =>130) do
			transparent(0,5) { stroke_bounds } 
		end

		bounding_box([30,350],:width =>350,:height =>130) do
			transparent(0) { stroke_bounds }
			move_down 5 
			text "De : #{newline(@canine.name.upcase)}", :size => 12
			if @canine.kind == "0"
				move_down 8
				text "LOF : #{@canine.lof}", :size => 12
			else
				move_down 8
				text "# OTRO REGISTRO : #{@canine.new_register}", :size => 12
			end
			move_down 8
			text "Sexo : #{gender(@canine.gender)}", :size => 12
			move_down 8
			text "Nacimiento : #{@canine.birth}", :size => 12
			move_down 8
			text "No. Hermanos : #{siblings(@canine.id).count}", :size => 12
		end

		# Father pedigree
		if @canine.lft
			@father = Canine.find(@canine.lft)
			bounding_box([30,480],:width =>400,:height =>450) do
				transparent(0) { stroke_bounds } 
				if @father.kind == "0"
					text "LOF : #{@father.lof}", :size => 12
				else
					text "# OTRO REGISTRO : #{@father.new_register}", :size => 12
				end
				move_down 5
				text "NOMBRE : #{newline(@father.name.upcase)}", :size => 12
			end
		end
		
		# Mother pedigree
		if @canine.rgt
			@mother = Canine.find(@canine.rgt)
			bounding_box([30,140],:width =>400,:height =>370) do
				transparent(0) { stroke_bounds } 
				if @mother.kind == "0"
					text "LOF : #{@mother.lof}", :size => 12
				else
					text "# OTRO REGISTRO : #{@mother.new_register}", :size => 12
				end
				move_down 5
				text "NOMBRE : #{newline(@mother.name.upcase)} ", :size => 12
			end
		end
		#if @array_canine_level.size > 3 
			if @canine.lft
				@father = Canine.find(@canine.lft)
				if @father.lft
					@father_lft = Canine.find(@father.lft)
					if @father_lft.present?
						@father_lft_lft = Canine.find(@father.lft)
						bounding_box([270,520],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "NOMBRE : #{newline(@father_lft_lft.name.upcase)}", :size => 10
							move_down 5
							if @father_lft_lft.kind == "0"
								text "LOF : #{@father_lft_lft.lof}", :size => 10
							else
								text "# OTRO REGISTRO : #{@father_lft_lft.new_register}", :size => 10
							end
						end						
						if @father_lft_lft.lft
							caninine_left = Canine.find(@father_lft_lft.lft)
							bounding_box([545,540],:width =>400,:height =>450) do
								transparent(0) { stroke_bounds } 
								text "NOMBRE : #{newline(caninine_left.name.upcase)}", :size => 10
								move_down 5
								if caninine_left.kind == "0"
									text "LOF : #{caninine_left.lof}", :size => 10
								else
									text "# OTRO REGISTRO : #{caninine_left.new_register}", :size => 10
								end
							end
						end
						if @father_lft_lft.rgt
							caninine_right = Canine.find(@father_lft_lft.rgt)
							bounding_box([545,490],:width =>400,:height =>450) do
								transparent(0) { stroke_bounds } 
								text "NOMBRE : #{newline(caninine_right.name.upcase)}", :size => 10
								move_down 5
								if caninine_right.kind == "0"
									text "LOF : #{caninine_right.lof}", :size => 10
								else
									text "# OTRO REGISTRO : #{caninine_right.new_register}", :size => 10
								end
							end	
						end	
					end
				end
				if @father.rgt
					@father_rgt = Canine.find(@father.rgt)
					bounding_box([270,440],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "NOMBRE : #{newline(@father_rgt.name.upcase)}", :size => 11
						move_down 5
						text "LOF : #{@father_rgt.lof}", :size => 11
					end
					if @father_rgt.lft
						caninine_right_lft = Canine.find(@father_rgt.lft)
						bounding_box([545,425],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{newline(caninine_right_lft.name.upcase)}", :size => 11
							move_down 5
							if caninine_right_lft.kind == "0"
								text "LOF : #{caninine_right_lft.lof}", :size => 11
							else
								text "# OTRO REGISTRO : #{caninine_right_lft.new_register}", :size => 11
							end
						end
					end
					if @father_rgt.rgt
						caninine_right_rgt = Canine.find(@father_rgt.rgt)
						bounding_box([545,370],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{newline(caninine_right_rgt.name.upcase)}", :size => 11
							move_down 5
							if caninine_right_rgt.kind == "0"
								text "LOF : #{caninine_right_rgt.lof}", :size => 11
							else
								text "# OTRO REGISTRO : #{caninine_right_rgt.new_register}", :size => 11
							end
						end
					end
				end
			end

			if @canine.rgt
				@mother = Canine.find(@canine.rgt)
				if @mother.rgt
					@mother_rgt = Canine.find(@mother.rgt)
					bounding_box([270,100],:width =>400,:height =>370) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : #{newline(@mother_rgt.name.upcase)}", :size => 11
						if @mother_rgt.kind == "0"
							text "LOF : #{@mother_rgt.lof}", :size => 11
						else
							text "# OTRO REGISTRO : #{@mother_rgt.new_register}", :size => 11
						end
					end
					
					if @mother_rgt.rgt
						canine_rgt = Canine.find(@mother_rgt.rgt)
						bounding_box([545,80],:width =>400,:height =>370) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{newline(canine_rgt.name.upcase)}", :size => 11
							move_down 5
							if canine_rgt.kind == "0"
								text "LOF : #{canine_rgt.lof}", :size => 11
							else
								text "# OTRO REGISTRO : #{canine_rgt.new_register}", :size => 11
							end
						end
					end

					if @mother_rgt.lft
						canine_rgt_1 = Canine.find(@mother_rgt.lft)
						bounding_box([545,155],:width =>400,:height =>370) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{newline(canine_rgt_1.name.upcase)}", :size => 11
							move_down 5
							if canine_rgt_1.kind == "0"
								text "LOF : #{canine_rgt_1.lof}", :size => 11
							else
								text "# OTRO REGISTRO : #{canine_rgt_1.new_register}", :size => 11
							end
						end
					end

				end
				if @mother.lft
					@mother_lft = Canine.find(@mother.lft)
					bounding_box([270,190],:width =>400,:height =>370) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : #{newline(@mother_lft.name.upcase)}", :size => 11
						move_down 5
						if @mother_lft.kind == "0"
							text "LOF : #{@mother_lft.lof}", :size => 11
						else
							text "# OTRO REGISTRO : #{@mother_lft.new_register}", :size => 11
						end
					end
					if @mother_lft.lft
						can_left = Canine.find(@mother_lft.lft)
						bounding_box([545,290],:width =>400,:height =>370) do
							text "	NOMBRE : #{newline(can_left.name.upcase)}", :size => 11
							move_down 5
							if can_left.kind == "0"
								text "LOF : #{can_left.lof}", :size => 11
							else
								text "# OTRO REGISTRO : #{can_left.new_register}", :size => 11
							end
						end
					end
					if @mother_lft.rgt
						can_right = Canine.find(@mother_lft.rgt)
						bounding_box([545,230],:width =>400,:height =>370) do
							text "	NOMBRE : #{newline(can_right.name.upcase)}", :size => 11
							move_down 5
							if can_right.kind == "0"
								text "LOF : #{can_right.lof}", :size => 11
							else
								text "# OTRO REGISTRO : #{can_right.new_register}", :size => 11
							end
						end
					end
		
				end
			end
		#end
	end


end



