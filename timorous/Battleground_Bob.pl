sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::say("Hail $name. We are looking for mighty level 50 adventurers such as yourself to join the war! Let me know if you would like to [" . quest::saylink("join") . "] the fight. Help fight for the future of norrath!");
    }
    elsif ($text=~/join/i) {
	if ($ulevel != 50) {
	    quest::say("I'm sorry $name, but you must be level 50 to participate in this battleground. Speak with Grabriel the Third if you like to learn more about gaining the powers of a level 50.");
	}
	else {
	    quest::say("Attempting to place you in battleground...");
	    if (defined $qglobals{"battleground_in_session"}) {
		quest::say("I'm sorry $name, but a battleground is in session. Please wait for the current battleground to finish.");
	    }
	    else {
		quest::movepc(58, 263.63,-483.92,5.72);
		quest::pvp("off");
	    }
	}
    }
}
