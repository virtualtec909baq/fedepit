json.array!(@races) do |race|
  json.extract! race, :id, :name, :description, :pdf
  json.url race_url(race, format: :json)
end
