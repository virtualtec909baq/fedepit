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
					feature_json = child.feature.as_json(except: [:id, :created_at, :updated_at, :canine_id])
					feature_json.each do |key , value|
						if !value.nil?
							create_json = [key, value]	
							@hash_to_json = Hash[*create_json]
							@array_child_features << @hash_to_json
						end
					end
					$total_children = @children.count
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
					@features_count["#{key}-#{value}"] += 1
				end
        	end
        	if !@array_prom_features.empty?
				@features_count = @features_count.sort_by {|key, value| key}
				return @features_count
			end
		end
	end
end


def names(key)
	ksplit = key.split('-')
	if ksplit[0] == "appearance"
		if ksplit[1] == "0" 
			return "Apariencia Normal"
		end
		if ksplit[1] == "1" 
			return "Curva Fuerte y Muscular"
		end
	elsif ksplit[0] == "flat_head"
		if ksplit[1] == "0" 
			return "Planos De Cabeza Divergente"
		end
		if ksplit[1] == "1" 
			return "Planos De Cabeza Convergente"
		end
		if ksplit[1] == "2" 
			return "Planos De Cabeza Paralelo"
		end
	elsif ksplit[0] == "general_appearance"
		if ksplit[1] == "0" 
			return "Apariencia General Excelente"
		end
		if ksplit[1] == "1" 
			return "Apariencia General Muy Buena"
		end
		if ksplit[1] == "2" 
			return "Apariencia General Buena"
		end
		if ksplit[1] == "3" 
			return "Apariencia General Insuficiente"
		end
	elsif ksplit[0] == "height"
		return "Largo de #{ksplit[1]} cms"
	elsif ksplit[0] == "length"
		return "Longitud de #{ksplit[1]} cms"
	elsif ksplit[0] == "shoulder"
		if ksplit[1] == "0" 
			return "Hombros Cargados"
		end
		if ksplit[1] == "1" 
			return "Hombros Medios"
		end
		if ksplit[1] == "2" 
			return "Hombros Alargados"
		end
		if ksplit[1] == "3" 
			return "Hombros Planos"
		end
	elsif ksplit[0] == "torax_length"
		return "Longitud Del Torax"
	elsif ksplit[0] == "typical_head"
		if ksplit[1] == "0"
			return "Tipicidad Cabeza Ecxelente"
		end
		if ksplit[1] == "1"
			return "Tipicidad Cabeza Buena"
		end
		if ksplit[1] == "2"
			return "Tipicidad Cabeza Insuficiente"
		end
	elsif ksplit[0] == "ears"
		if ksplit[1] == "0"
			return "Inserción Oreja Alta"
		end
		if ksplit[1] == "1"
			return "Inserción Oreja Media"
		end
		if ksplit[1] == "2"
			return "Inserción Oreja Baja"
		end
	elsif ksplit[0] == "shape_ears"
		if ksplit[1] == "0"
			return "Forma De Oreja Cirugia E."
		end
		if ksplit[1] == "1"
			return "Forma De Oreja Triangular Caída"
		end
		if ksplit[1] == "2"
			return "Forma De Oreja Semi-Caída"
		end
		if ksplit[1] == "3"
			return "Forma De Oreja Semi-Erecta"
		end
		if ksplit[1] == "4"
			return "Forma De Oreja Rosa"
		end
	elsif ksplit[0] == "shape_eyes"
		if ksplit[1] == "0"
			return "Forma De Ojos Redondos"
		end
		if ksplit[1] == "1"
			return "Forma De Ojos Almendrados"
		end
		if ksplit[1] == "2"
			return "Forma De Ojos Ovalados"
		end
		if ksplit[1] == "3"
			return "Forma De Ojos Triangulares"
		end
	elsif ksplit[0] == "eyes_placement"
		if ksplit[1] == "0"
			return "Colocación De Ojos Saltones"
		end
		if ksplit[1] == "1"
			return "Colocación De Ojos Profundos"
		end
		if ksplit[1] == "2"
			return "Colocación De Ojos A Nivel"
		end
	elsif ksplit[0] == "color_eyes"
		if ksplit[1] == "0"
			return "Color De Ojos Oscuros"
		end
		if ksplit[1] == "1"
			return "Color De Ojos Claros"
		end
		if ksplit[1] == "2"
			return "Color De Ojos Mixtos"
		end
		if ksplit[1] == "3"
			return "Color De Ojos Rojos"
		end
		if ksplit[1] == "4"
			return "Color De Ojos Nublados"
		end
	elsif ksplit[0] == "eyelid_abnormalities"
		if ksplit[1] == "0"
			return "Anomalías Del Parpado Entropión"
		end
		if ksplit[1] == "1"
			return "Anomalías Del Parpado Ectropión"
		end
		if ksplit[1] == "2"
			return "Anomalías Del Parpado Alteración"
		end
	elsif ksplit[0] == "neck"
		if ksplit[1] == "0"
			return "Longitud Del Cuello Corto"
		end
		if ksplit[1] == "1"
			return "Longitud Del Cuello Medio"
		end
		if ksplit[1] == "2"
			return "Longitud Del Cuello Alto"
		end
	elsif ksplit[0] == "teeth"
		if ksplit[1] == "0"
			return "Dentadura Completa"
		end
		if ksplit[1] == "1"
			return "Dentadura Incompleta"
		end	
	elsif ksplit[0] == "deciduous_tooth"
		if ksplit[1] == "0"
			return "Alineación Incisivos Recto"
		end
		if ksplit[1] == "1"
			return "Alineación Incisivos En Arco"
		end
		if ksplit[1] == "2"
			return "Alineación Incisivos Desalineados"
		end
	elsif ksplit[0] == "canines"
		if ksplit[1] == "0"
			return "Caninos Tamaño Normal"
		end
		if ksplit[1] == "1"
			return "Caninos Muy Pequeños"
		end
		if ksplit[1] == "2"
			return "Caninos Fracturados"
		end
	elsif ksplit[0] == "molar_tooth"
		if ksplit[1] == "0"
			return "Molares Tamaño Normal"
		end
		if ksplit[1] == "1"
			return "Molares Muy Pequeños"
		end
	elsif ksplit[0] == "premolar_tooth"
		if ksplit[1] == "0"
			return "Premolares Tamaño Normal"
		end
		if ksplit[1] == "1"
			return "Premolares Muy Pequeños"
		end
	elsif ksplit[0] == "deciduous"
		if ksplit[1] == "0"
			return "Temporales Pronunciados"
		end
		if ksplit[1] == "1"
			return "Temporales Moderados"
		end	
		if ksplit[1] == "2"
			return "Temporales Leves"
		end	
	elsif ksplit[0] == "jowl"
		if ksplit[1] == "0"
			return "Papada Visible"
		end
		if ksplit[1] == "1"
			return "Papada Exagerada"
		end	
		if ksplit[1] == "2"
			return "Papada Limpia"
		end	
	elsif ksplit[0] == "moving_poise"
		if ksplit[1] == "0"
			return "Aplomos En Movimiento Codos Salidos Hacia Afuera"
		end
		if ksplit[1] == "1"
			return "Aplomos En Movimiento Cruzamiento De Metacarpos"
		end	
		if ksplit[1] == "2"
			return "Aplomos En Movimiento Torsión De Las Manos"
		end	
		if ksplit[1] == "3"
			return "Aplomos En Movimiento Hacia Afuera"
		end	
	elsif ksplit[0] == "static_poise"
		if ksplit[1] == "0"
			return "Aplomos Estaticos Codos Hacia Afuera"
		end
		if ksplit[1] == "1"
			return "Aplomos Estaticos Codos Hacia Adentro"
		end	
		if ksplit[1] == "2"
			return "Aplomos Estaticos Torsión De Las Manos Hacia Afuera"
		end
	elsif ksplit[0] == "chest"
		if ksplit[1] == "0"
			return "Pecho Profundo"
		end
		if ksplit[1] == "1"
			return "Pecho Plano"
		end	
		if ksplit[1] == "2"
			return "Pecho Amplio"
		end	
	elsif ksplit[0] == "motion"
		if ksplit[1] == "0"
			return "Movimiento Excelente"
		end
		if ksplit[1] == "1"
			return "Movimiento Bueno"
		end	
		if ksplit[1] == "2"
			return "Movimiento Suficiente"
		end	
	end
end







