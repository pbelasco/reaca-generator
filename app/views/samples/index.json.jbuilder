json.array!(@samples) do |sample|
  json.extract! sample, :id, :body
  json.url sample_url(sample, format: :json)
end
