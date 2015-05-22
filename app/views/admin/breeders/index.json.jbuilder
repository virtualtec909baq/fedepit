json.array!(@breeders) do |breeder|
  json.extract! breeder, :id, :type_breeder_id, :name, :phone, :email, :name_breed, :facebook, :twitter, :instagram, :web
  json.url breeder_url(breeder, format: :json)
end
