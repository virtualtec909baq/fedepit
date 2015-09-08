json.array!(@shows) do |show|
  json.extract! show, :id, :entity_id, :place, :name, :date
  json.url show_url(show, format: :json)
end
