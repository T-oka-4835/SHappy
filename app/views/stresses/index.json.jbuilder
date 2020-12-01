json.array!(@events) do |event|
  json.extract! event, :id, :title
  json.start event.created_at
  json.url event_url(event, format: :html)
end