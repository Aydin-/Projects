json.array!(@pdf_generators) do |pdf_generator|
  json.extract! pdf_generator, :url, :filepath, :fd1, :fd2
  json.url pdf_generator_url(pdf_generator, format: :json)
end
