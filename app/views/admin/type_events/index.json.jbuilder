json.array!(@type_events) do |type_event|
  json.extract! type_event, :id, :name
  json.url type_event_url(type_event, format: :json)
end
