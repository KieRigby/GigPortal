json.extract! event, :id, :title, :short_description, :long_description, :location, :location_tbc, :date, :date_tbc, :published, :created_at, :updated_at
json.url event_url(event, format: :json)
