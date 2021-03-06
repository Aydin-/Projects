require 'net/http'
require 'uri'
 
def download(url)
	Thread.new do
		thread = Thread.current
		body = thread[:body] = []
		url = URI.parse url
		Net::HTTP.new(url.host, url.port).request_get(url.path) do |response|
			length = thread[:length] = response['Content-Length'].to_i
			 
			response.read_body do |fragment|
				body << fragment
				thread[:done] = (thread[:done] || 0) + fragment.length
				thread[:progress] = thread[:done].quo(length) * 100
			end
		end
	end
end
 
thread = download 'http://ipv4.download.thinkbroadband.com:8080/1GB.zip'
puts "%.2f%%" % thread[:progress].to_f until thread.join 1
puts "done"