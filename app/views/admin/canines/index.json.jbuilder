json.array!(@canines) do |canine|
  json.extract! canine, :id, :race_id, :breeder_id, :lof, :chip, :name, :gender, :color_id, :father_lof, :mother_lof, :rate, :birth, :death
  json.url canine_url(canine, format: :json)
end
