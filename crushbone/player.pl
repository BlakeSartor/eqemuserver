$count = 0;
$battle = 0;
sub EVENT_ENTERZONE {
    $client->Message(4, "Waiting for other players to join. Please be patient...");
    $count++;    
        $client->Message(4, $count);
    if ($count >= 2) {
	quest::shout("Battle starting in 5 minutes...");
	$battle = 1;
    }

}

sub EVENT_ZONE {
    $count--;
    if ($count <= 1) {
	$battle = 0;
	quest::say("winner winner chicken dinner");
    }
}
