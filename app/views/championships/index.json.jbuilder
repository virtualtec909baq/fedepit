json.array!(@championships) do |championship|
  json.extract! championship, :id, :type_championship_id, :date
  json.url championship_url(championship, format: :json)
end
