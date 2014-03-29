for $team in doc("teams.xml")/teams/team,
    $player in doc("players.xml")/players/player
where (($player/@pid = $team/player/@pid) and (sum($player/salary) > $team/budget))
return string($team/name)
