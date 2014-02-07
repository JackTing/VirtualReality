json.array!(@layers) do |layer|
  json.extract! layer, :name, :objectname
  json.url layer_url(layer, format: :json)
end
