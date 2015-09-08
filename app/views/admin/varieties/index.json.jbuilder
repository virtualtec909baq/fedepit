json.array!(@varieties) do |variety|
  json.extract! variety, :id, :name
  json.url variety_url(variety, format: :json)
end
