let $match := doc("matches.xml")/matches/match
let $team := doc("teams.xml")/teams/team

(:Get all teams that played in matches:)
let $teams_in_matches := for $t in $match/teams/team
 	      		 return $t

(:see which team lost and see if budget is higher:)
for $t in $team,
    $t2 in $team,
    $m at $i in $match
where ((($teams_in_matches[2*$i - 1]/score < $teams_in_matches[2*$i]/score)
and ($t/@tid = $teams_in_matches[2*$i - 1]/@tid)
and ($t2/@tid = $teams_in_matches[2*$i]/@tid)
and (xs:integer($t/budget) > xs:integer($t2/budget)))
or (($teams_in_matches[2*$i - 1]/score > $teams_in_matches[2*$i]/score)
and ($t/@tid = $teams_in_matches[2*$i - 1]/@tid)
and ($t2/@tid = $teams_in_matches[2*$i]/@tid)
and (xs:integer($t/budget) < xs:integer($t2/budget))))

return concat("MID: ", string($m/@mid))

