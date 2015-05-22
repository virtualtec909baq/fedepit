json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :image, :status, :link
  json.url sponsor_url(sponsor, format: :json)
end
