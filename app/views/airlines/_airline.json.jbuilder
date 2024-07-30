json.extract! airline, :id, :name, :image_url, :slug, :created_at, :updated_at
json.url airline_url(airline, format: :json)
