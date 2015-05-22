json.array!(@events) do |event|
  json.extract! event, :id, :type_event_id, :name, :description, :date, :place
  json.url event_url(event, format: :json)
end
