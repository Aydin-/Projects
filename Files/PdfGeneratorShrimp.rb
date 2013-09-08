# Solution by Aydin Gungordu - www.aydingungordu.com

require 'shrimp'
url     = 'http://www.google.com'
options = { :margin => "1cm"}
Shrimp::Phantom.new(url, options).to_pdf("~/output.pdf")
