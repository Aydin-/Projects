# Page Scraper - Create an application which connects to a site and pulls out all links, or images, and saves them to
# a list. Optional: Organize the indexed content and don’t allow duplicates. Have it put the results into an easily
# searchable index file.

require "nokogiri"
require "open-uri"

print 'Enter URL:'
url=gets

print "Scrape for: \n"
print "1. Links\n"
print "2. Images\n"
print "3. Both\n"
choice = gets

page = Nokogiri::HTML(open(url))

# print page
#print choice

if choice.to_i == 2 || 3
	print "scanning images.."
	# Nokogiri supports CSS-style selectors
	imagesXpath = page.xpath("//img")
	puts imagesXpath 
end
if choice.to_i == 1 || 3
	print "scanning links.."
	# And XPath selectors
	linksXpath = page.xpath("//a")
	puts linksXpath 
end

