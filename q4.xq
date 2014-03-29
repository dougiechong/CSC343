let $c_that_lost := distinct-values(for $match in doc("matches.xml")/matches/match,
    		        		$team in doc("teams.xml")/teams/team
where ((($match/teams/team[1]/score < $match/teams/team[2]/score)
and ($match/teams/team[1]/@tid = $team/@tid))
or (($match/teams/team[1]/score > $match/teams/team[2]/score)
and ($match/teams/team[2]/@tid = $team/@tid)))
return distinct-values($team/@country))

for $country in $c_that_lost,
    $player in doc("players.xml")/players/player
where (($player/salary > 100000) and ($player/nationality/country = $country))

return $player/@pid
