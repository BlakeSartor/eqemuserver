#Translocator for Multiple Zones

#Array for all available zones to be sent to
@ZoneList = qw(
	lopingplains
	emeraldjungle
	frontiermtns
	rathemtn
	westwastes
	eastwastes
	southkarana
	cazicthule
	akanon
	befallen
	blackburrow
	cabeast
	cabwest
	mistmoore
	chardok
	thurgadina
	veksar
	cobaltscar
	crystal
	dalnir
	necropolis
	dreadlands
	dulak
	freporte
	echo
	erudnext
	unrest
	everfrost
	fieldofbone
	fungusgrove
	greatdivide
	grobb
	guktop
	halas
	highkeep
	charasis
	paw
	kael
	kaesora
	karnor
	kurn
	lakeofillomen
	nurga
	soldungb
	najena
	nexus
	freportn
	nro
	oggok
	sebilis
	permafrost
	airplane
	fearplane
	growthplane
	hateplane
	mischiefplane
	qeytoqrg
	rivervale
	runnyeye
	shadowhaven
	skyshrine
	soldunga
	sro
	felwitheb
	ssratemple
	qrg
	acrylia
	arena
	burningwood
	citymist
	sharvahl
	nadox
	dawnshroud
	thegrey
	gunthak
	hole
	jaggedpine
	maiden
	overthere
	paludal
	hateplaneb
	scarlet
	umbral
	frozenshadow
	velketor
	vexthal
	warrens
	warslikswood
	freportw
);

sub EVENT_SAY{

	#Spacer between Text messages to make them easier to read
	$client->Message(7, "-");
	my $NPCName = $npc->GetCleanName();

	if ($text =~/Hail/i)
	{
		$client->Message(315, "$NPCName whispers to you, 'If there is a zone you would like to go to, just tell me the short name of it and I will see if I have a spell to send you there. If you do not know the full name, just type part of the name to search my list of possible zones.  Or, I can list [all] of them if you like.'");
	}

	#Counts each row for the While
	my $count = 1;

	#Counts each element in the Array for the While
	my $n = 0;

	
	if ($text !~ /Hail/i)
	{
		#Use scalar form of Array
		while ($ZoneList[$n])
		{
			#This uses the lc() function in perl to convert anything typed into all lowercase, since that is what the zone list is
			#If the zone name contains part of the text said, or if the player wants to list all possible zones we list them
			if (($ZoneList[$n] =~ lc($text) && $ZoneList[$n] ne lc($text)) || ($text =~ /^All$/i))
			{
				my $ZoneName = $ZoneList[$n];
				$client->Message(315, "$NPCName whispers to you, 'Possible match is: $ZoneName");
			}
			#If they say the full name of one of the zones in the Array, or click one of the saylinks, port them to the safe loc there
			if ($ZoneList[$n] eq lc($text) && $text !~ /^All$/i)
			{
				$client->Message(315, "$NPCName whispers to you, 'Enjoy your adventure!'");
				$client->Message(6, "$NPCName casts a spell to translocate you to another place.");
				quest::zone("$ZoneList[$n]");
			}
			$n++;
			$count++;
		}
	}
}
