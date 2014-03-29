let $players := doc("players.xml")/players/player
(:Need to self-join to use distinct-values on entire result:)
let $dup_names := distinct-values(for $player1 in $players,
    		    		      $player2 in $players
				  where($player1/@fname = $player2/@fname and
					$player1/@lname = $player2/@lname and
					$player1/@pid != $player2/@pid)
		return concat(string($player1/@fname), " ", string($player1/@lname)))
return $dup_names


