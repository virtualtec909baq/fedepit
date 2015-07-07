class CaninePdf< Prawn::Document

  def initialize(canine)
    super()
    @canine = canine
    bounding_box([100,300], :width => 300 , :height => 200) do
    	stroke_bounds
    end
    text "#{@canine.name}",:size => 12, :style => :bold, :text_aling => :center
  end

end