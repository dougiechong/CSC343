for $team in doc("teams.xml")/teams/team,
    $player in doc("players.xml")/players/player
where (($team/coach/@cid = $team/player/@pid) and ($team/coach/@cid = $player/@pid))
return concat("Name:", string($player/@fname), " ", string($player/@lname),
", Salary:", string($player/salary), ", Team Name:", string($team/name))
