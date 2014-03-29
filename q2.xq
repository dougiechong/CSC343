let $players := doc("players.xml")
let $non_distinct_players := for $i in 1 to count($players//player)
	       	 		 for $j in 1 to count($players//player)
				 (:	where($players//player[$i]/@fname = $players//player[$j]/@fname and
					      $players//player[$i]/@lname = $players//player[$j]/@lname and
					      $players//player[$i]/@id != $players//player[$j]/@id):)
	       		 	 return $i(:$players//player[$i]:)

return distinct-values($non_distinct_players) 

