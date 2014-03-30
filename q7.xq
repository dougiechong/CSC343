
(:Set up initial paths:)
let $p_married := doc("players.xml")/players/player[@married = "yes"]
let $match := doc("matches.xml")/matches/match
let $team := doc("teams.xml")/teams/team
(:Get repeated # of mids for the # of married players in a match:)
let $m_in_match := for $p in $p_married,
    		       $t in $team,
		       $m in $match
		   where (($p/@pid = $t/player/@pid) 
		   and ($m/teams/team/@tid = $t/@tid))
		   return $m/@mid
(:Count the repeated mids and format nicely:)
for $i in 1 to count($match)
return concat("Match #:", string($i), ", # of Married Players:", string(count($m_in_match[.= $i])))
