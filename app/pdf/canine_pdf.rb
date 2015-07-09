class CaninePdf< Prawn::Document
	include ApplicationHelper

  def initialize(canine)
    super(:page_size => 'A4', page_layout: :landscape)
    @canine = canine
    # Primera Pagina certificacion
    move_down 45
    # image open("http://www.sabiask.com/images/Image/perro.jpg")
    y_position = 430
    bounding_box([470,y_position],:width =>400,:height =>450) do 
    	transparent(0) { stroke_bounds }
    	text "#{Time.now.strftime("%Y")}"
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
	# Segunda Pagina pedigree
	start_new_page(:size => "A4", :layout => :landscape)
	
	line [10,380],[10,458]
	stroke
	line [10,458],[22,458]
	stroke
	bounding_box([30,480],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 12
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 12
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 12
	end
	line [280,420],[280,505]
	stroke
	line [280,420],[300,420]
	stroke
	line [280,505],[300,505]
	stroke
	bounding_box([310,520],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end

	bounding_box([310,440],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end

	line [475,475],[475,520]
	stroke
	line [475,520],[490,520]
	stroke
	line [475,475],[490,475]
	stroke
	
	bounding_box([500,540],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	
	line [475,360],[475,410]
	stroke
	line [475,360],[490,360]
	stroke
	line [475,410],[490,410]
	stroke

	bounding_box([500,490],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	bounding_box([500,425],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end


	bounding_box([500,380],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end

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
	    	text "No. Hermanos : #{@canine.id}", :size => 10
	    end
	end
	
	line [10,118],[10,210]
	stroke
	line [10,118],[22,118]
	stroke
	bounding_box([30,140],:width =>400,:height =>370) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.rgt).name.upcase}"
		move_down 5
		text "COLOR : #{Canine.find(@canine.rgt).color.name}"
		move_down 5
		text "LOF : #{Canine.find(@canine.rgt).lof}"
	end
	
	bounding_box([310,115],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end
	line [280,90],[280,170]
	stroke
	line [280,170],[300,170]
	stroke
	line [280,90],[300,90]
	stroke
	
	
	bounding_box([310,190],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end


	bounding_box([500,280],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end

	line [475,211],[475,264]
	stroke
	line [475,264],[490,264]
	stroke
	line [475,211],[490,211]
	stroke
	
	bounding_box([500,230],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	

	bounding_box([500,150],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end

	line [475,80],[475,133]
	stroke
	line [475,133],[490,133]
	stroke
	line [475,80],[490,80]
	stroke
	
	bounding_box([500,100],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	

 end

end



