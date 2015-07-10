class CaninePdf< Prawn::Document
	include ApplicationHelper

	def initialize(canine)
		super(:page_size => 'A4', page_layout: :landscape)
		@canine = canine
		
		# array pedigree
		@array_canine_level = []
		
		get_ancestors(@canine).each do |canine|
			nivel(@canine, canine)
			hash = [canine, $level]
			hash_canine_level = Hash[*hash]
			@array_canine_level << hash_canine_level
		end
		@array_canine_level =  @array_canine_level.reduce Hash.new, :merge
		@array_canine_level = @array_canine_level.sort_by {|_key, value| value}.to_h 
	    # first page 
	    move_down 45
	    # image open("http://www.sabiask.com/images/Image/perro.jpg")

	    bounding_box([470,430],:width =>400,:height =>450) do 
	    	transparent(0) { stroke_bounds }
	    	text "#{}"
	    	move_down 60
	    	text "	NOMBRE : #{@canine.name.upcase}"
	    	move_down 15
	    	text "RAZA : #{@canine.race.name.upcase}"
	    	move_down 15
	    	text "SEXO : #{gender(@canine.gender)}"
	    	move_down 15
	    	text "NACIMIENTO : #{@canine.birth}"
	    	move_down 15
	    	text "COLOR : #{@canine.color.name}"
	    	move_down 15
	    	text "LOF : #{@canine.lof}"
	    	move_down 15
	    	text "PROPIETARIO : #{@canine.breeder.name.upcase}"
	    	move_down 15
	    	text "FECHA DE REGISTRO : #{@canine.created_at.strftime("%m-%d-%Y")}"
	    end
		
		# second page
		start_new_page(:size => "A4", :layout => :landscape)
		# pedigree lines 
		line [10,380],[10,458]
		stroke
		line [10,458],[22,458]
		stroke
		line [280,420],[280,505]
		stroke
		line [280,420],[300,420]
		stroke
		line [280,505],[300,505]
		stroke
		line [475,475],[475,520]
		stroke
		line [475,520],[490,520]
		stroke
		line [475,475],[490,475]
		stroke

		line [475,360],[475,410]
		stroke
		line [475,360],[490,360]
		stroke
		line [475,410],[490,410]
		stroke

		line [10,118],[10,210]
		stroke
		line [10,118],[22,118]
		stroke

		line [280,90],[280,170]
		stroke
		line [280,170],[300,170]
		stroke
		line [280,90],[300,90]
		stroke
		
		line [475,211],[475,264]
		stroke
		line [475,264],[490,264]
		stroke
		line [475,211],[490,211]
		stroke

		line [475,80],[475,133]
		stroke
		line [475,133],[490,133]
		stroke
		line [475,80],[490,80]
		stroke
		
		bounding_box([10,360],:width =>350,:height =>130) do
			transparent(0,5) { stroke_bounds } 
			font "Helvetica" do
				text "De : #{@canine.name.upcase}", :size => 10
				move_down 8
				text "LOF : #{@canine.lof}", :size => 10
				move_down 8
				text "Sexo : #{gender(@canine.gender)}", :size => 10
				move_down 8
				text "COLOR : #{@canine.color.name}", :size => 10
				move_down 8
				text "Nacimiento : #{@canine.birth}", :size => 10
				move_down 8
				text "No. Hermanos : #{siblings(@canine.id).count}", :size => 10
			end
		end

		# Father pedigree
		if @canine.lft
			@father = Canine.find(@canine.lft)
			bounding_box([30,480],:width =>400,:height =>450) do
				transparent(0) { stroke_bounds } 
				text "	NOMBRE : #{@father.name.upcase}", :size => 12
				move_down 5
				text "COLOR : #{@father.color.name}", :size => 12
				move_down 5
				text "LOF : #{@father.lof}", :size => 12
			end
		else
			bounding_box([30,480],:width =>400,:height =>450) do
				transparent(0) { stroke_bounds } 
				text "	NOMBRE : NO TIENE PAPA", :size => 12
				move_down 5
				text "COLOR :  NO TIENE PAPA", :size => 12
				move_down 5
				text "LOF : NO TIENE PAPA", :size => 12
			end
		end
		
		# Mother pedigree
		if @canine.rgt
			@mother = Canine.find(@canine.rgt)
			bounding_box([30,140],:width =>400,:height =>370) do
				transparent(0) { stroke_bounds } 
				text "	NOMBRE : #{Canine.find(@canine.rgt).name.upcase}"
				move_down 5
				text "COLOR : #{Canine.find(@canine.rgt).color.name}"
				move_down 5
				text "LOF : #{Canine.find(@canine.rgt).lof}"
			end
		else
			bounding_box([30,140],:width =>400,:height =>370) do
				transparent(0) { stroke_bounds } 
				text "	NOMBRE : NO TIENE MAMA"
				move_down 5
				text "COLOR : NO TIENE MAMA"
				move_down 5
				text "LOF : NO TIENE MAMA"
			end
		end
		
		if @array_canine_level.size > 3 

			if @canine.lft
				@father = Canine.find(@canine.lft)
				if @father.lft
					@father_lft = Canine.find(@father.lft)
					
					if @father_lft.lft
						@father_lft_lft = Canine.find(@father.lft)
						bounding_box([310,520],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{@father_lft_lft.name.upcase}", :size => 10
							move_down 5
							text "COLOR : #{@father_lft_lft.color.name}", :size => 10
							move_down 5
							text "LOF : #{@father_lft_lft.lof}", :size => 10
						end
						if @father_lft_lft.lft
							bounding_box([500,540],:width =>400,:height =>450) do
								transparent(0) { stroke_bounds } 
								text "NOMBRE : #{Canine.find(@father_lft_lft.lft).name.upcase}", :size => 8
								move_down 5
								text "COLOR : #{Canine.find(@father_lft_lft.lft).color.name}", :size => 8
								move_down 5
								text "LOF : #{Canine.find(@father_lft_lft.lft).lof}", :size => 8
							end
						else
							bounding_box([500,540],:width =>400,:height =>450) do
								transparent(0) { stroke_bounds } 
								text "	NOMBRE : NO TIENE TATARABUELO PATERNO", :size => 8
								move_down 5
								text "COLOR : NO TIENE TATARABUELO PATERNO", :size => 8
								move_down 5
								text "LOF :NO TIENE TATARABUELO PATERNO", :size => 8
							end
						end
						if @father_lft_lft.rgt
							bounding_box([500,490],:width =>400,:height =>450) do
								transparent(0) { stroke_bounds } 
								text "NOMBRE : #{Canine.find(@father_lft_lft.rgt).name.upcase}", :size => 8
								move_down 5
								text "COLOR : #{Canine.find(@father_lft_lft.rgt).color.name}", :size => 8
								move_down 5
								text "LOF : #{Canine.find(@father_lft_lft.rgt).lof}", :size => 8
							end	
						else
							bounding_box([500,490],:width =>400,:height =>450) do
								transparent(0) { stroke_bounds } 
								text "	NOMBRE : NO TIENE TATARABUELA PATERNO", :size => 8
								move_down 5
								text "COLOR : NO TIENE TATARABUELA PATERNO", :size => 8
								move_down 5
								text "LOF :NO TIENE TATARABUELA PATERNO", :size => 8
							end	
						end
					else
						bounding_box([500,540],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : NO TIENE TATARABUELO PATERNO", :size => 8
							move_down 5
							text "COLOR : NO TIENE TATARABUELO PATERNO", :size => 8
							move_down 5
							text "LOF :NO TIENE TATARABUELO PATERNO", :size => 8
						end
						bounding_box([500,490],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : NO TIENE TATARABUELA PATERNO", :size => 8
							move_down 5
							text "COLOR : NO TIENE TATARABUELA PATERNO", :size => 8
							move_down 5
							text "LOF :NO TIENE TATARABUELA PATERNO", :size => 8
						end
						
					end
				else
					bounding_box([310,520],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE ABUELO PATERNO", :size => 10
						move_down 5
						text "COLOR : NO TIENE ABUELO PATERNO", :size => 10
						move_down 5
						text "LOF : NO TIENE ABUELO PATERNO", :size => 10
					end
					bounding_box([310,440],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE ABUELA PATERNO", :size => 10
						move_down 5
						text "COLOR : NO TIENE ABUELA PATERNO", :size => 10
						move_down 5
						text "LOF : NO TIENE ABUELA PATERNO", :size => 10
					end
					bounding_box([500,540],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE BISABUELO PATERNO", :size => 8
						move_down 5
						text "COLOR : NO TIENE BISABUELO PATERNO", :size => 8
						move_down 5
						text "LOF :NO TIENE BISABUELO PATERNO", :size => 8
					end
					bounding_box([500,490],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE BISABUELA PATERNO", :size => 8
						move_down 5
						text "COLOR : NO TIENE BISABUELA PATERNO", :size => 8
						move_down 5
						text "LOF :NO TIENE BISABUELA PATERNO", :size => 8
					end
					bounding_box([500,425],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE BISABUELO PATERNO", :size => 8
						move_down 5
						text "COLOR : NO TIENE BISABUELO PATERNO", :size => 8
						move_down 5
						text "LOF :NO TIENE BISABUELO PATERNO", :size => 8
					end
					bounding_box([500,370],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE BISABUELA PATERNO", :size => 8
						move_down 5
						text "COLOR : NO TIENE BISABUELA PATERNO", :size => 8
						move_down 5
						text "LOF :NO TIENE BISABUELA PATERNO", :size => 8
					end
				end
				if @father.rgt
					@father_rgt = Canine.find(@father.rgt)
					bounding_box([310,440],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : #{@father_rgt.name.upcase}", :size => 10
						move_down 5
						text "COLOR : #{@father_rgt.color.name}", :size => 10
						move_down 5
						text "LOF : #{@father_rgt.lof}", :size => 10
					end
					if @father_rgt.lft
						bounding_box([500,425],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{Canine.find(@father_rgt.lft).name.upcase}", :size => 8
							move_down 5
							text "COLOR : #{Canine.find(@father_rgt.lft).color.name}", :size => 8
							move_down 5
							text "LOF : #{Canine.find(@father_rgt.lft).lof}", :size => 8
						end
					else
						bounding_box([500,425],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : NO TIENE TATARABUELO PATERNO", :size => 8
							move_down 5
							text "COLOR : NO TIENE TATARABUELO PATERNO", :size => 8
							move_down 5
							text "LOF : NO TIENE TATARABUELO PATERNO", :size => 8
						end
					end
					if @father_rgt.rgt
						bounding_box([500,380],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : #{Canine.find(@father_rgt.rgt).name.upcase}", :size => 8
							move_down 5
							text "COLOR : #{Canine.find(@father_rgt.rgt).color.name}", :size => 8
							move_down 5
							text "LOF : #{Canine.find(@father_rgt.rgt).lof}", :size => 8
						end
					else
						bounding_box([500,380],:width =>400,:height =>450) do
							transparent(0) { stroke_bounds } 
							text "	NOMBRE : NO TIENE TATARABUELA PATERNO", :size => 8
							move_down 5
							text "COLOR : NO TIENE TATARABUELA PATERNO", :size => 8
							move_down 5
							text "LOF : NO TIENE TATARABUELA PATERNO", :size => 8
						end

					end


				else
					bounding_box([310,440],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE ABUELA", :size => 10
						move_down 5
						text "COLOR : NO TIENE ABUELA", :size => 10
						move_down 5
						text "LOF : NO TIENE ABUELA", :size => 10
					end
					bounding_box([500,425],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE TATARABUELA", :size => 8
						move_down 5
						text "COLOR : NO TIENE TATARABUELA", :size => 8
						move_down 5
						text "LOF : NO TIENE TATARABUELA", :size => 8
					end
					bounding_box([500,380],:width =>400,:height =>450) do
						transparent(0) { stroke_bounds } 
						text "	NOMBRE : NO TIENE TATARABUELO", :size => 8
						move_down 5
						text "COLOR : NO TIENE TATARABUELO", :size => 8
						move_down 5
						text "LOF : NO TIENE TATARABUELO", :size => 8
					end
				end
			else
				bounding_box([310,520],:width =>400,:height =>450) do
					transparent(0) { stroke_bounds } 
					text "	NOMBRE : NO TIENE ABUELO PATERNO", :size => 10
					move_down 5
					text "COLOR : NO TIENE ABUELO PATERNO", :size => 10
					move_down 5
					text "LOF : NO TIENE ABUELO PATERNO", :size => 10
				end
				bounding_box([310,440],:width =>400,:height =>450) do
					transparent(0) { stroke_bounds } 
					text "	NOMBRE : NO TIENE ABUELA PATERNO", :size => 10
					move_down 5
					text "COLOR : NO TIENE ABUELA PATERNO", :size => 10
					move_down 5
					text "LOF : NO TIENE ABUELA PATERNO", :size => 10
				end
				bounding_box([500,540],:width =>400,:height =>450) do
					transparent(0) { stroke_bounds } 
					text "	NOMBRE : NO TIENE BISABUELO PATERNO", :size => 8
					move_down 5
					text "COLOR : NO TIENE BISABUELO PATERNO", :size => 8
					move_down 5
					text "LOF :NO TIENE BISABUELO PATERNO", :size => 8
				end
				bounding_box([500,490],:width =>400,:height =>450) do
					transparent(0) { stroke_bounds } 
					text "	NOMBRE : NO TIENE BISABUELA PATERNO", :size => 8
					move_down 5
					text "COLOR : NO TIENE BISABUELA PATERNO", :size => 8
					move_down 5
					text "LOF :NO TIENE BISABUELA PATERNO", :size => 8
				end
				bounding_box([500,425],:width =>400,:height =>450) do
					transparent(0) { stroke_bounds } 
					text "	NOMBRE : NO TIENE BISABUELO PATERNO", :size => 8
					move_down 5
					text "COLOR : NO TIENE BISABUELO PATERNO", :size => 8
					move_down 5
					text "LOF :NO TIENE BISABUELO PATERNO", :size => 8
				end
				bounding_box([500,370],:width =>400,:height =>450) do
					transparent(0) { stroke_bounds } 
					text "	NOMBRE : NO TIENE BISABUELA PATERNO", :size => 8
					move_down 5
					text "COLOR : NO TIENE BISABUELA PATERNO", :size => 8
					move_down 5
					text "LOF :NO TIENE BISABUELA PATERNO", :size => 8
				end
			end

			# if @canine.rgt
			# 	@mother = Canine.find(@canine.rgt)
			# end
		
			
		end

		
	end


end



