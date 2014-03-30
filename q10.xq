let $team := doc("teams.xml")/teams/team

(:Go through all countries in teams, count how many teams have attribute country:)
return element Stats {
for $c in distinct-values($team/@country)
return 
	<Bar country="{data($c)}" 
count="{count($team[@country = $c])}">
	</Bar>
}	

