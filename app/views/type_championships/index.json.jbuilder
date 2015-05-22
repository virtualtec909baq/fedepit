json.array!(@type_championships) do |type_championship|
  json.extract! type_championship, :id, :name
  json.url type_championship_url(type_championship, format: :json)
end
