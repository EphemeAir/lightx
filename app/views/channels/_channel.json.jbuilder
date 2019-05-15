json.extract! channel, :id, :yt_id, :name, :description, :thumbnail_url, :published_at, :created_at, :updated_at
json.url channel_url(channel, format: :json)
