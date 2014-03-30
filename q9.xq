let $match := doc("matches.xml")/matches/match
let $team := doc("teams.xml")/teams/team

(:Get all tids that played in 2014 with multiplicity:)
let $teams_played_in_2014 := for $t in $team,
    				$m in $match
where (($t/@tid = $m/teams/team/@tid) and ($m/@year = "2014"))
return $t/@tid

(:Go through each team and count multiplicities:)
return element Stats {
for $t in $team
return 
	<Bar teamname="{data($t/name)}" 
count="{count($teams_played_in_2014[.=$t/@tid])}">
	</Bar>
}	


