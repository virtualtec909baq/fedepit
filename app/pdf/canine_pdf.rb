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
	
	bounding_box([80,480],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 12
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 12
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 12
	end
	
	bounding_box([300,520],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end
	
	bounding_box([300,425],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end

	bounding_box([500,540],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
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

	bounding_box([80,370],:width =>350,:height =>150) do
		transparent(0,5) { stroke_bounds } 
		font "Helvetica" do
			text "De : #{@canine.name.upcase}"
	    	move_down 10
	    	text "LOF : #{@canine.lof}"
	    	move_down 10
	    	text "Sexo : #{gender(@canine.gender)}"
	    	move_down 10
	    	text "COLOR : #{@canine.color.name}"
	    	move_down 10
	    	text "Nacimiento : #{@canine.birth}"
	    	move_down 10
	    	text "No. Hermanos : #{@canine.id}"
	    end
	end
	bounding_box([80,180],:width =>400,:height =>370) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.rgt).name.upcase}"
		move_down 5
		text "COLOR : #{Canine.find(@canine.rgt).color.name}"
		move_down 5
		text "LOF : #{Canine.find(@canine.rgt).lof}"
	end
	bounding_box([300,135],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end
	bounding_box([300,205],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 10
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 10
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 10
	end
	bounding_box([500,230],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	bounding_box([500,185],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	bounding_box([500,130],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	bounding_box([500,80],:width =>400,:height =>450) do
		transparent(0) { stroke_bounds } 
		text "	NOMBRE : #{Canine.find(@canine.lft).name.upcase}", :size => 8
		move_down 5
		text "COLOR : #{Canine.find(@canine.lft).color.name}", :size => 8
		move_down 5
		text "LOF : #{Canine.find(@canine.lft).lof}", :size => 8
	end
	

 end

end



