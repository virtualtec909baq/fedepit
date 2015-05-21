json.array!(@publicities) do |publicity|
  json.extract! publicity, :id, :image, :name, :status
  json.url publicity_url(publicity, format: :json)
end
