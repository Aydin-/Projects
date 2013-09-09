require 'geocoder'

# using haversine formula
# Solution by Aydin Gungordu - www.aydingungordu.com

print "Enter city 1: "
city1str = gets.chomp
print "Enter city 2: "
city2str = gets.chomp

city1 = Geocoder.search(city1str)
city2 = Geocoder.search(city2str)

lat1=city1[0].latitude
lat2=city2[0].latitude

lon1=city1[0].longitude
lon2=city2[0].longitude

Earth_radius=6371

 dLat = (lat2-lat1)* Math::PI / 180 
 dLon = (lon2-lon1)* Math::PI / 180 
 lat1 = lat1* Math::PI / 180 
 lat2 = lat2* Math::PI / 180 

 a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.sin(dLon/2) * Math.sin(dLon/2) * Math.cos(lat1) * Math.cos(lat2); 
 c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
 d = Earth_radius * c;


  print "Distance from %s to %s is %.04f km\n" % [city1str, city2str, d]
