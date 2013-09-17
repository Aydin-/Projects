json.array!(@progress_webs) do |progress_web|
  json.extract! progress_web, :url
  json.url progress_web_url(progress_web, format: :json)
end
