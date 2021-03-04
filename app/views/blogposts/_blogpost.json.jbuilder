json.extract! blogpost, :id, :title, :url, :summary, :body, :image, :active, :created_at, :updated_at
json.url blogpost_url(blogpost, format: :json)
