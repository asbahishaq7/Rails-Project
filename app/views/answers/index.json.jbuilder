json.array!(@answers) do |answer|
  json.extract! answer, :id, :detail
  json.url answer_url(answer, format: :json)
end
