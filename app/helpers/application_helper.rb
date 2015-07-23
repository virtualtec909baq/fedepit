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

	
	def get_left(canine)
		if canine.lft
			canine_lft = Canine.find(canine.lft)
			return canine_lft
		end
	end
	
	def get_rgt(canine)
		if canine.rgt
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
	
	def get_ancestors(canine)
		@tree ||= []
		if !canine.nil?
			@tree << get_id(canine)
			get_ancestors(get_left(canine))
			get_ancestors(get_rgt(canine))
			return @tree
		end
	end

	def get_ancestors_2(canine)
		@tree ||= []
		if !canine.nil?
			@tree << get_id(canine)
			get_ancestors_2(get_left(canine))
			get_ancestors_2(get_rgt(canine))
			return @tree
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
				get_nivel(get_left(canine),data,level +1)
				get_nivel(get_rgt(canine),data, level +1)
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
		return @graph.inspect
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

	def general_appearance(value)
		if value == 0
			return 'Excelente'
		elsif value == 1
			return 'Bueno'
		elsif value == 2
			return 'Insuficiente'
		end
	end

	def attitude(value)
		if value == 0
			return 'Excelente'
		elsif value == 1
			return 'Muy bueno'
		elsif value == 2
			return 'Bueno'	
		elsif value == 3
			return 'Insuficiente'
		end
	end

	def ears(value)
		if value == 0
			return 'Alta'
		elsif value == 1
			return 'Media'
		elsif value == 2
			return 'Baja'	
		end
	end

	def shape_ears(value)
		if value == 0
			return 'Cirugia E.'
		elsif value == 1
			return 'Triangular caida'
		elsif value == 2
			return 'Semi-caida'	
		elsif value == 3
			return 'Semi-recta'
		elsif value == 4
			return 'Rosa'
		end
	end
	def shape_eyes(value)
		if value == 0
			return 'Redondos'
		elsif value == 1
			return 'Almedrados'
		elsif value == 2
			return 'Ovalados'	
		elsif value == 3
			return 'Triangulares'	
		end
	end
	def eyes_placement(value)
		if value == 0
			return 'Saltones'
		elsif value == 1
			return 'Profundos'
		elsif value == 2
			return 'A nivel'	
		end
	end
	def color_eyes(value)
		if value == 0
			return 'Oscuros'
		elsif value == 1
			return 'Claros'
		elsif value == 2
			return 'Mixtos'	
		elsif value == 3
			return 'Rojos'
		elsif value == 4
			return 'Rojos'	
		end
	end
	def eyelid_abnormalities(value)
		if value == 0
			return 'Entropion'
		elsif value == 1
			return 'Ectropion'
		end
	end

	def head_measures(value)
		if value == 0
			return 'Dimensiones de craneo'
		elsif value == 1
			return 'Alto del craneo'
		elsif value == 2
			return 'Ancho del craneo'
		end
	end

	def flat_head(value)
		if value == 0
			return 'Divergente'
		elsif value == 1
			return 'Convergente'
		elsif value == 2
			return 'Paralelo'
		end
	end

	def head_shape(value)
		if value == 0
			return 'Corta y redonda'
		elsif value == 1
			return 'Acuñada'
		elsif value == 2
			return 'Braquicefala'
		elsif value == 3
			return 'Dolicocefala'
		elsif value == 4
			return 'Mesocefala'
		end
	end

	def head_stop(value)
		if value == 0
			return 'Agudo Marcado'
		elsif value == 1
			return 'Marcado con surco'
		elsif value == 2
			return 'Leve Inclinado'
		end
	end

	def snout(value)
		if value == 0
			return 'Largo'
		elsif value == 1
			return 'Corto'
		elsif value == 2
			return 'Chato'
		elsif value == 3
			return 'Chato e inclinado'
		end
	end

	def motion(value)
		if value == 0
			return 'Excelente'
		elsif value == 1
			return 'Excelente'
		elsif value == 2
			return 'Suficiente'
		end
	end

	def lips(value)
		if value == 0
			return 'De Belfos Pendulosos'
		elsif value == 1
			return 'De Belfos Apretados'
		elsif value == 2
			return 'Normales'
		end
	end

	def snout_2(value)
		if value == 0
			return 'Ato de Bozal'
		elsif value == 1
			return 'Longitud del bozal'
		elsif value == 2
			return 'En Punta'
		elsif value == 3
			return 'Terminado recto'
		elsif value == 4
			return 'Con arrugas visibles'
		end
	end
	
	def cigamatico_snout(value)
		if value == 0
			return 'Pronunciado'
		elsif value == 1
			return 'Moderado'
		elsif value == 2
			return 'Ausente'
		elsif value == 3
			return 'En Punta'
		end
	end

	def supracillares_snout(value)
		if value == 0
			return 'correcta tijera'
		elsif value == 1
			return 'Tijera inversa'
		elsif value == 2
			return 'Prognatismo Avanzado'
		elsif value == 3
			return 'Tenazas'
		elsif value == 4
			return 'Enognatismo'
		elsif value == 5
			return 'Cruzadas Anterior'
		end
	end
	
	def after_moving(value)
		if value == 0
			return 'Juntas de atras'
		elsif value == 1
			return 'Corvenjon inmovil'
		elsif value == 2
			return 'Roza corvejones'
		elsif value == 3
			return 'Rectos'
		end
	end

	def subsequent_static(value)
		if value == 0
			return 'Corvejones de vacas'
		elsif value == 1
			return 'Corecto'
		elsif value == 2
			return 'Corvejon inmovil'
		elsif value == 3
			return 'Rectos'
		end
	end

	def shaped_tail(value)
		if value == 0
			return 'Correcta'
		elsif value == 1
			return 'Partida'
		elsif value == 2
			return 'En espiral'
		elsif value == 3
			return 'Anudada'
		elsif value == 4
			return 'De Bulidog'
		elsif value == 5
			return 'Desviada'
		end
	end

	def tail_length(value)
		if value == 0
			return 'Correcta'
		elsif value == 1
			return 'Larga'
		elsif value == 2
			return 'Corta'
		end
	end

	def tail_movement(value)
		if value == 0
			return 'horizontal'
		elsif value == 1
			return 'Vertical'
		elsif value == 2
			return 'Caida Normal'
		end
	end
	
	def muscle_quality(value)
		if value == 0
			return '5 estrellas'
		elsif value == 1
			return '4 estrellas'
		elsif value == 2
			return '3 estrellas'
		elsif value == 3
			return 'Insuficiente'
		elsif value == 4
			return 'Gordo'
		elsif value == 5
			return 'Por debajo de su peso'
		end
	end

	def teeth(value)
		if value == 0
			return 'Completa'
		elsif value == 1
			return 'Incompleta'
		end
	end
	
	def deciduous_tooth(value)
		if value == 0
			return 'Recta'
		elsif value == 1
			return 'En Arco'
		elsif value == 2
			return 'Desalineados'
		end
	end

	def canines(value)
		if value == 0
			return 'Tamaño Normal'
		elsif value == 1
			return 'Muy Pequeños'
		elsif value == 2
			return 'Fracturados'
		end
	end

	def molar_tooth(value)
		if value == 0
			return 'Tamaño Normal'
		elsif value == 1
			return 'Muy Pequeños'
		end
	end

	def premolar_tooth(value)
		if value == 0
			return 'Tamaño Normal'
		elsif value == 1
			return 'Muy Pequeños'
		end
	end
       
    def jowl(value)
		if value == 0
			return 'Visible'
		elsif value == 1
			return 'Exagerada'
		elsif value == 2
			return 'Limpia'
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








