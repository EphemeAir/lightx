json.extract! video, :id, :yt_id, :name, :description, :thumbnail_url, :published_at, :created_at, :updated_at
json.url video_url(video, format: :json)
