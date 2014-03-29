let $p_married := doc("players.xml")/players/player[@married = "yes"]
let $match := doc("matches.xml")/matches/match
let $team := doc("teams.xml")/teams/team
let $m_in_match := for $p in $p_married,
    		       $t in $team,
		       $m in $match
		   where (($p/@pid = $t/player/@pid) 
		   and ($m/teams/team/@tid = $t/@tid))
		   order by $m/@mid
		   return $m/@mid
for $i in 1 to count($match)
return concat("Match #:", string($i), ", # of Married Players:", string(count($m_in_match[.= $i])))

(:return count(distinct-values($m_on_team)):)
(:for $pmatch in distinct-values($pmatches)
return ($pmatch, count($pmatch)):)
