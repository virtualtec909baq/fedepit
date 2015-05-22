json.array!(@type_breeders) do |type_breeder|
  json.extract! type_breeder, :id, :name
  json.url type_breeder_url(type_breeder, format: :json)
end
