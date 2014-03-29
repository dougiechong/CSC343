for $location in doc("matches.xml")/matches/match/location
where (contains($location/city, $location/country) or contains($location/country, $location/city))
return ($location/city, $location/country)
