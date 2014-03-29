for $player in doc("players.xml")/players/player 
where (count($player/nationality/country)>1)
return ($player/@fname, $player/@lname)
