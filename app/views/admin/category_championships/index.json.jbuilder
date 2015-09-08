json.array!(@category_championships) do |category_championship|
  json.extract! category_championship, :id, :race_id, :age_min, :age_max, :period, :variety_id
  json.url category_championship_url(category_championship, format: :json)
end
