# Solution by Aydin Gungordu - www.aydingungordu.com

require "pdfkit"
require "nokogiri"
require "open-uri"

print 'Enter URL:'
url=gets

page = Nokogiri::HTML(open(url))

kit = PDFKit.new(url)
kit.to_file("my_web_site.pdf")