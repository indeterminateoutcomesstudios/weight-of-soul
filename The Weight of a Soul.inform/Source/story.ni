"The Weight of a Soul" by Chin Kee Yong

The story headline is "A study of the ars vitalis".
The story genre is "Fantasy".
The release number is 150417.
The story description is "In a world of arcane mysteries, a young doctor's apprentice unravels a conspiracy most grim."
The story creation year is 2017.

[






S P O I L E R   W A R N I N G

The source code of The Weight of a Soul is hosted on GitHub for backup purposes.

If you read on, there WILL be massive spoilers.

You have been warned.




























]

Volume 1 - Preamble

[---TO DO---

- Write Webster's dialogue
- Write Crow's Nest

- Write end of Day Two

- Write Midnight
- Write Day Three
- Write Day Four
- Write Epilogue

- Implement the Map]

Book 1.1 - Miscellany

Part 1.1.1 - Use Options

Use American dialect and the serial comma.
Use MAX_ARRAYS of 20000.
Use MAX_DICT_ENTRIES of 4000.
Use MAX_NUM_STATIC_STRINGS of 40000.
Use MAX_OBJECTS of 1280.
Use MAX_PROP_TABLE_SIZE of 400000.
Use MAX_STATIC_DATA of 1440000.
Use MAX_SYMBOLS of 40000.
Release along with a "Marid" website and the "SpookyQuixe" interpreter.

Part 1.1.2 - Extensions

Include Approaches by Emily Short.
Include Basic Screen Effects by Emily Short.
Include Menus by Emily Short.

Part 1.1.3 - Miscellaneous Functions

The update chronological records rule is not listed in any rulebook.

The previous location is a room that varies.
Before reading a command (this is the update previous location rule):
	now the previous location is the location.
	
[This is part of a general movement to reduce reliance on the "update chronological records" rule, which becomes really slow on Quixe if you have too many past tense checks in the game.]

To say wait for any key: wait for any key.

[This allows us to write it directly inside the text without having to rely on tedious substitutions. Dangerous for cases where the text may be expanded, but useful for dialogue trees and scripted events using tables.]

This is the rest of the turn rule:
	follow the scene changing rules;
	follow the every turn rules;
	abide by the timed events rule;
	abide by the advance time rule;
	abide by the adjust light rule;
	abide by the note object acquisitions rule;
	abide by the notify score changes rule;
	follow the scene changing rules.

[This is the turn sequence rules minus the part that parses and follows a command. We use the 'rest of the turn rule' later when we reject the player's command but still want to advance the turn.]

Understand "i" as 1.
Understand "ii" as 2.
Understand "iii" as 3.
Understand "iv" as 4.
Understand "v" as 5.
Understand "vi" as 6.
Understand "vii" as 7.
Understand "viii" as 8.
Understand "ix" as 9.
Understand "x" as 10.

[I dunno, flavor I guess.]

Part 1.1.4 - Tweaked Extension Functionality

A room can be goto-passable or goto-impassable. A room is usually goto-passable.

This is the new approach-heading selection rule:
	now approach-heading is the best route from the location to the noun through goto-passable visited rooms, using doors;
	if approach-heading is not a direction:
		now approach-heading is the best route from the location to the noun through goto-passable visited rooms, using even locked doors;
	if approach-heading is not a direction:
		now approach-heading is the best route from the location to the noun through visited rooms, using even locked doors;
		if approach-heading is a direction:
			say "You can't go back that way.";
			rule fails.
			
The new approach-heading selection rule is listed instead of the approach-heading selection rule in the approach-finding rules.

[This allows us to make certain rooms impassable for approaching on the fly, which is handy when the player is barred from entering certain rooms by means other than locked doors.]

The unlocking before opening rule is not listed in any rulebook. [I didn't really want to include Locksmith, or this behavior.]

Part 1.1.5 - Room Names

A room has some text called the simple-name.

Rule for printing the name of a room (called the room in question) while the player is hurrying:
	say "[if the simple-name of the room in question is not empty][simple-name of the room in question][otherwise][printed name of the room in question][end if]";

Rule for printing the name of a room (called the room in question) while asking which do you mean:
	say "[if the simple-name of the room in question is not empty][simple-name of the room in question][otherwise][printed name of the room in question][end if]";

The can't approach our current location rule response (A) is "You are already in [if the simple-name of the location is not empty][simple-name of the location][otherwise][printed name of the location][end if]."

[The default Inform behavior for printing the names of rooms is weird. This allows us to define an alternate string in certain cases.

It turns out we call the simple-name most of the time, so I never experienced the recursion case until a baffling bug involving Cadaver Walk and its lack of a simple-name. It turns out that the distinction between [the room in question] and [printed name of the room in question] is extremely fucking important.]

Part 1.1.6 - Ending Options

When play begins (this is the new final question options rule):
	choose row 1 in the Table of Final Question Options;
	now the final question wording entry is ">[bold type]restart[roman type]";
	choose row 2 in the Table of Final Question Options;
	now the final question wording entry is ">[bold type]restore[roman type] a saved story";
	choose row 3 in the Table of Final Question Options;
	now the final question wording entry is "see some suggestions for >[bold type]amusing[roman type] things to do";
	choose row 4 in the Table of Final Question Options;
	now the final question wording entry is ">[bold type]quit[roman type]";
	choose row 5 in the Table of Final Question Options;
	now the final question wording entry is ">[bold type]undo[roman type] the last command";
	
To to be continued:
	clear the screen;
	say "[paragraph break][paragraph break][paragraph break][line break]";
	center "T O";
	say paragraph break;
	center "B E";
	say paragraph break;
	center "C O N T I N U E D";
	wait for any key;
	clear the screen;
	end the story saying "The end... for now".

Part 1.1.7 - Debug Messages - Release for testing

After printing the banner text, say "[line break](This is an unfinished playtest build of [italic type]The Weight of a Soul[roman type]. Type >[bold type]playtest[roman type] to see a special message for playtesters like you.)";
	
Understand "playtest" as a mistake ("[tester-commands-text]").
Understand "skip commands" as a mistake ("[skip-commands-text]").

First after reading a command (this is the playtest comments rule):
	let T be "[the player's command]";
	if character number 1 in T is "*":
		say "Comment recorded.";
		reject the player's command.

To say tester-commands-text:
	say "When you start a playthrough, please type >[bold type]transcript[roman type]. This will save the text of your playthrough to your browser cache. When you're done, type >[bold type]load[roman type], click 'Edit', copy the text of your transcript, and send it to me. This helps me see what actions you tried out and which parts of the game you got stuck at.[paragraph break]";
	say "To leave a comment during your playthrough, type a command that begins with an asterisk (a [bold type]*[roman type] symbol). The game will ignore your command, but it will still be printed to the transcript. You can use this to point out typos, highlight specific problems, or simply comment on something you found noteworthy.[paragraph break]";
	say "The game includes a skip feature to instantly progress the story to various checkpoints. To see the currently available skip commands, type >[bold type]skip commands[roman type] (mild spoilers).[paragraph break]";
	say "I would love any feedback regarding your game experience, including feedback about the plot, the prose, the game mechanics, and any bugs you find. Comments, criticism, and suggestions are all welcome. As of this writing, I can be reached at [bold type]chinkeeyong@gmail.com[roman type].[paragraph break]";
	say "Thanks again for helping me playtest [italic type]The Weight of a Soul[roman type]![paragraph break]";
	say "-Chin Kee Yong".
	
To say skip-commands-text:
	say "The following commands can be used to skip to various parts of the game:[line break]";
	say "[line break][italic type]Prologue[roman type]";
	say "[line break]>[bold type]skip surgery[roman type]";
	say line break;
	say "[line break][italic type]Day One[roman type]";
	say "[line break]>[bold type]skip to day one[roman type]";
	say "[line break]>[bold type]skip to errands[roman type]";
	say "[line break]>[bold type]skip to censor[roman type]";
	say "[line break]>[bold type]skip shanty maze[roman type]";
	say "[line break]>[bold type]skip to mechanistry[roman type]";
	say "[line break]>[bold type]skip to first aid[roman type]";
	say "[line break]>[bold type]skip first aid[roman type]";
	say line break;
	say "[line break][italic type]Day Two[roman type]";
	say "[line break]>[bold type]skip to day two[roman type]";
	say "[line break]>[bold type]skip to endoscope[roman type]";
	say "[line break]>[bold type]skip to bodies[roman type]";
	say "[line break]>[bold type]skip to cellar[roman type]";

Book 1.2 - Days and Scenes

Part 1.2.1 - Scene Definitions

['The Weight of a Soul' uses days to demarcate the acts of the story, here implemented as overarching scenes.]

Chapter 1.2.1.1 - Prologue

[An opening in medias res, in which Marid and Cavala try and fail to save Reden -- the first victim of Noctis. Characters are introduced, and their capabilities are elaborated upon.]

Prologue is a scene.
Prologue begins when play begins.
Prologue ends when Walking Home in Darkness ends.

Reden's Surgery is a scene. [Marid and Cavala try and fail to save Reden.]
Reden's Surgery begins when play begins.
Reden's Surgery ends when Reden is dead.

Walking Home in Darkness is a scene. [Marid goes home after the surgery.]
Walking Home in Darkness begins when Reden's Surgery ends.
Walking Home in Darkness ends when the location of Reden is not the Surgery Room.

Chapter 1.2.1.2 - Day One

[Doctor Cavala studies the cadaver, while Marid is sent on an errand to inform the next of kin. This chapter introduces the setting of Solphos and the Channelworks District. When Marid returns to the clinic, having completed her errand, she finds Carnicer attacking Doctor Cavala. Her unexpected appearance allows Cavala to gain the upper hand on Carnicer, forcing the mutant to flee. But Cavala is incapacitated in the struggle.]

Day One is a scene.
Day One begins when Prologue ends.
Day One ends when Walking Home in Fear ends.

Reden's Autopsy is a scene. [Cavala stays in the mortuary to perform an autopsy on Reden.]
Reden's Autopsy begins when Day One begins.
Reden's Autopsy ends when Cavala's Errands ends.

Nine to Five Zombie is a scene. [Marid goes to work and looks for Cavala.]
Nine to Five Zombie begins when Day One begins.
Nine to Five Zombie ends when the player carries the bundle of documents.

Cavala's Errands is a scene. [Marid delivers the documents to the basilica and talks to Zoiro.]
Cavala's Errands begins when Nine to Five Zombie ends.
Cavala's Errands ends when the forewoman is nowhere.

The Censor's Nap is a scene. [Marid wakes the sleeping censor.]
The Censor's Nap begins when the Basilica is visited.
The Censor's Nap ends when the bundle of documents is delivered.

Returning to a Break-In is a scene. [Marid returns to Cavala and gets her first glimpse of Carnicer.]
Returning to a Break-In begins when Cavala's Errands ends.
Returning to a Break-In ends when the location is the Clinic.

Averting Cavala's Assassination is a scene. [Marid interrupts the assassination attempt on Cavala.]
Averting Cavala's Assassination begins when Returning to a Break-In ends.
Averting Cavala's Assassination ends when Doctor Cavala is incapacitated.

First Aid on Cavala is a scene. [Marid helps Doctor Cavala fix her leg.]
FIrst Aid on Cavala begins when Averting Cavala's Assassination ends.
First Aid on Cavala ends when the CSOFAOC is 4.

Walking Home in Fear is a scene. [Marid goes home after fixing Doctor Cavala's leg.]
Walking Home in Fear begins when First Aid on Cavala ends.
start-of-day-two is a truth state that varies. [This is a silly hack.]
Walking Home in Fear ends when start-of-day-two is true.

Chapter 1.2.1.3 - Day Two

[A messenger brings a rude awakening: there's been another spate of deaths, and Doctor Arturus, who took in the patients, is dead of the same infection. Cavala sets Detective Marid on the scene. She discovers that there seems to be a deliberate pattern to the infection, that certain signs recur, and that Doctor Arturus was murdered. Cavala tells her to rest well and be careful.]

Day Two is a scene.
Day Two begins when Day One ends.

Bad News from Cavala is a scene. [Cavala lays the exposition on Marid.]
Bad News from Cavala begins when Day Two begins.
Bad News from Cavala ends when the player carries Doctor Cavala's signum.

There is a scene called The Game is Afoot. [Marid makes her way to the Turris Infinita to start her investigations.]
The Game is Afoot begins when Bad News from Cavala ends.
The Game is Afoot ends when the player is in Arturus's Clinic.

Meeting the Patients is a scene. [Marid goes to learn about Nacarat and the Thugs.]
Meeting the Patients begins when Four Investigations begins.
Meeting the Patients ends when Doctor Arturus is in Arturus's Clinic

Four Investigations is a scene. [The overarching scene for most of Day Two.]
Four Investigations begins when The Game is Afoot ends.
Four Investigations ends when (Reden Investigation has ended and Arturus Investigation has ended and Nacarat Investigation has ended and Thugs Investigation has ended).

All Quiet on the Western Front is a scene. [Doctor Cavala and Horatio stay in the clinic and do absolutely fuck all.]
All Quiet on the Western Front begins when The Game is Afoot begins.
All Quiet on the Western Front ends when Four Investigations ends.

A Crucible Game is a scene. [This marks when Doctor Cavala and Horatio are playing crucible.]
A Crucible Game begins when the main crucible timer is greater than 1.
A Crucible Game ends when All Quiet on the Western Front ends.

[1. Reden. A bum who stumbled near the secret lab beneath the Channelworks.
- Poisoned the afternoon of Prologue, died that night. Accidentally exposed himself to Noctis. Justinian doesn't know about him.
- A Channelworks worker fired for alcoholism. Knew the back entrance, tended to wander there drunk. That's how he got poisoned.
- A collection of rewards stamps found in Reden's shack leads the player to a sketchy pub in the Shanty Quarter, where Webster knows more about Reden's activities. He doesn't know exactly where he was going -- that's for Marid to find out on Day Three.
- Zoiro doesn't know exactly what Reden was doing, since Reden is a bum, but mentions his past and that he spent a lot of time in the undercity.]

Reden Investigation is a scene.
Reden Investigation begins when Four Investigations begins.

[2. Doctor Arturus, in Arturus's Domicile. Justinian personally poisoned Arturus because his mentor found out about his plans.
- The doctor was poisoned Day One afternoon after an argument with Justinian and died the evening of Day One.
- Noctis was planted inside the doctor's gloves. It entered his skin, dissolved in his bloodstream, and stopped his heart.
- Justinian implicates the bodies that Arturus was investigating. He fabricated some evidence and destroyed others.]

Arturus Investigation is a scene.
Arturus Investigation begins when Four Investigations begins.
Arturus Investigation ends when arturus-body-completion-quip is true and clue-arturus-discovery-justinian is true and clue-arturus-debt is true and clue-arturus-coffeetable is true and clue-patientrecords is true.

[3. Creditor Nacarat, in Arturus's Clinic. One of the Noctis patients that Arturus was investigating. A Trading Company hawk going after Arturus. Rich scumbag.
- Justinian poisoned his wine during a "meeting" with Arturus the morning of Prologue. Admitted Prologue day. Died Prologue night.
- Justinian destroyed most of the evidence, but Marid can print out a ticker-tape correspondence message in Arturus's Domicile that shows Arturus owed money to him.]

Nacarat Investigation is a scene.
Nacarat Investigation begins when Meeting the Patients ends.
Nacarat Investigation ends when nacarat-body-completion-quip is true and the Nacarat file is meticulously digested.

[4. Sal (Salio) and Piper, in the Shanty Quarter. Trading Company thugs, with very few redeeming qualities.
- Poisoned the night before Prologue. Admitted Prologue day. Died Prologue night.
- Justinian knows about them because they often came to shake down Arturus. He tracked them to the flophouse and falsified gifts of wine for them from their employers, which is how they were poisoned. (They're not very bright.)
- Justinian wrote in the notes to keep them a secret, but they kept the notes (because they're not very bright). Marid can check the handwriting against Creditor documents from Arturus's Clinic - they don't match.
- They were disgruntled because of work being taken from them by Carnicer. This gives Marid Carnicer's name and foreshadows the encounter later.
- They frequented the same pub as Reden, and the bartender will testify they worked for "those guys you don't talk about."]

Thugs Investigation is a scene.
Thugs Investigation begins when Meeting the Patients ends.
Thugs Investigation ends when sal-body-completion-quip is true and piper-body-completion-quip is true and clue-giftnote is true.

[We make Justinian seem like a sympathetic victim and potential ally - not to mention love interest. We also foreshadow Doctor Serpens's arrival in Day Three.

Marid internally notes when she doesn't think there are any more clues for each investigation. When all the investigations are done, she notes it's getting late and she should return to Doctor Cavala for a debrief.]

Chapter 1.2.1.4 - Midnight

[Carnicer makes a nighttime attempt on Marid's life. Marid flees her room through the window, runs through a condemned block, and outwits Carnicer by leading her into a nest of deadly vermin -- nearly dying herself in the process, and experiencing a strange vision of the hereafter. Help arrives moments after, but by then Carnicer is already dead.]

Midnight is a scene.
Midnight begins when Day Two ends.

Chapter 1.2.1.5 - Day Three

[More deaths. Doctor Cavala is quite certain that a conspiracy is afoot, that the plague is not natural, and asks Marid to look for a common infection vector. Marid goes out and discovers a newfound affinity for aurorae, which she uses to glean clues by speaking with the ghosts of the departed. But the ghosts of those killed by Noctis are fragmented, unable to tell her much. Quarantine has also been enacted by Doctor Serpens. The clues lead her to Arturus's secret lab beneath the Channelworks, where she is promptly knocked out cold.]

Day Three is a scene.
Day Three begins when Midnight ends.

Chapter 1.2.1.6 - Day Four

[Marid imprisoned. Justinian reveals himself to be the villain and monologues. Serpens is revealed to be in cahoots. They leaves her in a burning deathtrap, which she escapes; using a discarded animus lantern she navigates her way back to the surface. There Noctis has been unleashed in full force and the streets run black. Marid returns to the Channelworks, defeats Serpens, and confronts Justinian -- making a final choice.]

Day Four is a scene.
Day Four begins when Day Three ends.

Chapter 1.2.1.7 - Epilogue

[The result of Marid's final choice plays out. Largely an uninteractive cutscene.]

Epilogue is a scene.
Epilogue begins when Day Four ends.

Part 1.2.2 - Status Line

Chapter 1.2.2.1 - Status Line Variables

[We want to show the current day on the right hand status line. We use a variable to store it because a) there can be multiple concurrent scenes, so Inform doesn't know which one is relevant; and b) entering a dialogue changes the status line, and we'd like a foolproof way to restore it.]

The current day is a scene that varies. The current day is Prologue.
When Day One begins: now the current day is Day One.
When Day Two begins: now the current day is Day Two.
When Midnight begins: now the current day is Midnight.
When Day Three begins: now the current day is Day Three.
When Day Four begins: now the current day is Day Four.
When Epilogue begins: now the current day is Epilogue.

[When the player is engaged in dialogue, the right hand status line instead changes to "Talking to [the partner]". We likewise need a variable for this.]

The conversational partner text is some text that varies.

Chapter 1.2.2.2 - Constructing the Status Line

[We use Basic Screen Effects to construct the status line so that we can shift the right hand status line inward when it's too long. "Talking to Doctor Cavala" is a lot longer than 14 characters. We define the tables and rule for constructing the status line here; the actual shifting is dynamically done while starting and ending the dialogue.]

Table of Normal Status
left	central	right
" [location]"	""	"[if the current day is Prologue or the current day is Epilogue][otherwise][current day]"

Table of Dialogue Status
left	central	right
" [location]"	""	"[conversational partner text]"

Table of Endoscopy Status
left	central	right
" [location]"	""	"[endoscopic subject text]"

Rule for constructing the status line:
	if the player is engaged in dialogue:
		fill status bar with Table of Dialogue Status;
	otherwise if the player is engaged in endoscopy:
		fill status bar with Table of Endoscopy Status;
	otherwise:
		fill status bar with Table of Normal Status;
	rule succeeds.
	
Part 1.2.3 - Skipping Scenes - Release for testing

To skip past Reden's Surgery:
	now Reden is dead;
	now all purely-surgical-necessities are nowhere;
	now the enabled of cavala-errands2-vision is true;
	now the surgical mask is nowhere;
	now the surgical lamps are switched off;
	now Doctor Cavala is in the Clinic;
	follow the scene changing rules.

To skip past Prologue:
	if Reden's Surgery has not ended, skip past Reden's Surgery;
	now cavala-wh-goodnight-quipped is true;
	now sleeping-reminder-shown is true;
	now the Clinic is visited;
	now Via Terminalis West End is visited;
	now the Dormitory Block is visited;
	now the Public House is visited;
	now mutant-tutorial-shown is true;
	follow the scene changing rules.
	
To skip past Nine to Five Zombie:
	if Prologue has not ended:
		skip past Prologue;
		now Reden is on the mortuary slab;
		follow the scene changing rules;
	now Marid's Room is visited;
	now 9-5-zombie-cavala-prompt is true;
	move the player to the Mortuary, without printing a room description;
	now the home dialogue branch of Doctor Cavala is cavala-errands2;
	now the player carries the bundle of documents;
	follow the scene changing rules.
	
To skip past the first errand:
	if Nine to Five Zombie has not ended:
		skip past Nine to Five Zombie;
	now the Crooked Alley is visited;
	now Via Terminalis West Street is visited;
	add Horatio to the list of discovered characters;
	now the Condemned Block is visited;
	now Following the Canal is visited;
	now exterminators-profession-known is true;
	now the enabled of cavala-errands2-footpath is true;
	now the enabled of censor-woken-detour is true;
	now the Via Terminalis Bridge is visited;
	now the Canalside Steps are visited;
	now the Via Terminalis Junction is visited;
	now the Channelworks Concourse is visited;
	now the Turris Infinita is visited;
	now Miller's Gate is visited;
	now the Grand Forum is visited;
	move the player to the Basilica, without printing a room description;
	follow the scene changing rules;
	now the censor is awake;
	now the enabled of censor-woken-documents is false;
	now the enabled of censor-woken-thanks is true;
	now the bundle of documents is nowhere;
	now the bundle of documents is delivered;
	follow the scene changing rules.
	
To skip past the Shanty Maze:
	if the bundle of documents is not delivered:
		skip past the first errand;
	now Via Mercurii is visited;
	now shanty-quarter-warning-given is true;
	now Maze Part One is visited;
	now Maze Part Two is visited;
	now Maze Part Three is visited;
	now Maze Part Four is visited;
	now the Shanty Quarter is visited;
	now the Shanty Quarter is goto-impassable;
	move the player to Cadaver Walk, without printing a room description;
	now the exterminators are nowhere;
	now the cordon is nowhere;
	now the canalside manhole is not faraway;
	now the canalside manhole is closed;
	now the canalside manhole is described;
	follow the scene changing rules.
	
To skip past Zoiro:
	if Cadaver Walk is not visited:
		skip past the Shanty Maze;
	now Riggertown Lower Level is visited;
	now Riggertown Upper Level is visited;
	now VII Layabout Row is visited;
	move the player to the Riggertown Mechanistry, without printing a room description;
	now the forewoman is nowhere;
	follow the scene changing rules.
	
To skip past the first Carnicer encounter:
	if Cavala's Errands has not ended:
		skip past Zoiro;
	now returning-breakin-riggertown-quip is false;
	now the clinic door is open;
	move the player to the Clinic, without printing a room description;
	follow the scene changing rules;
	now Doctor Cavala is in the Clinic;
	now Doctor Cavala is incapacitated;
	now Carnicer is nowhere;
	follow the scene changing rules.
	
To skip past First Aid on Cavala:
	if Returning to a Break-In has not ended:
		skip past the first Carnicer encounter;
	now the antiseptic dressing is nowhere;
	now the elastic bandage is nowhere;
	now Doctor Cavala is wearing the hermetically sealed bandage;
	now the first aid bag is in the Clinic;
	now the first aid bag is undescribed;
	now the CSOFAOC is 4;
	now Horatio is in the Clinic;
	now the front door of the clinic is closed;
	follow the scene changing rules.
	
To skip past Day One:
	if First Aid on Cavala has not ended:
		skip past First Aid on Cavala;
	move the player to Marid's Room, without printing a room description;
	now start-of-day-two is true;
	follow the scene changing rules.
	
To skip past Bad News from Cavala:
	if Day One has not ended:
		skip past Day One;
	move the player to the Clinic, without printing a room description;
	now the day-two copy of the Libri Liberi is carried by the player;
	now Doctor Cavala's signum is carried by the player;
	now the endoscope is carried by the player;
	follow the scene changing rules.
	
To skip past Meeting the Patients:
	if Bad News from Cavala has not ended:
		skip past Bad News from Cavala;
	move the player to Arturus's Clinic, without printing a room description;
	follow the scene changing rules;
	now Examiner Velox is proper-named;
	now 4inv-vigiles-permission is true;
	now the dried black blood is in Arturus's Clinic;
	now Piper is in Arturus's Clinic;
	now Sal is in Arturus's Clinic;
	now Creditor Nacarat is in Arturus's Clinic;
	now Doctor Arturus is in Arturus's Clinic;
	now the home dialogue branch of Examiner Velox is examiner-home3;
	follow the scene changing rules.
	
To skip past the first half of Four Investigations:
	if Meeting the Patients has not ended:
		skip past Meeting the Patients;
	now clue-airborne-vector is true;
	now clue-ingestion-vector is true;
	now clue-patientrecords-justinian is true;
	now clue-arturus-discovery-justinian is true;
	now clue-arturus-timeofdeath is true;
	now examiner-thugs-timeofdeath-asked is true;
	now examiner-nacarat-timeofdeath-asked is true;
	now clue-arturus-gloves is true;
	now clue-arturus-animus is true;
	now arturus-body-completion-quip is true;
	now clue-nacarat-stomach is true;
	now clue-nacarat-pocketbook is true;
	now clue-nacarat-recording is true;
	now clue-nacarat-raven is true;
	now nacarat-body-completion-quip is true;
	now clue-sal-raven is true;
	now the battered keyring is described;
	now sal-body-completion-quip is true;
	now clue-piper-namelist is true;
	now clue-piper-raven is true;
	now clue-piper-stomach is true;
	now piper-body-completion-quip is true;
	now clue-ravens-sighted is 3;
	now clue-raven is true;
	discover the Trading Company connection;
	now clue-arturus-coffeetable is true;
	now clue-arturus-wineglassbroken is true;
	now clue-arturus-debt is true;
	now the Piper file is in the stack of miscellaneous patient records;
	now the Salio file is in the stack of miscellaneous patient records;
	now the Nacarat file is in the stack of miscellaneous patient records;
	now all patient-record files are meticulously digested;
	now clue-patientrecords is true;
	[now clue-reden-channelworks is true;
	now clue-reden-zoironest is true;
	now clue-reden-shack is true;
	now the enabled of zoiro-mourning-alldone is true;
	now the scattered coupons are nowhere;
	now all drink coupons in the Reden's Shack coupon container are carried by the player;
	now clue-crowsnest is true;]
	now the battered keyring is nowhere;
	now cellar-keygiven is true;
	now the landlord is nowhere;
	now cellar-access-granted is true;
	now Arturus's Domicile is visited;
	now Arturus's Study is visited;
	[now Zoiro's Residence is visited;
	now Reden's Shack is visited;]
	now shantyquarter-daytwo-quipped is true;
	now Rats' Run is visited;
	move the player to the Flophouse, without printing a room description;
	follow the scene changing rules.
	
Skipping Reden's surgery is an action applying to nothing.
Understand "skip surgery" as skipping Reden's surgery.
Check skipping Reden's surgery when Reden's surgery has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping Reden's surgery:
	skip past Reden's Surgery;
	say "Surgery skipped.";
	try looking.

Skipping to Day One is an action applying to nothing.
Understand "skip to day one" as skipping to Day One.
Check skipping to Day One when Prologue has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to Day One:
	skip past Prologue;
	unveil Day One.
	
Skipping to errands is an action applying to nothing.
Understand "skip to errands" as skipping to errands.
Check skipping to errands when Nine to Five Zombie has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to errands:
	skip past Nine to Five Zombie;
	try looking.
	
Skipping to censor is an action applying to nothing.
Understand "skip to censor" as skipping to censor.
Check skipping to censor when the bundle of documents is delivered: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to censor:
	skip past the first errand;
	try looking.
	
Skipping the Shanty Maze is an action applying to nothing. Understand "skip shanty quarter/-- maze" as skipping the Shanty Maze.
Check skipping the Shanty Maze when Cadaver Walk is visited: say "You have already passed that checkpoint."; stop the action.
Carry out skipping the Shanty Maze:
	skip past the Shanty Maze;
	try looking.
	
Skipping to mechanistry is an action applying to nothing.
Understand "skip to mechanistry" as skipping to mechanistry.
Check skipping to mechanistry when Cavala's Errands has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to mechanistry:
	skip past Zoiro;
	try looking.
	
Skipping to first aid is an action applying to nothing.
Understand "skip to first aid" as skipping to first aid.
Check skipping to first aid when Averting Cavala's Assassination has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to first aid:
	skip past the first Carnicer encounter;
	say "[cavala-firstaid-examinewound][paragraph break]".
	
Skipping first aid is an action applying to nothing.
Understand "skip first aid" as skipping first aid.
Check skipping first aid when First Aid on Cavala has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping first aid:
	skip past First Aid on Cavala;
	try looking.
	
Skipping to Day Two is an action applying to nothing.
Understand "skip to day two" as skipping to day two.
Check skipping to Day Two when Walking Home in Fear has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to Day Two:
	if First Aid on Cavala has not ended:
		skip past First Aid on Cavala;
	move the player to Marid's Room, without printing a room description;
	unveil Day Two.
	
Skipping to endoscope is an action applying to nothing.
Understand "skip to endoscope" as skipping to endoscope.
Check skipping to endoscope when Bad News from Cavala has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to endoscope:
	skip past Bad News from Cavala;
	try looking.
	
Skipping to bodies is an action applying to nothing.
Understand "skip to bodies" as skipping to bodies.
Check skipping to bodies when Meeting the Patients has ended: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to bodies:
	skip past Meeting the Patients;
	try looking.
	
Skipping to cellar is an action applying to nothing.
Understand "skip to cellar" as skipping to cellar.
Check skipping to cellar when the landlord is nowhere: say "You have already passed that checkpoint."; stop the action.
Carry out skipping to cellar:
	skip past the first half of Four Investigations;
	try looking.
	
Book 1.3 - People

Part 1.3.1 - Defining People

Definition: a person is other if it is not the player.
Does the player mean doing something with the player: it is unlikely.

A person can be friendly or hostile. A person is usually friendly. [This flag colors Marid's responses when interacting with that person.]

Understand "person" as a person. Understand "people" as the plural of a person. Understand "man" as a male person. Understand "men" as the plural of a male person. Understand "woman" as a female person. Understand "women" as the plural of a female person.

A person can be living or dead. A person is usually living. Understand "dead" or "body" or "corpse" or "cadaver" or "stiff" as a dead person. 

Race is a kind of value. The races are human, goblin, mutant, mixed-race, and creature. A person has a race. The race of a person is usually human. Understand the race property as describing a person.
Understand "humans" as the plural of a human person. Understand "goblins" as the plural of a goblin person. Understand "mutants" as the plural of a mutant person.
Understand "human/goblin/mutant" as a mixed-race person. Understand "humans/goblins/mutants" as the plural of a mixed-race person.

mutant-tutorial-shown is a truth state that varies. mutant-tutorial-shown is false.

First before examining or talking to a mutant person when mutant-tutorial-shown is false (this is the 'what's a mutant'? tutorial rule):
	if time is not critical:
		say "(It has been some years now since the mutants of the Dark Lands were integrated into society, and you have mostly gotten used to their haphazard anatomy, their alien perception of the world. Mostly.)[paragraph break]";
		now mutant-tutorial-shown is true.
		
Part 1.3.2 - People Block Responses

The sound of a person is usually "[regarding the item described][They] [are][if the item described is dead] silent.[otherwise]n't saying anything."
		
Instead of drinking, switching on, switching off, or wearing someone (this is the can't do that to a person rule): say "That doesn't make any sense."
Instead of setting someone to something (this is the can't set people rule): say "That doesn't make any sense."

Instead of looking under something carried by an other living person (called the carrier), say "[regarding the noun][They're] what [the carrier] [are] carrying."
Instead of looking under something worn by an other living person (called the wearer), say "[regarding the noun][They're] what [the wearer] [are] wearing."

Instead of eating a living person, say "What a strange notion."
Instead of taking an other living person (this is the new can't take people response rule): say "[regarding the noun]You lack the strength, even if [they] allowed you to."

Instead of attacking, cutting, knocking on, or pushing an other friendly living person (this is the can't hurt friendly people rule): say "[if time is critical]This is not the time.[otherwise]That hardly seems called for."
Instead of kissing, pulling, rubbing, searching, smelling, swinging, squeezing, touching, or turning an other friendly living person (this is the block actions on friendly people rule): say "[if time is critical]This is not the time.[otherwise]You aren't [italic type]that[roman type] friendly with [the noun]."

Instead of attacking or cutting an other hostile living person (this is the can't hurt hostile people rule): say "You doubt that would end well for you."
Instead of knocking on, pulling, pushing, smelling, squeezing, touching, or turning an other hostile living person (this is the can't provoke hostile people rule): say "You doubt that would go over well with [the noun]."
Instead of kissing, rubbing, or searching an other hostile living person (this is the block actions on hostile people rule), say "You doubt [the noun] will let you do that."

Instead of eating a dead person, say "What a revolting notion."
Instead of eating something that is part of a dead person, say "What a revolting notion."
Instead of giving something to a dead person, say "You won't get much of a response."
Instead of pushing, pulling, or turning a dead person, say "That won't accomplish anything."
Instead of swinging or taking a dead person, say "You lack the strength."
Instead of searching a dead person, say "You find nothing of interest."
Instead of knocking on, squeezing, or touching a dead person, say "[regarding the noun][They] [are] still."
Instead of kissing a dead person, say "An ill-advised, if romantic, notion."
Instead of waking a dead person, say "[regarding the noun][Theirs] is a sleep from which there is no awakening."

Part 1.3.3 - Recurring Characters

[These are important characters who show up several times in various locations throughout the game. They were originally listed in the location of their first appearance, but as the plot gets more convoluted and characters shift around more, placing these characters here makes them easier to keep track of.]

Chapter 1.3.3.1 - Doctor Cavala

Doctor Cavala is a woman.
The scent is "[if time is critical]Doctor Cavala is sweating.[otherwise]Doctor Cavala never wears perfume, owing to the danger of contamination during surgery."
Understand "dark-skinned" or "physician" or "dr" as Cavala.

Doctor Cavala can be able-bodied or incapacitated. She is able-bodied. [She becomes incapacitated later in the story, and certain descriptions need to reflect that.]

The description of Doctor Cavala is "[first time]You came to know Doctor Cavala when she served with Lumina's volunteers during the troubles. Her clinic was your first choice for apprenticeship when you graduated. Since then you've watched her drag more than a few souls kicking from the brink of death -- and they won't be the last, not if she has anything to say about it.

Doctor Cavala is a dark-skinned physician in her early forties, sharp and regal of bearing. [only][cavala-description]".

To say cavala-description:
	if Reden's Surgery is happening:
		say "She circles the gurney with increasing agitation, doing all she can to keep her patient alive. ";
	otherwise if Walking Home in Darkness is happening:
		say "Right now, she appears to be filling out a census report for Reden's death. ";
	otherwise if Reden's Autopsy is happening:
		say "She has a look of absolute concentration on her face. ";
	otherwise if Walking Home in Fear is happening:
		say "She's taking her injury rather well -- but then again, she [italic type]was[roman type] an army doctor. ";
	otherwise if All Quiet on the Western Front is happening:
		if A Crucible Game is happening:
			say "She's looking at her cards with a cool, unreadable expression. ";
		otherwise:
			say "She looks frankly irritated that she's bedridden. ";
	otherwise:
		say "She seems to be at a crossroads, lost in thought. ".
		
Doctor Cavala's leg is a thing.
The description is "[if First Aid on Cavala is happening and Doctor Cavala is wearing the hermetically sealed bandage]You hope the bleeding has subsided.[otherwise if First Aid on Cavala is happening]It's a ragged bloody tear.[otherwise]If Doctor Cavala feels any pain, she doesn't show it."
The scent is "[if First Aid on Cavala is happening]The scent of blood is thick.[otherwise]You smell the calomel in the dressing."
Understand "left" or "thigh/knee/tendon" or "cut/gash/wound/tear/injury" or "blood/bloody/bleeding" or "trouser/trousers" as Doctor Cavala's leg.
Before bandaging Doctor Cavala's leg with, try bandaging Doctor Cavala with the second noun instead.
Instead of attacking, cutting, knocking on, pushing, pulling, rubbing, squeezing, swinging, taking, touching, or turning Doctor Cavala's leg, say "[if time is critical]This is not the time.[otherwise]That would worsen her injury."

The hermetically sealed bandage is a wearable thing.
The description is "Doctor Cavala's knee has been bandaged tightly."
The scent is "You smell the calomel in the dressing."
Understand "antiseptic" or "dressing" or "bandages" or "calomel" or "solution" or "gauze" or "natron" or "sigil/sigils" or "fabric" as the hermetically sealed bandage.
Instead of attacking, cutting, knocking on, pushing, pulling, looking under, rubbing, squeezing, swinging, taking, touching, or turning the hermetically sealed bandage, say "[if time is critical]This is not the time.[otherwise]The bandage shouldn't be disturbed until a more qualified surgeon arrives. [first time](And Doctor Cavala can't exactly operate on herself.) [only][line break]"
		
Instead of bandaging Doctor Cavala with when Doctor Cavala is wearing the hermetically sealed bandage: say "Doctor Cavala's wound is already bandaged."

Chapter 1.3.3.2 - Horatio

Horatio is an undescribed man.
The description is "[horatio-description]".
The scent is "Horatio smells like sweat and ozone."
Understand "vigile" as Horatio.

To say horatio-description:
	if Cavala's Errands is happening:
		say "Vigile Horatio is a childhood friend of yours. He's always been a bit dense, but you're glad to have his around. ";
	otherwise if Walking Home in Fear is happening:
		say "At least he seems to be making himself useful. ";
	otherwise if All Quiet on the Western Front is happening:
		if A Crucible Game is happening:
			say "Horatio is contemplating his hand of cards. ";
		otherwise:
			say "He looks more bored than anything. ";
	otherwise:
		say "He looks bemused, as though at a loss.";

Chapter 1.3.3.3 - Carnicer

Carnicer is an undescribed hostile improper-named mutant woman.
The printed name is "assassin".
Understand "hooded" or "assassin" or "killer" or "butcher" as Carnicer.
Understand "stranger" as Carnicer when Averting Cavala's Assassination is happening.

The poisoned blade is carried by Carnicer.
Understand "sword" as the poisoned blade.

Chapter 1.3.3.4 - Justinian

Justinian is a human man.
The description is "[justinian-description]".
The scent is "You can't get distracted by his cologne, not now."
Understand "doctor" or "justin" or "volontis" as Justinian.

To say justinian-description:
	if Four Investigations is happening:
		say "His eyes are dark sunsets. ";
	otherwise:
		say "You shouldn't look at him. You'll start fantasizing. ";
	
Instead of kissing, rubbing, or touching Justinian:
	say "[one of]No. No! No. Yes -- [italic type]No![roman type][or]Absolutely not.[stopping]";
	
Instead of attacking, cutting, or pushing Justinian:
	say "[one of]What? No! Why would you even consider that?[or]Absolutely not.[stopping]";

Instead of knocking on, pulling, searching, swinging, squeezing, taking, or turning Justinian:
	say "[one of]No. No! That would -- that would be much too forward.[or]You can't bring yourself to.[stopping]";

Book 1.4 - Scene Flags

["When time is critical" - This is used to flag the player at certain tense times so that comedic and relaxed responses don't trigger.]

To decide whether time is critical:
	if Reden's Surgery is happening, decide yes;
	if the location is the Condemned Block, decide yes;
	if the location is the Shanty Quarter, decide yes;
	if the location is Rats' Run, decide yes;
	if the location is the Flophouse, decide yes;
	if the location is in the Shanty Maze, decide yes;
	if Returning to a Break-In is happening and Carnicer is in the Clinic, decide yes;
	if Averting Cavala's Assassination is happening, decide yes;
	if First Aid on Cavala is happening, decide yes;
	if Midnight is happening, decide yes;
	decide no.

To decide whether time is not critical:
	if time is critical, decide no;
	decide yes.
	
["It is night" - Self-explanatory.]

To decide whether it is night:
	if Prologue is happening, decide yes;
	if Walking Home in Fear is happening, decide yes;
	if Midnight is happening, decide yes;
	decide no.

Book 1.5 - Sounds, Scents

[This saves us a lot of instead rules and hopefully cuts down on action-processing time.]

A room has some text called the sound.
A thing has some text called the sound.
A room has some text called the scent.
A thing has some text called the scent.

The report listening rule is not listed in the report listening to rulebook.
The report smelling rule is not listed in the report smelling rulebook.
	
Report listening (this is the new report listening rule):
	if the sound of the noun is not empty:
		say "[sound of the noun][line break]";
	otherwise:
		say "You hear nothing unexpected."

Report smelling (this is the new report smelling rule):
	if the scent of the noun is not empty:
		say "[scent of the noun][line break]";
	otherwise:
		say "You smell nothing unexpected."

Book 1.6 - Faraway Things

[This game has a lot of scenery that you can see but not interact with. This is a tag for those things to consolidate all the instead rules into a single rule.]

A thing can be faraway. A thing is usually not faraway.

Last instead of doing something (this is the can't generally interact with faraway things rule):
	let N be an object;
	if action requires a touchable noun:
		if the noun is part of a faraway thing (called the parent):
			now N is the parent;
		otherwise if the noun is faraway:
			now N is the noun;
	otherwise if action requires a touchable second noun:
		if the second noun is part of a faraway thing (called the parent):
			now N is the parent;
		otherwise if the second noun is faraway:
			now N is the second noun;
	if N is a thing:
		if we are listening to N, continue the action;
		if we are smelling N and the scent of N is not empty, continue the action;
		if N provides the property faraway response:
			say "[faraway response of N][line break]";
		otherwise:
			say "[They're] too far away.";
	otherwise:
		continue the action.
		
The can't reach inside rooms rule response (A) is "That's too far away."


Volume 2 - The Player

Book 2.1 - Marid

Yourself is female. Understand "servator" or "marid" or "orpheia" or "yourself" as yourself. Understand "marid's" or "my" as a thing when yourself has the item described.

The sound of yourself is "[if time is critical]Your heart is pounding.[otherwise]Your breathing seems normal."
The scent of yourself is "[if time is critical]This is not the time.[otherwise]You smell okay."

Instead of examining the player:
	if the location is Maze Part Two:
		say "Fortunately, the knife didn't penetrate your jacket. You're unhurt. ";
	otherwise:
		say "You feel alert and well. [if time is critical]O[otherwise]Slightly o[end if]n edge, perhaps, but that's nothing unusual considering the circumstances. ";
	say "[paragraph break][inventory-text]".

Instead of taking inventory (this is the custom inventory rule): say inventory-text.

To say inventory-text: 
	say "You are wearing ";
	now all things enclosed by the player are unmarked for listing;
	now all things worn by the player are marked for listing;
	if no things worn by the player are marked for listing, say "nothing";
	otherwise list the contents of the player, as a sentence, listing marked items only;
	say ". On your person ";
	now all things carried by the player are marked for listing;
	now all things worn by the player are unmarked for listing;
	if no things carried by the player are marked for listing, say "is nothing of importance";
	otherwise list the contents of the player, as a sentence, including contents, tersely, giving brief inventory information, listing marked items only, prefacing with is/are;
	say ".".

Part 2.1.1 - Interactions

Before searching the player, try taking inventory instead.

Before looking under the player, try looking instead.
Before pushing the player to, try going the second noun instead.
Before showing something to the player, try examining the noun instead.
Instead of attacking or cutting the player, say "[if time is critical]This is not the time.[otherwise]Self-harm won't accomplish anything."
Instead of burning the player, say "No."
Before giving something to the player, say "[if time is critical]This is not the time.[otherwise]Don't be silly." instead.
Instead of kissing, pushing, pulling, or taking the player, say "[if time is critical]This is not the time.[otherwise]What a strange notion."
Instead of knocking on or touching the player, say "You feel nothing unexpected."
Instead of rubbing the player, say "[if time is critical]This is not the time.[otherwise]You don't get much cleaner."
Instead of squeezing the player, say "[if time is critical]This is not the time.[otherwise]It isn't [italic type]that[roman type] cold."
Instead of swinging the player, say "[if time is critical]This is not the time.[otherwise]That would require some sort of pendulum."
Instead of turning the player, say "[if time is critical]This is not the time.[otherwise]You turn around to little effect."

Part 2.1.2 - Marid's Tattoos

The alchemical tattoos are part of the player. The indefinite article of the alchemical tattoos is "your". The description of the alchemical tattoos is "Your father gave you these tattoos when you were a young child, as is tradition in some alchemical families. Even now, the flowing, circuitous lines remind you of him." Understand "my" or "marid's" or "face/skin" or "neck" or "tattoo" or "flowing" or "circuitous" or "lines" or "line" as the alchemical tattoos.

Instead of knocking on, looking under, searching, or touching the alchemical tattoos, say "[if time is critical]This is not the time.[otherwise]Your feel the faintest tingle of power beneath your skin."

Instead of rubbing the alchemical tattoos, say "[if time is critical]This is not the time.[otherwise]Your face doesn't get much cleaner."

Before doing anything other than examining, knocking on, looking under, rubbing, searching, or touching to the alchemical tattoos: now the noun is the player.

Part 2.1.3 - Marid's Eyes

Marid's eyes are a thing that is part of yourself. The printed name of Marid's eyes is "your eyes". The description of Marid's eyes is "[if time is critical]This is not the time.[otherwise if the location is Marid's Room]They are the eyes of one who has glimpsed death.[otherwise]Your eyes seem to be working fine." Understand "my" or "eye" as Marid's eyes.

Before searching Marid's eyes, try examining Marid's eyes instead.
Instead of attacking, burning, cutting, pushing, or pulling Marid's eyes, say "No."
Instead of listening to, looking under, swinging, or tasting Marid's eyes, say "That doesn't make any sense."
Instead of knocking on, rubbing, squeezing, or touching Marid's eyes, say "[if time is critical]This is not the time.[otherwise]That's bad for your eyes."

Book 2.2 - Marid's Possessions

Part 2.2.1 - Key Items

[This marks items that can't be dropped.]

A key-item is a kind of thing.

Last check dropping (this is the can't drop key-items rule):
	if the noun is a key-item:
		say "It's better to keep [the noun] on your person.";
		stop the action.

Last check putting something on something (this is the can't put key-items on things rule):
	if the noun is a key-item:
		say "It's better to keep [the noun] on your person.";
		stop the action.
		
Last check inserting something into something (this is the can't insert key-items into things rule):
	if the noun is a key-item:
		say "It's better to keep [the noun] on your person.";
		stop the action.
		
Last check giving something to someone (this is the can't give away key-items rule):
	if the noun is a key-item:
		say "It's better to keep [the noun] on your person.";
		stop the action.

Part 2.2.2 - Natron Jacket

The natron jacket is worn by the player. The indefinite article is "your".
The description is "A utilitarian white garment, lined and sealed with alchemical sigils against contamination. It effectively shields its wearer against most communicable diseases."
The scent is "The jacket has a distinct lack of smell."
Instead of attacking, burning, or cutting the natron jacket, say "You only have the one jacket. You can't afford to damage it."
Instead of looking under the natron jacket, say "Under your natron jacket are your pendant and blouse."
Instead of taking off the natron jacket, say "There's no reason to remove your jacket."
Instead of tying the natron jacket to something, say "Your clothes are too close-fitting to tie anything with."
Instead of tying something to the natron jacket, say "Your clothes are too close-fitting to tie anything with."

Some alchemical sigils are a fixed in place thing part of the natron jacket.
The description is "[if time is critical]This is not the time.[otherwise]You're no sigiler, but nothing seems out of the ordinary."
Understand "sigil" as the alchemical sigils.
Instead of looking under the sigils, say "The sigils are part of the jacket."
Before searching the sigils, try examining the sigils instead.

Part 2.2.3 - Marid's Clothes

Some clothes are worn by the player. The indefinite article of the clothes is "your".
The description is "Simple garb, but it keeps the wind and moisture out."
Understand "garb" or "blouse" or "glove/gloves" or "apron" or "pants/trousers" or "pocket/pockets" or "boot/boots" or "shoe/shoes" or "sock/socks" as the clothes.

Before smelling the clothes, try smelling the player instead.
Instead of attacking or burning the clothes, say "[if time is critical]This is not the time.[otherwise]What an odd idea."
Instead of looking under the clothes, say "[if time is critical]This is not the time.[otherwise]That's what you're wearing."
Instead of pulling the clothes, say "[if time is critical]This is not the time.[otherwise]Your clothes are already close-fitting enough."
Instead of searching the clothes, say "You have on your person [a list of things carried by the player]."
Instead of taking off the clothes, say "[if time is critical]This is not the time.[otherwise if the location is Marid's Room]You don't need a change of clothes at the moment.[otherwise]You'd rather remain in proper attire."
Instead of tying the clothes to something, say "Your clothes are too close-fitting to tie anything with."
Instead of tying something to the clothes, say "Your clothes are too close-fitting to tie anything with."

Instead of inserting something carried by the player into the clothes, say "[The noun] [are] already on your person."
Instead of inserting the endoscope into the clothes, say "Your pockets aren't any more interesting up close."

Part 2.2.4 - Animus Pendant

The animus pendant is worn by the player.
After printing the name of the animus pendant while listing contents of the player: say " (containing the spirit of your father)".
Understand "crystal" or "stone" or "spirit" or "of" or "father" as the animus pendant.

animus-flashback-seen is a truth state that varies. animus-flashback-seen is false.

Instead of examining the pendant (this is the custom pendant description rule):
	if animus-flashback-seen is false:
		say "Images tumble unbidden from memory--[paragraph break]";
		wait for any key;
		say "[italic type]--flames, licking at the beams, melting glass, engulfing the silhouette of your father. 'Marid, go!' he screamed, hoarse from the fumes, and you ran, ran, cheeks stained with tears--[paragraph break]";
		wait for any key;
		say "--turned to you, and her golden eyes were haunted. 'I'm sorry, Marid,' she said, her voice cracking. 'I couldn't save him. I'm so sorry--'[paragraph break]";
		wait for any key;
		say "'--no promises,' the animologist said, his brow knitted. 'If indeed your father died there, we can bind the residual energies to an animus stone, residual, you understand; there's no telling--'[paragraph break]";
		wait for any key;
		say "--flaring light, and you reached out and mouthed the word--[paragraph break]";
		wait for any key;
		say "[roman type]Father.[paragraph break]";
		wait for any key;
		say "You shake your head to clear your thoughts. The past belongs in the past. What matters is that he is with you now, in this pendant.";
		now animus-flashback-seen is true;
		now ambience suppression is true;
	otherwise:
		say "He's in there somewhere. Sleeping."
		
The sound of the animus pendant is "[if time is critical]This is not the time.[otherwise]You hear the barest susurrus, as though a man was breathing in his sleep."

Instead of pushing, pulling, rubbing, squeezing, taking, touching, or turning the animus pendant, say "[if time is critical]This is not the time.[otherwise]The weight of the pendant is comforting."
Instead of attacking, burning, or cutting the pendant, say "No."
Instead of looking under the animus pendant, say "[if time is critical]This is not the time.[otherwise]You're wearing it."
Instead of giving the animus pendant to someone, say "[if time is critical]This is not the time.[otherwise]You will never part with this pendant."
Instead of kissing the animus pendant, say "[if time is critical]This is not the time.[otherwise]You pull the pendant out from under your jacket and give it a kiss for luck."
Instead of inserting something into the animus pendant, say "The animus pendant isn't that kind of receptacle."
Instead of removing something from the animus pendant, say "You could not remove your father's imprint from the crystal any more than you could remove your tattoos from your skin."
Instead of searching the animus pendant, say "[if time is critical]This is not the time.[otherwise]Your father's animus is imprinted in the crystal."
Instead of talking to the animus pendant, say "[if time is critical]This is not the time.[otherwise]You only wish he could hear."
Instead of knocking on or taking off the animus pendant, say "[if time is critical]This is not the time.[otherwise]You don't want to."

Before examining the animus pendant when time is critical, say "Not now." instead.

Part 2.2.5 - Practitioner's Badge

The practitioner's badge is a key-item carried by the player. The indefinite article is "your".
The description is "This burnished badge bears the symbol of a snake coiling around a staff, certifying you as a qualified apprentice of the [italic type]ars vitalis[roman type]."
Understand "burnished" or "symbol" or "snake" or "staff" as the practitioner's badge.

Instead of attacking or cutting the practitioner's badge, say "The badge is far too valuable to risk damaging."
Instead of giving the practitioner's badge to someone, say "[if time is critical]This is not the time.[otherwise]You earned this badge. You'll keep it."
Instead of rubbing the practitioner's badge, say "[if time is critical]This is not the time.[otherwise]You polish your badge a little."
Instead of looking under or turning the practitioner's badge, say "[if time is critical]This is not the time.[otherwise]There's nothing on the reverse of the badge. The clip broke off some months ago."
Instead of wearing the practitioner's badge, say "[if time is critical]This is not the time.[otherwise]The clip of the badge broke off some months ago, and so you've had to keep it in your pocket instead."

Part 2.2.6 - Scalpel

The scalpel is a key-item carried by the player. The indefinite article is "your".
The description is "This elegant blade was a graduation gift from the Physicians['] College. It measures just over twenty centimeters long, and holds a finely graduated orichalcum edge."
The scent is "You smell the otherworldly tang of orichalcum."
Understand "elegant" or "blade" or "orichalcum" or "edge" as the scalpel.

Instead of attacking the scalpel, say "[if time is critical]This is not the time.[otherwise]Your scalpel is far too valuable to risk damaging."
Instead of cutting the scalpel, say "[if time is critical]This is not the time.[otherwise]A futile exercise in topology."
Instead of dropping the scalpel, say "[if time is critical]This is not the time.[otherwise]You were taught never to leave your scalpel unattended."
Instead of giving the scalpel to someone, say "[if time is critical]This is not the time.[otherwise]Your scalpel is yours alone."
Instead of inserting the scalpel into something, say "[if time is critical]This is not the time.[otherwise]You were taught never to leave your scalpel unattended."
Instead of knocking on or touching the scalpel, say "The blade is too sharp to touch."
Instead of putting the scalpel on something, say "[if time is critical]This is not the time.[otherwise]You were taught never to leave your scalpel unattended."
Instead of rubbing the scalpel, say "[if time is critical]This is not the time.[otherwise]You polish your scalpel with the antiseptic cloth."
Instead of swinging the scalpel, say "[if time is critical]That won't help you.[otherwise]The scalpel is very sharp. It isn't a toy."

Part 2.2.7 - Purse

The purse is a key-item carried by the player. The indefinite article is "your".
The description is "A simple cloth purse. It's slightly worn from age."
The scent is "Its scent has been leached from the constant proximity to natron-inscribed notes."
Understand "money" or "cash" or "libra/librae/talent/talents" or "[number] libra/librae/talent/talents" as the purse.

Before removing the purse from the purse, try opening the purse instead.
Instead of dropping the purse, say "[if time is critical]This is not the time.[otherwise]You prefer to keep your money close at hand."
Instead of opening the purse, say "[if time is critical]This is not the time.[otherwise]You only ever open your purse when you're buying something."
Instead of giving the purse to an other person, say "[if time is critical]This is not the time.[otherwise]You don't have [italic type]that[roman type] much money to spare."
Instead of inserting the purse into something, say "[if time is critical]This is not the time.[otherwise]You prefer to keep your money close at hand."
Instead of inserting the purse into the purse, say "[if time is critical]This is not the time.[otherwise]Your purse already contains all the money you have on you."
Instead of inserting something into the purse, say "[if time is critical]This is not the time.[otherwise]The only thing that belongs in your purse is money."
Instead of putting the purse on something, say "[if time is critical]This is not the time.[otherwise]You prefer to keep your money close at hand."
Instead of searching the purse, say "[if time is critical]This is not the time.[otherwise]You don't carry much money with you. Just enough to buy food and other necessities."

Part 2.2.8 - Antiseptic Cloth

The antiseptic cloth is a key-item carried by the player.
The description is "It's for cleaning your scalpel."
The scent is "It smells sharply of alcohol and calomel."

Instead of dropping the cloth, say "[if time is critical]Bad idea.[otherwise]That would dirty the cloth."
Instead of giving the cloth to someone, say "[if time is critical]This is not the time.[otherwise]There's no reason to do that."
Instead of putting the cloth on something, say "[if time is critical]Bad idea.[otherwise]That would dirty the cloth."
Instead of inserting the cloth into something, say "[if time is critical]Bad idea.[otherwise]That would dirty the cloth."
Instead of rubbing the cloth, say "The cloth can't get much cleaner."
Instead of tying the cloth to something, say "The cloth isn't large enough to tie anything with."
Instead of tying something to the cloth, say "The cloth isn't large enough to tie anything with."

Part 2.2.9 - Surgical Mask

[This is just for cutscenes where it makes sense for Marid to have to wear a mask. It isn't part of her normal kit.]

The surgical mask is worn by the player.
The description is "It's a crude bandana that covers your nose and mouth when worn."
Understand "crude" or "bandana" as the mask.

Instead of looking under or searching the mask, say "It's a cloth on your face. There really isn't much more to it."
Instead of smelling the mask, say "You try not to think about the smell."
Instead of pulling or taking off the mask, say "You need to keep the mask on for safety."
Instead of knocking on, pushing, rubbing, squeezing, touching, or turning the mask, say "That's poor practice, as Doctor Cavala would say."

Part 2.2.10 - Bundle of Documents

The bundle of documents is a key-item.
The description is "Comprehensive documentation of Reden's death. It's filled out in neat longhand and bound with Doctor Cavala's signature."
The scent is "It smells of ink."
Understand "sheaf" or "document/documentation" or "paper/papers" or "doctor/doctor's/-- cavala/cavala's/-- signature" or "seal" as the bundle of documents.

Instead of attacking or cutting the bundle of documents, say "You are fairly certain that would get your apprenticeship terminated."
Instead of opening the bundle of documents, say "You shouldn't break the seal."
Instead of giving the bundle of documents to someone, say "[regarding the second noun][They] [are]n't the recipient of the documents."
Instead of giving the bundle of documents to Doctor Cavala, say "Doctor Cavala gives you a strange look."

Part 2.2.11 - Endoscope

The endoscope is a key-item.
The description is "An intricate assembly of lenses mounted on adjustable orichalcum rods. It can be inserted into cadavers to examine their internal pathways, and may be useful for inspecting other crevices of a similar nature."
The scent is "The endoscope is well-oiled."
Understand "intricate" or "assembly" or "tiny" or "lense/lenses" or "adjustable" or "orichalcum" or "rod/rods" or "scope" or "fragile" or "implement" as the endoscope.

Instead of attacking, cutting, or knocking on the endoscope, say "The endoscope is far too valuable to risk damaging."
Instead of rubbing the endoscope, say "[if time is critical]This is not the time.[otherwise]You polish the endoscope with the antiseptic cloth."
Instead of touching the endoscope, say "The lenses shift at your touch."

Before inserting the endoscope into something when time is critical, say "You don't have time for that." instead.
Instead of inserting the endoscope into the player, say "That would be highly dangerous and of questionable utility."
Instead of inserting the endoscope into a living friendly person, say "The endoscope is generally used to examine someone [italic type]after[roman type] they are deceased."
Instead of inserting the endoscope into a living hostile person, say "You doubt [the second noun] will allow you to do that."
Last instead of inserting the endoscope into a container: try searching the second noun.
Last instead of inserting the endoscope into a door: try searching the second noun.
Last instead of inserting the endoscope into a dead person: try searching the second noun.
Last instead of inserting the endoscope into something worn by a living friendly person (called the wearer): say "You aren't [italic type]that[roman type] friendly with [the wearer]."
Last instead of inserting the endoscope into something worn by a living hostile person (called the wearer): say "You doubt [the wearer] will allow you to do that."
Last instead of inserting the endoscope into something: say "[The second noun] [are]n't something you can thread the endoscope into."

Instead of pushing, pulling, turning, searching, switching on, switching off, or squeezing the endoscope, say "To use the endoscope, >[bold type]put[roman type] it [bold type]in[roman type] the object you wish to inspect."
Instead of setting the endoscope to something, say "To use the endoscope, >[bold type]put[roman type] it [bold type]in[roman type] the object you wish to inspect."
Understand "use [the endoscope]" as a mistake ("To use the endoscope, >[bold type]put[roman type] it [bold type]in[roman type] the object you wish to inspect.").

Endoscope-inspecting is an action applying to one visible thing.
Understand "endoscope [something]" as endoscope-inspecting.
Understand "inspect [something]" as endoscope-inspecting.
Check endoscope-inspecting:
	if the endoscope is carried:
		try inserting the endoscope into the noun instead;
	otherwise:
		try examining the noun instead.

Specific endoscope-inspecting is an action applying to one visible thing and one thing.
Understand "look at/-- [something] with/using/through [the endoscope]" as specific endoscope-inspecting.
Understand "examine [something] with/using/through [the endoscope]" as specific endoscope-inspecting.
Understand "read [something] with/using/through [the endoscope]" as specific endoscope-inspecting.
Understand "see [something] with/using/through [the endoscope]" as specific endoscope-inspecting.
Understand "study [something] with/using/through [the endoscope]" as specific endoscope-inspecting.
Check specific endoscope-inspecting:
	if the endoscope is carried:
		try inserting the endoscope into the noun instead;
	otherwise:
		say "You need to be holding the endoscope to do that.";

Part 2.2.12 - Doctor Cavala's Signum

Doctor Cavala's signum is a key-item.
The description is "A piece of paper signed and sealed by Doctor Cavala. It declares that Servator Marid Orpheia is formally authorized to act in the signatory's stead, and that anyone who disagrees is welcome to take it up with the signatory."
Understand "if" or "signed/seal/sealed/signature" or "piece" or "paper" or "glyph" or "inertia" as Doctor Cavala's signum.

Instead of attacking or cutting Doctor Cavala's signum, say "[if time is critical]This is not the time.[otherwise]Thankfully, the seal makes the paper nigh indestructible."

Instead of looking under Doctor Cavala's signum, say "[if time is critical]This is not the time.[otherwise]The reverse of the signum is branded with a glyph of inertia."

Instead of giving Doctor Cavala's signum to Doctor Cavala, say "[if time is critical]This is not the time.[otherwise]Doctor Cavala rolls her eyes."

Book 2.3 - Actions

Part 2.3.1 - New Block Responses

Instead of attacking or cutting, say "That won't accomplish anything."
Instead of burning, say "No. No burning."
Instead of climbing, say "[regarding the noun][They're] not something you can climb."
Instead of drinking, say "[regarding the noun][They're] not something you can drink."
Instead of jumping, say "There's no reason to jump on the spot."
Instead of tasting, say "[if time is critical]This is not the time.[otherwise]That can't be hygienic."
Instead of tying something to something, say "You can't tie those."
Instead of waking up, say "This is not a dream."
Instead of rubbing or swinging, say "Nothing happens."
Instead of throwing something at something, say "That won't accomplish anything."
Instead of sleeping, say "[if time is critical]Sleep is the last thing on your mind right now.[otherwise if Walking Home in Darkness is happening or Walking Home in Fear is happening]You would prefer to sleep in the comfort of your dormitory.[otherwise if Nine to Five Zombie is happening]No, you have to report for work.[otherwise]It's too early to sleep."
After waiting when time is critical, say "This is no time for inaction."

Last before pushing something to: if the noun is not pushable between rooms, try pushing the noun instead.

Last instead of swinging a scenery thing: say "[regarding the noun][They're] not something you can swing."
Last instead of swinging a fixed in place thing: say "[regarding the noun][They] [are] fixed in place."

First rule for printing a parser error (this is the swear word filter rule):
	repeat through the Table of Mild Swear Words:
		if the player's command includes the topic entry:
			say "Indeed." instead;
	repeat through the Table of Severe Swear Words:
		if the player's command includes the topic entry:
			if time is critical:
				say "If you feel frustrated, type >[bold type]help[roman type] for hints." instead;
			otherwise:
				say "[one of]Language, Marid.[or]'Vulgar words reveal one's vulgar nature.' Philosopher Scepter.[or]If you feel frustrated, type >[bold type]help[roman type] for hints.[stopping]" instead;
	make no decision.
	
Table of Mild Swear Words
topic
"crap/crappy"
"crud/cruddy"
"darn/darned"

Table of Severe Swear Words
topic
"damn/damned/dammit"
"fuck/fucking"
"hell"
"shit/shitty/shitting"
"wtf"

Part 2.3.2 - New Synonyms

Chapter 2.3.2.1 - Blue Lacuna Style Input

Section 2.3.2.1.1 - ">" as a Synonym for Looking

[Parser hack courtesy of matt w. He writes:
	
	"What I've done is I've commented out the part of "Reading the Command" that handles "if the line was blank, get a fresh line." Then I use an "After reading a command" rule to handle the case where there's a blank command, by changing the command to what you want. I haven't checked it with undo and "end the story," but it might be safer than trying to hand-roll the turn sequence. Though I daren't ever say that messing with the parser template code is safe."

I use matt w's hack instead of changing the "I beg your pardon" error message so that the game runs all of the appropriate turn sequence code -- including "undo" save states and "end the story" triggers -- which aren't covered by the "rest of the turn rule" in Part 1.1.3.]
		
First after reading a command (this is the accept Blue Lacuna style looking rule):
	if the number of characters in "[the player's command]" is 0:
		change the text of the player's command to "look". 

Include
(- 
[ Keyboard  a_buffer a_table  nw i w w2 x1 x2;
	sline1 = score; sline2 = turns;

	while (true) {
		! Save the start of the buffer, in case "oops" needs to restore it
		for (i=0 : i<64 : i++) oops_workspace->i = a_buffer->i;
	
		! In case of an array entry corruption that shouldn't happen, but would be
		! disastrous if it did:
		#Ifdef TARGET_ZCODE;
		a_buffer->0 = INPUT_BUFFER_LEN;
		a_table->0 = 15;  ! Allow to split input into this many words
		#Endif; ! TARGET_
	
		! Print the prompt, and read in the words and dictionary addresses
		PrintPrompt();
		DrawStatusLine();
		KeyboardPrimitive(a_buffer, a_table);
	
		! Set nw to the number of words
		#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
	
		! If the line was blank, get a fresh line (commented this code out)
		!if (nw == 0) {
		!	@push etype; etype = BLANKLINE_PE;
		!	players_command = 100;
		!	BeginActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	if (ForActivity(PRINTING_A_PARSER_ERROR_ACT) == false) {
		!		PARSER_ERROR_INTERNAL_RM('X', noun); new_line;
		!	}
		!	EndActivity(PRINTING_A_PARSER_ERROR_ACT);
		!	@pull etype;
		!	continue;
		!}
	
		! Unless the opening word was OOPS, return
		! Conveniently, a_table-->1 is the first word on both the Z-machine and Glulx
	
		w = a_table-->1;
		if (w == OOPS1__WD or OOPS2__WD or OOPS3__WD) {
			if (oops_from == 0) { PARSER_COMMAND_INTERNAL_RM('A'); new_line; continue; }
			if (nw == 1) { PARSER_COMMAND_INTERNAL_RM('B'); new_line; continue; }
			if (nw > 2) { PARSER_COMMAND_INTERNAL_RM('C'); new_line; continue; }
		
			! So now we know: there was a previous mistake, and the player has
			! attempted to correct a single word of it.
		
			for (i=0 : i<INPUT_BUFFER_LEN : i++) buffer2->i = a_buffer->i;
			#Ifdef TARGET_ZCODE;
			x1 = a_table->9;  ! Start of word following "oops"
			x2 = a_table->8;  ! Length of word following "oops"
			#Ifnot; ! TARGET_GLULX
			x1 = a_table-->6; ! Start of word following "oops"
			x2 = a_table-->5; ! Length of word following "oops"
			#Endif; ! TARGET_
		
			! Repair the buffer to the text that was in it before the "oops"
			! was typed:
			for (i=0 : i<64 : i++) a_buffer->i = oops_workspace->i;
			VM_Tokenise(a_buffer,a_table);
		
			! Work out the position in the buffer of the word to be corrected:
			#Ifdef TARGET_ZCODE;
			w = a_table->(4*oops_from + 1); ! Start of word to go
			w2 = a_table->(4*oops_from);    ! Length of word to go
			#Ifnot; ! TARGET_GLULX
			w = a_table-->(3*oops_from);      ! Start of word to go
			w2 = a_table-->(3*oops_from - 1); ! Length of word to go
			#Endif; ! TARGET_
		
			! Write spaces over the word to be corrected:
			for (i=0 : i<w2 : i++) a_buffer->(i+w) = ' ';
		
			if (w2 < x2) {
				! If the replacement is longer than the original, move up...
				for (i=INPUT_BUFFER_LEN-1 : i>=w+x2 : i-- )
					a_buffer->i = a_buffer->(i-x2+w2);
		
				! ...increasing buffer size accordingly.
				#Ifdef TARGET_ZCODE;
				a_buffer->1 = (a_buffer->1) + (x2-w2);
				#Ifnot; ! TARGET_GLULX
				a_buffer-->0 = (a_buffer-->0) + (x2-w2);
				#Endif; ! TARGET_
			}
		
			! Write the correction in:
			for (i=0 : i<x2 : i++) a_buffer->(i+w) = buffer2->(i+x1);
		
			VM_Tokenise(a_buffer, a_table);
			#Ifdef TARGET_ZCODE; nw = a_table->1; #Ifnot; nw = a_table-->0; #Endif;
		
			return nw;
		}

		! Undo handling
	
		if ((w == UNDO1__WD or UNDO2__WD or UNDO3__WD) && (nw==1)) {
			Perform_Undo();
			continue;
		}
		i = VM_Save_Undo();
		#ifdef PREVENT_UNDO; undo_flag = 0; #endif;
		#ifndef PREVENT_UNDO; undo_flag = 2; #endif;
		if (i == -1) undo_flag = 0;
		if (i == 0) undo_flag = 1;
		if (i == 2) {
			VM_RestoreWindowColours();
			VM_Style(SUBHEADER_VMSTY);
			SL_Location(); print "^";
			! print (name) location, "^";
			VM_Style(NORMAL_VMSTY);
			IMMEDIATELY_UNDO_RM('E'); new_line;
			continue;
		}
		return nw;
	}
]; 
-) instead of "Reading the Command" in "Parser.i6t".

Section 2.3.2.1.2 - Contextual Keyword Commands

Understand "[something]" as examining.

Chapter 2.3.2.2 - Upstairs, Downstairs

Understand "upstairs" as up. Understand "downstairs" as down.

Chapter 2.3.2.3 - Action Synonyms

Understand "arrange [something]" as pushing.
Understand "climb through/into/in/inside/on/onto/to [something]" as entering.
Understand "descend into/through/on/in/inside/-- [something]" as entering.
Understand "dissect [something]" as cutting.
Understand "fall asleep" as sleeping.
Understand "find [text] in [something]" as consulting it about (with nouns reversed).
Understand "get inside [something]" as entering.
Understand "go back/-- to sleep" as sleeping.
Understand "go to [something]" as entering.
Understand "insert [something preferably held] down [something]" as inserting it into.
Understand "jump through/into/in/inside/on/onto/at/to [something]" as entering.
Understand "kick [something]" as attacking.
Understand "lick [something]" as tasting.
Understand "lift [things]" as taking.
Understand "look behind/beside [something]" as looking under.
Understand "l behind/beside [something]" as looking under.
Understand "look for [text] in [something]" as consulting it about (with nouns reversed).
Understand "l for [text] in [something]" as consulting it about (with nouns reversed).
Understand "load" as restoring the game.
Understand "order [something]" as buying.
Understand "poke [something]" as pushing.
Understand "prop up/-- [other things] up/-- on/onto [something]" as putting it on.
Understand "put [something preferably held] down [something]" as inserting it into.
Understand "raise [something]" as pulling.
Understand "ring [something]" as swinging.
Understand "search [something] for [text]" as consulting it about.
Understand "search for [text] in [something]" as consulting it about (with nouns reversed).
Understand "see [something]" as examining.
Understand "shake [something]" as swinging.
Understand "shuffle [something]" as swinging.
Understand "sit at [something]" as entering.
Understand "sit down on/at [something]" as entering.
Understand "slap [something]" as attacking.
Understand "stab [something]" as cutting.
Understand "step on/in [something]" as entering.
Understand "straighten [something]" as turning.
Understand "study [something]" as examining.
Understand "tear [something]" as attacking.
Understand "thread [something preferably held] into [something]" as inserting it into.
Understand "turn [something] to [text]" as setting it to.
Understand "unravel [something]" as opening.
Understand "untie [something]" as opening.

Before attacking, cutting, kissing, knocking on, pushing, pulling, rubbing, searching, smelling, swinging, squeezing, touching, or turning something worn by an other living person (called the wearer) (this is the redirect actions from other people's clothing to the wearer rule): now the noun is the wearer.

Before thinking, try asking for journal instead.

Last instead of climbing a door: try entering the noun instead.
Last instead of climbing a supporter: try entering the noun instead.
Before exiting when the player is not enclosed by something, try going outside instead.

Understand the commands "kiss" or "embrace" or "hug" as something new. Understand "kiss [something]" as kissing. Understand "embrace [something]" or "hug [something]" as squeezing. [This allows us to kiss inanimate objects, such as the animus pendant, and provides more pertinent responses for hugging things.]
Instead of kissing something that is not a person, try tasting the noun.

Understand the commands "give" or "pay" or "offer" or "feed" or "show" or "present" or "display" as something new. [Likewise for giving/showing.]
Understand "give [something preferably held] to [something]" as giving it to.
Understand "pay [something preferably held] to [something]" as giving it to.
Understand "offer [something preferably held] to [something]" as giving it to.
Understand "feed [something preferably held] to [something]" as giving it to.
Understand "show [something preferably held] to [something]" as giving it to.
Understand "present [something preferably held] to [something]" as giving it to.
Understand "display [something preferably held] to [something]" as giving it to.
Understand "give [something] [something preferably held]" as giving it to (with nouns reversed).
Understand "pay [something] [something preferably held]" as giving it to (with nouns reversed).
Understand "offer [something] [something preferably held]" as giving it to (with nouns reversed).
Understand "feed [something] [something preferably held]" as giving it to (with nouns reversed).
Understand "show [something] [something preferably held]" as giving it to (with nouns reversed).
Understand "present [something] [something preferably held]" as giving it to (with nouns reversed).
Understand "display [something] [something preferably held]" as giving it to (with nouns reversed).
The can't give to a non-person rule response (A) is "You can only do that to something animate."

Understand the command "wave" as something new. Understand "wave [something]" as swinging.

Check approaching (this is the no need to hurry when you can go normally rule):
	let N be the number of moves from the location to the noun, using doors;
	if N is 1:
		let thataway be the best route from the location to the noun, using doors;
		try going thataway;
		stop the action;
	otherwise:
		now N is the number of moves from the location to the noun, using even locked doors;
		if N is 1:
			let thataway be the best route from the location to the noun, using even locked doors;
			try going thataway;
			stop the action.
	
A thing can be consultable. A thing is usually not consultable.
Before consulting something that is not consultable about something (this is the search unconsultable things instead rule): try searching the noun instead.

Understand "possession" as a thing enclosed by a person.

Part 2.3.3 - New Miscellaneous Actions

Bandaging it with is an action applying to two things.
Understand "bandage [something]" as bandaging it with.
Understand "dress [something]" as bandaging it with.
Understand "bandage [something] with [other things]" as bandaging it with.
Understand "dress [something] with [other things]" as bandaging it with.

Rule for supplying a missing second noun while bandaging (this is the assume a proper bandage rule): 
	if the elastic bandage can be touched by the player:
		now the second noun is the elastic bandage;
	otherwise:
		now the second noun is the player.
	
Check bandaging it with (this is the block bandaging rule):
	say "[The noun] [don't] need bandaging.";
	stop the action.

Bed-making is an action applying to one thing. Understand "make [something]" as bed-making. [As you might have guessed, this is here for the bored player who attempts to 'make bed.']
Check bed-making: say "That doesn't make any sense."; stop the action.

Bribing is an action applying to one thing. Understand "bribe [something]" or "pay [something]" as bribing.
Check bribing:
	if the purse is carried:
		try giving the purse to the noun;
	otherwise:
		say "You have no money on you.";
	stop the action.

Brushing your teeth is an action applying to nothing. Understand "brush my/-- teeth" or "clean my/-- teeth" as brushing your teeth. [Blame Brentain for this one.]
Carry out brushing your teeth (this is the standard brushing your teeth rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the location is Marid's Room:
		if Walking Home in Darkness is happening:
			say "[one of]You brush your teeth.[or]You've already brushed your teeth.[stopping]";
		otherwise if Walking Home in Fear is happening:
			say "[one of]You brush your teeth.[or]You've already brushed your teeth.[stopping]";
		otherwise:
			say "You've already brushed your teeth.";
	otherwise:
		say "You have nothing with which to brush your teeth."
		
Card-playing is an action applying to one thing. Understand "play [something]" as card-playing.
Check card-playing: say "That doesn't make any sense."; stop the action.
		
Combing your hair is an action applying to nothing. Understand "comb my/-- hair" or "brush my/-- hair" as combing your hair. [The logical next step.]
Carry out combing your hair (this is the standard combing your hair rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the location is Marid's Room:
		if Walking Home in Darkness is happening or Walking Home in Fear is happening:
			say "There isn't much point. Your hair will get messed up when you sleep.";
		otherwise:
			say "You've already combed your hair.";
	otherwise:
		say "You have nothing with which to comb your hair."
		
Crying is an action applying to nothing. Understand "cry" or "panic" as crying.
Check crying (this is the block crying rule): say "No. You have to stay strong."; stop the action.
		
Descending is an action applying to nothing. Understand "descend" as descending.
Check descending: try going down instead.
		
Extinguishing is an action applying to one thing. Understand "blow out/on/-- [something]" or "extinguish [something]" or "put out [something]" or "snuff [something]" as extinguishing.
Check extinguishing: say "[regarding the noun][They're] not something that can be extinguished."; stop the action.

Filing your nails is an action applying to nothing. Understand "cut my/-- nails" or "file my/-- nails" or "trim my/-- nails" as filing your nails. [I hate you all.]
Carry out filing your nails (this is the standard filing your nails rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the location is Marid's Room and Walking Home in Darkness is happening:
		say "[one of]You file your nails.[or]You've already filed your nails.[stopping]";
	otherwise if the location is Marid's Room and Walking Home in Fear is happening:
		say "[one of]You file your nails.[or]You've already filed your nails.[stopping]";
	otherwise:
		say "You've already filed your nails.";

Going home is an action applying to nothing. Understand "go back/-- home" as going home.
Carry out going home:
	if Marid's Room is visited:
		try approaching Marid's Room;
	otherwise:
		say "That isn't a place you've visited[if player-knows-go is false].[paragraph break](Try going in a direction instead. For example, >[bold type]go south[roman type].)[otherwise].";

Knocking on is an action applying to one thing. Understand "knock on/-- [something]" or "tap [something]" as knocking on.
Check knocking on an openable door: say "There is no response."; stop the action.
Check knocking on: say "Nothing happens."; stop the action.

Scaring is an action applying to one visible thing. Understand "chase away/-- [something]" or "scare away/-- [something]" or "shoo away/-- [something]" or "frighten away-- [something]" as scaring.
Check scaring when the noun is not a living person: say "That is unlikely to elicit a response."; stop the action.
Check scaring the player: say "[if time is critical]This is not the time.[otherwise]There's no need for that."; stop the action.
Check scaring a friendly person: say "[if time is critical]This is not the time.[otherwise]That hardly seems called for."; stop the action.
Check scaring a hostile person: say "That seems unlikely to be effective."; stop the action.

Screaming is an action applying to nothing. Understand "yell" or "holler for/-- the/-- guard/guards/--" or "shout" or "scream" as screaming.
Check screaming: say "No. You have to keep your cool."; stop the action.

Singing is an action applying to nothing. Understand "sing" or "hum" as singing.
Check singing: say "[if time is critical]This is not the time.[otherwise]You hum to yourself."; stop the action.

Swimming is an action applying to nothing. Understand "swim" or "dive" as swimming.
Check swimming (this is the block swimming rule):
	if the fosse is in the location:
		say "[if time is critical]It's too dangerous to swim.[otherwise]Diving into the fosse is both dangerous and illegal.";
	otherwise if the Bilious Canal's runoff is in the location:
		say "If you dived into the water here, you doubt you'd ever come up again.";
	otherwise if the Bilious Canal is in the location or the up-close Canal is in the location:
		say "[if time is critical]It's impossible to swim in this current.[otherwise]The Bilious Canal isn't the most appealing venue for a swim.";
	otherwise:
		say "You don't see anywhere to swim here.";
	stop the action.
	
Tickling is an action applying to one thing. Understand "tickle [something]" or "fondle [something]" as tickling.
Check tickling when time is critical: say "This is not the time."; stop the action.
Check tickling when the noun is not a living person: say "That is unlikely to elicit a response."; stop the action.
Check tickling the player: say "It's impossible to tickle oneself. The exact reason why is one of the great mysteries of the [italic type]ars vitalis[roman type]."; stop the action.
Check tickling a friendly person: say "You aren't [italic type]that[roman type] friendly with [the noun]."; stop the action.
Check tickling a hostile person: say "You doubt [the noun] will let you do that."; stop the action.

Understand "blush" as a mistake ("[if time is critical]This is not the time.[otherwise]Absolutely not.").
Understand "bow" or "curtsy" or "curtsey" as a mistake ("[if time is critical]This is not the time.[otherwise]That's a little old-fashioned, don't you think?").
Understand "cook" or "cook [text]" as a mistake ("[if time is critical]This is not the time.[otherwise]You have neither the knowledge nor the inclination.").
Understand "die" as a mistake ("[if time is critical]No.[otherwise]Entertaining such thoughts is never productive.").
Understand "chuckle" or "grin" or "laugh" or "smile" as a mistake ("[if time is critical]This is not the time.[otherwise if (Cavala's Errands is happening and Maze Part One is unvisited) or (Walking Home in Fear is happening and the enabled of bartender-dialogue-drink is true)]You smile.[otherwise]You aren't in the mood.").
Understand "dance" or "dance [text]" or "do a dance/jig" as a mistake ("[if time is critical]This is not the time.[otherwise]You aren't in the mood.").
Understand "go behind [text]" or "go in front [text]" as a mistake ("(You don't need to be specific about where you're standing. Just >[bold type]examine[roman type] or >[bold type]search[roman type] what you'd like to interact with.)").
Understand "fall down/over/--" or "misstep" or "trip" or "trip [text]" as a mistake ("[if time is critical]This is not the time.[otherwise]You're more sure-footed than that, Marid.").
Understand "find [text]" or "look for [text]" as a mistake ("You'll have to be more specific about where you look.").
Understand "follow" or "follow [text]" or "go after [text]" as a mistake ("You'll have to specify which direction you want to go in.").
Understand "jump in front of [text]" or "run in front of [text]" as a mistake ("[if time is critical]This is not the time.[otherwise]That seems exceedingly unwise.").
Understand "kneel" or "kneel [text]" or "sink to my/-- knees" or "fall to my/-- knees" as a mistake ("[if marid-kneeling-in-maze is true]You are already kneeling.[otherwise if the location is Maze Part Four]You are not going to sink to your knees again.[otherwise if time is critical]This is not the time.[otherwise]You'll face the world on your feet.").
Understand "undress" as a mistake ("[if time is critical]This is not the time.[otherwise if the location is Marid's Room]You don't need a change of clothes at the moment.[otherwise]You'd rather remain in proper attire.").
Understand "use [text]" as a mistake ("(You'll have to use a more specific verb than that.)").
Understand "whistle" as a mistake ("[if time is critical]This is not the time.[otherwise]You don't know how to whistle.").
Understand "pray" or "pray [text]" as a mistake ("[if the location is Maze Part Four]There is no answer.[otherwise if time is critical]Action is needed now, not prayer.[otherwise]You never took much stock in the Deist worldview.").
Understand "primes" or "oh primes" or "curse" or "cuss" or "swear an/-- oath/--" as a mistake ("[if the location is Maze Part Four]...[otherwise if time is critical]Yup.[otherwise]You mutter an oath under your breath.").
Understand "remember" or "remember [text]" or "recall" or "recall [text]" or "think about" or "think about [text]" as a mistake ("(Type >[bold type]journal[roman type] for a reminder of the information you've come across.)").
Understand "roll my/-- eyes" as a mistake ("[if time is critical]This is not the time.[otherwise]You roll your eyes.").
Understand "sigh" as a mistake ("[if the location is Maze Part Four]You choke.[otherwise if time is critical]This is not the time.[otherwise]You sigh.").
Understand "step with care" as a mistake ("[if the location is Maze Part Four]You can't bring yourself to.[otherwise]Always.").
Understand "stoop" as a mistake ("[if time is critical]This is not the time.[otherwise]You stoop.").
Understand "throw up" or "vomit" or "barf" or "lose my/-- lunch" as a mistake ("You're made of sterner stuff than that.").
Understand "type [text]" as a mistake ("[if the correspondence machine is in the location]None of the alphanumeric keys are working.[otherwise]There's nothing here that you can type on.").
Understand "xyzzy" or "plugh" or "plover" as a mistake ("[if time is critical]This is not the time.[otherwise]You're a doctor's apprentice, not a wizard's apprentice.").

Part 2.3.4 - New Parser Error Messages

look-reminder-printed is a truth state that varies.

Rule for printing a parser error when the latest parser error is the can't see any such thing error (this is the new can't see any such thing rule):
	if the player's command includes "go/walk/run":
		say "You can only go in compass directions, or up, down, in, or out." instead;
	otherwise:
		say "That is either not important or not something you can see.[line break][if look-reminder-printed is false][line break](Type >[bold type]look[roman type] or a blank command to examine your surroundings.)";
		now look-reminder-printed is true.
	
Rule for printing a parser error when the latest parser error is the not a verb I recognise error or the latest parser error is the didn't understand that number error (this is the new not a verb I recognise rule):
	say "That object or command isn't available[one of].

(Type >[bold type]commands[roman type] or >[bold type]c[roman type] for a list of commands.)[or].[stopping]" instead.
	
Rule for printing a parser error when the latest parser error is the noun did not make sense in that context error (this is the new did not make sense in that context rule):
	if the player's command includes "go/revisit/return":
		say "That isn't a place you've visited[if player-knows-go is false].[paragraph break](Try going in a direction instead. For example, >[bold type]go south[roman type].)[otherwise]." instead;
	otherwise:
		say "That is either not important or not something you can see.[line break][if look-reminder-printed is false][line break](Type >[bold type]look[roman type] or a blank command to examine your surroundings.)";
		now look-reminder-printed is true.
	
Rule for printing a parser error when the latest parser error is the can't use multiple objects error (this is the new can't use multiple objects rule):
	say "You'll have to specify which one." instead.

Rule for printing a parser error when the latest parser error is the can't see whom to talk to error or the latest parser error is the can't talk to inanimate things error or the latest parser error is the can't again the addressee error or the latest parser error is the didn't understand addressee's last name error (this is the new can't see whom to talk to rule):
	say "(Use the command >[bold type]talk to[roman type] or >[bold type]t[roman type] to converse with other characters.)" instead.

Part 2.3.5 - New Action Behavior

player-knows-look is a truth state that varies.
Before looking when player-knows-look is false (this is the so you do know how to look rule):
	now player-knows-look is true;
	continue the action.

player-knows-go is a truth state that varies.
Before going a direction when player-knows-go is false (this is the so you do know how to go rule):
	now player-knows-go is true;
	continue the action.

After opening (this is the reveal any newly visible interior even if it contains nothing rule):
	if the noun is an opaque container and
		the noun contains nothing and
		the noun does not enclose the actor:
		if the action is not silent, say "[We] [open] [the noun]. [They're] empty.";
	otherwise:
		continue the action.
		
Does the player mean entering something:
	if the noun is not a door and the noun is not enterable, it is unlikely;
	make no decision.

Part 2.3.6 - Implicit Actions

A door can be better kept closed or better left open. A door is usually better kept closed.

After going through a door (called the traversed door) (this is the close doors after going through them rule):
	if the traversed door is openable and the traversed door is better kept closed:
		if the player is staid, say "(closing the door[if the traversed door is plural-named]s[end if] behind you)[command clarification break]";
		try silently closing the traversed door;
	continue the action.
	
Rule for issuing the response text of the opening doors before entering rule response (A) while the player is hurrying (this is the suppress implicit door-opening messages while approaching rule): say "[run paragraph on]".

Part 2.3.7 - Emptying It Into

Emptying it into is an action applying to two things.
Understand "empty [something preferably held]" as emptying it into.
Understand "empty [something preferably held] in/into/on/onto/over [something]" as emptying it into.
Understand "empty out [something preferably held]" as emptying it into.
Understand "empty out [something preferably held] in/into/on/onto/over [something]" as emptying it into.
Understand "empty [something preferably held] out" as emptying it into.
Understand "empty [something preferably held] out in/into/on/onto/over [something]" as emptying it into.
Understand "pour [something preferably held]" as emptying it into.
Understand "pour [something preferably held] in/into/on/onto/over [something]" as emptying it into.
Understand "pour out [something preferably held]" as emptying it into.
Understand "pour out [something preferably held] in/into/on/onto/over [something]" as emptying it into.
Understand "pour [something preferably held] out" as emptying it into.
Understand "pour [something preferably held] out in/into/on/onto/over [something]" as emptying it into.

Rule for supplying a missing second noun while emptying (this is the emptying into the location rule):
	now the second noun is the location.

Check emptying (this is the can't empty something that's not a container rule):
	if the noun is not a container:
		say "[The noun] [are]n't something you can empty.";
		stop the action.
		
Check emptying (this is the can't empty something into something that can't enclose things rule):
	if the second noun is not a room and the second noun is not a container and the second noun is not a supporter:
		say "[The second noun] [are]n't something you can empty things into.";
		stop the action.
		
Check emptying (this is the can't empty something that's already empty rule):
	if the noun contains nothing:
		say "[The noun] [are] already empty.";
		stop the action.
		
Check emptying (this is the can't empty something that's closed rule):
	if the noun is closed:
		say "(first opening [the noun])[command clarification break]";
		try silently opening the noun;
	if the noun is closed, stop the action.
	
Carry out emptying (this is the standard emptying rule):
	if the second noun is a supporter:
		now all things in the noun are on the second noun;
	otherwise:
		now all things in the noun are in the second noun.
			
Report emptying (this is the report emptying rule):
	if the second noun is a supporter:
		say "You empty [the noun] onto [the second noun].";
	otherwise:
		say "You empty [the noun] into [the second noun]."
		
Part 2.3.8 - Listing Exits and Going-In Disambiguation

A room has some text called the exit reminder.

Listing exits is an action out of world. Understand "exits" as listing exits.
Instead of going nowhere, try listing exits instead.

Report listing exits (this is the report listing exits rule):
	if the player is engaged in endoscopy:
		say "[exit reminder of the endoscopic location][line break]";
	otherwise:
		say "[exit reminder of the location][line break]".
	
A room has some text called the going-in disambiguation.

First instead of going when the noun is inside and the going-in disambiguation of the location is not empty (this is the provide going-in disambiguation rule):
	say "[going-in disambiguation of the location][line break]".

Part 2.3.9 - Dialogue System

Chapter 2.3.9.1 - Dialogue Branches

A dialogue branch is a kind of object.

A dialogue branch has a truth state called enabled. Enabled is usually true. [If a branch is not enabled, it doesn't show up as a possible choice in the command prompt.]

A dialogue branch has a truth state called one-shot. One-shot is usually false. [A one-shot branch disables itself after being read out.]

A dialogue branch has some text called the prompt. The prompt of a dialogue branch is usually "[printed name] (no prompt)". [The prompt is the text that labels the option to choose the branch.]

A dialogue branch has some text called the description. [The description is the text displayed when the branch is chosen.]

A dialogue branch has a list of dialogue branches called the choices. [These are the child branches of the branch.]

A person has a dialogue branch called the home dialogue branch. [This flag indicates the default branch when you TALK TO someone.]

The null dialogue branch is a dialogue branch. The home dialogue branch of a person is usually the null dialogue branch. [A placeholder to prevent runtime errors due to not defining dialogue for someone.] The description of the null dialogue branch is "[bold type]Error:[roman type] Attempted to read out null dialogue branch."

[If a branch has no children, it will end the dialogue upon being read out.]

Look-pending switch is a truth state that varies. [This is switched on when we want to look after ending a dialogue.]

To say look pending:
	follow the scene changing rules;
	now look-pending switch is true;
	wait for any key.

Chapter 2.3.9.2 - Tearing Out Inform Dialogue

Understand the commands "ask" and "tell" and "say" and "answer" and "yes" and "no" and "sorry" as something new.

Understand "ask [text]" or "tell [text]" or "answer [text]" or "say [text]" or "insult [text]" or "compliment [text]" or "flirt [text]" or "greet [text]" or "whisper [text]" or "wave at [text]" or "report [text]" or "hello" or "hi" or "ok" or "okay" or "nod" or "shake head" or "wave" or "yes" or "no" or "sorry" as a mistake ("(Use the command >[bold type]talk to[roman type] or >[bold type]t[roman type] to converse with other characters.)").

Understand "wave hello" or "wave hello [text]" or "wave goodbye" or "wave goodbye [text]" as a mistake ("(Use the command >[bold type]talk to[roman type] or >[bold type]t[roman type] to converse with other characters.)"). [Because OF COURSE wxd tried this]

Instead of asking someone to try doing something, say "(Use the command >[bold type]talk to[roman type] or >[bold type]t[roman type] to converse with other characters.)"
Instead of answering someone that something, say "(Use the command >[bold type]talk to[roman type] or >[bold type]t[roman type] to converse with other characters.)"

Chapter 2.3.9.3 - Engaged in Dialogue

Yourself can be engaged in dialogue. Yourself is not engaged in dialogue.

The available dialogue choices is a list of dialogue branches that varies.

Reading out something is an activity on dialogue branches. [This activity is what translates the dialogue branch object into displayed text and provides the appropriate dialogue choices. We make it an activity rather than a function so we can write "Before reading out X..." or "After reading out X..."]

To read out (current branch - a dialogue branch):
	carry out the reading out activity with the current branch. [A more convenient and human-readable way to say the same thing.]
	
Rule for reading out a dialogue branch (called the current branch):
	say "[description of the current branch][if the description of the current branch is not empty and look-pending switch is false][line break]";
	if the one-shot of the current branch is true, now the enabled of the current branch is false;
			
Last after reading out a dialogue branch (called the current branch) (this is the end the dialogue after reading out a dialogue branch with no choices rule): [This is separated from the main 'reading out' rule because the 'after reading out' rules may change the conditions of a scene change or what dialogue choices are available.]
	if the number of entries in the choices of the current branch is 0:
		end the dialogue;
	otherwise:
		change the available dialogue choices to have 0 entries;
		repeat with current child running through the choices of current branch:
			if the enabled of current child is true, add current child to the available dialogue choices.
	
Chapter 2.3.9.4 - Dialogue Command Prompt

To say dialogue-cmd-prompt:
	if the number of entries in the available dialogue choices is 0:
		say "[bold type]Error:[roman type] Attempted to print the dialogue command prompt with no available choices. Now ending the dialogue...[line break]";
		end the dialogue;
	otherwise:
		say italic type;
		repeat with N running from 1 to the number of entries in the available dialogue choices:
			say "[N]) [prompt of entry N in the available dialogue choices][line break]";
		say roman type;
	say "[line break]>".
	
After reading a command while the player is engaged in dialogue (this is the reading a command during dialogue rule):
	if the player's command matches "[number]":
		let N be the number understood;
		if N > 0 and N <= the number of entries in the available dialogue choices:
			read out entry N in the available dialogue choices;
			reject the player's command;
			stop;
	unless the player's command matches "quit/q/save/restore/load/restart":
		say "Please choose a response from the list by typing the corresponding number.";
		reject the player's command.

First turn sequence rule (this is the time doesn't pass during dialogue rule):
	if the player is engaged in dialogue, rule fails.

Chapter 2.3.9.5 - Starting and Ending a Dialogue

To start a dialogue with (provided partner - a thing):
	if the home dialogue branch of the provided partner is not the null dialogue branch:
		now the conversational partner text is "Talking to [the provided partner]";
		if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
		now the command prompt is "[dialogue-cmd-prompt]";
		read out the home dialogue branch of the provided partner;
		now the player is engaged in dialogue;
	otherwise:
		say "[bold type]Error:[roman type] Attempted to start a dialogue with [the provided partner] but no home dialogue branch was defined for [them]."
		
To start a dialogue using dialogue (chatter - a dialogue branch):
	now the conversational partner text is "[if the current day is Prologue or the current day is Epilogue][otherwise][current day]";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	now the command prompt is "[dialogue-cmd-prompt]";
	read out the chatter;
	now the player is engaged in dialogue.
		
To start a dialogue saying (provided text - some text) using dialogue (chatter - a dialogue branch):
	now the conversational partner text is the provided text;
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	now the command prompt is "[dialogue-cmd-prompt]";
	read out the chatter;
	now the player is engaged in dialogue.

To start a dialogue with (provided partner - a thing) using dialogue (chatter - a dialogue branch):
	now the conversational partner text is "Talking to [the provided partner]";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	now the command prompt is "[dialogue-cmd-prompt]";
	read out the chatter;
	now the player is engaged in dialogue.
	
To end the dialogue:
	now the conversational partner text is "";
	now right alignment depth is 14;
	now the command prompt is ">";
	now the player is not engaged in dialogue;
	if look-pending switch is true, try looking;
	now look-pending switch is false;
	now ambience suppression is true;
	follow the rest of the turn rule.

Chapter 2.3.9.6 - Talking To

Talking to is an action applying to one visible thing.
Understand "t [something]" as talking to.
Understand "talk to/with/-- [something]" as talking to.
Understand "holler at [something]" as talking to.
Understand "scream at [something]" as talking to.
Understand "shout at [something]" as talking to.
Understand "speak to/with/-- [something]" as talking to.
Understand "yell at [something]" as talking to.

Does the player mean talking to something that is not a person: it is unlikely.

Check talking to something that is not a living person (this is the can't talk to inanimate objects rule): say "You won't get much of a response." instead.

Check talking to the player (this is the can't talk to yourself rule): say "You aren't that far gone, Marid." instead.

Check talking to an other person when the home dialogue branch of the noun is the null dialogue branch (this is the can't talk to someone with no home dialogue rule): say "[The noun] [have] nothing to say to you." instead.

Check talking to an other person when the enabled of the home dialogue branch of the noun is false (this is the can't talk to someone with disabled home dialogue rule): say "[The noun] [have] nothing to say to you." instead.

Carry out talking to something (this is the standard talking to rule):
	start a dialogue with the noun.

Part 2.3.10 - Endoscopy

[This is a minigame where we "transport" the player's perspective inside the pathway they inspect. We clear the screen and shift perspective to the endoscope-viewpoint. You can "look," "go," or "examine" a thing in the endoscopic room. Any other action ends the endoscopy.]

Chapter 2.3.10.1 - Definitions

Yourself can be engaged in endoscopy. Yourself is not engaged in endoscopy.

The endoscopic location is a room that varies.

The endoscopic subject text is some text that varies.

The endoscopic-endoscope is a privately-named backdrop.
The printed name is "light from your endoscope".
The description is "A circle of feeble illumination."
Understand "ring/circle" or "of/from" or "your/my" or "light/lens-light/illumination" or "lens/lenses" or "endoscope/scope" as the endoscopic-endoscope.

Chapter 2.3.10.2 - Endoscopic Actions

After deciding the scope of the player while the player is engaged in endoscopy:
	place the endoscopic location in scope;
	place the endoscopic-endoscope in scope.

Does the player mean doing something with a thing enclosed by the endoscopic location when the player is engaged in endoscopy: it is very likely.
Does the player mean doing something with the endoscopic-endoscope when the player is engaged in endoscopy: it is very likely.
Rule for clarifying the parser's choice of something when the player is engaged in endoscopy: do nothing.
	
Last before doing anything when the player is engaged in endoscopy (this is the endoscopic actions rule):
	if we are looking:
		say "[bold type][printed name of the endoscopic location in title case][roman type][line break][run paragraph on with special look spacing]";
		if set to abbreviated room descriptions:
			do nothing;
		otherwise if set to sometimes abbreviated room descriptions and abbreviated form allowed is true and the endoscopic location is visited:
			do nothing;
		otherwise:
			say "[description of the endoscopic location][line break]";
		if the endoscopic location is a room, now the endoscopic location is visited;
		stop the action;
	[A caveat for looking: this is a short-form hack that doesn't describe the locale, so we have to describe all the scenery in the room description. I could make it describe the locale if I wanted to but that is a lot of effort and code for no real gain.]
	otherwise if we are going:
		if the noun is outside:
			end the endoscopy, followed by looking;
			stop the action;
		otherwise if the noun is inside:
			now the noun is down;
		if the room the noun from the endoscopic location is a room:
			if the noun is up:
				say "You withdraw...[paragraph break]";
			otherwise if the noun is down:
				say "You descend...[paragraph break]";
			wait for any key;
			clear only the main screen;
			say line break;
			now the endoscopic location is the room the noun from the endoscopic location;
			update backdrop positions;
			surreptitiously reckon darkness;
			try looking;
			stop the action;
		otherwise if the noun is up:
			end the endoscopy, followed by looking;
			stop the action;
		otherwise if the noun is down:
			say "You cannot go any further.";
			stop the action;
		otherwise:
			say "You can only go up or down.";
			stop the action;
	otherwise if we are descending:
		continue the action;
	otherwise if we are exiting:
		end the endoscopy, followed by looking;
		stop the action;
	otherwise if we are doing something with a thing (called the curiosity) enclosed by the endoscopic location:
		if we are searching or looking under:
			try examining the noun;
			stop the action;
		otherwise if we are examining:
			continue the action;
		otherwise:
			say "You can only examine [regarding the curiosity][them].";
			stop the action;
	otherwise if the current action involves the endoscopic-endoscope:
		if we are searching or looking under:
			try examining the noun;
			stop the action;
		otherwise if we are examining:
			continue the action;
		otherwise if we are pulling or taking:
			try going up;
			stop the action;
		otherwise if we are pushing or dropping:
			try going down;
			stop the action;
		otherwise if we are opening, closing, knocking on, squeezing, swinging, touching, tickling, or turning:
			say "You adjust the lenses.";
			stop the action;
		otherwise:
			say "You cannot do that.";
			stop the action;
	otherwise if we are examining down or examining inside:
		say "You see only darkness.";
		stop the action;
	otherwise if we are examining a direction:
		say "The endoscope is not articulated enough to do that.";
		stop the action;
	otherwise if we are waiting:
		say "You adjust the lenses.";
		stop the action;
	otherwise:
		end the endoscopy;
		continue the action.
		
[Since the before stage doesn't run for out of world actions, this still allows saving, loading, asking for help, and so on.]
		
endoscopy-exit-tutorial-quipped is a truth state that varies.
Before reading a command when the player is engaged in endoscopy and endoscopy-exit-tutorial-quipped is false and the room down from the endoscopic location is not a room:
	say "(Type >[bold type]out[roman type] to end the endoscopy.)";
	now endoscopy-exit-tutorial-quipped is true.

Chapter 2.3.10.3 - Starting and Ending an Endoscopy

endoscopy-tutorial-quipped is a truth state that varies.

To start an endoscopy on (victim name - some text) via (the aperture - some text) to (destination - a room):
	say "You insert the endoscope into [the aperture]...[paragraph break]";
	wait for any key;
	now the player is engaged in endoscopy;
	now the endoscopic location is the destination;
	now the endoscopic subject text is "Inspecting [victim name]";
	if the number of characters in the endoscopic subject text is greater than 14, now right alignment depth is the number of characters in the endoscopic subject text;
	clear the screen;
	redraw status line;
	say line break;
	try looking.
	
To end the endoscopy, followed by looking:
	say "You withdraw upward...[paragraph break]";
	wait for any key;
	now the player is not engaged in endoscopy;
	now right alignment depth is 14;
	clear the screen;
	redraw status line;
	say line break;
	say "You clean the endoscope and put it in your pocket.[paragraph break]";
	if followed by looking, try looking.

Part 2.3.11 - Help Menu

Table of the Help Menu
title	subtable	description	toggle
"About This Game"	--	"[about-this-game-text]"	--
"How to Play"	--	"[how-to-play-text]"	--
"List of Commands"	--	"[useful-commands-text]"	--
"Journal"	--	"[journal-text]"	--
"Characters"	--	"[characters-text]"	--
"Map"	--	"[map-text]"	--
"Hints"	Table of the Hint Menu	--	--
"Credits"	--	"[credits-text]"	--
"Back"	--	--	quit rule

Chapter 2.3.11.1 - About This Game, How to Play, Useful Commands, Credits

To say about-this-game-text:
	say "[bold type]About this game[roman type]

[italic type]The Weight of a Soul[roman type] is an interactive fiction game set in the world of Solphos. It takes place some years after my short story [italic type]The Guiding Light[roman type], and is an indirect sequel to it. There are callbacks and references scattered throughout this game for those already familiar with the setting, but don't worry if you're new to the whole thing: the game is designed so that anyone can enjoy it regardless of prior experience.

This game was written and compiled in Inform, a design system for interactive fiction using human-readable programming language. Inform 7 was created by Graham Nelson with contributions from countless talented writers and programmers, and this game is deeply indebted to all of their efforts. More information can be found at [bold type]inform7.com[roman type].";

To say how-to-play-text:
	say "[bold type]How to play[roman type]

This is a work of interactive fiction. It is a game about solving puzzles and investigating mysteries. You play the part of Marid, a doctor's apprentice, and your actions in the coming days could determine the fate of the Channelworks District.

The > symbol indicates a command prompt. When a > is displayed, you can type commands for Marid to follow, in the form >[bold type]go west[roman type] or >[bold type]take lantern[roman type], and she will go along as far as she is able and willing. A list of commands can be found in the help menu.

If you are talking to someone, you will instead be prompted to choose from a list of possible responses, in the form [italic type]'1) Say hello; 2) Say goodbye.'[roman type] In this case, you should choose one of the responses by typing the corresponding number.

At other times, there may be no command prompt provided at all, such as during a dramatic pause in the text. When this happens, press any key to continue.";

To say useful-commands-text:
	say "[bold type]A list of useful commands[roman type]

>[bold type]look[roman type] (>[bold type]l[roman type] or a blank command) provides a description of your surroundings.

>[bold type]examine (something)[roman type] (>[bold type]x (something)[roman type] or simply >[bold type](something)[roman type]) provides you with a closer look at whatever it is you're examining. You can examine practically anything, including yourself.

>[bold type]inventory[roman type] (>[bold type]i[roman type]) tells you what items you're wearing or carrying.

>[bold type]talk to (someone)[roman type] (>[bold type]t (someone)[roman type]) allows you to interact with someone.

>[bold type]take (something)[roman type], >[bold type]drop (something)[roman type], >[bold type]open (something)[roman type], and >[bold type]close (something)[roman type] can be used to manipulate things around you. You can also >[bold type]enter (something)[roman type] or >[bold type]exit[roman type].[paragraph break]";
	say ">[bold type]go (direction)[roman type] (>[bold type](direction)[roman type]) allows you to navigate the world. The directions are each of the eight compass directions, plus [bold type]up[roman type], [bold type]down[roman type], [bold type]in[roman type] and [bold type]out[roman type]. [bold type]Northwest[roman type] can be abbreviated to [bold type]nw[roman type].

>[bold type]sleep[roman type] advances the story at the end of each in-game day.

>[bold type]go to (place)[roman type] lets you quickly travel to a place you've visited before.

>[bold type]help[roman type] opens the help menu. >[bold type]commands[roman type] (>[bold type]c[roman type]), >[bold type]journal[roman type] (>[bold type]j[roman type]), >[bold type]characters[roman type] (>[bold type]ch[roman type]), >[bold type]map[roman type] (>[bold type]m[roman type]), and >[bold type]hints[roman type] can be used as shortcuts to display those menu pages.

>[bold type]undo[roman type] takes back your last command. >[bold type]again[roman type] (>[bold type]g[roman type]) repeats it.

>[bold type]save[roman type] allows you to create a saved game, while >[bold type]restore[roman type] restores a game you've saved.

>[bold type]quit[roman type] exits the game.

The game recognizes a good deal of synonyms and miscellaneous commands not listed here. Feel free to experiment.";

To say credits-text:
	say "[bold type]Acknowledgements[roman type]

[italic type]The Weight of a Soul[roman type] was written by Chin Kee Yong a.k.a. CKY, a Singaporean artist, writer, game designer, and coffee addict. It is my first serious foray into interactive fiction.

I'd like to thank Lieu, Gu, Wen, WY, GA, and the rest for putting up with my fits of manic inspiration. Thanks also to Aaarrrgh, Barinellos, Brentain, Hidetsugu, Huey, Keeper, Luna, OL, Raven, razor, Ruwin, and Tevish: you've been wonderful co-creators and stewards of the Expanded Multiverse. Your creativity and positivity are what inspire me to keep going.

To everyone who's ever given feedback on this game -- everyone mentioned above, plus Brian, Emily, Liangdeng, Luel, Mabbu, Miss G, Samuel, Qingxiang, Wei Ling, the folks at Rotten Mage, and probably a whole host of people whose names escape me (sorry!) -- thank you for setting aside your time to help make this game better. Any bugs in the game are my fault and not the fault of these amazing people.

Thanks again to Emily Short for various extensions that do backstage heavy lifting for [italic type]The Weight of a Soul[roman type]. Thanks to my family, to the Inform team, to the Singaporean game dev community, and to the IF community. And of course, thank you, dear player: I hope you enjoy the game I've made.[paragraph break]";
	say "[bold type]Licensing and Contact Information[roman type]

[italic type]The Weight of a Soul[roman type] is licensed under a Creative Commons Attribution 4.0 International License. For questions, comments, and/or criticism, feel free to drop me a line: as of this writing, I am reachable at [bold type]chinkeeyong@gmail.com[roman type].";

Chapter 2.3.11.2 - Journal

[The Journal shows the current quest objectives and clues that have been discovered. We show quest objectives by referencing the scenes that are happening, and clues by checking against specific flags.]

To say journal-text:
	say "[bold type][journal-text-date][roman type]

[journal-text-entry]

[bold type]Current objectives:[roman type][line break][journal-text-objectives][journal-text-notes]";

Chapter 2.3.11.3 - Characters

[Choosing Characters brings up a list of all the significant characters you've encountered. Each character gets a short bio about them and their relationship with Marid.]

The list of discovered characters is a list of things that varies.

A person has some text called the bio-name. The bio-name of a person is usually "[printed name in title case]".
A person has some text called the bio-description. The bio-description of a person is usually "".

To say characters-text:
	say "You have discovered the following notable characters:";
	repeat with current character running through the list of discovered characters:
		say "[paragraph break][bold type][bio-name of current character][roman type][line break][bio-description of current character][run paragraph on]".

When play begins: add yourself to the list of discovered characters.
The bio-name of yourself is "Servator Marid Orpheia[roman type] (yourself)".
The bio-description of yourself is "A seventeen-year-old graduate of the Physicians['] College, currently apprenticed to Doctor Cavala. You have taken care of yourself ever since your parents died four years ago."

When play begins: add Doctor Cavala to the list of discovered characters.
The bio-description of Doctor Cavala is "Your mentor in the [italic type]ars vitalis.[roman type] A former army doctor and a physician of commanding skill[if Doctor Cavala is incapacitated]. She is currently injured following a mysterious break-in[end if]."

When Reden's Surgery ends: add Reden to the list of discovered characters.
The bio-description of Reden is "A goblin bum who died in Doctor Cavala's surgery room of an hitherto unknown affliction."

After going to the West Street when Horatio is not listed in the list of discovered characters: add Horatio to the list of discovered characters; continue the action.
The bio-name of Horatio is "Vigile Horatio".
The bio-description of Horatio is "A guardsman of the Channelworks District, and a childhood friend of yours[if First Aid on Cavala has ended]. He has been temporarily assigned as Doctor Cavala's protector[end if]."

When Cavala's Errands ends: add Zoiro to the list of discovered characters.
The bio-description of Zoiro is "The brother of Reden. An assembly-worker who is employed at the Riggertown Mechanistry, and lives at VII Layabout Row."

When Returning to a Break-In ends: add Carnicer to the list of discovered characters.
The bio-name of Carnicer is "[if Carnicer is proper-named]Carnicer[otherwise]???[roman type] (the assassin)".
The bio-description of Carnicer is "A mutant woman who broke into Doctor Cavala's clinic and tried to kill her. Her true motives remain unknown."

When Bad News from Cavala ends: add Doctor Arturus to the list of discovered characters.
The bio-description of Doctor Arturus is "A reclusive doctor in his waning years. Some of his patients had Reden's disease; now he is dead of the same contagion."

When The Game is Afoot ends: add Justinian to the list of discovered characters.
The bio-name of Justinian is "Doctor Justinian Volontis".
The bio-description of Justinian is "Doctor Arturus's protégé, a driven young man who was your senior at the Physician's College. You have a crush on him, though you'd never admit it."

When Meeting the Patients ends: add Creditor Nacarat to the list of discovered characters.
The bio-description of Creditor Nacarat is "One of Doctor Arturus's patients. A well-to-do financial businessman."

When Meeting the Patients ends: add Sal to the list of discovered characters.
The bio-name of Sal is "Sal and Piper".
The bio-description of Sal is "Two of Doctor Arturus's patients. A notorious pair of underworld thugs."

Chapter 2.3.11.4 - Map

To say map-text:
	say "Sorry, this feature is not yet implemented."

Chapter 2.3.11.5 - Hints

Table of the Hint Menu
title	subtable	description	toggle
"General Hints"	--	"[general-hints-text]"	--
"Prologue"	Table of Prologue Hints	--	--
"Day One"	Table of Day One Hints	--	--
"Back"	--	--	quit rule

Section 2.3.11.5.1 - General Hints

To say general-hints-text:
	say "[bold type]General hints for play[roman type]

[italic type]The Weight of the Soul[roman type] is a game about investigation and problem-solving. Take your time and examine your surroundings, especially things that seem out of place or things that could be connected to the greater mystery at hand. Don't be afraid to ask around, explore, and get your hands dirty. Only look at hints if you're completely stuck and need guidance.

Marid is a capable and perceptive protagonist, and she usually has a good idea of where to go next. The Journal shows your current objective, a list of clues you've found, and Marid's thoughts on the situation. You can also consult Characters to refresh your memory on important personages you've encountered, or Map for a street map of the Channelworks District.

[italic type]The Weight of a Soul[roman type] is a very forgiving game. (It's rated 'Polite' on the Zarfian Cruelty Scale, if you know what that is.) Nevertheless, some sections of it have deadly time limits, and it [italic type]is[roman type] possible for the story to end badly for Marid. It is recommended to >[bold type]save[roman type] if you find yourself in a dire situation. If you get a game over, you can >[bold type]undo[roman type] a few times to retrace your steps and try again.";

Section 2.3.11.5.2 - Prologue Hints

Table of Prologue Hints
title	subtable	description	toggle
"How do I save the patient?"	Table of Reden's Surgery Hints	--	hint toggle rule
"Back"	--	--	quit rule

Table of Reden's Surgery Hints
hint	used
"He doesn't look good."	a number
"Follow Doctor Cavala's instructions."
"If you don't see something at first, try looking again."
"The soporific is the inhaler labeled [italic type]aer soporifer[roman type] on the shelves of medical supplies."
"The stethoscope is hidden behind the gurney."
"The breath of catholicon is on the shelves of medical supplies, but only appears after you examine the shelves several times."
"It's impossible to keep Reden from dying. However, if you see the sequence all the way through, you unlock a special dialogue option in the conversation with Doctor Cavala that follows."

Section 2.3.11.5.3 - Day One Hints

Table of Day One Hints
title	subtable	description	toggle
"How do I deliver the documents?"	Table of Censor's Nap Hints	--	hint toggle rule
"I'm lost in the Shanty Quarter!"	Table of Shanty Maze Hints	--	hint toggle rule
"Doctor Cavala needs my help!"	Table of First Aid on Cavala Hints	--	hint toggle rule
"Back"	--	--	quit rule

Table of Censor's Nap Hints
hint	used
"First, you have to get to the basilica."	a number
"To reach the basilica, follow the Via Terminalis east to the junction, then go south to the grand forum and west to the basilica."
"The censor isn't in any condition to receive you, though."
"Try various actions to wake the censor up."
"The easiest way is to >[bold type]hit[roman type] him."
"There are eight different ways to wake him up, each eliciting a different oath from the censor. See if you can find all of them."

Table of Shanty Maze Hints
hint	used
"The Shanty Quarter isn't a welcoming place."	a number
"Maybe if you >[bold type]go[roman type] in a random direction...?"
"You seem to be getting somewhere..."
"...out of the frying pan and into the fire, it would seem."
"Marid struggles with her fear of fire, but she's strong enough to overcome it."
"Open your eyes and take another look."
"Type >[bold type]look[roman type]."

Table of First Aid on Cavala Hints
hint	used
"Doctor Cavala is injured, and you need to apply first aid."	a number
"Marid knows first aid. Examining Doctor Cavala or consulting your journal will show you what to do next."
"The first step is to >[bold type]take[roman type] the first aid bag."
"Next, >[bold type]take[roman type] the antiseptic dressing and the elastic bandage."
"Finally, >[bold type]take[roman type] Doctor Cavala's leg."
"That wasn't so hard, was it?"

Chapter 2.3.11.6 - Summoning the Help Menu

Asking for help is an action out of world.
Understand "about" as asking for help.
Understand "credits" as asking for help.
Understand "help" as asking for help.
Understand "info" as asking for help.
Understand "menu" as asking for help.
Understand "pause" as asking for help.
Carry out asking for help (this is the standard asking for help rule):
	now the current menu is the Table of the Help Menu;
	now the current menu title is "Help";
	carry out the displaying activity;
	clear the screen;
	say line break;
	try looking.
	
Asking for commands is an action out of world.
Understand "c" as asking for commands.
Understand "commands" as asking for commands.
Understand "list of/-- commands/verbs" as asking for commands.
Understand "verbs" as asking for commands.
Carry out asking for commands (this is the standard asking for commands rule):
	let the temporary title be the current menu title;
	now the current menu title is "List of Commands";
	now the endnode flag is 1;
	redraw status line;
	now the endnode flag is 0;
	clear only the main screen;
	say "[variable letter spacing][useful-commands-text][paragraph break]";
	pause the game;
	now the current menu title is temporary title;
	clear the screen;
	say line break;
	try looking.
	
Asking for journal is an action out of world.
Understand "j" as asking for journal.
Understand "journal" as asking for journal.
Carry out asking for journal (this is the standard asking for journal rule):
	let the temporary title be the current menu title;
	now the current menu title is "Journal";
	now the endnode flag is 1;
	redraw status line;
	now the endnode flag is 0;
	clear only the main screen;
	say "[variable letter spacing][journal-text][paragraph break]";
	pause the game;
	now the current menu title is temporary title;
	clear the screen;
	say line break;
	try looking.
	
Asking for characters is an action out of world.
Understand "ch" as asking for characters.
Understand "cast" as asking for characters.
Understand "characters" as asking for characters.
Understand "people" as asking for characters.
Carry out asking for characters (this is the standard asking for characters rule):
	let the temporary title be the current menu title;
	now the current menu title is "Characters";
	now the endnode flag is 1;
	redraw status line;
	now the endnode flag is 0;
	clear only the main screen;
	say "[variable letter spacing][characters-text][paragraph break]";
	pause the game;
	now the current menu title is temporary title;
	clear the screen;
	say line break;
	try looking.
	
Asking for map is an action out of world.
Understand "m" as asking for map.
Understand "directory" as asking for map.
Understand "landmarks" as asking for map.
Understand "locations" as asking for map.
Understand "map" as asking for map.
Understand "places" as asking for map.
Carry out asking for map (this is the standard asking for map rule):
	let the temporary title be the current menu title;
	now the current menu title is "Map";
	now the endnode flag is 1;
	redraw status line;
	now the endnode flag is 0;
	clear only the main screen;
	say "[variable letter spacing][map-text][paragraph break]";
	pause the game;
	now the current menu title is temporary title;
	clear the screen;
	say line break;
	try looking.
	
Asking for hints is an action out of world.
Understand "hint" as asking for hints.
Understand "hints" as asking for hints.
Understand "walkthrough" as asking for hints.
Carry out asking for hints (this is the standard asking for hints rule):
	now the current menu is the Table of the Hint Menu;
	now the current menu title is "Hints";
	carry out the displaying activity;
	clear the screen;
	say line break;
	try looking.
	
Asking for commands is menu-summoning. Asking for journal is menu-summoning. Asking for characters is menu-summoning. Asking for map is menu-summoning.

Rule for constructing the status line while menu-summoning (this is the constructing status line while menu-summoning rule):
	if the endnode flag is 0,
		fill status bar with Table of Deep Menu Status;
	otherwise fill status bar with Table of Shallow Menu Status;
	rule succeeds.
	
Part 2.3.12 - Journal Text

Chapter 2.3.12.1 - Flags

[Day One]

journal-riggertown-detour-known is a truth state that varies.
journal-porter-talkedto is a truth state that varies.
journal-buskers-examined is a truth state that varies.
journal-zoiro-address-known is a truth state that varies.

[Day Two]

clue-airborne-vector is a truth state that varies.
clue-ingestion-vector is a truth state that varies.

clue-patientrecords is a truth state that varies.
clue-patientrecords-justinian is a truth state that varies.

clue-ravens-sighted is a number that varies.
clue-raven is a truth state that varies.
clue-tradingcompany is a truth state that varies.
clue-crowsnest is a truth state that varies.
clue-giftnote is a truth state that varies.

clue-reden-channelworks is a truth state that varies.
clue-reden-zoironest is a truth state that varies.
clue-reden-shack is a truth state that varies.

clue-arturus-discovery-justinian is a truth state that varies.
clue-arturus-timeofdeath is a truth state that varies.
clue-arturus-gloves is a truth state that varies.
clue-arturus-animus is a truth state that varies.
clue-arturus-coffeetable is a truth state that varies.
clue-arturus-wineglassbroken is a truth state that varies.
clue-arturus-debt is a truth state that varies.

clue-nacarat-recording is a truth state that varies.
clue-nacarat-pocketbook is a truth state that varies.
clue-nacarat-raven is a truth state that varies.
clue-nacarat-stomach is a truth state that varies.

clue-sal-raven is a truth state that varies.
clue-piper-namelist is a truth state that varies.
clue-piper-raven is a truth state that varies.
clue-piper-stomach is a truth state that varies.

journal-crucible-witnessed is a truth state that varies.

Chapter 2.3.12.2 - Date
	
To say journal-text-date:
	if the current day is:
		-- Prologue:
			say "Third";
		-- Day One:
			say "Fourth";
		-- Day Two:
			say "Fifth";
		-- Midnight:
			say "Fifth";
		-- Day Three:
			say "Sixth";
		-- otherwise:
			say "Seventh";
	say " of ";
	if the current day is Epilogue:
		say "Libra";
	otherwise:
		say "Aquaria";
	say ", Auritum IV".

Chapter 2.3.12.3 - Entry
	
To say journal-text-entry:
	[---
	PROLOGUE
	---]
	if Reden's Surgery is happening:
		say "Oh, Primes. He's only inches away from dying on the gurney. His life is in Doctor Cavala's hands, in my hands, and I barely even know his name...

I thought it would be a slow day at the clinic. Nothing could have prepared me for this. What do I do? What do I do? ";
	otherwise if Walking Home in Darkness is happening:
		say "I'm tired. I'm so tired.

I'm sorry, Reden. I hope your animus rests in peace. ";
	[---
	DAY ONE
	---]
	otherwise if Nine to Five Zombie is happening:
		say "It isn't like me to oversleep. Last night's events must have weighed more heavily on me than I thought... not to mention the nightmares. I thought I'd gotten over those...

But enough wallowing in self-pity. Life goes on for the living, as it always has. ";
	otherwise if Cavala's Errands is happening:
		if Via Terminalis West Street is unvisited:
			say "I've been given an opportunity to get out of the clinic and see the sights of the Channelworks District... but I still feel a hollowness inside. ";
		otherwise if Maze Part One is unvisited:
			say "It feels good to be out and about making myself useful. Has it really been a week since the last time I went out on the town? Not that I should be going shopping at a time like this... but walking through the streets, seeing everyone going about their daily lives, it's almost enough to make me feel as though everything is going to be well. ";
		otherwise if Cadaver Walk is unvisited:
			say "This place is a nightmare. I want to wake up. Please... someone... anyone... ";
		otherwise:
			say "The poorest parts of the district have been an ordeal to walk through, but the worst has finally passed. After everything that I've seen today, having to break the news of Reden's death... somehow doesn't seem as bad. ";
	otherwise if Returning to a Break-In is happening:
		if Carnicer is in the West End:
			say "It's over. I've fulfilled my task, just as Doctor Cavala asked me to... and thank the Three Primes for that.

I don't know how much more misfortune I can weather, and I sincerely hope not to find out. ";
		otherwise:
			say "Who could that be? Don't tell me... ";
	otherwise if First Aid on Cavala is happening:
		say "Okay. Okay. I've trained for this. I can do this.

But I have to move fast. ";
	otherwise if Walking Home in Fear is happening:
		say "I'm still a little shocked at tonight's events. To think that someone would attack Doctor Cavala in her own clinic... it's surreal, and more than a little frightening.

If there's one good thing that's come out of tonight, it's Horatio. I'm glad he's here. I hope he gets along with Doctor Cavala. I hope he takes good care of her.

I don't want to lose anyone else. ";
	[---
	DAY TWO
	---]
	otherwise if Bad News from Cavala is happening:
		say "I knew something like this was coming. I'd better hurry to the clinic and get the full picture of what's happening. ";
	otherwise if The Game is Afoot is happening:
		say "Doctor Arturus -- I've [italic type]seen[roman type] him. He was [italic type]there[roman type], in his clinic, every time I visited Justinian... and now he's dead. He's gone.

I don't know what to think. All I can do is make my way there and talk to Justinian. Find out what really happened, and why. ";
	otherwise if Four Investigations is happening:
		say "I've made my choice. I have a job to do -- and I'm going to finish it. ";

Chapter 2.3.12.4 - Objectives

To say journal-text-objectives:
	let L be a list of texts;
	[---
	PROLOGUE
	---]
	if Reden's Surgery is happening:
		add "- Help Doctor Cavala save the patient's life" to L;
	if Walking Home in Darkness is happening:
		add "- Go home and get some sleep" to L;
	[---
	DAY ONE
	---]
	if Nine to Five Zombie is happening:
		if 9-5-zombie-cavala-prompt is false:
			add "- Report for work at Doctor Cavala's clinic" to L;
		otherwise if the location is not the Mortuary:
			add "- Find Doctor Cavala" to L;
		otherwise:
			add "- Report to Doctor Cavala" to L;
	if Cavala's Errands is happening:
		if the location is in the Shanty Maze:
			add "- Find a way out of the Shanty Quarter" to L;
		otherwise:
			if the bundle of documents is undelivered:
				add "- Deliver the bundle of documents to the censor in the basilica" to L;
			if The Censor's Nap is happening:
				add "[italic type]   ...and think of a way to wake the censor[roman type]" to L;
			add "- Find Zoiro, Reden's brother, in Riggertown" to L;
			if journal-zoiro-address-known is false:
				if Maze Part One is unvisited:
					add "[italic type]   ...by asking the censor for his address[roman type]" to L;
				add "[italic type]   ...by asking around Riggertown[roman type]" to L;
			if Following the Canal is visited and journal-riggertown-detour-known is false and no rooms in Riggertown are visited:
				add "[italic type]   ...and find another route around the blocked path to Riggertown[roman type]" to L;
	if Returning to a Break-In is happening:
		if Carnicer is in the West End:
			add "- Report back to Doctor Cavala's clinic" to L;
		otherwise:
			add "- Investigate the stranger" to L;
	if First Aid on Cavala is happening:
		add "- Administer first aid to Doctor Cavala" to L;
	if Walking Home in Fear is happening:
		add "- Go home and get some sleep" to L;
	[---
	DAY TWO
	---]
	if Bad News from Cavala is happening:
		add "- Report to Doctor Cavala" to L;
	if The Game is Afoot is happening:
		add "- Go to the Turris Infinita" to L;
	if Four Investigations is happening:
		add "- Investigate the victims of the disease and identify the transmission vector" to L;
	if Reden Investigation is happening:
		add "" to L;
		add "[italic type]Reden[roman type]" to L;
		if the enabled of zoiro-mourning-alldone is false:
			add "- Go to Riggertown and ask Zoiro about his brother's activities" to L;
		if clue-reden-shack is true and Reden's Shack is unvisited:
			add "- Look for a place in Lower Riggertown where Reden could have stayed" to L;
		if Reden's Shack is visited:
			add "- Investigate Reden's shack in Lower Riggertown for clues" to L;
		if clue-crowsnest is true:
			add "- Go to the Shanty Quarter and investigate the Crow's Nest pub" to L;
		otherwise if clue-reden-zoironest is true:
			add "- Find out more about a pub involving a [']bird's nest[']" to L;
	if Arturus Investigation is happening:
		add "" to L;
		add "[italic type]Doctor Arturus[roman type]" to L;
		if 4inv-vigiles-permission is false:
			add "- Get permission from the Vigiles to examine the body" to L;
		otherwise if clue-arturus-gloves is false and clue-arturus-animus is false:
			add "- Examine the body" to L;
		otherwise if arturus-body-completion-quip is false:
			add "- Examine the body further" to L;
		if examiner-arturus-found-asked is false and clue-arturus-gloves is false, add "- Ask the Vigiles examiner about his findings" to L;
		if clue-arturus-discovery-justinian is false, add "- Ask Justinian about the circumstances of death" to L;
		if clue-arturus-coffeetable is false and clue-arturus-debt is false and clue-patientrecords is false:
			if Arturus's Domicile is unvisited:
				add "- Look around Doctor Arturus's domicile, in the Turris Infinita" to L;
			otherwise:
				add "- Continue investigating Doctor Arturus's domicile, in the Turris Infinita" to L;
	if Meeting the Patients is happening:
		add "" to L;
		add "[italic type]Doctor Arturus's patients[roman type]" to L;
		add "- Find out their identities" to L;
		add "- Get permission from the Vigiles to examine the bodies" to L;
		add "- Ask the Vigiles examiner about his findings" to L;
		if the Nacarat file is nowhere:
			if clue-patientrecords-justinian is false:
				add "- Ask Justinian where Doctor Arturus's patient records are kept" to L;
			otherwise:
				add "- Look up the patient records in Doctor Arturus's domicile" to L;
		otherwise if the Piper file is meticulously digested:
			add "- Investigate the note in the [']Piper['] file about the Shanty Quarter" to L;
	if Nacarat Investigation is happening:
		add "" to L;
		add "[italic type]Creditor Nacarat[roman type]" to L;
		if clue-nacarat-stomach is false and clue-nacarat-pocketbook is false and clue-nacarat-recording is false and clue-nacarat-raven is false:
			add "- Examine the body" to L;
		otherwise if nacarat-body-completion-quip is false:
			add "- Examine the body further" to L;
		if examiner-nacarat-notable-asked is false and clue-nacarat-recording is false, add "- Ask the Vigiles examiner about his findings" to L;
		if the Nacarat file is nowhere:
			if clue-patientrecords-justinian is false:
				add "- Ask Justinian where Doctor Arturus's patient records are kept" to L;
			otherwise:
				add "- Look up the patient records in Doctor Arturus's domicile" to L;
	if Thugs Investigation is happening:
		add "" to L;
		add "[italic type]Sal and Piper[roman type]" to L;
		if clue-sal-raven is false and the battered keyring is not carried:
			add "- Examine Sal's body" to L;
		otherwise if sal-body-completion-quip is false:
			add "- Examine Sal's body further" to L;
		if clue-piper-namelist is false and clue-piper-raven is false and clue-piper-stomach is false:
			add "- Examine Piper's body" to L;
		otherwise if piper-body-completion-quip is false:
			add "- Examine Piper's body further" to L;
		if examiner-thugs-notable-asked is false and (the battered keyring is not described or clue-piper-namelist is false), add "- Ask the Vigiles examiner about his findings" to L;
		if the Nacarat file is nowhere:
			if clue-patientrecords-justinian is false:
				add "- Ask Justinian where Doctor Arturus's patient records are kept" to L;
			otherwise:
				add "- Look up the patient records in Doctor Arturus's domicile" to L;
		otherwise if the Piper file is meticulously digested and cellar-access-granted is false:
			add "- Investigate the note in the [']Piper['] file about the Shanty Quarter" to L;
		if cellar-keygiven is true and cellar-access-granted is false:
			add "- Tell the flophouse landlord which room Sal's keyring unlocks" to L;
		otherwise if clue-giftnote is false:
			add "- Investigate the cellar of the flophouse" to L;
	if Four Investigations is happening:
		let LM be a list of texts;
		if clue-raven is true and clue-tradingcompany is false:
			add "- Ask around about the meaning of the raven" to LM;
		if LM is not {}:
			add "" to L;
			add "[italic type]Miscellaneous[roman type]" to L;
			add LM to L;
	[---
	END
	---]
	if the number of entries in L is 0:
		say "[line break]I have no particular objective at the moment.";
	otherwise:
		repeat with current objective running through L:
			say "[line break][current objective]";

Chapter 2.3.12.5 - Notes

To say journal-text-notes:
	let L be a list of texts;
	[---
	CLUES, DAY ONE
	---]
	if Cavala's Errands is happening:
		if the Basilica is unvisited:
			add "- I remember that the basilica is across the Via Terminalis bridge, next to the grand forum. " to L;
		if no rooms in Riggertown are visited:
			if journal-riggertown-detour-known is true:
				add "- I learned that I can reach Riggertown by detouring through the Shanty Quarter. " to L;
			otherwise:
				add "- I remember that Riggertown is down the canal from the Via Terminalis[if Following the Canal is visited], but the footpath is currently blocked[end if]. " to L;
		if journal-zoiro-address-known is true:
			if the enabled of censor-woken-address is false:
				add "- I learned that Zoiro lives on Layabout Row, in Upper Riggertown, and works at the Riggertown Mechanistry. " to L;
			otherwise:
				add "- I learned that Zoiro works at the Riggertown Mechanistry, in Upper Riggertown. " to L;
	if First Aid on Cavala is happening:
		if the CSOFAOC is:
			-- 1:
				add "- The supplies I need should be in the first aid bag behind the counter. " to L;
			-- 2:
				add "- I need the dressing and the bandage from the first aid bag. " to L;
			-- 3:
				add "- I need to prop Doctor Cavala's leg up. That waiting chair will do as a support. " to L;
	[---
	CLUES, DAY TWO
	---]
	if The Game is Afoot is happening:
		add "- I remember that the Turris Infinita is east of the Via Terminalis junction, across the bridge from the clinic. " to L;
	if Four Investigations is happening:
		let LFI be a list of texts; [List of Four Investigations]
		let L2 be a list of texts;
		if clue-airborne-vector is true, add "- I learned that the disease is unlikely to be airborne." to L2;
		if clue-ingestion-vector is true, add "- I learned that the disease can be transmitted by ingestion." to L2;
		if clue-arturus-animus is true, add "- I learned that the disease is bloodborne and attacks the animus, or the soul." to L2;
		if L2 is not {}:
			add "[italic type]The disease[roman type]" to LFI;
			add L2 to LFI;
		[---
		REDEN INVESTIGATION
		---]
		now L2 is {};
		if clue-crowsnest is true:
			add "- I learned that Reden frequented a rooftop pub in the Shanty Quarter called the Crow's Nest." to L2;
		otherwise if clue-reden-zoironest is true:
			add "- I learned that Reden could have frequented a pub involving a [']bird's nest.[']" to L2;
		if clue-reden-shack is true and Reden's Shack is unvisited:
			add "- I learned that Reden could have stayed somewhere in Lower Riggertown." to L2;
		if clue-reden-channelworks is true:
			add "- I learned that Reden was once a Channelworks worker, and it reminded me that his clothes were unusually wet when he stumbled into Doctor Cavala's clinic." to L2;
		add "- I remember that Reden died on the night of the Third, two days ago." to L2;
		if L2 is not {}:
			if LFI is not {}, add "" to LFI;
			add "[italic type]Reden[roman type]" to LFI;
			add L2 to LFI;
		[---
		ARTURUS INVESTIGATION
		---]
		now L2 is {};
		if clue-arturus-debt is true:
			if clue-tradingcompany is true:
				add "- I learned that Doctor Arturus was in debt, and the Trading Company was involved." to L2;
			otherwise:
				add "- I learned that Doctor Arturus was in debt, and someone or something referred to as a 'raven' was involved." to L2;
		if clue-arturus-wineglassbroken is true:
			add "- I found a coffee table set for three in Doctor Arturus's home. According to Justinian, one of the wineglasses had been broken by a guest." to L2;
		otherwise if clue-arturus-coffeetable is true:
			add "- I found a coffee table set for three in Doctor Arturus's home. The table had not been tidied up, but the third wineglass was missing." to L2;
		if clue-patientrecords is true:
			add "- I found that Doctor Arturus rushed through his patient record files for some reason, leaving them unfinished." to L2;
		if clue-arturus-gloves is true:
			add "- I found that the gloves on Doctor Arturus's body were brand new. He couldn't have been infected through his hands if he had been wearing them." to L2;
		otherwise if examiner-arturus-notable-asked is true:
			add "- I learned that Doctor Arturus may have been infected through his gloves." to L2;
		if clue-arturus-timeofdeath is true, add "- I learned that Doctor Arturus died sometime between last night, on the Fourth, and this morning, on the Fifth." to L2;
		if L2 is not {}:
			if LFI is not {}, add "" to LFI;
			add "[italic type]Doctor Arturus[roman type]" to LFI;
			add L2 to LFI;
		[---
		NACARAT INVESTIGATION
		---]
		now L2 is {};
		if clue-nacarat-stomach is true:
			add "- I learned that Creditor Nacarat was killed by something he ingested." to L2;
		if clue-nacarat-raven is true:
			if clue-tradingcompany is true:
				add "- I learned that Creditor Nacarat was connected to the Trading Company." to L2;
			otherwise:
				add "- I found a raven symbol on Creditor Nacarat's gloves." to L2;
		if clue-giftnote is true:
			add "- I learned that Creditor Nacarat hired Sal and Piper recently." to L2;
		otherwise if clue-nacarat-pocketbook is true:
			add "- I learned that Creditor Nacarat could have hired Sal and Piper recently." to L2;
		if clue-nacarat-recording is true:
			add "- I learned that Creditor Nacarat was taking tea with Doctor Arturus when his symptoms emerged, and he broke a piece of tableware as a result." to L2;
		otherwise if examiner-nacarat-notable-asked is true:
			add "- I learned that Creditor Nacarat has a glyph of recording hidden in his jacket." to L2;
		if the Nacarat file is meticulously digested:
			add "- I learned that Creditor Nacarat was admitted to the clinic on the afternoon of the Third, two days ago." to L2;
		if examiner-nacarat-timeofdeath-asked is true, add "- I learned that Creditor Nacarat died on the night of [if clue-patientrecords is true]that day[otherwise]the Third, two days ago[end if]." to L2;
		if L2 is not {}:
			if LFI is not {}, add "" to LFI;
			add "[italic type]Creditor Nacarat[roman type]" to LFI;
			add L2 to LFI;
		[---
		THUGS INVESTIGATION
		---]
		now L2 is {};
		if clue-tradingcompany is true:
			if clue-sal-raven is true and clue-piper-raven is true:
				add "- I learned that Sal and Piper were connected to the Trading Company." to L2;
			otherwise if clue-sal-raven is true:
				add "- I learned that Sal was connected to the Trading Company." to L2;
			otherwise if clue-piper-raven is true:
				add "- I learned that Piper was connected to the Trading Company." to L2;
		otherwise:
			if clue-sal-raven is true:
				add "- I found a raven symbol on Sal's knuckle-dusters." to L2;
			if clue-piper-raven is true:
				add "- I found a raven symbol on Piper's throwing knives." to L2;
		if clue-piper-namelist is true:
			add "- I found a list of names that suggested Piper had been collecting debts. The reverse side of the paper had been blanked out." to L2;
		if the battered keyring is described and the Cellar is unvisited:
			if cellar-keygiven is true:
				add "- I found a battered keyring on Sal's belt, and learned that it unlocks a room in a Shanty Quarter flophouse." to L2;
			otherwise:
				add "- I found a battered keyring on Sal's belt." to L2;
		if the Cellar is visited:
			add "- I found that Sal and Piper had been hiding out in the cellar of a flophouse in the Shanty Quarter.'" to L2;
		otherwise if the Piper file is meticulously digested:
			add "- I found a note in Piper's patient record that read 'cellar in f.h. shanty quarter.'" to L2;
		if clue-giftnote is true:
			add "- I found a strange wine bottle in the hideout that was apparently a gift from Nacarat." to L2;
		otherwise if the Cellar is visited:
			add "- I found a strange wine bottle in the hideout." to L2;
		if clue-piper-stomach is true:
			add "- I learned that Piper was killed by something she ingested." to L2;
		if the Salio file is meticulously digested:
			add "- I learned that Sal [if the Piper file is meticulously digested]and Piper were[otherwise]was[end if] admitted to the clinic on the morning of the Third, two days ago." to L2;
		otherwise if the Piper file is meticulously digested:
			add "- I learned that Piper was admitted to the clinic on the morning of the Third, two days ago." to L2;
		if examiner-thugs-timeofdeath-asked is true, add "- I learned that both Sal and Piper died on the night of [if the Salio file is meticulously digested or the Piper file is meticulously digested]that day[otherwise]the Third, two days ago[end if]." to L2;
		if L2 is not {}:
			if LFI is not {}, add "" to LFI;
			add "[italic type]Sal and Piper[roman type]" to LFI;
			add L2 to LFI;
		add LFI to L;
	[---
	MUSINGS, MISCELLANEOUS
	---]
	let LM be a list of texts; [List of Miscellaneous]
	if Four Investigations is happening:
		if clue-tradingcompany is true:
			add "- I learned that the raven is the symbol of the Greater Corindia Trading Company, a criminal syndicate." to LM;
	if time is not critical and the enabled of bartender-dialogue-drink is true:
		add "- I'm in the mood for a drink..." to LM;
	[---
	MUSINGS, PROLOGUE
	---]
	if Walking Home in Darkness is happening and the Dormitory Block is visited and Saliunca is friendly:
		add "- There's something strange about [if Saliunca is proper-named]Saliunca[otherwise]that old woman in the atrium[end if]..." to LM;
	[---
	MUSINGS, DAY ONE
	---]
	if Cavala's Errands is happening:
		if Via Terminalis West Street is visited:
			if the enabled of cavala-errands2-vision is true:
				add "- Doctor Cavala told me to think about what I saw last night.. " to LM;
			add "- This district is so much larger than the Lake District..." to LM;
			if the enabled of horatio-dayone-intro is true:
				add "- I haven't spoken with Horatio in a while. I wonder how he's getting on..." to LM;
			if the Grand Forum is visited and journal-buskers-examined is false:
				add "- I wonder what those buskers in the grand forum are performing..." to LM;
			if journal-porter-talkedto is false:
				add "- Perhaps I could go to the Turris Infinita and pay Justinian a surprise visit..." to L;
	[---
	MUSINGS, DAY TWO
	---]
	if All Quiet on the Western Front is happening:
		if journal-crucible-witnessed is false:
			add "- I hope Doctor Cavala and Horatio will be all right at the clinic..." to LM;
	if Four Investigations is happening and LM is not {}:
		add "[italic type]Miscellaneous[roman type]" at entry 1 in LM;
		add "" at entry 1 in LM;
	[---
	END
	---]
	add LM to L;
	if the number of entries in L is not 0:
		say "[paragraph break][bold type]Marid's notes:[roman type][line break]";
		repeat with current note running through L:
			say "[line break][current note]";


Volume 3 - The Channelworks District

Book 3.1 - Miscellany

Part 3.1.1 - Outdoors and the Sky

Outdoors is a region.
Instead of examining up in Outdoors, try examining the sky.
Before listening to something that is part of the sky, try listening to the sky instead.

The sky is a faraway backdrop in Outdoors. The indefinite article is "the".
The description is "[if it is night]Shrouded among the clouds and the constellations, the [italic type]Luna[roman type] presides from its throne.[otherwise]The clouds huddle overhead in suspense."
The sound is "The [if it is night]night is[otherwise]clouds are[end if] quiet."
The sky has some text called the faraway response. The faraway response of the sky is "The heavens are beyond your reach."
Understand "heaven" or "heavens" or "day/night/daylight" or "weather" or "overcast" or "desolate" as the sky.

Some clouds are scenery part of the sky. The indefinite article is "the".
The description is "[if it is night]They are dark shapes in a darker sky.[otherwise]The sun is shy on the best of days here, and today's weather is far from the best."
Understand "dark" or "shapes" as the clouds.

The Luna is scenery part of the sky. The printed name is "[italic type]Luna[roman type]". The indefinite article is "the".
The description is "Theories abound on the nature of that alabaster sphere, but none can deny its beauty."
Understand "moon" or "alabaster" or "sphere" or "throne" as the Luna.
Instead of searching the Luna, say "The [italic type]Luna[roman type] has no answers to give."

Some constellations are scenery part of the sky. The indefinite article is "the".
The description is "The Ouroboros, the Hierophant, the Alembicus Major..."
Understand "ouroboros" or "hierophant" or "alembicus" or "major" or "constellation" or "star" or "stars" as the constellations.
Before searching the constellations, try examining the constellations instead.

When Prologue ends (this is the daytime sky scenery after Prologue rule):
	now the Luna is nowhere;
	now the constellations are nowhere.
	
When Walking Home in Fear begins (this is the nighttime sky scenery during Walking Home in Fear rule):
	now the Luna is part of the sky;
	now the constellations are part of the sky.
	
When Walking Home in Fear ends (this is the daytime sky scenery after Walking Home in Fear rule):
	now the Luna is nowhere;
	now the constellations are nowhere.
	
When Midnight begins (this is the nighttime sky scenery during Midnight rule):
	now the Luna is part of the sky;
	now the constellations are part of the sky.
	
When Midnight ends (this is the daytime sky scenery after Midnight rule):
	now the Luna is nowhere;
	now the constellations are nowhere.

Part 3.1.2 - Various Backdrops

Some high-rise buildings are a faraway backdrop.
The description is "The city stretches out in every direction."
The sound is "You hear the sounds of the city."
Before smelling the high-rise buildings, try smelling the location instead.
Understand "steel" or "spire/spires" or "building" or "city" or "channelworks district" or "district" as the high-rise buildings.
Before entering or searching the high-rise buildings when the location is in Outdoors, try listing exits instead.

Some street-lamps are a backdrop.
The description is "There is a living quality to the light."
The sound is "You hear the hum of galvanism."
The scent is "The lamps smell of ozone."
Understand "street" or "lamp/lamps" or "post/posts" or "lamp-post/lamp-posts" or "lamppost/lampposts" or "streetlamp/streetlamps" or "lamplight/lamplights" or "light/lights" or "ghostly" or "glow" or "bound" or "animus/animii" or "spark/sparks" or "ozone" or "street-lamp" as the street-lamps.
Instead of searching the street-lamps, say "At the heart of each lamp is the spark of a bound animus."

The mist is a backdrop. The indefinite article is "the".
The description is "It curls and winds around your ankles, never quite forgotten."
The scent is "You smell a hundred foreign odors in the mist."
Understand "air" or "fog" or "mists" or "smog" or "wind" as the mist.
Instead of looking under or searching the mist, say "The mist remains as enigmatic as ever."
Instead of drinking or tasting the mist, say "The last time you tried that, you came down with the Midaes fever."
Instead of touching the mist, say "There is a slight clamminess in the air."
Instead of attacking, cutting, knocking on, pushing, pulling, rubbing, squeezing, swinging, or turning the mist, say "The mist is immaterial."

Some various shops are a backdrop.
The description is "[if it is night]All the shops are closed for the night.[otherwise if time is critical]Shopping is the last thing on your mind at the moment.[otherwise]Signs advertise a variety of goods and services, but none of them catch your eye."
The sound is "[if it is night]All the shops are closed for the night.[otherwise]You hear the sounds of commerce."
Before smelling the various shops, try smelling the location instead.
Understand "shop" or "window" or "windows" or "signs/signage" or "advertisement/advertisements" or "goods" or "and" or "services" or "shop door/doors" as the shops.
Instead of buying, entering, knocking on, or searching the shops, say "[if it is night]All the shops are closed for the night.[otherwise if time is critical]Shopping is the last thing on your mind at the moment.[otherwise]None of the shops are relevant to your situation."

The city crowd is a backdrop. The indefinite article is "the".
The description is "The population of the Channelworks District is only a few thousand, but at times like this it seems much more."
The sound is "A hundred voices drown out each other."
The scent is "Perfumes, colognes, fresh groceries -- all blend together into an eclectic infinity."
Understand "crowds" or "carriage/carriages/cabriolet/cabriolets" or "man/men/woman/women/person/people" or "human/humans" or "goblin/goblins" or "mutant/mutants" or "and" or "voice/voices" or "bustle/traffic" or "in/-- general" as the city crowd.
After printing the name of the city crowd while asking which do you mean: say " in general".
Instead of giving something to the city crowd, say "Society, as a rule, frowns on spontaneous acts of charity."
Instead of searching the city crowd, say "An impractical proposition, to say the least."
Instead of setting the city crowd to something, say "That doesn't make any sense."
Instead of taking the city crowd, say "An impossible notion."
Instead of talking to the city crowd, say "They are engrossed in their own lives."
Instead of attacking or cutting the city crowd, say "That hardly seems called for."
Instead of drinking, eating, switching on, switching off, or wearing the city crowd, say "That doesn't make any sense."
Instead of kissing, knocking on, pushing, pulling, rubbing, swinging, squeezing, touching, turning, or waking the city crowd, say "All heads turn to you, and you are forced to retreat out of embarrassment."

The Via Terminalis is a backdrop. The indefinite article is "the".
The description is "It bears the burden of a thousand living souls."
The sound is "You hear the murmuring of the city all around you."
The scent is "It smells like dust."
Understand "spine" as the Via Terminalis.
Instead of entering the Via Terminalis, say "You're standing in it."
Before searching the Via Terminalis when the shops are in the location, try examining the shops instead.

The view of the Via Terminalis is a faraway backdrop. The indefinite article is "the".
The description is "It bears the burden of a thousand living souls."
The sound is "You hear the murmuring of the city all around you."
Understand "spine" as the view of the Via Terminalis.

The view of the condemned block is a faraway backdrop. The indefinite article is "the".
The description is "An oppressive bulk you would prefer not to dwell on."
The sound is "Silence."
The scent is "The air is dead and still."
Understand "skeleton/skeletons" or "blackened" or "husk/husks" or "building/buildings" or "plot" as the view of the condemned block.
Instead of searching the view of the condemned block when the location is the Condemned Block, say "You'd have to go through the gate first."

The Bilious Canal is a faraway backdrop. The indefinite article is "the".
The description is "The Bilious Canal is furious and vitriolic, as befits its name. Mist curls from the surface of the water." Understand "water/waters" or "surface" or "wall of/--" as the Bilious Canal.
The sound is "The water roars through the canal."
The scent is "A septic odor rises from the torrent."
Before entering the Bilious Canal, try swimming instead.
Instead of looking under or searching the Bilious Canal, say "The water is moving too quickly for you to see anything."
Instead of drinking the Bilious Canal, say "To call the canal water potable would be quite the exaggeration."

The up-close Canal is a backdrop. The printed name is "Bilious Canal". The indefinite article is "the".
The description is "From this close, the Bilious Canal is enormous and spiteful and roaring."
Understand "water/waters" or "surface" or "bilious" or "white/-- spray" or "algae" or "corrosion" as the up-close Canal.
The sound is "The rushing of the water is everywhere."
The scent is "There is a powerful odor of algae and corrosion."
Before entering the up-close Canal, try swimming instead.
Instead of cutting the up-close Canal, say "You dip your scalpel in the current and watch the flow divide in two."
Instead of knocking on, rubbing or touching the up-close Canal, say "Your gloves would be ruined if you did that."
Instead of inserting the endoscope into the up-close Canal, say "The endoscope would be ruined if you did that."
Instead of inserting something into the up-close Canal, say "You would never see [regarding the noun][them] again if you did that."
Instead of searching or looking under the up-close Canal, say "The water is moving too quickly for you to see anything."
Instead of drinking the up-close Canal, say "To call the canal water potable would be quite the exaggeration."
Instead of attacking, pushing, pulling, squeezing, swinging, or turning the up-close Canal, say "How you might accomplish that is beyond you."

The view of the Channelworks is a faraway backdrop. The indefinite article is "the".
The description is "[italic type]Hydra Aquifera,[roman type] pride of the district, cathedral to Knowledge and Power. Stunning bas-relief adorns its architecture, and the Bilious Canal flows from its mouth."
The sound is "Even from here, you can hear the rushing of water."
Understand "hydra" or "aquifera" or "aquifer/aquifers" or "cathedral" or "mouth" as the view of the Channelworks.

The distant bas-relief is scenery part of the view of the Channelworks.
The description is "It's too far away to make out."
Understand "stunning" or "bas" or "relief" or "architecture" as the distant bas-relief.

The view of the bridge is a faraway backdrop. The indefinite article is "the".
The description is "The bridge crosses the Bilious Canal."
The sound is "You hear the bustle, far away."
Understand "via/-- terminalis/-- bridge" or "bustle" as the view of the bridge.
Instead of looking under the view of the bridge, say "There's the Bilious Canal, rushing past."

The view of the footpath is a faraway backdrop. The indefinite article is "the".
The description is "The footpath follows the Bilious Canal."

The view of the junction is a faraway backdrop. The indefinite article is "the".
The description is "The rotunda is a good distance away."
Understand "rotunda" as the view of the junction.
	
The view of Riggertown is a faraway backdrop. The indefinite article is "the".
The description is "Riggertown is a ramshackle fungus-like proliferation of lean-tos perched on the wall of the Bilious Canal. Parts of it appear to have fallen off and washed downstream."
Understand "algae" or "grime" or "upper/lower" or "level" or "lean-to/lean-tos" or "proliferation" as the view of Riggertown.
Understand "western" or "embankment" as the view of Riggertown when the location is Cadaver Walk.
Instead of looking under the view of Riggertown, say "The Bilious Canal churns below."

The view of the basilica is a faraway backdrop. The indefinite article is "the".
The description is "An imposing gothic hall[if Day One is happening]. Petitioners trickle in and out[end if]."
Understand "gothic" or "hall" as the view of the basilica.

The clandestine stairway is a faraway backdrop. The indefinite article is "the".
The description is "The steps lead down the east side of the canal."
The clandestine stairway has some text called the faraway response. The faraway response is "You'll have to get closer to do that."
Understand "step/steps" or "half" or "hidden" or "half-hidden" or "canalside" or "canal-side" as the clandestine stairway.

The view of Miller's Gate is a faraway backdrop. The indefinite article is "the".
The description is "It rises tall and triumphant in the mist."
The sound is "The sounds of traffic echo through the mist."

The view of the colonnades is a faraway backdrop.
The description is "The pillars are taller than some buildings."
Understand "concourse" or "colonnade" or "pillar/pillars" as the view of the colonnades.

The view of the Turris Infinita is a faraway backdrop. The indefinite article is "the".
The description is "An impossibly ornate obelisk of glass. The apartments stretch without end into the clouds."
The sound is "Silence."
Understand "obelisk" or "glass" or "apartment/apartments" or "tower" or "mirror/mirrors" as the view of the Turris Infinita.

The view of the grand forum is a faraway backdrop. The indefinite article is "the".
The description is "It's a lively riot of color."
The sound is "You can hear voices and music."
Understand "riot" or "color" or "voice/voices" or "music" as the view of the grand forum.

The view of the Via Mercurii is a faraway backdrop. The indefinite article is "the".
The description is "It curves back and forth like a stone-gray serpent."
The sound is "The sounds of the city are darker there, in the twisting shadows."

The view of the Shanty Quarter is a faraway backdrop. The indefinite article is "the".
The description is "There, the city splinters into a maze of urban decay."
The sound is "You hear flapping fabric and little else."
The scent is "It's too far to smell. You're almost relieved."
Understand "maze" or "of/-- urban/-- decay" or "grimy" or "brick" or "concrete" or "and" as the view of the Shanty Quarter.

The nightmarish architecture is a backdrop.
The description is "The architecture of this place is nightmarish, impossible. Walls are crushed together. Roofs and floors are one and the same."
The scent is "Every inch of this place smells foul."
Understand "rope/ropes" or "concrete" or "wall/walls" or "impossible" or "roof/roofs" or "floor/floors" or "manhole/manholes" or "rickety" or "beam/beams" or "light/darkness" or "labyrinthine" or "morass" or "path/paths" or "alley/alleys" as the nightmarish architecture.
Instead of searching the nightmarish architecture, say "Nothing will be found here."
Instead of entering or climbing the nightmarish architecture:
	if the location is in the Shanty Maze:
		try going inside;
	otherwise:
		say "You don't want to get lost in here again."
		
The offal is a faraway backdrop. The indefinite article is "some".
The description is "There is no sanitation here."
The scent is "Nightsoil, rotten food, and the acrid stench of smoke."
The offal has some text called the faraway response. The faraway response is "You're not touching that."
Understand "refuse" or "waste" or "stench" or "and" or "heap/heaps" or "nightsoil" or "rotten/rotting/rotted" or "food" or "acrid" or "smoke" or "garbage" or "fire/fires" as the offal.
Instead of eating, drinking, or tasting the offal, say "No."

Some slum-dwellers are a backdrop.
The description is "Here are the homeless and the destitute, the lost and the damned."
The sound is "A hundred broken voices reach you."
The scent is "None of these people have showered in weeks."
Understand "walking" or "dead" or "homeless" or "lost" or "damned" or "crowd/crowds" or "man/men/woman/women/person/people" or "human/humans" or "goblin/goblins" or "mutant/mutants" or "and" or "voice/voices" or "bustle/traffic" or "life/lives" or "destitute" or "slum" or "dweller/dwellers" or "slum-dweller" or "in" or "general" or "hollow-eyed" or "resident/residents" as the slum-dwellers.
After printing the name of the slum-dwellers while asking which do you mean: say " in general".
Instead of setting the slum-dwellers to something, say "That doesn't make any sense."
Instead of taking the slum-dwellers, say "An impossible notion."
Instead of attacking or cutting the slum-dwellers, say "They outnumber you. You'd better not."
Instead of drinking, eating, switching on, switching off, or wearing the slum-dwellers, say "That doesn't make any sense."
Instead of giving something to the slum-dwellers, say "Misguided acts of charity won't change anything."
Instead of kissing, knocking on, pushing, pulling, rubbing, searching, swinging, squeezing, talking to, touching, turning or waking the slum-dwellers, say "You don't want to have anything to do with these people."

The view of Cadaver Walk is a faraway backdrop. The indefinite article is "the".
The description is "It's a wonder it hasn't disintegrated into the canal yet."
The sound is "You can almost hear the chains clinking from here."
Understand "bridge" or "crossing" as the view of Cadaver Walk.

The view of the upper landing is a faraway backdrop. The indefinite article is "the".
The description is "The girders overhead clang with footsteps."
The sound is "You hear lots of traffic above."
Understand "shadow" or "girder/girders" as the view of the upper landing.

The arcane system of ladders are a backdrop.
The description is "An arcane system of ladders connects the upper and lower levels of Riggertown."
Understand "ladder" or "beam/beams" or "series" as the arcane system of ladders.
Before climbing the arcane system of ladders, try entering the arcane system of ladders instead.
Instead of pushing, pulling, swinging, or turning the arcane system of ladders, say "Perhaps not. You have the feeling the place would collapse like a house of cards."

Some twisty catwalks are a backdrop.
The description is "Better step with care. The railings are a little low for your arms."
Understand "catwalk" or "walkway/walkways" or "railing/railings" or "road/roads" as the twisty catwalks.
Instead of pushing, pulling, swinging, or turning the twisty catwalks, say "You would rather not test the stability of these catwalks."
Instead of climbing or entering the twisty catwalks, say "You're standing on them."
Instead of looking under the twisty catwalks, say "Below the catwalks are more catwalks. [first time](That's goblin architecture for you.) [only][line break]".

The Riggertown crowd is a backdrop. The indefinite article is "the".
The description is "You feel like a pale, awkward giant among the Riggertown crowd."
The sound is "They chatter about sports and the price of iron."
The scent is "Rust and timber, with notes of volcanic rock."
Understand "crowds" or "man/men/woman/women/person/people" or "goblin/goblins/gobliness/goblinesses" or "and" or "voice/voices" or "bustle/traffic" or "in/-- general" or "midday" or "little" or "great/-- mess" as the Riggertown crowd.
After printing the name of the Riggertown crowd while asking which do you mean: say " in general".
Instead of giving something to the Riggertown crowd, say "Society, as a rule, frowns on spontaneous acts of charity."
Instead of searching the Riggertown crowd, say "An impractical proposition, to say the least."
Instead of setting the Riggertown crowd to something, say "That doesn't make any sense."
Instead of taking the Riggertown crowd, say "An impossible notion."
Instead of talking to the Riggertown crowd, say "They are engrossed in their own lives."
Instead of attacking or cutting the Riggertown crowd, say "That hardly seems called for."
Instead of drinking, eating, switching on, switching off, or wearing the Riggertown crowd, say "That doesn't make any sense."
Instead of kissing, knocking on, pushing, pulling, rubbing, swinging, squeezing, touching, turning, or waking the Riggertown crowd, say "All heads turn to you, and you are forced to retreat out of embarrassment."

Some scrap-heap spires are a faraway backdrop.
The description is "It's unclear where one building ends and another begins."
The sound is "Clicking, creaking, crashing, crunching..."
The scent is "The odor of rust is omnipresent."
Understand "spire" or "building/buildings" or "scrap" or "heap" or "riggertown" or "factory/factories" as the scrap-heap spires.
Before entering or searching the scrap-heap spires when the location is in Outdoors, try listing exits instead.

The view of the Riggertown Mechanistry is a faraway backdrop.
The description is "The Riggertown Mechanistry is a monstrosity of a workshop that appears to have assimilated countless smaller workshops. It is a chimera with feathers of brick, antlers of mortar, and far too many chimneys for its size."
The sound is "A great cacophony of grinding and chugging issues from the building."
The scent is "The Mechanistry smells of hard phlogiston, the kind used in industrial furnaces."
Understand "monstrosity" or "workshop/workshops" or "chimera" or "feather/feathers" or "brick/bricks/brickwork" or "antler/antlers" or "mortar" or "chimney/chimneys" or "sign/signs/signage" as the view of the Riggertown Mechanistry.

The Bilious Canal's runoff is a backdrop.
The description is "A black, viscous, spiteful weight."
Understand "water/waters" or "surface" or "dark" or "writhing" or "canal" as the Bilious Canal's runoff.
The sound is "The water percolates."
The scent is "There is a powerful odor of algae and corrosion."
Before entering the Bilious Canal's runoff, try swimming instead.
Instead of cutting the Bilious Canal's runoff, say "You dip your scalpel in the current and watch the flow divide in two."
Instead of knocking on, rubbing or touching the Bilious Canal's runoff, say "Your gloves would be ruined if you did that."
Instead of inserting the endoscope into the Bilious Canal's runoff, say "The endoscope would be ruined if you did that."
Instead of inserting something into the Bilious Canal's runoff, say "You would never see [regarding the noun][them] again if you did that."
Instead of searching or looking under the Bilious Canal's runoff, say "The water is utterly opaque."
Instead of drinking the Bilious Canal's runoff, say "To call the canal water potable would be quite the exaggeration."
Instead of attacking, pushing, pulling, squeezing, swinging, or turning the Bilious Canal's runoff, say "How you might accomplish that is beyond you."

Part 3.1.3 - Ambience

[This part governs random events that sometimes trigger in various areas, to create a sense of liveliness in the Channelworks District. There are a number of backdrop objects which can be placed in rooms to provide them with ambience. The actual ambience text is provided by tables which we shuffle and cycle through in random order.]

An ambience object is a kind of backdrop.
An ambience object can be active or inactive. An ambience object is usually active.
An ambience object has a table name called the associated table.
An ambience object has a number called the message index. The message index is usually 1.

The ambience cooldown timer is a number that varies. The ambience cooldown timer is 3.

Ambience suppression is a truth state that varies.

When play begins (this is the shuffle the ambience rule):
	sort the Table of Day One Upper Perioch ambience in random order;
	sort the Table of Day Two Upper Perioch ambience in random order;
	sort the Table of Day One Riggertown ambience in random order.

Every turn (this is the ambience rule):
	if ambience suppression is false:
		if an active ambience object is in the location:
			decrement the ambience cooldown timer;
			if the ambience cooldown timer is 0:
				now the ambience cooldown timer is a random number from 3 to 4;
				let the relevant ambience be a random active ambience object in the location;
				say the happening in row message index of the relevant ambience of associated table of the relevant ambience;
				say line break;
				increment the message index of the relevant ambience;
				if the message index of the relevant ambience is greater than the number of rows in the associated table of the relevant ambience:
					now the message index of the relevant ambience is 1;
					sort the associated table of the relevant ambience in random order;
	otherwise:	
		now ambience suppression is false.

Chapter 3.1.3.1 - Upper Perioch Ambience

Some Upper Perioch ambience is a privately-named inactive ambience object.
The associated table is the Table of Day One Upper Perioch Ambience.

When Day One begins: now the Upper Perioch ambience is active.

When Walking Home in Fear begins: now the Upper Perioch ambience is inactive.

When Day Two begins:
	now the Upper Perioch ambience is active;
	now the associated table of the Upper Perioch ambience is the Table of Day Two Upper Perioch Ambience.

When Midnight begins: now the Upper Perioch ambience is inactive.

When Day Three begins: now the Upper Perioch ambience is active.

Table of Day One Upper Perioch Ambience
happening
"A carriage roars down the street, pulled by a smoke-belching mechanical longhorn."
"A carriage with drawn blinds trundles past."
"A clockwork cabriolet drives past."
"A luxury carriage glides past."
"A prison carriage rolls past. You glimpse what looks like a squid through the bars before it turns a corner and is gone."
"A pair of cabriolets hurtle past without warning, and are gone."
"A calcareous ooze burbles down the street, attended by its alchemist handler."
"Some giggling schoolgirls walk past with ice-creams in hand."
"A pair of arguing businessmen walk past."
"You step out of the way of a stockade longhorn and its cartful of goods."
"A couple walks past, arm in arm."
"A couple walks past, chatting animatedly."
"Some young men walk past, pointing and laughing at something out of sight."
"A dozen goblins meander down the street, chatting loudly."
"A chymist brushes through the crowd, fixated on her watch, and disappears from sight."
"A harried-looking alchemist runs past."
"Two ladies in elegant coats walk past discussing a business deal."
"A man walks past carrying a bouquet of flowers."
"A confused-looking tourist wanders past."
"A chanting procession of Deists passes by."
"A char-golem waddles past you and down the street."
"A middle-aged woman shuffles past with an armful of groceries."
"An engineer wanders down the street muttering to himself."
"A pair of little boys run past."
"Some scholars float by, engrossed in theoretical discussion."
"A group of fabers walks past, on their way to some great work or other."
"A snakelike mutant slithers through the crowd, and is gone."
"A mutant in work clothes tromps past."
"A gargoyle swoops between rooftops overhead, and is gone as quickly as it came."
"A goblin saunters past whistling a ditty."
"A flock of birds passes overhead."
"A little glass thopter whizzes down the street and vanishes into a side alley."
"In the distance, a zeppelin floats by."
"Everyone stops and stares as a flight of archons thunders overhead. But life soon resumes as if nothing had happened."
"You nearly bump into a goblin half your height, but she's gone before you can apologize."
"A shrill bell sounds momentarily in the distance."
"The bells of Miller's Gate strike the hour."
"The strains of a galvanic viol waft over the rooftops."
"Some stray papers flutter down the street."
"A door slams somewhere in the city."
"Someone yells at someone else in the crowd."

Table of Day Two Upper Perioch Ambience
happening
"A carriage roars down the street, pulled by a smoke-belching mechanical longhorn."
"A carriage with drawn blinds trundles past."
"A clockwork cabriolet drives past."
"A luxury carriage glides past."
"A prison carriage rolls past. Through the window is nothing but darkness."
"A pair of cabriolets hurtle past without warning, and are gone."
"An inkblot ooze burbles down the street, trailing a dark and viscous stain along the cobbles."
"Some schoolgirls walk past, not meeting your eye."
"A pair of arguing businessmen walk past."
"You step out of the way of a stockade longhorn and its cartful of goods."
"Some civic guards lead a prisoner down the street in chains."
"A fight breaks out down the street. The culprits are quickly accosted and taken into custody."
"A funeral procession passes by."
"A dozen goblins meander down the street, completely silent."
"A chymist brushes through the crowd, fixated on her watch, and disappears from sight."
"A harried-looking alchemist runs past."
"Two ladies in dark coats walk past discussing a business deal."
"A drunk staggers out of an alley and down the road."
"Someone in the crowd bumps into you, but he disappears before you can get a better look."
"A chanting procession of Deists passes by."
"A patrol golem thump-thump-thumps down the street."
"For a moment, inexplicably, there is the smell of rotting meat. Then it is gone."
"An engineer wanders down the street muttering to himself."
"A pair of little boys walk past."
"Some animologists drift by, engrossed in a macabre discussion."
"A group of fabers walks past, on their way to some great work or other."
"A snakelike mutant slithers through the crowd, and is gone."
"A mutant in work clothes tromps past."
"A gargoyle swoops between rooftops overhead, and is gone as quickly as it came."
"A gobliness in mourning clothes brushes past you."
"A flock of birds passes overhead."
"A little glass thopter whizzes down the street and vanishes into a side alley."
"In the distance, a zeppelin floats by."
"The wind picks up, tousling your hair and chilling your fingers."
"A woman with a painted face walks past."
"A shrill bell sounds momentarily in the distance."
"The bells of Miller's Gate strike the hour."
"The sounds of a distant pipe organ echo in the street."
"A particularly vicious breeze whips at your cheeks."
"A woman runs past in tears. She's gone before you can see her face."
"A man nearly trips over a pothole, but he catches himself in time."

Chapter 3.1.3.2 - Riggertown Ambience

Some Riggertown ambience is a privately-named ambience object.
The associated table is the Table of Day One Riggertown Ambience.

Table of Day One Riggertown Ambience
happening
"Some goblin schoolchildren meander around your legs."
"A sprocket sails out of someone's shack and disappears into the canal with a plop."
"The smell of deep-fried train oil wafts past."
"A boy walks past doing a handstand."
"A pair of engineers walk past arguing about the applications of orichalcum."
"A drunk staggers past."
"A tiny mechanical spider meanders past along the handrail."
"A piece of the landing falls off with a clang. No one seems to be too concerned."
"A group of goblins runs past."
"A fly buzzes past."
"Three workmen march past carrying a ladder of comical length."
"A goblin tips his hat at you as he waddles past."
"A forlorn crate bobs down the canal and rolls out of sight."
"A blob of spit flies out of someone's doorway, landing several meters away in a well-used spitoon."
"A calcareous ooze burbles along and disappears up a drainpipe."
"A lass thunders past in what appears to be a rocket-assisted wheelchair."
"A gobliness bumps into your pant leg, rubs her head, and continues along the landing."
"A ball bearing rolls down the walkway. Someone in the crowd picks it up and pops it in his mouth."
"Some pigeons scatter squawking out of an alley."
"A pair of housewives pass by, tittering at some in-joke."
"A goblin rides past on a unicycle."
"A goblin matron saunters down the walk, accompanied by a dozen or so excitable children."
"Someone brushes your elbow, and your hairs stand on end from the galvanic discharge."
"Someone tosses the contents of their chamberpot into the canal."
"Far off, someone says a prayer to the Trismegistus."
"The lights flicker. An alchemist runs up and administers a fresh injection of phlogiston."
"A goblin housewife runs past, chasing after an irritable house-lizard."
"You hear glass shattering somewhere, followed by an indistinct curse."
"A horn honks."
"Someone steps in a foul-smelling puddle and curses."
"A breeze whips by, [if the tinkling windchimes are in the location]sending the windchimes to and fro[otherwise]smelling of turpentine[end if]."

Book 3.2 - Surgery Room

The Surgery Room is a proper-named room. "You are in a cold cylindrical chamber, [if the surgical lamps are switched on]thrown into sharp focus by hovering[otherwise]devoid of light from the inactive[end if] surgical lamps. Shelves of vials and medical supplies crowd around you, leaving little room to misstep. A shimmering calomel curtain frames the exit to the south."

The simple-name is "the surgery room".
The sound is "It's quiet."
The scent is "The room is layered in the scent of antiseptic solution and ozone."
The exit reminder is "The only exit is south through the calomel curtain."

Before examining south in the Surgery Room, try searching the calomel curtain instead.
Before examining outside in the Surgery Room, try searching the calomel curtain instead.

Before going outside in the Surgery Room, try going south instead.

Part 3.2.1 - Scenery

Some hovering surgical lamps are a switched on scenery device in the Surgery Room.
Instead of examining the surgical lamps, say "They hang in the air as though suspended by invisible threads. You can only guess where Doctor Cavala acquired them. They are currently switched [if the surgical lamps are switched on]on[otherwise]off[end if]."
Understand "lamp" or "light/lights" as the surgical lamps.
Before burning the surgical lamps, try switching on the surgical lamps instead.
Before extinguishing the surgical lamps, try switching off the surgical lamps instead.
Instead of taking the surgical lamps, say "The lamps seems to be tethered in place."

Some shelves of medical supplies are a scenery supporter in the Surgery Room. 
Understand "vials" or "and" or "shelf" as the shelves of medical supplies.
Instead of examining or searching the shelves of medical supplies, say "[if a described thing is on the shelves of medical supplies]Nestled among the medical supplies, you spy [a list of described things on the shelves of medical supplies].[otherwise]You spy nothing useful on the shelves, well-stocked though they are."
Instead of entering the shelves of medical supplies, say "There's no need; you can reach all the shelves quite easily."

Part 3.2.2 - Calomel Curtain

The calomel curtain is a scenery door. It is south of the Surgery Room and north of the Clinic. It is open and unopenable.
The description is "It decontaminates objects that pass through it[if player-knows-go is false].[paragraph break](Type >[bold type]go south[roman type] to leave the surgery room.)[otherwise]."
The scent is "It smells[if time is not critical], unsurprisingly,[end if] of calomel."
Understand "immaterial" or "field" or "of" or "energy" as the calomel curtain.
Understand "exit" as the calomel curtain when the location is the Surgery Room.

Instead of searching the calomel curtain, say "You can't see much through the calomel curtain."
Instead of touching the calomel curtain, say "Your hand tingles as it passes through the curtain."
Instead of attacking, climbing, closing, knocking on, opening, pulling, pushing, rubbing, squeezing, swinging, taking, or turning the calomel curtain, say "The calomel curtain is an immaterial field of energy. It isn't a literal curtain."

After going through the calomel curtain while the player is staid: say "A wave of warmth washes over you as you step through the calomel curtain."; continue the action. 

Part 3.2.3 - Gurney

The gurney is a fixed in place enterable supporter in the Surgery Room. "[if Reden is on the gurney][reden-gurney-description].[otherwise if a described thing is on the gurney]On the gurney [is-are a list of described things on the gurney].[otherwise]The gurney in the center of the room is empty."
Understand "sober" or "mechanical" or "bed" or "drawer" or "drawers" or "side" or "of" as the gurney.

Instead of examining the gurney, say "It's a sober mechanical bed with various devices and surgical implements attached.[if Reden is on the gurney] [reden-gurney-description].[otherwise if a described thing is on the gurney][line break]On the gurney [is-are a list of described things on the gurney]."

The attached surgical implements are part of the gurney. Understand "devices" or "device" or "implement" or "strap" or "straps" or "hook" as the implements. Instead of doing anything with the implements, say "You don't think anything useful will result from fiddling with the gurney devices."

Instead of entering the gurney, say "The gurney is for patients. It isn't a toy."
Instead of searching the gurney, say "You find nothing useful in the mechanical drawers."

Instead of taking an other person on the gurney, say "[regarding the noun]You don't think you should disturb [them]."
Instead of putting something on the gurney when someone is on the gurney, say "[The random person on the gurney] [are] already on the gurney."

Part 3.2.4 - Reden

Reden is a goblin man on the gurney. 
The scent is "[if Reden is living]He reeks.[otherwise if Reden is on the gurney]He's going to have to be embalmed soon.[otherwise]He smells of embalming fluid."
The sound is "[if Reden is living]Hacking, gurgling, wheezing.[otherwise]He is silent."
Understand "patient" as Reden.
Understand "chest" or "cavity" or "autopsy" as Reden when Reden's Autopsy is happening.

To say reden-gurney-description:
	if Reden is living:
		say "The patient[first time], Reden -- he[only] shudders against his straps on the gurney, black blood streaming from his eyes and mouth, even as Doctor Cavala fights to isolate the infection";
		now Doctor Cavala is mentioned;
	otherwise:
		say "Reden lies on the gurney, lifeless and still";
	now Reden is mentioned.

The description of Reden is "[if Reden is living]Reden, goblin male aged 37, stumbled into the clinic six minutes ago suffering from convulsions and phantom pains. Now his life is in Doctor Cavala's hands -- and yours.[otherwise if Reden's Autopsy is happening]His chest cavity has been dissected, revealing a spiderweb pattern of blackened blood vessels and tissues.[otherwise]Black stains run down his cheeks like tears."

Instead of bandaging Reden with, say "It's a little late for that."

Some streams of black blood are part of Reden.
The description is "A chilling symptom. It's unlike any affliction you've ever studied."
Understand "fluid/effluvium" or "stream" or "stain/stains" or "spiderweb" or "pattern" or "blackened" or "vessel/vessels/artery/arteries/arterial" or "tissue/tissues" or "drop/drops/droplet/droplets" as the streams of black blood.
Instead of doing anything other than examining or rubbing with the streams of black blood, say "The fluid could be contagious. You shouldn't interact carelessly with it."
Instead of doing anything when the second noun is the streams of black blood, say "The fluid could be contagious. You shouldn't interact carelessly with it."

Part 3.2.5 - Surgery Room during Prologue

Doctor Cavala is in the Surgery Room.

When play begins (this is the print the introduction rule):
	clear the screen;
	say paragraph break;
	say "Too fast. It all happened too fast.[run paragraph on]";
	wait for any key;
	say "[paragraph break]He was healthy not a day before, or so he said when he stumbled into the clinic just minutes ago. You should have seen the signs -- the recurring shivers, the black stains around his eyes -- but the shadows were long in the hour of night, and in the darkness you couldn't see, you couldn't see...[run paragraph on]";
	wait for any key;
	say "[paragraph break]The vomiting came first, then the weakness of the knees -- you barely caught him as he keeled over you -- Doctor Cavala pulled him back before you were crushed by his weight. 'The surgery room!' she shouted, and together you half-carried half-dragged the goblin to the gurney and strapped him down. You hid behind the protection of your surgical mask, adjusted the lights as you had been drilled. Thoughts flitted across your mind -- flit -- flitting --";
	wait for any key;
	say "[paragraph break]'I've never operated on a goblin before,' you say, with a hint of panic in your voice. 'I did, in a way, on the Collegiate cadavers, but--'";
	wait for any key;
	say "[paragraph break]'Steady, girl.' Doctor Cavala snaps on her gloves and squeezes your shoulder. 'Remember your training. I need your help. Are you with me?'[run paragraph on]";
	wait for any key;
	say "[paragraph break]You take a deep breath. 'I'm with you, Doctor.'[run paragraph on]";
	wait for any key;
	say "[paragraph break]'Good.' She nods. 'Try to keep up.'[run paragraph on]";
	wait for any key;
	clear the screen;
	say "[paragraph break][paragraph break][paragraph break]";
	center "T H E";
	say paragraph break;
	center "W E I G H T";
	say paragraph break;
	center "O F";
	say paragraph break;
	center "A";
	say paragraph break;
	center "S O U L";
	wait for any key;
	clear the screen;
	say paragraph break;
	set pronouns from Doctor Cavala;
	set pronouns from Reden.

first-message-and-help-text-shown is a truth state that varies.

Before reading a command while first-message-and-help-text-shown is false (this is the print the first surgical procedure message and new player help text rule):
		say "[happening in row 1 of the Table of Reden's Surgical Procedure][paragraph break](New players should type >[bold type]help[roman type].)";
		now first-message-and-help-text-shown is true.

Chapter 3.2.5.1 - Reden's Surgical Procedure

[This is a minigame where you help Doctor Cavala find stuff for the procedure, potentially prolonging Reden's life. He dies either way, but it's good for atmosphere.]

The CSORSP [current step of Reden's surgical procedure] is a number that varies. The CSORSP is 1.

A purely-surgical-necessity is a kind of thing. [These things will be removed from play when Reden's Surgery ends.]
A purely-surgical-necessity has some text called the terse appellation.
Instead of doing anything when the noun is a purely-surgical-necessity or the second noun is a purely-surgical-necessity:
	if the action name part of the current action is:
		-- the examining action: continue the action;
		-- the pulling action: continue the action;
		-- the removing it from action: continue the action;
		-- the taking action: continue the action;
	say "You don't have time for that."

The Reden's surgery holding zone is a container. [This holds surgical necessities that are ready to go on stage when Marid examines the appropriate thing.]

Every turn during Reden's Surgery (this is the Reden's surgical procedure minigame rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		advance Reden's surgical procedure;
	otherwise if the Table of Reden's Agonizing Demise is not empty:
		choose a random row in the Table of Reden's Agonizing Demise;
		say "[happening entry][paragraph break]";
		blank out the whole row.

To advance Reden's surgical procedure:
	increase the CSORSP by 1;
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	say "[happening entry][paragraph break]";
	if there is a spawned items entry:
		repeat with current item running through the spawned items entry:
			now the current item is in the Reden's surgery holding zone.
			
Report asking for help during Reden's Surgery (this is the show message after help menu rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		say "[happening entry][paragraph break]";
		
Report asking for commands during Reden's Surgery (this is the show message after commands menu rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		say "[happening entry][paragraph break]";
		
Report asking for journal during Reden's Surgery (this is the show message after journal menu rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		say "[happening entry][paragraph break]";
		
Report asking for characters during Reden's Surgery (this is the show message after characters menu rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		say "[happening entry][paragraph break]";
		
Report asking for map during Reden's Surgery (this is the show message after map menu rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		say "[happening entry][paragraph break]";
		
Report asking for hints during Reden's Surgery (this is the show message after hints menu rule):
	choose row CSORSP in the Table of Reden's Surgical Procedure;
	if there is no item required entry:
		say "[happening entry][paragraph break]";

Table of Reden's Surgical Procedure
index	happening	spawned items	item required
1	"'Eyes sharp, Marid,' she says. 'I'm going to need your help in a moment.'

'Got it,' you reply."	--	--

[cont.]
			
Section 3.2.5.1.1 - The Soporific

Table of Reden's Surgical Procedure (continued)
index	happening	spawned items	item required
2	"A convulsion -- Doctor Cavala takes a step back as the gurney creaks. 'We need to sedate the patient,' she says, 'or we'll never get anything done. Marid, get the soporific from the shelves. I'm going to take a look at his eyes...'

You glance up at the shelves ringing the surgery room."	{soporific, vivific}	--
3	"'...massive internal bleeding...' she mutters.[if the current action is looking][paragraph break](Not sure what to do? Try typing >[bold type]examine shelves[roman type] or >[bold type]shelves[roman type].)"	--	--
4	"'...unnerving. I've never seen anything like it.' Doctor Cavala shakes her head before glancing to you. 'Marid. Did you find the soporific? Give it to me.'"	--	soporific

The soporific inhaler is a purely-surgical-necessity. The printed name is "inhaler labeled [italic type]aer soporifer[roman type]". The terse appellation is "the soporific".
The description is "This must be the soporific Doctor Cavala is looking for.[paragraph break](You can type >[bold type]take soporific[roman type] to retrieve it.)[line break]".
Understand "inhaler" or "labeled" or "aer" or "soporifer" as the soporific.
	
The vivific inhaler is a purely-surgical-necessity. The printed name is "inhaler labeled [italic type]aer vivificans[roman type]".
Understand "labeled" or "aer" or "vivificans" as the vivific.

Understand "inhalers" as the soporific and the vivific.

The phantom-soporific is an undescribed purely-surgical-necessity. It is on the shelves of medical supplies. The printed name is "soporific". [This is a bone for new players, after playtesting revealed several attempts to interact with the soporific followed by confusion.]
Instead of doing anything when the current action involves the phantom-soporific, say "You can't see anything like that at the moment.[paragraph break](Some things are hidden until you discover them. Try typing >[bold type]examine shelves[roman type] or >[bold type]shelves[roman type].)[line break]".
Understand "soporific" or "sedative" as the phantom-soporific.

Before examining or searching the shelves of medical supplies when the soporific is in the Reden's surgery holding zone (this is the spawn the soporific and vivific rule):
	now the soporific is on the shelves of medical supplies;
	now the vivific is on the shelves of medical supplies;
	now the phantom-soporific is nowhere.

Before doing anything to the vivific (this is the oops wrong inhaler rule):
	say "Wait... that's not the right inhaler. You push it aside.";
	now the vivific is nowhere;
	stop the action.
	
After taking the soporific (this is the soporific supplied for Reden's surgery rule):
	now the CSORSP is 4;
	blank out the item required in row 4 of the Table of Reden's Surgical Procedure;
	now the soporific is nowhere;
	now the vivific is nowhere.
	
Section 3.2.5.1.2 - The Stethoscope

[I decided that a legit stethoscope might be given to the player later on, so this section uses a pair of prop stethoscopes.]

Table of Reden's Surgical Procedure (continued)
index	happening	spawned items	item required
5	"You tiptoe -- grab the inhaler -- press the device into Doctor Cavala's waiting palm. She shakes it experimentally and nods at you before raising the inhaler to Reden's lips with a [italic type]hiss...[roman type]

The goblin's pupils begin to dilate. 'Easy now,' Doctor Cavala mutters--

[wait for any key]His head bucks violently. Doctor Cavala drops the inhaler and the bulb shatters all over the floor. 'Primes!' she hisses. 'Marid, can you get me another dose?'"	--	--
6	"'That was the last one,' you yell back, trying not to breathe in any of the fumes.

'Fine!' Doctor Cavala says. 'We'll do this without anaesthetic, one way or another.' She gives the straps another pull and bends over Reden's body. 'Bleeding... arterial...' She snaps her fingers. 'Marid, get me the stethoscope.'

'Where is it?'

Doctor Cavala's answer is drowned out by another round of coughing from the patient."	{purely-surgical-stethoscope}	--
7	"[if the purely-surgical-stethoscope is not in the Surgery Room]'Doctor, I don't know where the stethoscope is.'

'The gurney, the gurney!' she snaps. 'There. Hanging from the side. I can't reach it from here.'[otherwise]'Never mind,' you mumble."	--	--
8	"Doctor Cavala looks up from her work, irritated. 'Have you found it yet?'

[if the purely-surgical-stethoscope is in the Surgery Room]'I found it,' you reply.

'Good,' she says, 'give it to me.'[otherwise]'I'm still looking,' you reply.

'Look behind the gurney,' she says. 'It's right there.'"	--	purely-surgical-stethoscope

The purely-surgical-stethoscope is a privately-named purely-surgical-necessity. "Hanging on the side of the gurney is an orichalcum stethoscope." The printed name is "stethoscope". The terse appellation is "the stethoscope".
The description is "[if the purely-surgical-stethoscope is carried by Doctor Cavala]Doctor Cavala's using it.[otherwise]It looks to be a new design, sleeker than the ones in the Physicians['] College. No wonder you missed it the first time round."
Understand "stethoscope" or "orichalcum" or "ausculting" or "dish" as the purely-surgical-stethoscope.
Instead of doing anything other than examining to the purely-surgical-stethoscope when the purely-surgical-stethoscope is carried by Doctor Cavala, say "You can't disturb Doctor Cavala, not now."

The phantom-stethoscope is an undescribed purely-surgical-necessity. It is on the gurney. The printed name is "stethoscope".
Instead of doing anything when the current action involves the phantom-stethoscope, say "You can't see anything like that at the moment.[paragraph break](Some things are hidden until you discover them. Try typing >[bold type]examine gurney[roman type] or >[bold type]gurney[roman type].)[line break]".
Understand "stethoscope" or "orichalcum" or "ausculting" or "dish" as the phantom-stethoscope.

Instead of examining, looking under, or searching the gurney when the purely-surgical-stethoscope is in the Reden's surgery holding zone (this is the spawn the stethoscope rule):
	say "You look behind the gurney and there it is -- a stethoscope reclining snakelike on its hook.";
	now the purely-surgical-stethoscope is in the Surgery Room;
	now the phantom-stethoscope is nowhere;
	set pronouns from the purely-surgical-stethoscope. [Playtesting shows that it's natural to want to 'give it to Cavala' immediately after, so we do this.]

Instead of examining, looking under, or searching the gurney when the purely-surgical-stethoscope is in the Surgery Room (this is the stethoscope is still there rule):
	say "Hanging from the side of the gurney is an orichalcum stethoscope."

After taking the purely-surgical-stethoscope (this is the stethoscope supplied for Reden's surgery rule):
	now the CSORSP is 8;
	blank out the item required in row 8 of the Table of Reden's Surgical Procedure;
	now the purely-surgical-stethoscope is carried by Doctor Cavala.
	
Section 3.2.5.1.3 - The Catholicon

Table of Reden's Surgical Procedure (continued)
index	happening	spawned items	item required
9	"You carefully unwind the stethoscope and toss it to Doctor Cavala, who catches it with a practiced hand.

'Took you long enough.'

'But it was...' you protest.

'Hush.' Doctor Cavala pushes the device against Reden's chest and lowers her ear to the ausculting dish. 'I'm trying to listen.'"	--	--
10	"Blood continues to run down the goblin's lips, and you hurry over to dab it away before it touches Doctor Cavala's face. At last she rises, her face grim.

'What did you hear, Doctor?' you ask.

'Nothing good,' she replies. 'I fear we may be too late -- but there is one last thing we can try.'

[wait for any key]She pauses. 'Have you ever heard of the [italic type]breath of catholicon?[roman type]'

[wait for any key]You frown. 'I thought that was a myth.'

'Check the shelves again,' Doctor Cavala commands, turning back to her ailing patient. 'And be quick about it.'"	{catholicon}	--
11	"'What would such a thing even look like?' you protest.

Doctor Cavala moves as if to speak -- but then there is another coughing fit from Reden, and she curses and adjusts the straps. You shake your head and turn back to the shelves."	--	--
12	"'It's in an inhaler,' she says finally. 'Labeled in the old language. It cost me a great deal to acquire.'

There is no mirth in her voice, and for a moment you are at a loss for words."	--	--
13	"There is another convulsion from the patient, but with less vigor than before. Much less.

'He's falling apart,' Doctor Cavala says in a low voice. 'Don't hesitate, Marid. Get me the catholicon.'"	--	--
14	"Distantly you hear Reden's ragged breathing."	--	catholicon

The catholicon inhaler is a purely-surgical-necessity. The printed name is "inhaler labeled [italic type]halitus catholiconis[roman type]". The terse appellation is "the catholicon".
The description is "Something is moving inside."
Understand "labeled" or "halitus" or "catholiconis" or "breath of/--" as the catholicon.

The phantom-catholicon is an undescribed purely-surgical-necessity. It is on the shelves of medical supplies. The printed name is "catholicon".
Instead of doing anything when the current action involves the phantom-catholicon, say "You can't see anything like that at the moment.[paragraph break](Some things are hidden until you discover them. Try typing >[bold type]examine shelves[roman type] or >[bold type]shelves[roman type].)[line break]".
Understand "breath of/--" or "catholicon" as the phantom-catholicon.

The catholiconometer is a number that varies. [You get a series of messages before actually finding the catholicon. This number keeps track of how many times you've searched.]

Before taking the shelves of medical supplies when the catholicon is in the Reden's surgery holding zone (this is the convert attempts to take the supplies to taking the catholicon rule):
	try examining the shelves of medical supplies instead.

Instead of examining or searching the shelves of medical supplies when the catholicon is in the Reden's surgery holding zone (this is the still searching for the catholicon rule):
	if the catholiconometer is less than 3:
		say "[one of]The breath of catholicon -- could it really be here, hidden among this detritus? You glance across the crowded supplies, but nothing catches your eye, not yet...[or]Curatives, laxatives, poisons, panaceas, blades of every shape and size... no. None of them...[or]Rows and rows of strange tools, tubes, vials, beakers, inhalers... inhalers?[stopping]";
		increment the catholiconometer;
	otherwise if the catholiconometer is 3:
		say "You blink.[paragraph break]";
		now the catholicon is on the shelves of medical supplies;
		now the phantom-catholicon is nowhere;
		set pronouns from the catholicon; [Playtesting shows that it's natural to want to 'give it to Cavala' immediately after, so we do this.]
		increment the catholiconometer;
		continue the action.
		
After taking the catholicon (this is the catholicon supplied for Reden's surgery rule):
	now the CSORSP is 14;
	blank out the item required in row 14 of the Table of Reden's Surgical Procedure;
	now the catholicon is nowhere;
	now the enabled of cavala-redendead-catholicon is true.
		
Understand "curative/curatives" or "laxative/laxatives" or "poison/poisons" or "panacea/panaceas" or "blade/blades" or "inhaler/inhalers" as the shelves of medical supplies when the catholiconometer is 2. Understand "tool/tools" or "tube/tubes" or "beaker/beakers" or "inhaler/inhalers" as the shelves of medical supplies when the catholiconometer is 3. [Just in case someone is crazy enough to actually try this.]

Section 3.2.5.1.4 - The Catholicon Doesn't Work

Table of Reden's Surgical Procedure (continued)
index	happening	spawned items	item required
15	"The halitus whirls within its glass cage as you lower it from the shelves; it billows as Doctor Cavala bears the inhaler to Reden's bloodsoaked lips. She breaks the seal, and in the bulb it spirals round and round in the dance of exhalation --

[wait for any key]And then it is within him.

His breath is stolen away. His irises flare with the light of catharsis. He flails against the gurney straps as though puppeted by invisible hands.

[wait for any key]'Doctor Cavala?' you ask. You look to her, and her eyes are as wide as yours."	--	--

Section 3.2.5.1.5 - Reden's Agonizing Demise

[These messages display in random order when the player is dilly-dallying. If the player takes too long, Reden dies.]
	
Table of Reden's Agonizing Demise
happening
"'[The terse appellation of the item required in row CSORSP of the Table of Reden's Surgical Procedure in sentence case], Marid,' Doctor Cavala presses. 'Give [regarding the item required in row CSORSP of the Table of Reden's Surgical Procedure][them] to me.'"
"[regarding the item required in row CSORSP of the Table of Reden's Surgical Procedure]'I need [them] [italic type]now[roman type], Marid,' Doctor Cavala hisses."
"Reden suddenly coughs, and Doctor Cavala narrowly avoids a fusillade of black droplets."
"Doctor Cavala curses as she fumbles with the gurney mechanisms."
"The seconds slip away."
"'Marid, I need [the terse appellation of the item required in row CSORSP of the Table of Reden's Surgical Procedure].'"
	
Chapter 3.2.5.2 - Reden's Screwed

[If the player fails the minigame or completes the entire surgery cutscene, the next command the player inputs will be ignored in favor of Reden dying straight away.]

To decide whether Reden is screwed:
	if Reden is dead, no;
	if the CSORSP is the number of rows in the Table of Reden's Surgical Procedure, yes;
	if the Table of Reden's Agonizing Demise is empty, yes;
	no.

After reading a command while Reden is screwed (this is the put poor Reden out of his misery rule):
	say "Hold--

There is a sudden quiet, a moment when the surgical lights flicker and time itself seems to slow. For an instant something brilliant swims at the edges of your vision.[paragraph break]";
	wait for any key;
	say "Reden's eyes close.[paragraph break]";
	wait for any key;
	say "The moment passes. Doctor Cavala seizes him, shouting, but the goblin is unresponsive. She checks his pulse. She produces a needle, lines up an injection -- the needle withdraws empty, stained with foul black effluvium. But he does not awaken.[paragraph break]";
	wait for any key;
	say "Seconds pass. A minute. Finally she stands, silent, her breathing level. She takes off her mask and sets it on the operating table with an air of grim finality.[paragraph break]";
	now Reden is dead;
	now all purely-surgical-necessities are nowhere;
	wait for any key;
	start a dialogue with Doctor Cavala using dialogue cavala-redendead;
	reject the player's command. [Ordinarily we would also follow the 'rest of the turn rule' here, since we overrode the player's action, but the dialogue system already calls that function.]
	
Chapter 3.2.5.3 - Reden's Death Dialogue

Some dialogue branches are defined by the Table of Reden's Death Dialogue.

Table of Reden's Death Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
cavala-redendead	true	false	""	"(To continue, choose a response from the list by typing the corresponding number.)"	 {cavala-redendead-damn, cavala-redendead-sorry, cavala-redendead-mask}
cavala-redendead-damn	true	false	"'Damn it.'"	"'Damn it,' you mutter.

Doctor Cavala shakes her head. 'We did all we could. That's all anyone can do. But it's out of our hands now.'"	{cavala-redendead-mask2, cavala-redendead-ifonly, cavala-redendead-catholicon, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-sorry	true	false	"'I'm sorry.'"	"'I'm sorry.' Your voice is a whisper.

Doctor Cavala shakes her head. 'Don't apologize, Marid. We did all we could. But it's out of our hands now.'"	{cavala-redendead-mask2, cavala-redendead-ifonly, cavala-redendead-catholicon, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-mask	true	false	"<Take off your surgical mask.>"	 "You pull off your surgical mask and gaze at it. Words tumble over each other and choke in your throat.

'We did all we could,' Doctor Cavala says, shaking her head. 'But it's over. It's out of our hands now.'"	{cavala-redendead-ifonly, cavala-redendead-catholicon, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-mask2	true	true	"<Take off your surgical mask.>"	 "You pull off your surgical mask. The smell of antiseptic, of death, washes over you like cold reality.

You don't meet Doctor Cavala's gaze as you hand the mask to her."	{cavala-redendead-ifonly, cavala-redendead-catholicon, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-ifonly	true	true	"'If only...'"	"'If only...'

'If only [italic type]what?'[roman type] She fixes you with a stern gaze. 'The man is dead, Marid. We are not animologists. Nothing we do will bring him back -- and you of all people should know this.'

'I know,' you say bitterly. 'I... I just wish there was something we could do.'

[if the player is wearing the surgical mask]Doctor Cavala holds out her hand. No words are needed. You pull off your surgical mask and hand it to her, unable to meet her gaze.[otherwise]Doctor Cavala's eyes flicker to the outline of your pendant, under your jacket, but she says nothing."	{cavala-redendead-catholicon, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-catholicon	false	true	"'The catholicon -- what [roman type]was[italic type] that?'"	"'The catholicon--'

You glance at Reden, half expecting to see white fire in his eyes, and suppress a shudder.

'The catholicon, Doctor. What [italic type]was[roman type] that?'

[wait for any key]Doctor Cavala takes the empty inhaler out of her pocket. She looks pensively into the glass, and holds it up to the lights where it shines.

'The catharsis,' she says quietly. 'The purging of the soul. It is the most destructive of all remedies, and the most irreversible once administered. But remember this, Marid: sometimes a thing must be destroyed before it can be built anew.'

[wait for any key]She turns to regard the body on the gurney, so frail and gentle in death, and sighs.

'It was his only chance,' she says. 'He was going to die either way. But... I'm sorry you had to see that, Marid. I really am.'"	{cavala-redendead-mask2, cavala-redendead-ifonly, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-sawlight	true	true	"'At the moment he died, I had a strange vision...'"	 "'At the moment he died, I had a strange vision. It was... it was...'

You try to recall the strange sensation you experienced, but it fragments and swims away, and lingers at the edge of your consciousness where you can find no purchase. What words could describe that weightless moment?

[wait for any key]'It was...' you flounder, 'it was...'

Doctor Cavala watches you intently. 'Strange sights are not uncommon at the moment of death, Marid. Especially when the animus escapes untethered. You studied such reactions in the Physicians['] College, did you not?'

[wait for any key]'This was different,' you insist.

'It's been a long day,' she replies. 'Take a moment to collect your thoughts. Talk to me again tomorrow when you are certain.'

You lower your eyes. 'Yes, Doctor.'"	{cavala-redendead-mask2, cavala-redendead-ifonly, cavala-redendead-catholicon, cavala-redendead-whatnext}
cavala-redendead-whatnext	true	false	"'What happens next?'"	"'What happens next?'

[if the player is wearing the surgical mask]'You can begin by taking off your mask,' she reminds you. 'We won't be operating on a cadaver any time soon.'

You sigh and pull off your mask. 'But what happens next?'

[wait for any key][end if]'It's a unique situation, to be sure.' Doctor Cavala [if the player is wearing the surgical mask]takes the mask from you and [end if]begins to pace around the gurney. 'For any other disease, our course would be straightforward. Log the death. Inform the family. Check for symptoms. Do our best to contain the contagion. Easier said than done, but at least it would be straightforward.

[wait for any key]'Now Reden has died of an illness I cannot identify. And I've seen a lot of illnesses, Marid.' She studies her gloved hands, stained black with blood.  'In the morning I will reference the [italic type]Alchemical Library of Fluids[roman type] and contact my colleagues for help... but we must be prepared for the possibility that we are dealing with an unknown affliction.

[wait for any key]'For now, we proceed with caution.' She gives you a curt nod. 'After you clean up the surgery room, Marid, you may retire for the night. You've been a good assistant. As for myself... I will begin on the paperwork, and on the task of moving the body to the mortuary.'"	{cavala-redendead-goodbye, cavala-redendead-help}
cavala-redendead-goodbye	true	false	"'Yes, Doctor.'"	"'Yes, Doctor.'

'See that it's done.'

Doctor Cavala hands her tools to you and leaves to dispose of the soiled surgical masks. The next half hour is spent in simple work: the comforting tedium of cleaning, sterilizing, organizing. Soon the surgery room is pristine and unblemished.

You wash your hands, switch off the lamps, and look to the calomel curtain to the south. It's time to go home."	{}
cavala-redendead-help	true	false	"'Can I help?'"	"'Can I help?' you ask.

Doctor Cavala smiles and shakes her head. 'I appreciate the sentiment, Marid, but you've seen and done more than enough for one night. Take my advice and get some rest. You'll need it for tomorrow.'"	{cavala-redendead-goodbye}

After reading out cavala-redendead-mask: now the enabled of cavala-redendead-mask2 is false; now the surgical mask is nowhere.
After reading out cavala-redendead-mask2: now the surgical mask is nowhere.
After reading out cavala-redendead-ifonly: now the enabled of cavala-redendead-mask2 is false; now the surgical mask is nowhere.
After reading out cavala-redendead-sawlight: now the enabled of cavala-errands2-vision is true.
After reading out cavala-redendead-whatnext: now the surgical mask is nowhere.
After reading out cavala-redendead-goodbye: now the surgical lamps are switched off; now Doctor Cavala is in the Clinic.

Chapter 3.2.5.4 - What Not to Do During Life-and-Death Surgery

Instead of talking to Doctor Cavala during Reden's Surgery:
	if there is an item required in row CSORSP of the Table of Reden's Surgical Procedure:
		say "Doctor Cavala asked you to find [the terse appellation of the item required in row CSORSP of the Table of Reden's Surgical Procedure] and give it to her.";
	otherwise:
		say "[run paragraph on]".
		
Instead of waiting during Reden's Surgery, say "[run paragraph on]".
Instead of listening to the Surgery Room during Reden's Surgery, say "[run paragraph on]".
Instead of listening to Doctor Cavala during Reden's Surgery, say "[run paragraph on]".

Instead of switching off the lamps during Reden's Surgery, say "But a surgery is in progress."

Instead of going from the Surgery Room during Reden's Surgery, say "Doctor Cavala has not given up hope, and neither should you."

Instead of doing anything other than examining or listening to Reden during Reden's Surgery, say "You can't disturb the patient at this critical juncture."
Instead of doing anything when the second noun is Reden during Reden's Surgery, say "You can't disturb the patient at this critical juncture."

Instead of doing anything other than examining or listening to Doctor Cavala during Reden's Surgery, say "You can't disturb Doctor Cavala, not now."
Instead of doing anything other than giving something to something when the second noun is Doctor Cavala during Reden's Surgery, say "You can't disturb Doctor Cavala, not now."

Book 3.3 - Clinic

The Clinic is a proper-named room. "[if Cavala's Errands has not ended]Doctor Cavala's clinic is a small, unostentatious affair, neatly organized with little in the way of decoration. [end if]A row of chairs faces the prescription counter, where the medication and patient records are sorted in gridlike pigeonholes[if  Cavala's Errands has not ended]; f[otherwise]. F[end if]urther on is the consulting study, home to a desk strewn with notes and diagrams.

A calomel curtain leads north to the surgery room, stairs lead down to the mortuary, and the front door lies east."
The scent is "You smell a hint of calomel from the surgery room."
Understand "doctor/doctor's" or "cavala/cavala's" as the Clinic.

The simple-name is "Doctor Cavala's clinic".
The scent is "You smell a hint of calomel from the surgery room."
The exit reminder is "You can go [if Walking Home in Darkness has ended]north to the surgery room, down to the mortuary, or [end if]east to the Via Terminalis."
The going-in disambiguation is "[if Walking Home in Darkness has ended]Do you mean going north (to the surgery room) or going down (to the mortuary)?[otherwise]You don't really want to go back in there."

Before examining north in the Clinic, try searching the calomel curtain instead.
Before examining east in the Clinic, try searching the clinic front door instead.
Before examining outside in the Clinic, try searching the clinic front door instead.
Before examining down in the Clinic, try examining the stairs to the mortuary instead.
Before going outside in the Clinic, try going east instead.

Part 3.3.1 - Scenery

The view of the Via Terminalis is in the Clinic.
Before entering the view of the Via Terminalis in the Clinic, try going east instead.

Some waiting chairs are an enterable scenery supporter in the Clinic.
The description is "They're for waiting patients to sit on."
Understand "row" or "of" or "chair" or "area" as the waiting chairs.
Report entering the waiting chairs: say "You sit on one of the chairs."; stop the action.
Report getting off the waiting chairs: say "You stand up."; stop the action.
Rule for issuing the response text of room description heading rule response (B) when the player is on the waiting chairs (this is the print 'on one of the waiting chairs' rule):
	say " (on one of the waiting chairs)".

The prescription counter is a scenery supporter in the Clinic.
The description is "The counter, with its latticework screen, divides the pharmacy from the waiting area. There is a drawer for money and a service handbell."
Understand "latticework" or "screen" as the prescription counter.
Instead of entering the prescription counter, say "That won't accomplish anything."

The money drawer is a scenery container part of the prescription counter. It is closed and openable.
Instead of examining the money drawer, say "If you didn't work here, you would never have noticed the faint bevel that demarcates it." 
Understand "faint" or "bevel" or "drawer for money" as the money drawer.
Instead of opening the money drawer, say "[if time is critical]This is not the time.[otherwise]You are many things, Marid, but you are not a thief."

The small brass handbell is scenery on the prescription counter.
The description is "A small brass handbell[if time is not critical]. You know its sound all too well[end if]."
Understand "bell" or "clapper" as the small brass handbell.
Instead of listening to or swinging the small brass handbell, say "[if time is critical]This is not the time.[otherwise]You have already heard it ring countless times, and you aren't inclined to listen to it again."
Instead of searching the small brass handbell, say "Inside the bell is its clapper."
Instead of taking the small brass handbell, say "You see little point in removing it from the counter."

The view of the surgery room is faraway scenery in the Clinic.
Before entering the view of the surgery room, try going north instead.
Instead of doing anything when the current action is not entering and the current action involves the view of the surgery room, say "You can't perceive much of the surgery room from here."

Chapter 3.3.1.1 - Consulting Study

The consulting study is scenery in the Clinic.
The description is "Named so because it is used for study and consultation."
Before entering the consulting study, try entering Doctor Cavala's armchair instead.

Doctor Cavala's armchair is an enterable scenery supporter in the Clinic.
The description is "It looks comfortable."
Instead of taking, pushing, pulling, or turning Doctor Cavala's armchair, say "You don't think Doctor Cavala would appreciate that."
Report entering Doctor Cavala's armchair: say "You sit in the armchair."; stop the action.
Report getting off Doctor Cavala's armchair: say "You stand up."; stop the action.

The consulting-study desk is a scenery supporter in the Clinic. The printed name is "desk in the consulting study".
The description is "Doctor Cavala's notes are laid out in neat stacks."
Understand "desk in the consulting study" or "consulting/study desk" or "consulting study desk" as the consulting-study desk.

There is some plural-named scenery on the desk called Doctor Cavala's notes and diagrams.
The description is "Studies of human, goblin, and mutant anatomy; musings on possible contagion vectors; comparisons between ailments with similar symptoms."
Understand "note" or "diagram" or "studies" or "anatomy" or "musings" or "comparisons" or "possible" or "contagion" or "vectors" or "ailments" or "similar" or "symptoms" as the diagrams.
Instead of searching Doctor Cavala's notes and diagrams, say "It's all way over your head."
Instead of looking under or taking Doctor Cavala's notes and diagrams, say "You shouldn't interfere with Doctor Cavala's work."

Part 3.3.2 - Front Door of the Clinic

The front door of the clinic is a scenery door. It is east of the Clinic and west of the Via Terminalis West End.
The description is "It's a tempered glass door with a brass handle."
Understand "tempered" or "glass" or "brass" or "handle" as the clinic door.
Instead of searching the clinic door, say "Through the glass, [if the location is the Clinic]the length of the Via Terminalis is laid out before you.[otherwise]you see the spartan lines and busy rows of Doctor Cavala's clinic."

Instead of knocking on the clinic door:
	if Doctor Cavala is in the Clinic:
		if the location is the Clinic:
			say "Doctor Cavala glances up, then gives you a strange look.";
		otherwise:
			say "'Come in,' you hear Doctor Cavala say.";
	otherwise:
		if the location is the Clinic:
			say "Nothing happens.";
		otherwise:
			say "There is no response."

Part 3.3.3 - Pigeonholes

There is a plural-named consultable scenery container in the Clinic called the pigeonholes of medication and patient records.
The description is "You can search for medication or patient records in the pigeonholes."
Understand "gridlike" or "medication" or "record" or "inhaler" or "inhalers" or "pigeon" or "hole" or "holes" as the pigeonholes.
Instead of searching the pigeonholes when the pigeonholes contain nothing, say "There is far too much to go through here. You will have to search for a specific medication or patient record."
Instead of taking the pigeonholes, say "You don't need to take anything from the pigeonholes."
Instead of consulting the pigeonholes about, say "You can't find anything under that label."
Instead of consulting the pigeonholes about a topic listed in the Table of the Pigeonholes, say "[description entry][line break]".
	
Table of the Pigeonholes
topic	description
"servator" or "marid" or "orpheia" or "me/self/myself"	"Your own medical record is little more than an informal note for accounting purposes, as your only treatment here -- for a bout of Midaes fever last month -- was self-prescribed."
"doctor" or "cavala"	"Doctor Cavala has meticulously recorded her medical history starting from the day she opened this clinic six years ago. [if Cavala is incapacitated]Her most recent leg injury is here as well, complete with a sketch of the tendons damaged.[otherwise]It seems she has been mostly in health, except for a recurrent ache in her right shoulder from her soldiering days."
"reden"	"On record are various minor illnesses typical for a goblin of his age: the homunculoid shingles, the common cold. There is no precedent for the sudden and dramatic affliction that took his life."
"doctor/-- arturus"	"Doctor Arturus must be the prideful sort -- there are no records of him ever receiving treatment in this clinic."
"doctor/-- justinian" or "doctor/-- volontis"	"You secretly hope to find a patient record for him, and are mildly disappointed when your search turns up nothing."
"doctor/-- serpens"	"Doctor Serpens does not reside in the Channelworks District, and so would not be on record."
"saliunca"	"It appears Saliunca is a long-time patron of this clinic. She suffers from a severe imbalance of the choleric temperament, leading to cataracts and incontinence."
"horatio" or "vigile"	"Horatio is a regular patron of the clinic, mainly for injuries sustained during physical exercise."
"donti"	"There's no reference to Donti here."
"zoiro"	"Zoiro has come in for the common cold now and then."
"koriph"	"It seems Koriph receives regular treatment here for an imbalance of phlegm. His file records a visit every month."
"creditor" or "nacarat"	"There's no patient record for Creditor Nacarat."
"sal" or "salio"	"You find that a man named Salio has come in for brawl-related injuries before, but he was thrown out by Doctor Cavala for disorderly conduct."
"piper"	"There are records of someone named Piper with a recurring phlegmatic infection, but she stopped coming to this clinic a few months ago."
"inhaler/inhalers" or "aer" or "halitus"	"There are a few inhalers here, mainly for treating asthma and hay fever."
"soporific" or "aer/-- soporifer" or "vivific" or "aer/-- vivificans"	"The more powerful medications are reserved for the surgery room."
"catholicon" or "breath of catholicon" or "halitus/-- catholiconis"	"You doubt you will see another inhaler of the [italic type]halitus catholiconis[roman type] in your lifetime, let alone in these pigeonholes."

Part 3.3.4 - Clinic during Prologue

Instead of going to the Surgery Room during Walking Home in Darkness, say "You don't really want to go back in there."
Instead of approaching the Surgery Room during Walking Home in Darkness, say "You don't really want to go back in there."
Instead of going to the Mortuary during Walking Home in Darkness, say "You've seen enough dead bodies for one day."

Instead of switching on the surgical lamps during Walking Home in Darkness, say "But you just switched them off."

Instead of taking Reden during Walking Home in Darkness, say "Doctor Cavala already asked you to leave the shifting of the body to her."

Chapter 3.3.4.1 - Cavala Doing Paperwork

cavala-wh-forgot-quipped is a truth state that varies.
cavala-wh-forgot-quip-switch is a truth state that varies.
cavala-wh-saliunca-quipped is a truth state that varies.
cavala-wh-goodnight-quipped is a truth state that varies.

Rule for writing a paragraph about Doctor Cavala during Walking Home in Darkness:
	if the previous location is the West End:
		if cavala-wh-forgot-quipped is false:
			say "Doctor Cavala raises an eyebrow when she notices you. 'Forgot something?'";
			now cavala-wh-forgot-quipped is true;
			now cavala-wh-forgot-quip-switch is true;
		otherwise:
			say "Doctor Cavala glances at you before returning to her paperwork.";
	otherwise:
		say "Doctor Cavala is at her desk, engrossed in paperwork[if the previous location is the Surgery Room]. As you emerge from the surgery room, she glances up and gives you a nod[end if].";
		
[Doctor Cavala is technically not in her armchair, so we can show her initial appearance. But we want the game to behave in all other respects as though she is.]
Instead of entering Doctor Cavala's armchair while Prologue is happening, say "Doctor Cavala is already in the armchair."
Instead of putting anything on Doctor Cavala's armchair while Prologue is happening, say "Doctor Cavala is already in the armchair."

Instead of talking to Doctor Cavala during Walking Home in Darkness:
	if cavala-wh-saliunca-quipped is false and Saliunca is hostile:
		say "'Doctor,' you breathe. 'There's a woman in my dormitory block -- she's poisoning the pigeons, and... and...'

Doctor Cavala is giving you a look. You trail off, suddenly embarrassed.

[wait for any key]'Please, Marid,' she replies wearily. 'I'm a physician, not a veterinarian. I know tonight has been hard on you, but... could you just leave me to my paperwork? Please?'

[wait for any key]You look at your feet. 'I -- I'm sorry, Doctor. I won't do it again.'

She shakes her head and turns her attention back to her desk.";
		now cavala-wh-saliunca-quipped is true;
		now cavala-wh-forgot-quip-switch is false;
	otherwise if cavala-wh-forgot-quip-switch is true:
		say "'I'm just checking,' you reply.

She shrugs and returns to her paperwork.[line break]";
		now cavala-wh-forgot-quip-switch is false;
	otherwise if cavala-wh-goodnight-quipped is false:
		say "'Good night, Doctor Cavala.'[paragraph break]'Good night, Marid,' she replies. 'Don't stay up too late.'";
		now cavala-wh-goodnight-quipped is true;
	otherwise if cavala-wh-saliunca-quipped is true:
		say "You promised not to bother Doctor Cavala.";
	otherwise:
		say "You shouldn't bother Doctor Cavala while she's working.";
		
Instead of giving something to Doctor Cavala during Walking Home in Darkness, say "You shouldn't bother Doctor Cavala while she's working."
		
Before going through the clinic front door when cavala-wh-goodnight-quipped is false:
	say "'Good night, Doctor Cavala,' you say.[paragraph break]'Good night, Marid. Don't stay up too late.'";
	now cavala-wh-goodnight-quipped is true.
	
Doctor Cavala's paperwork is scenery. The description is "Certificates of death, administrative letters, and other formalities that Doctor Cavala is obliged to entertain." Understand "certificates" or "of" or "death" or "certificate" or "administrative" or "letter" or "letters" or "census" or "report" as the paperwork.
Instead of doing anything other than examining to the paperwork, say "You shouldn't bother Doctor Cavala while she's working."

When Walking Home in Darkness begins (this is the spawn paperwork rule):
	now Doctor Cavala's paperwork is carried by Doctor Cavala.
	
When Walking Home in Darkness ends (this is the despawn paperwork rule):
	now Doctor Cavala's paperwork is nowhere.
	
Part 3.3.5 - Clinic during Day One

Chapter 3.3.5.1 - Clinic during Nine to Five Zombie

9-5-zombie-cavala-prompt is a truth state that varies. 9-5-zombie-cavala-prompt is true.

When Nine to Five Zombie begins: now 9-5-zombie-cavala-prompt is false.

Before approaching the Surgery Room when Nine to Five Zombie is happening and 9-5-zombie-cavala-prompt is false, try approaching the Clinic instead.

Before reading a command when the player is in the Clinic and 9-5-zombie-cavala-prompt is false (this is the trigger the Nine to Five clinic message rule):
	say "'Good morning, Doctor,' you call. But she doesn't seem to be in the waiting area or the consulting study. Odd; where could she have gone?[paragraph break]";
	now 9-5-zombie-cavala-prompt is true.
	
Before going east in the Clinic during Nine to Five Zombie, say "Perhaps you should take a closer look around the clinic." instead.
Instead of examining the waiting chairs during Nine to Five Zombie, say "The chairs are empty."
Instead of examining Doctor Cavala's armchair during Nine to Five Zombie, say "Doctor Cavala's armchair is empty."
Instead of examining or searching the consulting study when Nine to Five Zombie is happening, say "Doctor Cavala is not in her study."
Instead of searching the prescription counter during Nine to Five Zombie, say "Doctor Cavala is not behind the counter."

Instead of listening to or swinging the handbell during Reden's Autopsy, start a dialogue with Doctor Cavala.

Chapter 3.3.5.2 - Clinic during Returning to a Break-In

Instead of going to the Clinic when Returning to a Break-In is happening and Carnicer is not in the Clinic (this is the block approaching the Clinic during Returning to a Break-In rule):
	say "[path-walked so far][line break]".
	
Instead of searching the clinic door during Returning to a Break-In, say "You can't see much."
Instead of listening to the clinic door during Returning to a Break-In, say "You can't hear much."
Instead of closing the clinic door during Returning to a Break-In, say "This is not the time."
	
Instead of going to the Clinic when Returning to a Break-In is happening and Carnicer is in the Clinic (this is the Returning to a Break-In cutscene rule):
	say "You rush through the door of the[paragraph break]";
	move the player to the Clinic, without printing a room description;
	say "[bold type]Clinic[roman type][line break]";
	say "A row of chairs faces the prescription counter, where the medication and patient records are sorted in gridlike pigeonholes. Further on is the consulting study, home to a desk strewn with notes and diagrams.[paragraph break]";
	say "And she is there, walking slowly toward the mortuary stairs. Her sword glints in the final rays of sunlight.[paragraph break]";
	wait for any key;
	say "'Coming!' Doctor Cavala calls. You hear the doctor's chair shift, her footfalls climbing the steps.[paragraph break]";
	wait for any key;
	say "The hooded stranger raises her sword.";
	now Doctor Cavala is in the Clinic.

Chapter 3.3.5.3 - Averting Cavala's Assassination

[In this section, anything the player does will distract Carnicer and foil the assassination, but Doctor Cavala is incapacitated during the struggle.]

Before doing anything when Averting Cavala's Assassination is happening (this is the pick up the phone booth and Carnicer rule):
	if the current action is looking, waiting, waking up, sleeping, or thinking:
		distract Carnicer with inaction;
	otherwise if the current action is examining, listening to, looking under, or smelling something:
		distract Carnicer with inaction;
	otherwise if the current action is crying, saying yes, saying no, saying sorry, or screaming:
		distract Carnicer by crying out;
	otherwise if the current action is talking to something:
		distract Carnicer by crying out;
	otherwise if the current action is answering something that something:
		distract Carnicer by crying out;
	otherwise if the current action is telling something about something:
		distract Carnicer by crying out;
	otherwise if the current action is asking something about something:
		distract Carnicer by crying out;
	otherwise if the current action is asking something for something:
		distract Carnicer by crying out;
	otherwise if the current action involves Carnicer:
		distract Carnicer by attacking her;
	otherwise if the current action involves the poisoned blade:
		distract Carnicer by attacking her;
	otherwise:
		distract Carnicer by moving;
	stop the action.
	
Check asking for help when Averting Cavala's Assassination is happening (this is the can't ask for help during Cavala's assassination rule):
	distract Carnicer with inaction;
	follow the rest of the turn rule;
	stop the action.
	
Check asking for characters when Averting Cavala's Assassination is happening (this is the can't ask for characters during Cavala's assassination rule):
	distract Carnicer with inaction;
	follow the rest of the turn rule;
	stop the action.
	
Check asking for commands when Averting Cavala's Assassination is happening (this is the can't ask for commands during Cavala's assassination rule):
	distract Carnicer with inaction;
	follow the rest of the turn rule;
	stop the action.
	
Check asking for journal when Averting Cavala's Assassination is happening (this is the can't ask for journal during Cavala's assassination rule):
	distract Carnicer with inaction;
	follow the rest of the turn rule;
	stop the action.
	
Check asking for map when Averting Cavala's Assassination is happening (this is the can't ask for map during Cavala's assassination rule):
	distract Carnicer with inaction;
	follow the rest of the turn rule;
	stop the action.
			
To distract Carnicer with inaction:
	say "You stand there, frozen in shock. Your heart hammers in your chest.

The assassin turns her head and looks directly at you.[paragraph break]";
	wait for any key;
	resolve Averting Cavala's Assassination.

To distract Carnicer by crying out:
	say "'Get away!' you scream.

The assassin turns her head and looks directly at you.[paragraph break]";
	wait for any key;
	resolve Averting Cavala's Assassination.

To distract Carnicer by attacking her:
	say "You lunge at the assassin and her hand shoots out. Your momentum is arrested. There is a terrible pressure around your neck.

The assassin has placed the tip of her sword at your throat.[paragraph break]";
	wait for any key;
	resolve Averting Cavala's Assassination.
	
To distract Carnicer by moving:
	say "You take a step--

The assassin turns her head and looks directly at you.[paragraph break]";
	wait for any key;
	resolve Averting Cavala's Assassination.
	
To resolve Averting Cavala's Assassination:
	say "Her face catches the light and she has so[paragraph break]";
	wait for any key;
	say "many[paragraph break]";
	wait for any key;
	say "teeth[paragraph break]";
	wait for any key;
	say "and Doctor Cavala comes up the stairs with a flying tackle that sends the assassin staggering into the waiting chairs. In three steps she is reaching under the counter -- but the assassin is quicker -- her blade faster -- blood spatters the floor -- Doctor Cavala cries out -- a blur of motion -- and there is a flash and thunder from the walls.[paragraph break]";
	now Doctor Cavala is incapacitated;
	wait for any key;
	say "The assassin clutches at her face. Doctor Cavala raises the cutter and pulls the trigger again -- lightning arcs, misses by inches.[paragraph break]";
	wait for any key;
	say "'Get the fuck out of my clinic,' she growls.[paragraph break]";
	wait for any key;
	say "A rush of wind. The assassin is gone. You whirl around and see a dark shape disappearing into the night.[paragraph break]";
	wait for any key;
	say "Doctor Cavala takes a deep breath. Stifles a cry.

'Marid,' she says. 'My leg.'[paragraph break]";
	now Carnicer is nowhere;
	wait for any key;
	say "You find her slumped onto the floor, her chest rising and falling. A gash has been torn above her left knee. Her entire trouser leg is stained red.";
	start a dialogue with Doctor Cavala using dialogue cavala-firstaid-home;
	follow the scene changing rules.

Chapter 3.3.5.4 - First Aid on Cavala

[This is a multi-step procedure similar to Reden's surgery.]

The CSOFAOC [current step of first aid on Cavala] is a number that varies.

Section 3.3.5.4.1 - Cavala First Aid Dialogue

Some dialogue branches are defined by the Table of Cavala First Aid Dialogue.

Table of Cavala First Aid Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
cavala-firstaid-home	true	false	""	""	{cavala-firstaid-doctor, cavala-firstaid-ohprimes}
cavala-firstaid-doctor	true	false	"'Doctor...!'"	"'Doctor...!'

'Be quiet and help me--'

[cavala-firstaid-examinewound]"	{}
cavala-firstaid-ohprimes	true	false	"'Oh Primes...'"	"'Oh Primes...'

[cavala-firstaid-examinewound]"	{}

To say cavala-firstaid-examinewound:
	say "You rush to Doctor Cavala's side. Even from a cursory examination, it's obvious that she needs help, and quickly.

'Hurry,' she says through gritted teeth. 'There's a first aid bag behind the counter...'

[wait for any key](This scene has lethal consequences. You may wish to save the game by typing >[bold type]save[roman type].) ";

Section 3.3.5.4.2 - Setting the Scene

Rule for writing a paragraph about Doctor Cavala during First Aid on Cavala:
	say "Doctor Cavala is lying on the floor in pain.";
	
Instead of examining Doctor Cavala during First Aid on Cavala: [If for some reason we've never examined Doctor Cavala, this bypasses the suspense-killing initial description of her.]
	if the CSOFAOC is:
		-- 1:
			say "She's bleeding heavily.";
		-- 2:
			say "She's bleeding heavily. You need to dress her leg and bandage it.";
		-- 3:
			say "The bandage is compressing the wound nicely, but you still need to raise her leg above chest level to halt the bleeding.";
	
The galvanic cutter is a faraway thing.
The description is "It looks like the doctor kept a souvenir from her volunteering days."
The scent is "You can still detect the faint smell of ozone."
The galvanic cutter has some text called the faraway response. The faraway response is "It's a cutting tool. You shouldn't be touching it without a good reason."
Understand "lightning" or "cutting" or "tool" as the galvanic cutter.

When First Aid on Cavala begins (this is the initialize First Aid on Cavala rule):
	now the galvanic cutter is carried by Doctor Cavala;
	now Doctor Cavala's leg is part of Doctor Cavala;
	now the first aid bag is described;
	now the CSOFAOC is 1.
	
Section 3.3.5.4.3 - Step 1, Get the First Aid Bag

Instead of talking to Doctor Cavala while the CSOFAOC is 1:
	say "[one of]'Doctor--'

'Get the first aid bag!' she hisses.[or]She doesn't look to be in any state to talk.[stopping]"
	
The first aid bag is a closed openable undescribed container in the Clinic. "A first aid bag is behind the counter."
[It has no description because we want to show its contents and nothing else.]

Does the player mean doing something with the first aid bag when First Aid on Cavala is happening: it is very likely.

Instead of inserting something into the first aid bag:
	if the noun is the antiseptic dressing or the noun is the elastic bandage:
		say "You need that right now.";
	otherwise:
		say "That doesn't belong in the first aid bag."
		
Instead of closing the first aid bag while the first aid bag is open and the CSOFAOC < 3, say "No, you still need the first aid bag."
Instead of emptying the first aid bag into when First Aid on Cavala is happening, say "This is not the time to be making a mess."
	
Instead of doing anything with the first aid bag when Cavala's Errands has not ended (this is the block actions on the first aid bag before First Aid on Cavala rule):
	if we are examining the first aid bag:
		say "A bulky cloth bundle. It's behind the presciption counter.";
	otherwise if we are opening or searching the first aid bag:
		say "You check the contents of the first aid bag. Good -- everything is still intact. You close the bag.";
	otherwise:
		say "You shouldn't meddle with the first aid bag. You never know when it might be needed."
		
Instead of doing anything with the first aid bag when First Aid on Cavala has ended (this is the block actions on the first aid bag after First Aid on Cavala rule):
	if we are examining the first aid bag:
		say "A bulky cloth bundle. It's behind the presciption counter.";
	otherwise if we are opening or searching the first aid bag:
		say "You check the contents of the first aid bag. It looks like there are still enough supplies to last a while. You close the bag.";
	otherwise:
		say "You shouldn't meddle with the first aid bag. You never know when it might be needed again."
		
Before examining, searching, or looking under the prescription counter when the CSOFAOC is 1:
	say "There it is.[paragraph break]";
	try taking the first aid bag instead.

Instead of examining, opening, searching, or taking the first aid bag when the CSOFAOC is 1 (this is the getting the first aid bag rule):
	now the first aid bag is carried by the player;
	now the first aid bag is open;
	say "You grab the bag and wrest it open. Inside are a bellows, an aspirator, a stethoscope, a blood pressure gauge, a pair of scissors, a pair of tweezers, a bar of soap, a roll of tape, five vials (containing saline, laudanum, smelling salts, [italic type]aqua vitae[roman type], and tincture-of-resins)--

There. An antiseptic dressing and an elastic bandage.";
	now ambience suppression is true;
	now the CSOFAOC is 2.

Section 3.3.5.4.4 - Step 2, Bandage the Wound

Instead of talking to Doctor Cavala while the CSOFAOC is 2:
	say "[one of]'Just hang on,' you tell the doctor. 'I found a dressing and a bandage. I'm going to try to stop the bleeding...'[or]Never mind talking. You need to bandage the doctor before she bleeds out.[stopping]"

An antiseptic dressing is a key-item in the first aid bag.
The printed name is "dressing".
The description is "You need it to dress Doctor Cavala's leg."
The scent is "The calomel solution is still active."
Understand "calomel" or "solution" or "gauze" as the antiseptic dressing.
Instead of dropping the antiseptic dressing when the antiseptic dressing is carried, say "No. You can't fumble now."
Does the player mean doing something with the antiseptic dressing when First Aid on Cavala is happening: it is very likely.

An elastic bandage is a key-item in the first aid bag.
The printed name is "bandage".
The description is "You need it to bandage Doctor Cavala's leg."
The scent is "It smells a bit musty, but that's the last thing on your mind at the moment."
Understand "bandages" or "fabric" as the elastic bandage.
Instead of dropping the elastic bandage when the antiseptic dressing is carried, say "No. You can't fumble now."
Does the player mean doing something with the elastic bandage when First Aid on Cavala is happening: it is very likely.

Some other first aid supplies are a thing in the first aid bag.
Rule for printing the name of the other first aid supplies when the number of things in the first aid bag is 1: say "first aid supplies".
Instead of doing anything with the other first aid supplies, say "You don't need any of the other things right now."
Understand "bellows" or "aspirator" or "stethoscope" or "pair" or "blood pressure" or "gauge" or "of" or "scissors" or "tweezers" or "bar" or "soap" or "roll" or "tape" or "vial/vials" or "saline" or "laudanum" or "aqua" or "vitae" or "smelling" or "salt/salts" or "tincture-of-resins" or "tincture" or "resin/resins" as the other first aid supplies.

Before tying something to when the CSOFAOC is 2 (this is the convert tying to bandaging during First Aid on Cavala rule):
	if Doctor Cavala is the noun, try bandaging Doctor Cavala with the second noun instead;
	if Doctor Cavala's leg is the noun, try bandaging Doctor Cavala with the second noun instead;
	if Doctor Cavala is the second noun, try bandaging Doctor Cavala with the noun instead;
	if Doctor Cavala's leg is the second noun, try bandaging Doctor Cavala with the noun instead.
	
Before putting something on when the CSOFAOC is 2 and (the second noun is Doctor Cavala or the second noun is Doctor Cavala's leg) (this is the convert putting to bandaging during First Aid on Cavala rule):
	try bandaging Doctor Cavala with the noun instead.

Before bandaging Doctor Cavala with when the CSOFAOC is 2 (this is the bandaging works during First Aid on Cavala rule):
	if the second noun is the antiseptic dressing or the second noun is the elastic bandage:
		let L be a list of things;
		if the antiseptic dressing is not carried:
			try silently taking the antiseptic dressing;
			add the antiseptic dressing to L;
		if the elastic bandage is not carried:
			try silently taking the elastic bandage;
			add the elastic bandage to L;
		say "(first taking [L with definite articles])[command clarification break]";
		dress and bandage Doctor Cavala's leg;
		stop the action;
	otherwise:
		say "You need a dressing and a bandage."

First every turn when the CSOFAOC is 2 (this is the automatically bandage Doctor Cavala when materials are gathered rule):
	if the player carries the antiseptic dressing and the player carries the elastic bandage:
		dress and bandage Doctor Cavala's leg.

To dress and bandage Doctor Cavala's leg:
	now the antiseptic dressing is nowhere;
	now the elastic bandage is nowhere;
	say "'There's no debris.' Doctor Cavala's voice is shaking. 'Remember. Apply pressure--'

She cries out as the dressing touches her wound. You force yourself to ignore her gasps, press down hard, loop the bandage tight. And natron sigils flare on the fabric: the wound is sealed.

'Not... not bad,' she croaks, when she has the voice to speak.

[wait for any key]'Can you move?' you ask.

[wait for any key]Her face twitches.

'Primes, it hurts. I... I think my tendon's gone.'

[wait for any key]'You're still bleeding,' you tell her. 'I need to--'

'--raise my leg above chest level,' she finishes. 'I understand. Do it, Marid. Prop it up on the chair.'";
	now the CSOFAOC is 3;
	now cavala-firstaid-event-timer is 0;
	now Doctor Cavala is wearing the hermetically sealed bandage.

Section 3.3.5.4.5 - Step 3, Raise the Leg

Instead of talking to Doctor Cavala while the CSOFAOC is 3:
	say "[one of]'Are you going to be okay?' you ask.

'I'll manage,' Doctor Cavala replies. 'As soon as you raise my leg so that my circulation doesn't kill me.'[or]Doctor Cavala just glares at you.[stopping]";
	now ambience suppression is true.
	
Does the player mean putting Doctor Cavala on the waiting chairs: it is likely.

Before putting something on the waiting chairs when the CSOFAOC is 3 (this is the convert putting to taking for first aid rule):
	if the noun is Doctor Cavala or the noun is Doctor Cavala's leg:
		try taking Doctor Cavala instead.

Before pushing, pulling, or taking Doctor Cavala's leg when the CSOFAOC is 3 (this is the convert injury actions to Doctor Cavala actions for first aid rule):
	try taking Doctor Cavala instead.
	
Before pushing, pulling, or taking Doctor Cavala when the first aid bag is carried and the CSOFAOC is 3 (this is the drop the first aid bag before raising Doctor Cavala's leg for first aid rule):
	say "(first putting down the first aid bag)[command clarification break]";
	try silently dropping the first aid bag;

Instead of pushing, pulling, or taking Doctor Cavala when the CSOFAOC is 3 (this is the raise Doctor Cavala's leg for first aid rule):
	now the first aid bag is undescribed;
	now the first aid bag is closed;
	say "Taken--

Doctor Cavala grits her teeth and screws her eyes shut. Her bloodstained trousers stick to your gloves. Her leg feels heavy and fragile in your hands, like a porcelain model that will shatter if you slip.

Seconds pass before her leg finds its place, before you dare loosen your grip and let go--[paragraph break]";
	wait for any key;
	say "You let go.[paragraph break]";
	wait for any key;
	say "Doctor Cavala breathes a sigh of relief.

You exhale. Something in your expression makes Doctor Cavala chuckle, and her laughter is infectious. The two of you, master and apprentice -- you can't help but start laughing at the terror, the absurdity of the situation.[paragraph break]";
	wait for any key;
	say "'The bleeding's stopped,' you say, wiping your gloves on your apron. 'I... I think.'

'Then we've done the best we could,' Doctor Cavala replies. 'You've done well, Marid. Very well. I'm afraid this evening would have gone rather worse without you--'

She smirks at her own gallows humor, and looks morbidly satisfied.";
	now the CSOFAOC is 4;
	start a dialogue with Doctor Cavala using dialogue cavala-firstaid-denouement.
	
Section 3.3.5.4.6 - Denouement

Table of Cavala First Aid Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
cavala-firstaid-denouement	true	false	""	""	{cavala-firstaid-grin, cavala-firstaid-glad, cavala-firstaid-soworried}
cavala-firstaid-grin	true	true	"<Smile.>"	"A smile touches your lips. Doctor Cavala's eyes meet yours, and you find yourself laughing with her all over again."	{cavala-firstaid-glad, cavala-firstaid-soworried, cavala-firstaid-yousafe}
cavala-firstaid-glad	true	true	"'I'm just glad you're all right, Doctor.'"	"'I'm just glad you're all right, Doctor.'

She smiles and squeezes your hand.

'I look Death in the eyes too often to count,' she says. 'It's only fair that I get to spit in his face once in a while.'"	{cavala-firstaid-grin, cavala-firstaid-soworried, cavala-firstaid-yousafe}
cavala-firstaid-soworried	true	true	"'I was so worried for you...'"	"'I was so worried for you,' you say. 'I thought...'

'I know.' Doctor Cavala's voice is soft. 'I know.'"	{cavala-firstaid-grin, cavala-firstaid-glad, cavala-firstaid-yousafe}
cavala-firstaid-yousafe	true	false	"'Will you be safe here?'"	""	{clinic-interviewer-anecdote, clinic-interviewer-otherdoctors, clinic-interviewer-somethingsmells, clinic-interviewer-silent}

After reading out cavala-firstaid-yousafe:
	say "You glance at the clinic door. The [italic type]Luna[roman type] is ascending, painting the Via Terminalis the colors of moonlight.

'Will you be safe here?'

'I don't think she'll be coming back, if that's what you mean.' She holds up her cutter. 'You may rest assured that I'm a very good shot.'

'But what about your injury?' you ask. 'Are you going to sleep on the floor? What if you need to relieve yourself? I -- I don't know if I'm comfortable leaving you here. Perhaps I should--'[paragraph break]";
	wait for any key;
	now the clinic door is open;
	now Horatio is in the Clinic;
	say "Boots clatter on cobble. Lanterns approach. The clinic door swings open, admitting a bustle of hard-eyed civic guards.[paragraph break]";
	wait for any key;
	say "'Hullo!' the point man says. 'Doctor Cavala.' He salutes. 'The neighbors reported a scream, and we responded as soon as we could. What appears to be the problem?'[paragraph break]";
	wait for any key;
	say "There's something oddly familiar about him...[paragraph break]";
	wait for any key;
	say "'...Horatio?' you say.[paragraph break]";
	wait for any key;
	say "'Marid?' He turns -- it [italic type]is[roman type] him, the buffoon. 'What are you doing here? Is everything alright?'[paragraph break]";
	wait for any key;
	say "'You've arrived with commendable timing,' remarks Doctor Cavala. 'I've just chased a violent hoodlum out of my clinic, and Servator Marid here has seen to my injuries. We were just on the topic of informing the authorities, but it seems that won't be necessary...'[paragraph break]";
	wait for any key;
	center "* * *";
	say paragraph break;
	say line break;
	wait for any key;
	now the conversational partner text is "Talking to the interviewer";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	redraw status line;
	say "It takes the better part of an hour to sort everything out with the Vigiles. You're interviewed by a bored-looking patrolwoman, and given a steaming mug of tea to wash away the foul taste of the evening's events. An agreement is made: Doctor Cavala will remain under official protection for the time being, with Horatio assigned as a personal assistant-cum-bodyguard.[paragraph break]";
	wait for any key;
	say "'...and you're saying you have no idea who the assailant was?' the interviewer is asking. 'Surely you must have made an enemy of [italic type]someone.'[roman type][paragraph break]";
	wait for any key;
	say "'I'm telling you, I [italic type]know[roman type] this district.' Doctor Cavala takes another sip from her drinking straw. 'No one is fool enough to antagonize the only [italic type]pro bono[roman type] doctor in the city. Just ask Marid.'[paragraph break]";
	wait for any key;
	say "The interviewer shoots you an inquiring look.";
	
Some dialogue branches are defined by the Table of Clinic Interviewer Dialogue.
	
Table of Clinic Interviewer Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
clinic-interviewer-silent	true	false	"<Remain silent.>"	"You fidget.

Doctor Cavala sighs.

Well, now [italic type]would[roman type] be a good time to say something..."	{clinic-interviewer-anecdote, clinic-interviewer-otherdoctors, clinic-interviewer-somethingsmells}
clinic-interviewer-anecdote	true	true	"'It's true. I was almost robbed in the Shanty Quarter...'"	"'It's true. I was almost robbed in the Shanty Quarter...'

You describe how you were accosted; how the robbers were terrified once they realized your identity. The interviewer writes furiously in her little black notebook, pursing her lips all the while.

'You see?' Doctor Cavala says. 'Even if I stepped on someone's toes, they wouldn't have the stones to touch me.'

'But clearly,' the interviewer counters, 'someone does.'"	{clinic-interviewer-otherdoctors, clinic-interviewer-somethingsmells}
clinic-interviewer-otherdoctors	true	true	"'Aren't there other doctors operating in the area?'"	"'Aren't there other doctors operating in the area?' you ask.

Doctor Cavala shakes her head. 'Not [italic type]pro bono.[roman type] Arturus and Justinian do good work, but they operate by appointment only. For the less fortunate -- for the less refined elements in the district -- I'm the only physician that can be relied on.'

The interviewer cocks an eyebrow. 'And you provide your services to these... elements?'

'I uphold the oath, madam,' Doctor Cavala replies. 'How I do so is my own business.'"	{clinic-interviewer-anecdote, clinic-interviewer-somethingsmells}
clinic-interviewer-somethingsmells	true	false	"'Something definitely smells about this incident...'"	"'Something definitely smells about this incident. Who would want to attack Doctor Cavala? And why attack now, of all times?'

The doctor falls silent. The interviewer's eyes dart between you.

[wait for any key]It is Doctor Cavala who breaks the silence, with words that prick like pins.

'Do you think it's connected to Reden?' she asks. 'To what happened last night?'

[wait for any key]You hesitate."	{clinic-interviewer-yes, clinic-interviewer-no, clinic-interviewer-maybe, clinic-interviewer-idk}
clinic-interviewer-yes	true	false	"'Yes...'"	"'...Yes, actually. It's been on my mind -- first a man dies in our clinic, and then someone tries to kill you?' You shake your head. 'It can't be a coincidence. It's too close to be.'

'Intriguing.' She searches your eyes. 'You didn't see anything today, did you, Marid? Anything that might provide a clue? What you're suggesting...'

Doctor Cavala doesn't finish her sentence. She takes another sip of tea, looking greatly perturbed.

[clinic-interviewer-end]"	{}
clinic-interviewer-no	true	false	"'No...'"	"'...No,' you say. 'They're two separate events. I can't imagine how they would be connected -- or why anyone would want you dead for it. There must be another reason.'

Doctor Cavala doesn't look convinced. 'Perhaps,' she concedes. 'Perhaps. It's too early to be sure...'

She takes another sip of tea, quiet, pensive.

[clinic-interviewer-end]"	{}
clinic-interviewer-maybe	true	false	"'Maybe...'"	"'...Maybe,' you say. 'It's uncomfortably close. I can't imagine it being a coincidence. But if it isn't -- how could the surgery possibly be connected? Why would anyone want you dead for such a thing?'

Doctor Cavala furrows her brow. 'I certainly hope it's a coincidence,' she says. 'If the alternative is true...'

She doesn't finish her sentence. She takes another sip of tea, looking greatly perturbed.

[clinic-interviewer-end]"	{}
clinic-interviewer-idk	true	false	"'I don't know.'"	"'I... I don't know.'

You look down, and Doctor Cavala sighs.

'You may be right, Marid. There are so many questions -- it's too early to be sure of anything. And yet...'

She trails off. She takes another sip of tea, becoming quiet, pensive.

[clinic-interviewer-end]"	{}

To say clinic-interviewer-end:
	wait for any key;
	say "'Well,' the interviewer finally says. 'This has all been very fascinating -- but the hour is growing late, and we are no closer to discovering any answers. I shall recommend a better equipped team to join you tomorrow, Doctor. Until then--'[paragraph break]";
	wait for any key;
	now the front door of the clinic is closed;
	say "The guards leave the clinic following a perfunctory sending-off. You are left in the company of Doctor Cavala and Horatio, who have settled down in the waiting area for the long haul.[look pending]".

Section 3.3.5.4.7 - First Aid Timed Events

cavala-firstaid-event-timer is a number that varies.

Every turn when First Aid on Cavala is happening (this is the First Aid on Cavala timed events rule):
	increment cavala-firstaid-event-timer;
	if the CSOFAOC < 3:
		if cavala-firstaid-event-timer is:
			-- 3:
				if ambience suppression is false, say "Doctor Cavala's breathing is getting faster.";
			-- 5:
				if ambience suppression is false, say "Doctor Cavala is starting to look very pale. 'Hurry,' she whispers.";
			-- 7:
				if ambience suppression is false, say "Doctor Cavala is on the verge of passing out.";
			-- 9:
				if ambience suppression is false:
					knock Doctor Cavala off this fragile mortal coil;
	otherwise if the CSOFAOC is 3:
		if cavala-firstaid-event-timer is:
			-- 3:
				if ambience suppression is false, say "'It's not going to hurt any less if you dilly-dally,' Doctor Cavala says.";
			-- 5:
				if ambience suppression is false, say "'I'm bleeding out here,' Doctor Cavala breathes. 'Come on, Marid.'";
			-- 7:
				if ambience suppression is false, say "Doctor Cavala is very quiet. She looks faint.";
			-- 9:
				if ambience suppression is false:
					knock Doctor Cavala off this fragile mortal coil;
	otherwise:
		now ambience suppression is false.

To knock Doctor Cavala off this fragile mortal coil:
	say "You realize that Doctor Cavala's eyes have closed.[paragraph break]";
	wait for any key;
	say "When you try to rouse her, she doesn't wake.[paragraph break]";
	wait for any key;
	say "She never will.[paragraph break]";
	wait for any key;
	end the story saying "You have failed";

Section 3.3.5.4.8 - What Not to Do during Life-and-Death First Aid

Instead of examining the player during First Aid on Cavala, say "You're fine. Doctor Cavala, on the other hand..."
Instead of entering the waiting chairs during First Aid on Cavala, say "This is no time to sit down."
Instead of entering Doctor Cavala's armchair during First Aid on Cavala, say "This is no time to sit down."
Instead of going during First Aid on Cavala, say "You can't leave Doctor Cavala, not now."

Chapter 3.3.5.5 - Clinic during Walking Home in Fear

Section 3.3.5.5.1 - Makeshift Bed

The makeshift bed is a scenery supporter.
The description is "Some of the waiting chairs have been furnished with cushions."
The scent is "The bed smells fresh. Horatio must be replacing the cushions every now and then."
Understand "cushion/cushions" as the makeshift bed.
Instead of entering the makeshift bed, say "There's no room beside Doctor Cavala."
Instead of looking under the makeshift bed, say "It's just the waiting chairs underneath."
Instead of putting something on the makeshift bed, say "There's no room beside Doctor Cavala."
Instead of searching the makeshift bed, say "Doctor Cavala is on the makeshift bed."
Instead of taking the makeshift bed, say "Now isn't the best time to dismantle Doctor Cavala's bed."
Instead of knocking on, rubbing, or touching the makeshift bed: say "You poke at the cushions[first time].[paragraph break]'Really?' Doctor Cavala says[only]."

When Walking Home in Fear begins (this is the spawn the makeshift bed rule):
	now the makeshift bed is in the Clinic.

Section 3.3.5.5.2 - Doctor Cavala and Horatio

whf-goodnight-quips is a number that varies.
[0: Yawn.
1: Marid has not said goodbye yet. Next quip is "I should be going..."
2: Marid has said goodbye but not left the clinic.
3: Marid has left the clinic but not reentered. Next quip is "Back again?"
4: Marid has reentered the clinic but not left again. If she talks to Horatio and Cavala, she gets special dialogue.
5: Marid has read special dialogue or left the clinic again. No more dialogue.]

Rule for writing a paragraph about Doctor Cavala during Walking Home in Fear:
	if whf-goodnight-quips is 3:
		say "'Back again?' Doctor Cavala quips.

'Just wondering about something,' you reply.

'Don't worry about her, Doctor,' Horatio says. 'Marid is like that sometimes.'";
		now whf-goodnight-quips is 4;
	otherwise:
		say "Doctor Cavala is recuperating in a makeshift bed, with Horatio keeping watch nearby.";
		if whf-goodnight-quips is 0:
			say line break;
			say "You catch yourself yawning. Is it night already? You should get back home before it's too dark out.";
			now whf-goodnight-quips is 1.

Before going to the West End when Walking Home in Fear is happening:
	if whf-goodnight-quips < 3:
		if whf-goodnight-quips is 1, say "'I should be going too,' you say. 'I'll see you tomorrow.'

'Good night, Marid.'

'G'night, Marid.'

'Good night, Doctor, Horatio.'";
		now whf-goodnight-quips is 3;
	otherwise if whf-goodnight-quips is 4:
		now whf-goodnight-quips is 5.

Section 3.3.5.5.3 - Cavala-Horatio Dialogue
	
Some dialogue branches are defined by the Table of Cavala-Horatio WHF Dialogue.

Table of Cavala-Horatio WHF Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
cavalahoratio-whf	true	false	""	"[if whf-goodnight-quips is 4]'I am [italic type]not.'[roman type]

'You are [italic type]too.'[roman type]

'Am not!'

'Are too!'

'Cut that out,' Doctor Cavala says wearily, 'or I'll bodily cart both of you out of my clinic.'

'Sorry,' Horatio mumbles.[otherwise]You approach the makeshift bed, and Doctor Cavala and Horatio turn to you."	{cavalahoratio-whf-speakcavala, cavalahoratio-whf-speakhoratio, cavalahoratio-whf-goodbye}
cavalahoratio-whf-speakcavala	true	false	"<Speak to Doctor Cavala...>"	""	{cavalahoratio-whf-feelingbetter, cavalahoratio-whf-aboutclinic, cavalahoratio-whf-abouthoratio, cavalahoratio-whf-speakhoratio, cavalahoratio-whf-goodbye}
cavalahoratio-whf-speakhoratio	true	false	"<Speak to Horatio...>"	""	{cavalahoratio-whf-fancy, cavalahoratio-whf-howdoing, cavalahoratio-whf-nomess, cavalahoratio-whf-speakcavala, cavalahoratio-whf-goodbye}
cavalahoratio-whf-feelingbetter	true	true	"'Are you feeling better, Doctor?'"	"'Are you feeling better, Doctor?'

The corner of her lip quirks. 'I'm feeling rather well,' she says, 'considering the circumstances. But I do hope to be looked at by a surgeon soon. The Vigiles have already sent for Doctor Arturus, but you know how careless he can be when it comes to these things... Did you know he hasn't replied to my correspondence [italic type]at all[roman type] today?'

You feel a twinge of sympathy for Doctor Arturus. Doctor Cavala takes a dim view of tardiness, as you know from experience."	{cavalahoratio-whf-aboutclinic, cavalahoratio-whf-abouthoratio, cavalahoratio-whf-speakhoratio, cavalahoratio-whf-goodbye}
cavalahoratio-whf-aboutclinic	true	true	"'What will happen with the clinic while you're indisposed?'"	"'What will happen with the clinic while you're indisposed?' you ask.

Doctor Cavala lifts a hand. 'I'm obviously not in any condition to operate,' she says wryly. 'But I'm not [italic type]completely[roman type] indisposed. I can still listen to patients. Diagnose illnesses. The clinic will remain open for business, I think, until the time comes for my knee operation.'

'I'll help Doctor Cavala where I can,' Horatio adds. 'Since I'll be here and all.'"	{cavalahoratio-whf-feelingbetter, cavalahoratio-whf-abouthoratio, cavalahoratio-whf-speakhoratio, cavalahoratio-whf-goodbye}
cavalahoratio-whf-abouthoratio	true	true	"'How is Horatio doing?'"	"'How is Horatio doing?'

'Your friend, isn't he?' Doctor Cavala raises an eyebrow. 'He hasn't broken anything, so I suppose that's a plus--'

'--Hey!--'

'--but he's a good lad.' She smiles. 'Eager to learn, and not afraid of hands-on work. I expect we'll get on swimmingly.'"	{cavalahoratio-whf-feelingbetter, cavalahoratio-whf-aboutclinic, cavalahoratio-whf-speakhoratio, cavalahoratio-whf-goodbye}
cavalahoratio-whf-fancy	true	true	"'Fancy seeing you here, Horatio.'"	"'Fancy seeing you here, Horatio.'

'It's good to see you too, Marid.' His expression grows grave for a moment. 'When the call came in, I thought... I was worried about you. Now that I'm here, I'm -- I'm just glad you're okay.'

You can't help but smile. Even a buffoon like him can be sweet sometimes."	{cavalahoratio-whf-howdoing, cavalahoratio-whf-nomess, cavalahoratio-whf-speakcavala, cavalahoratio-whf-goodbye}
cavalahoratio-whf-howdoing	true	true	"'How are you doing?...'"	"'How are you doing?' you ask Horatio. 'I recall you saying you wanted to see some [italic type]action[roman type] in the Vigiles...'

He chuckles. 'I guess I'm eating my words now. Tonight was a lot more than I'd hoped for. Still--' He nods. 'I feel like I'm making a difference here, like I'm doing something worthwhile. How often does anyone get the chance to say that?'"	{cavalahoratio-whf-fancy, cavalahoratio-whf-nomess, cavalahoratio-whf-speakcavala, cavalahoratio-whf-goodbye}
cavalahoratio-whf-nomess	true	true	"'Try not to mess anything up.'"	"You punch Horatio's shoulder. 'Try not to mess anything up.'

He grins. 'I won't.'"	{cavalahoratio-whf-fancy, cavalahoratio-whf-howdoing, cavalahoratio-whf-speakcavala, cavalahoratio-whf-goodbye}
cavalahoratio-whf-goodbye	true	false	"'I should be going[if whf-goodnight-quips is 1]..[no line break][end if].'"	"'I should be going,' you say.[if whf-goodnight-quips is 1] 'I'll see you tomorrow.'[end if]

'Good night, Marid.'

'G'night, Marid[if whf-goodnight-quips is 1].'

'Good night, Doctor, Horatio[end if].'"	{}
	
When Walking Home in Fear begins (this is the initialize Clinic dialogue for Walking Home in Fear rule):
	now the home dialogue branch of Doctor Cavala is cavalahoratio-whf;
	now the home dialogue branch of Horatio is cavalahoratio-whf.
	
After reading out cavalahoratio-whf:
	if whf-goodnight-quips is 4, now whf-goodnight-quips is 5;
	now the conversational partner text is "Talking to Doctor Cavala and Horatio";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	
After reading out cavalahoratio-whf-speakhoratio:
	now the conversational partner text is "Talking to Horatio";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	if the enabled of cavalahoratio-whf-feelingbetter is false and
	the enabled of cavalahoratio-whf-aboutclinic is false and
	the enabled of cavalahoratio-whf-abouthoratio is false:
		now the enabled of cavalahoratio-whf-speakcavala is false;
		
After reading out cavalahoratio-whf-speakcavala:
	now the conversational partner text is "Talking to Doctor Cavala";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	if the enabled of cavalahoratio-whf-fancy is false and
	the enabled of cavalahoratio-whf-howdoing is false and
	the enabled of cavalahoratio-whf-nomess is false:
		now the enabled of cavalahoratio-whf-speakhoratio is false;
	
After reading out cavalahoratio-whf-goodbye:
	if the enabled of cavalahoratio-whf-feelingbetter is false and
	the enabled of cavalahoratio-whf-aboutclinic is false and
	the enabled of cavalahoratio-whf-abouthoratio is false:
		now the enabled of cavalahoratio-whf-speakcavala is false;
	if the enabled of cavalahoratio-whf-fancy is false and
	the enabled of cavalahoratio-whf-howdoing is false and
	the enabled of cavalahoratio-whf-nomess is false:
		now the enabled of cavalahoratio-whf-speakhoratio is false;
	if whf-goodnight-quips is 1, now whf-goodnight-quips is 2.
	
Instead of talking to when Walking Home in Fear is happening (this is the no more Cavala-Horatio WHF dialogue rule):
	if the noun is Doctor Cavala or the noun is Horatio:
		if the enabled of cavalahoratio-whf-speakcavala is false and the enabled of cavalahoratio-whf-speakhoratio is false:
			if whf-goodnight-quips is 4:
				say "'I am [italic type]not.'[roman type]

'You are [italic type]too.'[roman type]

'Am not!'

'Are too!'

'Cut that out,' Doctor Cavala says wearily, 'or I'll bodily cart both of you out of my clinic.'

'Sorry,' Horatio mumbles.";
				now whf-goodnight-quips is 5;
			otherwise:
				say "[one of]'Don't let us keep you,' Doctor Cavala says. 'You should return home before it gets dark.'[or]That's enough conversation for now. You really should be going.[stopping]";
			stop the action;
	continue the action.
	
Part 3.3.6 - Clinic during Day Two

Chapter 3.3.6.1 - Clinic during Bad News from Cavala

Section 3.3.6.1.1 - Bad News from Cavala Cutscene

Last after going to the Clinic when Bad News from Cavala is happening (this is the Bad News from Cavala cutscene rule):
	say "[path-walked so far][line break][bold type]Clinic[roman type][line break]";
	say "Doctor Cavala and Horatio have been busy this morning. You spy fresh cups of tea beside the makeshift bed, and plates with crumbs that Horatio is in the process of tidying. Doctor Cavala, for her part, looks up from a newspaper as you enter.[paragraph break]";
	say "'Marid. Has Horatio told you what's happened?'[paragraph break]";
	wait for any key;
	if the enabled of horatio-d2msg-bethere is true:
		say "'More deaths?'[paragraph break]";
	otherwise:
		say "'Not yet,' you say.[paragraph break]";
	say "She passes the newspaper to you. 'Take a look at this.'[paragraph break]";
	wait for any key;
	say "[italic type]DOCTOR FOUND DEAD IN HIS OWN HOME. Doctor Arturus, the renowned pathologist of the Channelworks District, was found dead this morning. Black blood was observed running from his eyes and mouth, a symptom shared by several patients he had recently received. Doctor Justinian, who discovered the body, expressed fears that his colleague's death could mark the beginning of a dangerous epidemic--[roman type][paragraph break]";
	wait for any key;
	say "A chill grips your spine.[paragraph break]";
	wait for any key;
	say "Doctor Cavala nods grimly. 'Our suspicions have proven true. Reden is the first of many. More than that -- Doctor Arturus himself is among the casualties.'";
	start a dialogue with Doctor Cavala using dialogue cavala-badnews-home.
	
Section 3.3.6.1.2 - Cavala's Bad News Dialogue
		
Some dialogue branches are defined by the Table of Cavala's Bad News Dialogue.

Table of Cavala's Bad News Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
cavala-badnews-home	true	false	""	""	{cavala-badnews-swear, cavala-badnews-howhappen, cavala-badnews-whatdo}
cavala-badnews-swear	true	true	"'Oh Primes.'"	"'Oh Primes.'

'I know.' Her eyes are hard. 'This week just keeps getting worse.'"	{cavala-badnews-howhappen, cavala-badnews-whatdo}
cavala-badnews-howhappen	true	true	"'How could this have happened?'"	"'How could this have happened?'

She shakes her head. 'Very easily. It is unlikely for a medical practitioner to contract a patient's disease -- not with the proper safeguards in place -- but not inconceivable. And Doctor Arturus... oh, the bloody fool. He should have known better...'"	{cavala-badnews-swear, cavala-badnews-whatdo}
cavala-badnews-whatdo	true	false	"'What do we do now?'"	"'What do we do now?'

'That, Marid, is a very good question.'

Doctor Cavala folds her arms. Her expression seethes with disquiet, with the agitation of an invalid accustomed to physical activity.

'Recent events have backed us into a corner,' she says. 'I can't do much of anything, on account of my injury. Horatio's hands are full with matters around the clinic. That leaves only one person to look into the situation--'

[wait for any key]'Myself,' you say.

[wait for any key]'Exactly.' She snaps her fingers. 'Before we can combat the disease, we need data -- data that can only be gathered through firsthand observation. You've proven yourself to be dependable and resourceful. You have enough medical expertise to make informed judgments. It will have to be you who investigates this series of deaths.'

[wait for any key]You consider her words carefully."	{cavala-badnews-whyme, cavala-badnews-wheretostart, cavala-badnews-whattofind, cavala-badnews-aboutarturus, cavala-badnews-aboutjustinian, cavala-badnews-onit}
cavala-badnews-whyme	true	false	"'Does it [roman type]have[italic type] to be me?'"	"'Does it [italic type]have[roman type] to be me?'

She gives you a withering look.

You sigh. 'Yes, Doctor.'"	{cavala-badnews-wheretostart, cavala-badnews-whattofind, cavala-badnews-aboutarturus, cavala-badnews-aboutjustinian, cavala-badnews-onit}
cavala-badnews-wheretostart	true	true	"'Where should I begin?'"	"'Where should I begin?' you ask.

'You could begin by examining the bodies,' Doctor Cavala says. 'He'll be in his clinic -- I suppose it's Doctor Justinian's clinic now. Talk to Doctor Justinian about it, and check his patient records for possible contagion vectors between the deceased.

'It might also be worth asking Zoiro about his brother's associations. See if you can find any correlation between the patients so far. With any luck, we'll uncover the source of the outbreak.'"	{cavala-badnews-whattofind, cavala-badnews-aboutarturus, cavala-badnews-aboutjustinian, cavala-badnews-onit}
cavala-badnews-whattofind	true	true	"'What should I look out for?'"	"'What should I look out for?'

'Our goal is to combat the disease,' Doctor Cavala replies. 'We need to determine the means by which it is transmitted -- whether it is endemic to a particular area, or spread by contact, or something else entirely. Once the transmission method is determined, we can take measures to isolate the disease and find a cure.'"	{cavala-badnews-wheretostart, cavala-badnews-aboutarturus, cavala-badnews-aboutjustinian, cavala-badnews-onit}
cavala-badnews-aboutarturus	true	true	"'Can you tell me anything about Doctor Arturus?'"	"'Can you tell me anything about Doctor Arturus?'

She sighs. 'Not much, I'm afraid. Doctor Arturus was from before my time. I'm familiar with his corpus of work, of course -- even met him once or twice, in a professional capacity -- but he was a reclusive man, and rarely involved in everyday affairs.

'Try asking Doctor Justinian instead. He's had more contact with the man than anyone else.'"	{cavala-badnews-wheretostart, cavala-badnews-whattofind, cavala-badnews-aboutjustinian, cavala-badnews-onit}
cavala-badnews-aboutjustinian	true	true	"'Do you think Doctor Justinian can help?'"	"'Do you think Doctor Justinian can help?' you ask.

Doctor Cavala nods. 'He likely can. At minimum, he can give you a better picture of the events that led to Doctor Arturus's death. Beyond that, he's now the only other qualified doctor in the district. He'll be a useful ally if we are to contain the disease.'"	{cavala-badnews-wheretostart, cavala-badnews-whattofind, cavala-badnews-aboutarturus, cavala-badnews-onit}
cavala-badnews-onit	true	false	"'I'm on it, Doctor.'"	"[cavala-badnews-onit-text]"	{}

To say cavala-badnews-onit-text:
	say "'I'm on it, Doctor.'[paragraph break]";
	say "She nods. 'Remember: talk to Doctor Justinian in the Turris Infinita. Investigate all the deaths that have occurred so far. If you find a connection, we can isolate the transmission vector and quarantine the disease.'[paragraph break]";
	wait for any key;
	say "'Got it.'[paragraph break]";
	say "She holds up a hand. 'Before you go, I have a couple of things to give you. First -- Horatio, would you fetch me a pen?'[paragraph break]";
	wait for any key;
	say "The pen is delivered. Doctor Cavala signs a small piece of paper, then seals it with a sigil-brand and hands it to you.[paragraph break]";
	wait for any key;
	say "'This is my signum,' she says. 'It's proof that you're acting on my behalf, for anyone who asks. And another thing--'[paragraph break]";
	wait for any key;
	say "She has Horatio retrieve a sleek instrument from her desk. It is orichalcum, threaded with tiny magnification lenses, and your eyes widen as he places it in your palm.[paragraph break]";
	wait for any key;
	say "'Yes, Marid.' She smiles wryly. 'Since you'll be dealing with a lot of dead bodies, you can borrow my endoscope for this investigation. Just promise me you'll return it in one piece -- I'd hate to take the cost out of your next paycheck.'[paragraph break]";
	wait for any key;
	say "'I-- I understand, Doctor.'[paragraph break]";
	say "She squeezes your hand. 'Good luck, Marid. I'm counting on you.'[paragraph break]";
	wait for any key;
	say "You step back and put the endoscope in your pocket.[paragraph break]";
	say "(The endoscope can be used to look inside narrow pathways. To use the endoscope, >[bold type]put[roman type] it [bold type]in[roman type] the object you wish to inspect.) ";
	now the day-two copy of the Libri Liberi is carried by the player;
	now Doctor Cavala's signum is carried by the player;
	now the endoscope is carried by the player;
	set pronouns from the endoscope.
	
Section 3.3.6.1.3 - Day-Two Copy of the Libri Liberi

The day-two copy of the Libri Liberi is a proper-named thing.
The printed name is "[if the current day is Day Two]today's[otherwise if the current day is Day Three]yesterday's[otherwise if Day Three has ended]Fifth of Aquaria[end if] copy of the [italic type]Libri Liberi[roman type]".
The description is "[if time is critical]The newspaper can't help you.[otherwise]'DOCTOR FOUND DEAD IN HIS OWN HOME.' Doctor Arturus, the renowned pathologist of the Channelworks District, was found dead this morning. Black blood was observed running from his eyes and mouth, a symptom shared by several patients he had recently received. Doctor Justinian, who discovered the body, expressed fears that his colleague's death could mark the beginning of a dangerous epidemic.".
The scent is "[if the current day is Day Two]The ink is still fresh.[otherwise]It smells of ink."
Understand "newspaper/news/paper" or "headline/headlines" or "article/articles" as the day-two copy of the Libri Liberi.
Understand "today's" or "today" as the day-two copy of the Libri Liberi when the current day is Day Two.
Understand "yesterday's" or "yesterday" as the day-two copy of the Libri Liberi when the current day is Day Three.
Understand "fifth/five/5th/5/v" or "of" or "aquaria" as the day-two copy of the Libri Liberi when Day Three has ended.

Instead of searching the day-two copy of the Libri Liberi, say "[if time is critical]This is not the time.[otherwise]You flip through the newspaper for a while, but there isn't much of interest beyond the main headline."
Instead of eating the day-two copy of the Libri Liberi, say "[if time is critical]This is not the time.[otherwise]While the [italic type]Libri Liberi[roman type] is technically edible, it doesn't strike you as the most appropriate midday snack."

Instead of giving the day-two copy of the Libri Liberi to someone (this is the can't give away the day-two newspaper rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the second noun is a creature:
		say "There is no response.";
	otherwise if the second noun is friendly:
		say "You don't think [the second noun] [are] interested in the news.";
	otherwise:
		say "You don't see what that would accomplish.";
		
Instead of attacking or cutting the day-two copy of the Libri Liberi (this is the destroying the day-two newspaper rule):
	say "You tear up the newspaper.";
	now the day-two copy of the Libri Liberi is nowhere.
	
Instead of dropping the day-two copy of the Libri Liberi (this is the how to drop a day-two newspaper rule):
	if the location is in Outdoors:
		say "The newspaper flutters away in the wind.";
		now the day-two copy of the Libri Liberi is nowhere;
	otherwise if time is critical:
		say "This is not the time.";
	otherwise if the location is not Marid's Room:
		say "You shouldn't leave the newspaper lying around here.";
	otherwise:
		continue the action.
		
Chapter 3.3.6.2 - Clinic during All Quiet on the Western Front

Rule for writing a paragraph about Doctor Cavala during All Quiet on the Western Front:
	if A Crucible Game is happening:
		say "Doctor Cavala and Horatio are playing a game of crucible.";
	otherwise:
		say "Doctor Cavala is recuperating in a makeshift bed, with Horatio keeping watch nearby.";
	
Section 3.3.6.2.1 - Cavala Dialogue

When All Quiet on the Western Front begins (this is the initialize Cavala 4inv dialogue rule):
	now the home dialogue branch of Doctor Cavala is cavala-4inv-home.
	
Some dialogue branches are defined by the Table of Cavala 4inv Dialogue.

Table of Cavala 4inv Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
cavala-4inv-home	true	false	""	"You approach Doctor Cavala, and she looks up [if A Crucible Game is happening]from her cards[otherwise]at you[end if].

'Yes, Marid?'"	{cavala-4inv-wherebeginagain, cavala-4inv-whatlookagain, cavala-4inv-redeninfo, cavala-4inv-raven, cavala-4inv-crucible, cavala-4inv-nevermind}
cavala-4inv-wherebeginagain	true	false	"'[if The Game is Afoot has ended]Where should I investigate[otherwise]Where should I begin my investigation[end if], again?'"	"'[if The Game is Afoot has ended]Where should I investigate[otherwise]Where should I begin my investigation[end if], again?'

'Go to Doctor Arturus's clinic,' she says. 'The doctor's body will be there, along with the bodies of his patients. Talk to Doctor Justinian and see if you can find any connection between the deceased.

'It might also be worth asking Zoiro about his brother's associations. There may be a lead on the source of the affliction we've missed.'"	{cavala-4inv-whatlookagain, cavala-4inv-redeninfo, cavala-4inv-raven, cavala-4inv-crucible, cavala-4inv-goodbye}
cavala-4inv-whatlookagain	true	false	"'What should I look out for, again?'"	"'What should I look out for, again?'

'Find out how the disease is transmitted,' she replies. 'Once we've determined how it spreads, we can isolate it and begin work on a cure.'"	{cavala-4inv-wherebeginagain, cavala-4inv-redeninfo, cavala-4inv-raven, cavala-4inv-crucible, cavala-4inv-goodbye}
cavala-4inv-redeninfo	true	true	"'By the way, did you learn anything from Reden's autopsy?'"	"'By the way, did you learn anything from Reden's autopsy?'

Doctor Cavala shrugs. 'Little that we did not already know. The disease is in the blood, certainly -- it spreads through the circulatory system, attacking the brain, heart, lungs, and other vital organs -- but Reden's death was both violent and degenerative, obfuscating the means of transmission. My hope is that Doctor Arturus and his patients will shed more light on how the disease operates.'"	{cavala-4inv-wherebeginagain, cavala-4inv-whatlookagain, cavala-4inv-raven, cavala-4inv-crucible, cavala-4inv-goodbye}
cavala-4inv-raven	false	true	"'Does a raven mean anything to you?'"	"'Does a raven mean anything to you?'

'A raven?' She frowns. 'When someone mentions a raven in the Channelworks District, the Greater Corindia Trading Company is usually involved. Don't tell me you've gotten yourself mixed up with them.'

'The... Trading Company?'

'A criminal syndicate,' Doctor Cavala replies. 'One of the oldest and most dangerous. If you believe they have something to do with the source of the outbreak, all I can tell you is -- be careful.'

You make a mental note of the connection."	{cavala-4inv-wherebeginagain, cavala-4inv-whatlookagain, cavala-4inv-crucible, cavala-4inv-goodbye}
cavala-4inv-crucible	false	true	"'Crucible? Really?'"	"'Crucible? Really?'

She raises an eyebrow. 'I'll get to work as soon as you bring me information I can act upon. Until then, it's either crucible or romance novels.'

'...Fair enough.'"	{cavala-4inv-wherebeginagain, cavala-4inv-whatlookagain, cavala-4inv-redeninfo, cavala-4inv-raven, cavala-4inv-goodbye}	
cavala-4inv-nevermind	true	false	"'Nothing, never mind.'"	"'Nothing, never mind.'

Doctor Cavala [if A Crucible Game is happening]returns her attention to the card game[otherwise]waves you off nonchalantly[end if]."	{}
cavala-4inv-goodbye	true	false	"'I'll be back soon.'"	"'I'll be back soon.'

Doctor Cavala nods. 'I'm counting on you, Marid.'

You step back from the makeshift bed."	{}

After reading out cavala-4inv-raven: discover the Trading Company connection.

Section 3.3.6.2.2 - Horatio Dialogue

When All Quiet on the Western Front begins (this is the initialize Horatio 4inv dialogue rule):
	now the home dialogue branch of Horatio is horatio-4inv-home.
	
Some dialogue branches are defined by the Table of Horatio 4inv Dialogue.

Table of Horatio 4inv Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
horatio-4inv-home	true	false	""	"You approach Horatio, and he [if A Crucible Game is happening]puts down his cards and grins[otherwise]grins a little bashfully[end if].

'Hey, Marid,' he says."	{horatio-4inv-sleepwell, horatio-4inv-thoughts, horatio-4inv-raven, horatio-4inv-crucible, horatio-4inv-seeyou}
horatio-4inv-sleepwell	true	true	"'You don't look too good. Did you sleep well last night?'"	"'You don't look too good,' you say. 'Did you sleep well last night?'

'Well... no.' He rubs his eyes. 'I couldn't get any shut-eye in the clinic -- too much calomel in the air. Doctor Cavala slept like a baby, though. I don't know how she does it...'

He sighs and looks you over.

'To be honest,' he says, 'you don't look too good yourself. Your tattoos are all in a jumble. I know the doctor has you running errands for her, but -- just watch yourself out there, all right?'

'I will,' you say. 'I promise.'"	{horatio-4inv-thoughts, horatio-4inv-raven, horatio-4inv-crucible, horatio-4inv-seeyou}
horatio-4inv-thoughts	true	true	"'What do you think of the situation so far?'"	"'What do you think of the situation so far?'

Horatio's jaw hardens, and he looks contemplative.

'I... I don't really know what to think,' he says. 'You and Doctor Cavala have been at this for a lot longer than I have. All I know that people seem to be dropping like flies all of a sudden. Doctor Arturus is dead -- even Doctor Cavala's got a ruined leg. How can we fix the problem when we don't even know what's going on?'"	{horatio-4inv-sleepwell, horatio-4inv-raven, horatio-4inv-crucible, horatio-4inv-seeyou}
horatio-4inv-raven	false	true	"'Does a raven mean anything to you?'"	"'Does a raven mean anything to you?'

Horatio blinks. 'The raven? Now that's an omen if I ever heard one. The Greater Corindia Trading Company uses a raven as its symbol.'

'What's that?'

'It's a criminal syndicate,' he says. 'Rich, powerful, and very dangerous. The Vigiles have been trying to stamp them out for years, but it seems like they control the city at times...'

That can't be good. You make a mental note of the connection."	{horatio-4inv-sleepwell, horatio-4inv-thoughts, horatio-4inv-seeyou}
horatio-4inv-crucible	false	true	"'I didn't know you played crucible.'"	"'I didn't know you played crucible.'

He shrugs. 'I picked it up in the Vigiles. It's a way to pass the time in the late-night watches. Want me to teach you?'

You smile. 'Thanks, but I'm a bit busy right now. Perhaps another time.'"	{horatio-4inv-sleepwell, horatio-4inv-thoughts, horatio-4inv-raven, horatio-4inv-seeyou}
horatio-4inv-seeyou	true	false	"'See you around, Horatio.'"	"'See you around, Horatio.'

'You too, Marid.'

You step back, and Horatio returns to his [if A Crucible Game is happening]card game[otherwise]duties[end if]."	{}

After reading out horatio-4inv-raven: discover the Trading Company connection.

Instead of talking to Horatio when (the home dialogue branch of Horatio is horatio-4inv-home and the enabled of horatio-4inv-sleepwell is false and the enabled of horatio-4inv-thoughts is false and the enabled of horatio-4inv-crucible is false) (this is the no more Horatio 4inv dialogue rule):
	say "You can't think of anything to bring up at the moment."
	
Section 3.3.6.2.3 - Cavala and Horatio Play Crucible

The main crucible timer is a number that varies. The main crucible timer is -1.
[0-1: nothing
2: "Let's play a game of crucible"
3: Horatio deals
4: Turn sequence. Doctor Cavala goes first
5: Someone wins
6: "Again"; goto 2]

The active crucible player is a person that varies. The active crucible player is Doctor Cavala.

Doctor Cavala has a number called trinitates.
Horatio has a number called trinitates.

The crucible deck is a faraway scenery thing.
The description is "Crucible is a gambling card game about matching sets of three. It's a common sight at public houses and social gatherings, but you've never quite gotten the hang of the rules."
The sound is "The cards flick and sift."
The crucible deck has some text called the faraway response. The faraway response is "As much as you'd like to be playing cards with Doctor Cavala and Horatio, you have more pressing concerns at the moment."
Understand "card/cards" or "deck" or "game" or "[a number]" or "ace" or "of" or "discs/staves/cups/swords" or "lead/tin/iron/copper/quicksilver/silver/gold" or "mercury/sulfur/natron/astra/sol/azoth/fool" or "hand/materia/residuum" or "trinitas/trinitates" as the crucible deck.

When A Crucible Game begins (this is the spawn the crucible deck rule):
	now the crucible deck is in the Clinic.

When A Crucible Game ends (this is the despawn the crucible deck rule):
	now the crucible deck is nowhere.
	
After waiting when the location is the Clinic and A Crucible Game is happening:
	say run paragraph on.
	
Every turn when the location is the Clinic and A Crucible Game is happening and journal-crucible-witnessed is false:
	now journal-crucible-witnessed is true.
	
First every turn when All Quiet on the Western Front is happening and ambience suppression is false (this is the Four Investigations crucible game rule):
	if the main crucible timer is not 4, increment the main crucible timer;
	if the main crucible timer is:
		-- 2:
			now the enabled of cavala-4inv-crucible is true;
			now the enabled of horatio-4inv-crucible is true;
		-- 7:
			now the main crucible timer is 3;
	if the location is not the Clinic, make no decision;
	if the main crucible timer is:
		-- 1:
			say "Horatio yawns.";
		-- 2:
			say "'I expect we shall be waiting awhile,' Doctor Cavala observes. 'How about a game of crucible, Horatio?'

'Sure, I guess.'

Horatio produces a pack of cards and sits opposite Doctor Cavala.";
		-- 3:
			say "Horatio deals a[one of][or] new[stopping] hand. [one of]Doctor Cavala picks up her cards and looks at them intently.[or]The players pick up their cards.[or]Doctor Cavala scoops up her cards and fans them out.[in random order]";
			now the active crucible player is Doctor Cavala;
		-- 4:
			choose a random row in the Table of the Crucible Deck;
			let discarded card be the card entry;
			let drawn card source be "materia";
			if a random chance of 1 in 3 succeeds:
				now drawn card source is "residuum";
			let N be 0;
			let catalysis be "none";
			if a random chance of 1 in 3 succeeds:
				if a random chance of 1 in 4 succeeds and the trinitates of the active crucible player > 0:
					now catalysis is "dissolve";
					decrement the trinitates of the active crucible player;
				otherwise:
					now catalysis is "conjoin";
					increment the trinitates of the active crucible player;
			if the trinitates of the active crucible player is 3:
				say "'[discarded card].' [The active crucible player] forms a [italic type]trinitas[roman type] and reveals [their] hand. '[one of]Revelation[or]I win[or]Good game[in random order].'[paragraph break]";
				let the crucible loser be Doctor Cavala;
				if the active crucible player is Doctor Cavala:
					now the crucible loser is Horatio;
				say "[The crucible loser] [one of]groans[or]sighs[or]purses [their] lips[or]grimaces[in random order][one of][or] and sets down [their] cards[or] and forks over the winnings[as decreasingly likely outcomes].";
				now the main crucible timer is 5;
				now the trinitates of Doctor Cavala is 0;
				now the trinitates of Horatio is 0;
			otherwise:
				let crucible callout text order be a random number from 1 to 2; [1 = before the description, 2 = after]
				if crucible callout text order is 1, say "'[discarded card].' ";
				if catalysis is "conjoin":
					say "[The active crucible player] forms a [italic type]trinitas[roman type]. ";
				otherwise if catalysis is "dissolve":
					say "[The active crucible player] dissolves one of [their] [italic type]trinitates[roman type]. ";
				otherwise:
					say "[The active crucible player] [one of]discards a card[or]draws a card from the [italic type][drawn card source][roman type][or]examines [regarding the active crucible player][their] cards[as decreasingly likely outcomes]. ";
				if crucible callout text order is 2, say "'[discarded card].' ";
				say line break;
			if the active crucible player is Doctor Cavala:
				now the active crucible player is Horatio;
			otherwise:
				now the active crucible player is Doctor Cavala;
		-- 6:
			say "'[one of]Another round[or]Shall we play again[or]One more[in random order]?' Doctor Cavala offers.

'[one of]I suppose it wouldn't hurt[or]I don't mind[or]Let's[in random order],' Horatio replies.";

Section 3.3.6.2.4 - Crucible Deck

Table of the Crucible Deck
card
"Ace of Discs"
"Two of Discs"
"Three of Discs"
"Four of Discs"
"Five of Discs"
"Six of Discs"
"Seven of Discs"
"Ace of Staves"
"Two of Staves"
"Three of Staves"
"Four of Staves"
"Five of Staves"
"Six of Staves"
"Seven of Staves"
"Ace of Cups"
"Two of Cups"
"Three of Cups"
"Four of Cups"
"Five of Cups"
"Six of Cups"
"Seven of Cups"
"Ace of Swords"
"Two of Swords"
"Three of Swords"
"Four of Swords"
"Five of Swords"
"Six of Swords"
"Seven of Swords"
"Lead"
"Lead"
"Lead"
"Tin"
"Tin"
"Tin"
"Iron"
"Iron"
"Iron"
"Copper"
"Copper"
"Copper"
"Quicksilver"
"Quicksilver"
"Quicksilver"
"Silver"
"Silver"
"Silver"
"Gold"
"Gold"
"Gold"
"Sulfur"
"Sulfur"
"Sulfur"
"Mercury"
"Mercury"
"Mercury"
"Natron"
"Natron"
"Natron"
"Astra"
"Sol"
"The Azoth"
"The Fool"

Book 3.4 - Mortuary

The Mortuary is a proper-named room. "The odor of tinctured camphor is overwhelming in this gloomy subterranean chamber. Shelves along the walls house organs in jars of formaldehyde. Deeper in, cadavers are organized in labeled niches, embalmed and awaiting cremation.

A flight of stairs leads back up to the clinic."

The scent is "The smell of embalming fluid blankets everything here."
The exit reminder is "The only way out is back upstairs, to the clinic proper."

The simple-name is "the mortuary".
Before examining up in the Mortuary, try examining the stairs to the mortuary instead.
Before examining outside in the Mortuary, try examining the stairs to the mortuary instead.
Before going outside in the Mortuary, try going up instead.

Part 3.4.1 - Stairs to the Mortuary

Some stairs to the mortuary are an open unopenable scenery door. They are below the Clinic and above the Mortuary.
The description is "[if the player is in the Clinic]The stairs lead into darkness.[otherwise]Light streams down the stairs."
Understand "exit" as the stairs to the mortuary when the location is the Mortuary.

After going through the mortuary stairs while the player is staid: say "[if the previous location is the Clinic]You descend the steps into shadow...[paragraph break][otherwise]You emerge from the darkness of the mortuary...[paragraph break]"; continue the action.

Before putting something on the stairs to the mortuary, try dropping the noun instead.
Instead of smelling the stairs to the mortuary in the Clinic, say "The smell of embalming fluid is faint, but distinctive."

Part 3.4.2 - Scenery

The odor of tinctured camphor is scenery in the Mortuary.
Understand "embalming" or "fluid" as the odor of tinctured camphor.
Before examining or smelling the odor of tinctured camphor, try smelling the location instead.
Instead of doing anything other than examining or smelling to the odor of tinctured camphor, say "You can only smell it."

Some shelves of organs are a scenery supporter in the Mortuary.
The description is "Each jar is meticulously labeled with names and dates."
Understand "organ" or "shelf" or "jar/jars" or "formaldehyde" or "eyeball/eyeballs" or "kidney/kidneys" or "liver/livers" or "name/names" or "date/dates" as the shelves of organs.
Instead of entering the shelves of organs, say "The shelves wouldn't support your weight."
Instead of searching the shelves of organs, say "There are twenty or thirty jars here. They contain eyeballs, kidneys, livers, and so on."
Instead of taking the shelves of organs, say "You can't imagine how that would be useful."
Instead of putting something on the shelves of organs, say "Doctor Cavala would be quite annoyed to find your things mixed in with the jars."
Instead of opening the shelves of organs, say "Formaldehyde is quite toxic. You shouldn't expose yourself to more than you have to."
Instead of removing something from the shelves of organs, say "You can't imagine how that would be useful."

The mortuary slab is a scenery supporter in the Mortuary.
Instead of examining the mortuary slab, say "It's a dais for cadavers to be laid on[if Reden's Autopsy is happening]. Reden's body and organs are presently occupying it[end if]."
Instead of entering the mortuary slab, say "[if Reden's Autopsy is happening]You shouldn't disturb Doctor Cavala while she's performing the autopsy.[otherwise]There's no need for that."
Instead of putting something on the mortuary slab when Reden's Autopsy is happening, say "Reden's body is already occupying the slab."

Some labeled niches are a scenery container in the Mortuary.
Understand "niche" as the labeled niches.
Instead of entering the labeled niches, say "You aren't dead yet, Marid."
Instead of examining the labeled niches, say "For each niche, a body."
Instead of inserting something into the labeled niches, say "The niches are reserved for cadavers."

Some embalmed cadavers are a dead mixed-race person in the labeled niches.
The description is "You feel a chill when you look at them."
Instead of searching the cadavers, say "All of the cadavers have been stripped of clothing and personal effects."
Instead of pulling or taking the cadavers, say "You can't imagine why you would want to do that."

Part 3.4.3 - Mortuary during Day One

[Day One begins when Reden is moved to the mortuary slab, so we don't have to specify that here.]

Instead of going from the Mortuary during Nine to Five Zombie, say "You should talk to Doctor Cavala to let her know you're here."

Chapter 3.4.3.1 - Reden and his Organs

Instead of cutting Reden during Reden's Autopsy, say "You should leave the autopsy to Doctor Cavala."
Instead of knocking on, pushing, pulling, rubbing, squeezing, taking, touching, or turning Reden during Reden's Autopsy, say "Not in the middle of an autopsy."

Reden's-organs are a plural-named privately-named scenery thing on the mortuary slab. The printed name is "Reden's organs".
The description is "Reden's organs are black and withered. You might have suspected poor embalming technique if it hadn't been Doctor Cavala performing the dissection."
Understand "Reden's" or "organ/organs" or "heart" or "lungs" or "trachea" or "respiratory" or "system" as Reden's-organs.
Instead of cutting Reden's-organs, say "You should leave the autopsy to Doctor Cavala."
Instead of eating Reden's-organs, say "Diseased organs are not food, Marid."
Instead of knocking on, pushing, pulling, rubbing, squeezing, taking, touching, turning, or waving Reden's-organs, say "You shouldn't handle the organs carelessly."

When Reden's Autopsy begins (this is the shift Reden's organs for Reden's Autopsy rule):
	now Reden's-organs are on the mortuary slab.
	
When Reden's Autopsy ends (this is the despawn Reden rule):
	now Reden is nowhere;
	now Reden's-organs are nowhere.

Chapter 3.4.3.2 - Cavala during Reden's Autopsy
	
Rule for writing a paragraph about Doctor Cavala during Reden's Autopsy:
	say "Doctor Cavala is here studying Reden's body with a loupe. His heart, lungs, and trachea are neatly laid out beside him on the slab.";
	now Reden is mentioned.
	
Instead of kissing, knocking on, pushing, pulling, rubbing, squeezing, taking, touching, or turning Doctor Cavala during Reden's Autopsy, say "She wouldn't like to be disturbed in the middle of an autopsy. Talking to her will be enough to get her attention."

The surgical loupe is a wearable thing.
The description is "A special adjustable lens, capable of a high degree of tunnel magnification."
Understand "special" or "adjustable" or "lens" as the surgical loupe.
Before searching the surgical loupe, say "It's difficult to look through the loupe without wearing it." instead.

When Reden's Autopsy begins (this is the initialize Doctor Cavala for Reden's Autopsy rule):
	now Doctor Cavala is in the Mortuary;
	now Doctor Cavala is wearing the surgical loupe;
	now the home dialogue branch of Doctor Cavala is cavala-errands.
	
When Reden's Autopsy ends (this is the despawn the surgical loupe when Reden's Autopsy ends rule):
	now the surgical loupe is nowhere.

Section 3.4.3.2.1 - Cavala's Errands Dialogue

Some dialogue branches are defined by the Table of Cavala's Errands Dialogue.

Table of Cavala's Errands Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
cavala-errands	true	false	""	"[if the location is the Mortuary]You cough politely. 'Good morning, Doctor.'

'Hmm? Oh.' Doctor Cavala pushes up her loupe and acknowledges you with a nod. [otherwise]You ring the handbell. 'Coming!' you hear Doctor Cavala say from downstairs.

There's a clink followed by footsteps, and she emerges from the mortuary with black-stained gloves. Her eyes flicker over you.

[end if]'Good morning, Marid. I trust you had a good night's sleep?'"	 {cavala-errands-goodsleep, cavala-errands-nightmare, cavala-errands-rathernot}
cavala-errands-goodsleep	true	false	"'Um. Yes.'"	"'Um. Yes.'

She sighs. 'You're a terrible liar, Marid.'

You redden. 

[wait for any key]Doctor Cavala [if the location is the Mortuary]gets to her feet, [end if]wipes off her gloves[if the location is the Mortuary],[end if] and places her hand on your shoulder. 

'Don't worry,' she says, more gently. 'It's not an easy thing to go through. I remember the first time I lost a patient. [cavala-errands-introtext]"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-nightmare	true	false	"'I had a terrible nightmare...'"	"'I had a terrible nightmare,' you confide. 'I... I saw him die over and over. I saw the flames again.'

Doctor Cavala sighs. She [if the location is the Mortuary]gets to her feet, [end if]wipes off her gloves, places her hand on your shoulder.

[wait for any key]'I'm sorry,' she says. 'It's not an easy thing to have gone through -- to have witnessed. Wounds like yours take a long time to heal. [cavala-errands-introtext]"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-rathernot	true	false	"'I'd rather not talk about it.'"	"You look down. 'I'd rather not talk about it.'

Doctor Cavala sighs. She [if the location is the Mortuary]gets to her feet, [end if]wipes off her gloves[if the location is the Mortuary],[end if] and places her hand on your shoulder.

'It's not an easy thing to go through,' she says. 'I remember the first time I lost a patient. [cavala-errands-introtext]"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}

To say cavala-errands-introtext:
	say "But I promise it will get better.'[paragraph break]";
	wait for any key;
	say "You shake your head. 'I'll... I'll be fine, Doctor. Don't worry about me.'

After a pause, she nods and squeezes your shoulder. 'Good girl.'[paragraph break]";
	wait for any key;
	say "Then Doctor Cavala steps back, and her businesslike demeanor returns.[paragraph break]";
	wait for any key;
	say "'The order of business today is twofold,' she begins. 'As we are expecting few patients today, you aren't required to be in attendance at the counter. Instead, I need you to run an errand for me.'[paragraph break]";
	wait for any key;
	say "'What sort of errand?' you ask.[paragraph break]";
	say "She purses her lips. 'First, I need you to deliver the documentation of Reden's death to the basilica. Second, I need you to inform Reden's next of kin that he has passed away.' "

Table of Cavala's Errands Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
cavala-errands-documents	true	true	"'What's the procedure for delivering the documentation?'"	"'What's the procedure for delivering the documentation?'

'It's quite straightforward.' Doctor Cavala shows you a sheaf of papers. 'I've already bundled the documents and sent word to the basilica by correspondence. All you have to do is pass the bundle to the censor's office.'

You rack your memory. 'The basilica is next to the forum, right? Across the Via Terminalis bridge?'

'Correct.'"	 {cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-nextofkin	true	true	"'Where does Reden's next of kin live?'"	"'Where does Reden's next of kin live?' you ask.

Doctor Cavala frowns. 'According to my file, he has a brother in Riggertown by the name of Zoiro, but I don't have an address for you. Your best bet is to look up his name in the census records. Or you could ask around in Riggertown -- I understand the goblin community is quite tightly knit.'

'Is Riggertown that shanty town down the canal?'

'It is. Turn right at the bridge and you'll see it.' She pauses. 'And another thing -- check whether anyone in Riggertown is exhibiting similar symptoms. The cause of the affliction has yet to be determined.'"	 {cavala-errands-documents, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-youdoing	true	true	"'What will you be doing?'"	"'What will you be doing?' you ask.

Doctor Cavala inclines her head at the [if the location is the Mortuary]slab[otherwise]stairs to the mortuary[end if]. 'I intend to spend today studying Reden's affliction. It is definitively not in the Alchemical Library. I've already left correspondence for Doctor Arturus, who I expect shall join me in the afternoon; in the meantime, I am compiling post-mortem observations and studying the mechanism by which Reden has died. If all goes well, we should be able to present our findings to the medical community by the end of the week.'"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-onit}
cavala-errands-onit	true	false	"'I'm on it, Doctor.'"	"'I'm on it, Doctor.'

She nods and presses the bundle of documentation into your hands. 'Remember: first, deliver the documents to the basilica; second, look for Zoiro in Riggertown. Report back to me when you're done.'

[wait for any key]'Okay.'

'I'll be [if the location is the Mortuary]here[otherwise]in the mortuary[end if] if you need anything.' She pauses. 'Take your time. Consider today a break after yesterday night.'

[wait for any key]'Yes, Doctor.'

'Run along.'

With that, she [if the location is the Mortuary]sits down at the slab[otherwise]returns to the mortuary[end if].

[wait for any key](Type >[bold type]inventory[roman type] or >[bold type]i[roman type] to see what items you're carrying. Type >[bold type]journal[roman type] or >[bold type]j[roman type] to review your current objectives.)"	 {}

After reading out cavala-errands-onit:
	now the home dialogue branch of Doctor Cavala is cavala-errands2;
	now the player carries the bundle of documents.

Section 3.4.3.2.2 - Cavala's Errands Dialogue Reprise

Some dialogue branches are defined by the Table of Cavala's Errands Dialogue Reprise.

Table of Cavala's Errands Dialogue Reprise
dialogue branch	enabled	one-shot	prompt	description	 choices
cavala-errands2	true	false	""	"[if the location is the Mortuary]Doctor Cavala pushes up her loupe as you approach her.[otherwise]You ring the bell. 'Coming!' Doctor Cavala says.

After a moment, she appears from the mortuary.[end if] 'Yes, Marid?'"	{cavala-errands2-documents, cavala-errands2-nextofkin, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-nevermind}
cavala-errands2-documents	true	false	"'Who do I deliver the documents to again?'"	"'Who do I deliver the documents to again?' you ask.

'Pass them to the censor's office,' she replies. 'The basilica is across the Via Terminalis bridge, next to the grand forum.'"	{cavala-errands2-nextofkin, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-backsoon}
cavala-errands2-nextofkin	true	false	"'Who is Reden's next of kin again?'"	"'Who is Reden's next of kin again?' you ask.

'His name is Zoiro,' she replies. 'Reden's brother. Either get his address from the censor's office, in the basilica; or ask around Riggertown, down the canal from here.'"	{cavala-errands2-documents, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-backsoon}
cavala-errands2-footpath	false	true	"'The footpath along the canal is blocked.'"	"'The footpath along the canal is blocked.'

Doctor Cavala frowns. 'Right; I'd forgotten about that. That means you'll have to take the long way around from the forum -- detouring through Via Mercurii and the Shanty Quarter, then crossing over by Cadaver Walk.'

You glance at her. 'Is it safe to cross through that part of town?'

'Less safe than I would like,' she admits. 'But you have always handled yourself well, and no one in their right mind would antagonize me by harming you. You'll be fine. Use your judgment.'"	{cavala-errands2-documents, cavala-errands2-nextofkin, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-backsoon}
cavala-errands2-footpath2	false	false	"'What route should I take to Riggertown again?'"	"'What route should I take to Riggertown again?'

'Cross the bridge to the forum,' Doctor Cavala replies, 'detour through Via Mercurii to the Shanty Quarter, then cross over by Cadaver Walk.'"	{cavala-errands2-documents, cavala-errands2-nextofkin, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-backsoon}
cavala-errands2-autopsy	true	true	"'How is the autopsy coming along?'"	"You gesture at Reden's body. 'How is the autopsy coming along?'

'As well as can be expected.' She points inside the cadaver. 'See how the arteries have ruptured? The entire respiratory system -- degenerated. My working theory is of some sort of airborne pathogen that attacks the capillaries... but many things do not add up.

'What I need is Doctor Arturus's opinion. Pathogens were always his area of expertise. Until then, all I can do is experiment and observe -- nothing more.'"	{cavala-errands2-documents, cavala-errands2-nextofkin, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-vision, cavala-errands2-backsoon}
cavala-errands2-vision	false	true	"'About what I saw last night...'"	"You pause, struggling to put your thoughts into words.

'About what I saw last night... my reaction to Reden's animus. I thought about it, like you asked. There was... there was something unusual about the texture of the light. As though it was fractured somehow.'

Doctor Cavala searches your face, your eyes.

[wait for any key]Finally, slowly, she nods once.

[wait for any key]'You are absolutely correct, Marid.' She prods Reden's heart with the tip of her scalpel. 'I felt the same way last night, but I said nothing until I could be sure of my own eyes. There was definitely something off about his animus.

'But we are not animologists -- all this is merely conjecture on our part. Until we discover more anomalies, we can only take our experience for what it is: an anecdotal observation.

'Nevertheless, Marid, you've a sharp eye. Thank you for reminding me.'"	{cavala-errands2-documents, cavala-errands2-nextofkin, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-autopsy, cavala-errands2-backsoon}
cavala-errands2-backsoon	true	false	"'I'll be back soon.'"	"'I'll be back soon.'

'Stay safe, Marid.' 

[cavala-errands2-bye-sub]."	{}
cavala-errands2-nevermind	true	false	"'Nothing, never mind.'"	"'Nothing, never mind.'

[cavala-errands2-bye-sub]."	{}

To say cavala-errands2-bye-sub:
	say "Doctor Cavala ";
	if the location is the Mortuary:
		say "snaps on her loupe and turns back to the mortuary slab";
	otherwise:
		say "returns downstairs to the mortuary".

After reading out cavala-errands2-footpath:
	now journal-riggertown-detour-known is true;
	now the enabled of cavala-errands2-footpath2 is true;
	now the enabled of censor-woken-detour is false.

Book 3.5 - Via Terminalis, West End

Via Terminalis West End is a proper-named room in Outdoors. "You stand in the terminus of the Via Terminalis, a cul-de-sac of steel spires and buildings aspiring to the heavens. [if it is night]Night has fallen, broken only by the ghostly glow of bound animii in street-lamps and shop windows. Beyond, you see the great spine of the Channelworks District, receding from the lamplight into the beginnings of rain.[otherwise]From here the street-lamps and shop windows line the great spine of the Channelworks District until, shrouded in the mists of the canal, it curves out of sight.[end if]

The white cross of Doctor Cavala's clinic is to the west[if Nine to Five Zombie is happening];[otherwise if it is night or Bad News from Cavala is happening], and[otherwise],[end if] the dormitory block where you live lies to the north[if Prologue is happening]. The rest of the district can wait until tomorrow.[otherwise if Nine to Five Zombie is happening]. The rest of the district will have to wait until after you report for work.[otherwise if it is night or Bad News from Cavala is happening].[otherwise], and a gap between buildings hides an alley entrance to the south. The great Via Terminalis continues to the east."
The printed name is "Via Terminalis, West End".

The simple-name is "the West End".
The sound is "You hear the murmuring of the city all around you."
The scent is "The smell of ozone mingles with the mist."
The exit reminder is "[if it is night or Nine to Five Zombie is happening or Bad News from Cavala is happening]You can go west to the clinic or north to the dormitory block.[otherwise]You can go west to the clinic, north to the dormitory block, south to the crooked alley, or east along the Via Terminalis."
The going-in disambiguation is "Do you mean going north (to the dormitory block)[unless it is night or Nine to Five Zombie is happening or Bad News from Cavala is happening], going south (to the crooked alley),[end if] or going west (to the clinic)?"

Before examining north in the West End, try examining the view of the dormitory instead.
Before examining south in the West End, try searching the gap between buildings instead.
Before examining west in the West End, try examining the clinic building instead.
Instead of examining inside in the West End, say "It's unclear where you want to look."
Instead of examining outside in the West End, say "It's unclear where you want to look."
Instead of examining east in the West End, say "The Via Terminalis continues in that direction."

Part 3.5.1 - Scenery

The Via Terminalis, the high-rise buildings, the street-lamps, the shops, the mist, the city crowd, and the Upper Perioch ambience are in the West End.

The clinic building is scenery in the West End.
The description is "Among the drab steel buildings, the silver sign glows like a beacon."
Understand "white" or "cross" or "doctor" or "cavala's" or "silver" or "sign" as the clinic building.
Before entering the clinic building, try going west instead.
Before searching the clinic building, try searching the clinic front door instead.

The view of the dormitory is faraway scenery in the West End.
The description is "Squat, graceless, and weathered by time. But it's home." Understand "dorm" or "block" as the view of the dormitory.
Before entering the view of the dormitory, try going north instead.
Before listening to the view of the dormitory, try listening to the West End instead.

Part 3.5.2 - Gap Between Buildings

The gap between buildings is an open unopenable scenery door. The gap between buildings is south of the West End and north of the Crooked Alley.
The description is "[if the location is the West End]It's dark and uninviting.[otherwise]It leads into light."
The sound is "[if the location is the West End]It's quiet.[otherwise]The sounds of the city filter in."
The scent is "You smell a hint of foul smoke."
Understand "alley" or "entrance" as the gap between buildings.
Before searching the gap between buildings, try examining the gap between buildings instead.

After going through the gap between buildings while the player is staid: say "You shuffle through the gap..."; continue the action.

Part 3.5.3 - West End during Prologue

Instead of going to Via Terminalis West Street when it is night, say "It's dangerous to go out at night."
Instead of going to the Crooked Alley when it is night, say "It's dangerous to go out at night."

The burgeoning rain is faraway scenery in Via Terminalis West End. The indefinite article is "the".
The description is "More than mist, but less than rain."
The burgeoning rain has some text called the faraway response. The faraway response is "The rain is barely there."
Understand "beginning/beginnings" or "of" as the burgeoning rain.

When Prologue ends: now the burgeoning rain is nowhere.
When Walking Home in Fear begins: now the burgeoning rain is in the West End.
When Day One ends: now the burgeoning rain is nowhere.

Part 3.5.4 - West End during Day One

Chapter 3.5.4.1 - Blocking the Way during Nine to Five Zombie

Instead of going to Via Terminalis West Street during Nine to Five Zombie, say "But the clinic is in the other direction."
Instead of going to the Crooked Alley during Nine to Five Zombie, say "But the clinic is in the other direction."

Chapter 3.5.4.2 - Seeing Carnicer during Returning to a Break-In

When Returning to a Break-In begins (this is the spawn Carnicer for the break-in rule):
	now Carnicer is in the West End.

First every turn when the location is the West End and Returning to a Break-In is happening (this is the suppress ambience in the West End during Returning to a Break-In rule):
	now ambience suppression is true.

Every turn when the location is the West End and Carnicer is not in the Clinic and Returning to a Break-In is happening (this is the Carnicer breaks into the Clinic rule):
	now Carnicer is in the Clinic;
	now the clinic door is open;
	say "Wait a moment.[paragraph break]";
	wait for any key;
	say "Someone on the street has just drawn her sword and stalked into Doctor Cavala's clinic.";
	
Before going in the West End when Returning to a Break-In is happening (this is the can't go anywhere from the West End but the Clinic during Returning to a Break-In rule):
	if the noun is west:
		continue the action;
	otherwise if the noun is inside:
		try going west instead;
	otherwise:
		say "You'd better investigate the clinic first." instead.
		
Before examining inside when the location is the West End and Returning to a Break-In is happening (this is the assume examining inside is examining west during Returning to a Break-In rule):
	try examining west instead.
	
Instead of listening to the clinic building during Returning to a Break-In:
	say "You can't hear much."
	
Part 3.5.5 - West End during Day Two

Chapter 3.5.4.1 - During Bad News from Cavala

badnewscavala-westend-quipped is a truth state that varies.

First every turn when the location is the West End and badnewscavala-westend-quipped is false and Bad News from Cavala is happening:
	say "Some pigeons fly overhead.";
	now badnewscavala-westend-quipped is true;
	now ambience suppression is true.

Instead of going to Via Terminalis West Street during Bad News from Cavala, say "But the clinic is in the other direction."
Instead of going to the Crooked Alley during Bad News from Cavala, say "But the clinic is in the other direction."

Before approaching a room during Bad News from Cavala:
	if the noun is not Marid's Room and the noun is not West End and the noun is not West Street and the noun is not Clinic:
		say "Doctor Cavala is at the clinic. You shouldn't keep her waiting." instead.

Book 3.6 - Dormitory Block

The Dormitory Block is a proper-named room in Outdoors. "[if Cavala's Errands has not ended]You have walked the grounds of this three-storey estate long enough to know it by heart. [end if]Here is the faded arch, with its years of verdigris; here are the too-small atrium and the fountain at its center. All around above are [if it is night]the lights of [end if]innumerable domiciles, linked by crumbling stairs and divided by flimsy plaster walls.

From here, you can go up to your dormitory room[unless Nine to Five Zombie is happening or Bad News from Cavala is happening], visit the public house to the west,[end unless] or exit the building to the south."
The Dormitory Block is north of the West End.
Understand "dorm" as the Dormitory Block.

The simple-name is "the dormitory block".
The sound is "You hear the flowing of the fountain, the bustle of the public house."
The scent is "You smell cooking from the dormitory and the public house."
The exit reminder is "You can go up to your dormitory[unless Nine to Five Zombie is happening or Bad News from Cavala is happening], west to the public house,[end unless] or south to the Via Terminalis."
The going-in disambiguation is "Do you mean going up (to your dormitory)[unless Nine to Five Zombie is happening or Bad News from Cavala is happening], going west (to the public house),[end unless] or going south (to the Via Terminalis)?"

Before examining inside in the Dormitory Block, try examining the dormitory domiciles instead.
Before examining west in the Dormitory Block, try examining the view of the public house instead.
Before examining south in the Dormitory Block, try searching the faded arch instead.
Before examining outside in the Dormitory Block, try searching the faded arch instead.
Before going outside in the Dormitory Block, try going south instead.

Part 3.6.1 - Scenery

The high-rise buildings and the view of the Via Terminalis are in the Dormitory Block.
Before entering the view of the Via Terminalis in the Dormitory Block, try going south instead.

The faded arch is scenery in the Dormitory Block.
The description is "The inscription reads [italic type]Welcome to the Pax Civil Dormitory.[roman type]".
Understand "inscription" or "archway" or "exit" as the arch.
Before touching the faded arch, try touching the verdigris instead.
Before entering the faded arch, try going south instead.
Instead of searching or looking under the faded arch, say "Through the faded arch is the way to the Via Terminalis."

The verdigris is scenery part of the faded arch. The indefinite article is "some".
The description is "There's a melancholy beauty to it."
Instead of touching the verdigris, say "It's rough and streaked by rain."

The cloistered atrium is scenery in the Dormitory Block.
The description is "The court is so cloistered that you can barely see the sky."
Understand  "court" or "too-small" or "cloister/cloisters" or "grounds" as the atrium.
Instead of entering the atrium, say "You're standing in it."
Instead of looking under the atrium, say "Beyond the atrium are the public house and the domiciles."

The view of the public house is faraway scenery in the Dormitory Block. The printed name is "public house".
The description is "A refuge from the troubles of the world, at least for some."
The sound is "You hear the hubbub of conversation, intermittently sprinkled with laughter."
The scent is "You smell the welcoming aroma of hot food."
Understand "pub" or "downstairs public" as the view of the public house.
Before entering the view of the public house, try going west instead.

Some dormitory domiciles are a faraway backdrop in the Dormitory Block.
The description is "Here live friends and foes, neighbors and strangers, and only a door's width apart."
The sound is "You hear the sounds of everyday living."
Understand "domicile" or "dorm/dorms" or "light/lights" or "of domicile/domiciles" or "washhouse" as the domiciles.
Before entering the domiciles, try going up instead.

Some flimsy plaster walls are a backdrop in the Dormitory Block.
The description is "There is little privacy that these walls offer."
Before listening to the plaster walls, try listening to the domiciles instead.
The scent is "The walls smell of burnt gypsum."
Understand "burnt" or "gypsum" as the plaster walls.
Instead of attacking or cutting the plaster walls, say "The landlord would have your head."

Some crumbling stairs are scenery in the Dormitory Block.
The description is "Well-worn stairs lead up to the domiciles."
The sound is "You hear the sounds of everyday living."
Understand "well-worn" as the crumbling stairs.
Before entering the crumbling stairs, try going up instead.
Before putting something on the crumbling stairs, try dropping the noun instead.
Instead of searching the crumbling stairs, say "The stairs lead up to the domiciles."

Part 3.6.2 - Atrium Fountain

The atrium-fountain is a privately-named enterable scenery supporter in the Dormitory Block. The printed name is "atrium fountain".
The sound is "You hear the hush of the water flowing into itself."
Understand "fountain" or "atrium fountain" or "neoclassical" or "sculpture" or "concentric" or "basin/basins" or "water" as the atrium-fountain.
Instead of examining the atrium-fountain, say "A neoclassical sculpture of concentric basins. An image of Mercury takes pride of place, with sword aloft in one hand and water-spout chalice in the other."
Instead of drinking the atrium-fountain, say "The water isn't potable."
Instead of searching the atrium-fountain, say "Nothing out of the ordinary is in the water."
Instead of taking or touching the atrium-fountain, say "You splash your face with a little water."
Instead of inserting the endoscope into the atrium-fountain, say "Nothing out of the ordinary is in the water."
Instead of inserting something that is not the endoscope into the atrium-fountain, say "There's a fine for littering in the fountain."

Report entering the atrium-fountain: say "You sit at the base of the fountain."; stop the action.
Report getting off the atrium-fountain: say "You stand up."; stop the action.

Rule for issuing the response text of room description heading rule response (B) when the player is on the atrium-fountain (this is the print 'at the base of the fountain' rule):
	say " (at the base of the fountain)".
	
The image of Mercury is a scenery thing part of the atrium-fountain.
The description of the image is "It's the Mercury depicted in paintings and opera; a far cry from the alchemist's silver."
Understand "sword" or "water-spout" or "chalice" as the image.

Part 3.6.3 - Dormitory Block during Prologue

Chapter 3.6.3.1 - Saliunca and the Pigeons

Section 3.6.3.1.1 - Saliunca and her Props

Saliunca is an improper-named woman in the Dormitory Block. "[A Saliunca] sits at the base of the fountain, feeding pigeons that wing down from the sky above."
The indefinite article is "an".
The description is "[if Saliunca is hostile]You don't want to look at her.[otherwise]You recognize her as a fellow dormitory resident, having passed by her once or twice in the washhouse. She is feeding the pigeons breadcrumbs from the basket in her lap."
Rule for printing the name of Saliunca when Saliunca is improper-named: say "old woman".
Understand "old" or "lady" or "resident" or "fellow" or "dormitory resident" as Saliunca.

Instead of attacking, burning, cutting, knocking on, pulling, or pushing Saliunca when Saliunca is hostile, say "No... that would only get you in trouble."
Instead of talking to Saliunca when Saliunca is hostile, say "You have nothing more to say to her."
Instead of touching Saliunca when Saliunca is hostile, say "You are loath to touch her."

Saliunca is carrying a wicker basket.
Instead of examining the wicker basket, say "It's an ordinary wicker basket."
Instead of attacking, taking, pushing, pulling, squeezing, or turning the wicker basket when Saliunca is friendly, say "That hardly seems called for."
Instead of searching the wicker basket, say "There is nothing in the basket but breadcrumbs."

Some breadcrumbs are a thing in the wicker basket. "All around the fountain, pigeons are nibbling at scattered breadcrumbs."
The description is "[if Saliunca is hostile]It is sobering that death can lurk in something so little.[otherwise]Meager pickings, but apparently enough for the pigeons to fight over."
Understand "bread" or "crumb/crumbs" or "breadcrumb" as the breadcrumbs.
Instead of looking under the breadcrumbs when the breadcrumbs are in the wicker basket, say "The breadcrumbs are in the wicker basket."
Instead of eating or tasting the breadcrumbs, say "[if Saliunca is hostile]That would either make you very sick or kill you.[otherwise]You aren't a pigeon, Marid."
Instead of searching the breadcrumbs, say "There is nothing among the breadcrumbs."
Instead of taking the breadcrumbs, say "You would need a broom for that."
Instead of pushing, pulling, rubbing, squeezing, touching, or turning the breadcrumbs, say "[if the breadcrumbs are in the wicker basket]It's hard to do that while the basket is with [the Saliunca].[otherwise]You aren't sure what that would accomplish."
		
Some living-pigeons are an undescribed privately-named creature animal in the Dormitory Block. The printed name is "pigeons".
The description is "They are white and black and every shade of grey."
The sound is "They flap and coo."
Understand "bird/birds" or "pigeon/pigeons" as the living-pigeons.
Instead of attacking, cutting, or scaring the living-pigeons, say "You scare some of the pigeons away, but they return shortly after."
Instead of searching the living-pigeons, say "[if Saliunca is hostile]The pigeons exhibit the tell-tale twitching of strychnine poisoning.[otherwise]You notice that the pigeons are acting a little oddly. Perhaps it's something about their movements. It's nothing you could put your finger on, though."
Instead of talking to the living-pigeons, say "The pigeons are not capable of language."
Instead of kissing, pushing, pulling, rubbing, squeezing, taking, or turning the living-pigeons, say "The pigeons flap out of reach."
		
Section 3.6.3.1.2 - Saliunca's Dialogue

Some dialogue branches are defined by the Table of Saliunca's Dialogue.

Table of Saliunca's Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
saliunca-home1	true	false	""	"As you approach, the old woman looks up and smiles.

'Ah, hello, Marid,' she says. 'It is Marid, isn't it?'"	 {saliunca-greet1, saliunca-greet2, saliunca-greet3}
saliunca-greet1	true	false	"'It's nice to meet you too, ma'am.'"	"'It's nice to meet you too, ma'am.'

'And so polite!' the old woman laughs. 'Everyone here knows your name, of course; you are the doctor's assistant, are you not? And I hear you live all by yourself in this dormitory, poor girl... but I'm sure you don't need my pity.

'As I know your name, it's only fair that you know mine. My name is Saliunca.'"	 {saliunca-orphan, saliunca-pigeons, saliunca-rush}
saliunca-greet2	true	false	"'Have we met before?'"	"'Have we met before?' you ask.

'Oh, no, no,' the old woman replies. 'It's just that everyone knows your name, you see; you are the doctor's assistant, are you not? And I hear you live all by yourself in this dormitory, poor girl... but I'm sure you don't need my pity.

'As I know your name, it's only fair that you know mine. My name is Saliunca.'"	 {saliunca-nicemeet, saliunca-orphan, saliunca-pigeons, saliunca-rush}
saliunca-greet3	true	false	"'Sorry, I don't know who you're talking about.'"	"'Sorry, I don't know who you're talking about.'

The old woman's face falls. 'Oh, I'm sorry, love,' she says. 'I've gone and forgotten my manners. It's just that everyone here knows your name; you [italic type]are[roman type] the doctor's assistant, are you not? And I hear you live all by yourself in this dormitory, poor girl... but I'm sure you don't need my pity.

'As I know your name, it's only fair that you know mine. My name is Saliunca.'"	 {saliunca-nicemeet, saliunca-mistaken, saliunca-orphan, saliunca-pigeons, saliunca-rush}
saliunca-nicemeet	true	true	"'It's nice to meet you, Saliunca.'"	"'It's nice to meet you, Saliunca.'

'The pleasure is all mine.' She bares her crooked teeth in a wry smile."	{saliunca-orphan, saliunca-pigeons, saliunca-rush}
saliunca-mistaken	true	true	"'No, really, you have me mistaken for someone else.'"	"'No, really, you have me mistaken for someone else.'

Saliunca tut-tuts at you. 'It's not right for a young lady to lie and skulk, you know. Next you'll be following in Philosopher Scepter's footsteps, and then where will you go?

'In any case, Marid, you won't be fooling anyone with that jacket on. You and Doctor Cavala are the only women in the district who wear the things.'

You redden. 'Fine,' you admit, 'so I [italic type]am[roman type] Marid Orpheia.'

'Now was that so hard?'

A few moments pass in silence, and you watch as she tosses more breadcrumbs to the pigeons."	{saliunca-orphan, saliunca-pigeons, saliunca-seeingyou}
saliunca-orphan	true	true	"'Living by myself isn't [roman type]that[italic type] bad...'"	"'Living by myself isn't [italic type]that[roman type] bad,' you say. 'I've grown accustomed to it ever since I boarded out to the Physicians['] College.'

'Oh, I don't doubt you can look after yourself, love,' Saliunca quickly adds. 'I'm -- We're only worried for you, is all; just a spot of neighborly worry. It isn't easy for an -- for a young lady to -- to live like you do.'

An awkward pause.

'I appreciate the concern,' you say eventually, 'but you shouldn't worry. I get by, in my own way.'"	{saliunca-pigeons, saliunca-seeingyou}
saliunca-pigeons	true	false	"'Do you feed the pigeons often?'"	"You gesture at the flock surrounding her. 'Do you feed the pigeons often?'

Saliunca cackles. 'Feed them?' she says. 'I suppose you could say that, in a way. Yes, I feed them; but if you think I harbor any love for the pigeons, you would be quite mistaken. I'm poisoning the pigeons, you see, love -- feeding them poison!'"	{saliunca-poison, saliunca-thenkilling, saliunca-whydoit}
saliunca-poison	true	true	"'Poison!?'"	"'Poison!?' you exclaim.

'Why, that's what I said. Poison.' She picks another pinch out of her basket. 'These breadcrumbs are sprinkled with flowers of strychnia -- and look! Every one of these birds will be dead before dawn.'

You look around at the pigeons. Sure enough, the tell-tale spasms of strychnine poisoning are beginning to show."	{saliunca-thenkilling, saliunca-whydoit, saliunca-corpses}
saliunca-thenkilling	true	true	"'Then you're killing them...!'"	"'Then you're killing them...!'

[saliunca-killing-text]"	{saliunca-right, saliunca-wrong, saliunca-whydoit, saliunca-corpses, saliunca-havetogo}
saliunca-butkilling	true	true	"'But killing them...!'"	"'But killing them...!'

[saliunca-killing-text]"	{saliunca-right, saliunca-wrong, saliunca-whydoit, saliunca-corpses, saliunca-havetogo}
saliunca-whydoit	true	true	"'But... but why would you do something like that?'"	"'But... but why would you do something like that?'

[saliunca-why-text]"	{saliunca-right, saliunca-wrong, saliunca-butkilling, saliunca-corpses, saliunca-havetogo}
saliunca-whymust	true	true	"'Has to be done? What do you mean?'"	"'Has to be done? What do you mean?'

[saliunca-why-text]"	{saliunca-right, saliunca-wrong, saliunca-butkilling, saliunca-corpses, saliunca-havetogo}
saliunca-corpses	true	true	"'The corpses... the corpses will litter the ground.'"	"'The corpses...' You shake your head. 'The corpses will litter the ground.'

Saliunca grimaces. 'Yes. Yes, they will. The atrium will be rather unpleasant for a while; that's the cost of it, Marid. But you must see -- you must see it's something that has to be done.'"	{saliunca-right, saliunca-wrong, saliunca-butkilling, saliunca-whymust, saliunca-havetogo}
saliunca-right	true	false	"'I suppose you are right...'"	"You close your eyes.

'I suppose you are right,' you say. 'Forgive me, Saliunca; it hasn't been the best of days for me, and... and I've witnessed death aplenty for one night.'

[wait for any key]'Oh, you poor, poor girl,' she murmurs, laying a hand on your arm. 'It's the clinic, isn't it? I can't imagine -- oh, the things Doctor Cavala must have you do. It's no way for a young lady to live, Marid, no way for a lady to live.

'But if it's your choice, your calling--' She squeezes your arm. 'The [italic type]ars vitalis[roman type] is a very noble pursuit, Marid. Very brave. Tending to the sick, saving lives and all that--'

[wait for any key]You tense up."	{saliunca-outburst, saliunca-havetogo}
saliunca-wrong	true	false	"'I don't believe that for a second...'"	"'I don't believe that for a second,' you say. 'The pigeons may be pests, but [italic type]poisoning[roman type] them? That's too cruel. There must be some other way.'

'Oh?' Saliunca raises an eyebrow. 'Pray tell.'

'I... I don't...'

[wait for any key]You shake your head.

'I don't know. But there must be a way. Perhaps you just aren't looking hard enough.'

'And suppose I'm right, and there isn't?' She frowns. 'You've got some nerve telling me off, young lady, when all I've heard out of you is talk. Talk won't get you anywhere. Don't tell me you're squeamish about killing a few birds -- or is that what the Physicians['] College taught you?'

[wait for any key]You tense up."	{saliunca-outburst, saliunca-havetogo}
saliunca-outburst	true	false	"'What would a hag like [roman type]you[italic type] possibly know about the Art?...'"	"[italic type]What would--[roman type]

[wait for any key]No. You start. You catch yourself.

Being emotional won't get you anywhere, Marid. It won't change anything. It won't bring him back.

[wait for any key]You take a deep breath."	{saliunca-havetogo}
saliunca-rush	true	false	"'I'm in a bit of a rush, actually...'"	"'I'm in a bit of a rush, actually...'

Saliunca waves you off. 'Of course, of course, love. Don't let me stop you.'"	{}
saliunca-seeingyou	true	false	"'I'll be seeing you, then.'"	"'I'll be seeing you, then.'

'Have a good night, love.'"	{}
saliunca-havetogo	true	false	"'I'm sorry. I have to go.'"	"'I'm sorry,' you mutter. 'I have to go.'

You turn and walk away. 'Suit yourself, love,' Saliunca calls after you.

When you don't respond, she shakes her head and goes back to feeding the pigeons."	{}
saliunca-home2	true	false	""	"You approach the old woman. 'Hello again,' you say.

'Why, hello, Marid.' She squints and grins. 'Did you want to ask me something, love?'"	 {saliunca-pigeons, saliunca-rush}

To say saliunca-killing-text:
	say "Saliunca frowns. 'You say that as though I'm a murderess,' she says, 'when I'm nothing of the sort. Think, girl, think!

'Do you think about the food you eat, of how the butcher earns his keep? No, of course not -- they are animals, animals! We know they are lesser -- we have [italic type]measured[roman type] their animii. And the animus of a pigeon... why, it's little more than a candlelight. So why shouldn't I snuff them?' "

To say saliunca-why-text:
	say "Saliunca shakes her head sadly. 'Oh, Marid, don't you see? The pigeons are infesting the dormitory! All over the atrium they are, and even in some of the ground-floor domiciles. You never even noticed?'

[wait for any key]'I -- I live on the third floor,' you admit.

'Then you haven't noticed.' She sighs. 'The pigeons are everywhere, love -- a great nuisance they are making. Stealing food. Leaving their droppings about. And that's why their numbers have to be culled.

'For some peace, Marid, for some peace. You understand, don't you?' "

The home dialogue branch of Saliunca is saliunca-home1.

After reading out saliunca-greet1:
	now Saliunca is proper-named;
	now the conversational partner text is "Talking to Saliunca";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	redraw status line;
	
After reading out saliunca-greet2:
	now Saliunca is proper-named;
	now the conversational partner text is "Talking to Saliunca";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	redraw status line;
	
After reading out saliunca-greet3:
	now Saliunca is proper-named;
	now the conversational partner text is "Talking to Saliunca";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	redraw status line;

After reading out saliunca-rush: now the home dialogue branch of Saliunca is saliunca-home2.
After reading out saliunca-seeingyou: now the home dialogue branch of Saliunca is saliunca-home2.
After reading out saliunca-thenkilling: now the enabled of saliunca-butkilling is false.
After reading out saliunca-butkilling: now the enabled of saliunca-thenkilling is false.
After reading out saliunca-whydoit: now the enabled of saliunca-whymust is false.
After reading out saliunca-whymust: now the enabled of saliunca-whydoit is false.
After reading out saliunca-havetogo: now Saliunca is hostile.

Section 3.6.3.1.3 - When Saliunca Goes Away

Instead of attacking, taking, pushing, pulling, squeezing, or turning the wicker basket when Saliunca is hostile (this is the piss off Saliunca rule):
	say "You give the wicker basket a forceful tug and it falls out of Saliunca's hands. Breadcrumbs scatter everywhere. The pigeons take to them with great enthusiasm.

Saliunca glares at you wordlessly. She picks up the basket -- now empty -- and vanishes into the dormitory.";
	now the breadcrumbs are in the Dormitory Block;
	now Saliunca is nowhere.
	
When Prologue ends (this is the despawn Saliunca rule):
	now the breadcrumbs are nowhere;
	now the living-pigeons are nowhere;
	now Saliunca is nowhere.
	
Part 3.6.4 - Dormitory Block during Day One

Chapter 3.6.4.1 - During Nine to Five Zombie

Before going west in Dormitory Block during Nine to Five Zombie, say "Doctor Cavala is at the clinic. You shouldn't keep her waiting." instead.

Chapter 3.6.4.2 - Dead Pigeons and Cleaners

The Council of Works char-golem is a thing. "The ground is littered with what must be dozens of dead pigeons. A char-golem is busy sweeping the carcasses into a bag, while a gobliness slouches beside the fountain nearby."
The description is "An animated golem comprised of cast iron. The stamp on its forehead identifies it as property of the Council of Works."
The sound is "The golem is silent."
Understand "golem" or "cast" or "iron" or "cast-iron" or "animated" or "char/chare/chore" or "stamp" as the char-golem.
Instead of attacking or cutting the char-golem, say "That hardly seems called for."
Instead of climbing the char-golem, say "You have better things to do than that."
Instead of knocking on the char-golem, say "Clank."
Instead of pushing, pulling, swinging, taking, or turning the char-golem, say "The golem is many times your weight."
Instead of talking to the char-golem, say "Golems aren't sapient. You'd sooner get a response out of a lamp-post."

The big burlap bag is a thing carried by the Council of Works char-golem.
The description is "It's just a big burlap bag."
The scent is "You smell dead pigeons and strychnia."

Some dead pigeons are a scenery thing.
The description is "Each carcass is contorted strangely, as though frozen in an instant of convulsion."
The scent is "They are less putrefied than one might expect, perhaps due to the preservative qualities of strychnia."
Understand "corpse/corpses" or "cadaver/cadavers" or "carcass/carcasses" or "ground" or "dozen/dozens of/--" or "pigeon" as the dead pigeons.
Instead of attacking the dead pigeons, say "They are already dead."
Instead of cutting the dead pigeons, say "This is neither the time nor place for a dissection."
Instead of entering the dead pigeons, say "That seems unnecessary." [Response to "step on pigeons."]
Instead of knocking on, squeezing, or touching the dead pigeons, say "They are still."
Instead of rubbing, swinging, taking, or tasting the dead pigeons, say "You can't imagine any reason you would have to do that."

The odd-job gobliness is an undescribed goblin woman.
The description is "She's dressed like an odd-job woman. The pockets of her apron are stuffed with work tools."

Instead of talking to the gobliness, say "[one of]'Good morning.'

'Morning, miss.' She tips her cap. 'Take care you don't step on one of them pigeons. Nasty business.'

You look at your feet. 'Thanks for the warning.'[or]You make some small talk, but the conversation soon peters out.[stopping]"

The odd-job gobliness wears a container called a simple apron.
Instead of examining the simple apron, say "A simple apron, spotty from years of use."
Understand "stuffed" or "pocket/pockets" or "spotty/spot/spots" as the simple apron.

Some janitorial tools are a thing in the simple apron.
The description is "They look to be for cleaning roads and public spaces."
Understand "work" or "tool" as the janitorial tools.
Instead of doing anything other than examining to the janitorial tools, say "There's no need to concern yourself with her tools."
Instead of doing anything other than examining when the second noun is the janitorial tools, say "There's no need to concern yourself with her tools."

When Day One begins (this is the spawn the dead pigeons and cleaners rule):
	now the dead pigeons are in the Dormitory Block;
	now the char-golem is in the Dormitory Block;
	now the gobliness is in the Dormitory Block.
	
When Cavala's Errands ends (this is the despawn the dead pigeons and cleaners rule):
	now the dead pigeons are nowhere;
	now the char-golem is nowhere;
	now the gobliness is nowhere.
	
Chapter 3.6.4.3 - The Single Pigeon

The single pigeon is a neuter creature animal.
"You notice a single pigeon half-hidden under the stairs. The gobliness and her golem must have missed it."
The sound is "It's not making any sound."
Understand "bird" or "half-hidden" or "half" or "hidden" as the single pigeon.

First before doing anything other than listening when the current action involves the single pigeon:
	say "You take a step closer--[paragraph break]";
	wait for any key;
	say "The pigeon twitches.[paragraph break]";
	wait for any key;
	say "Before your eyes, the pigeon begins to move, like a delicate clockwork replica that has been wound up again. It rights itself in a flutter of feathers, and coos, unmistakably alive.[paragraph break]";
	wait for any key;
	say "It looks around. It cocks its head in your direction.[paragraph break]";
	wait for any key;
	say "And with no more than a thought, it leaps awing, and disappears into the glittering night sky.[paragraph break]";
	wait for any key;
	say "You touch your pendant.";
	now the single pigeon is nowhere;
	stop the action.

When Walking Home in Fear begins (this is the spawn the single pigeon rule):
	now the single pigeon is in the Dormitory Block.
	
When Walking Home in Fear ends (this is the despawn the single pigeon rule):
	now the single pigeon is nowhere.
	
Part 3.6.4 - Dormitory Block during Day Two

Chapter 3.6.4.1 - During Bad News from Cavala

Before going west in Dormitory Block during Bad News from Cavala, say "Doctor Cavala is at the clinic. You shouldn't keep her waiting." instead.

Book 3.7 - Public House

There is a proper-named room called the Public House. "Tucked away in the shadow of the domiciles, this cozy establishment offers a retreat from the [if it is night]melancholy of the night[otherwise]bustle of the day[end if]. Other patrons are scattered at the tables, engaged in drinking and conversation, while in the corner a solitary clockwork musician plays. The door is to the east."

The simple-name is "the public house".
The sound is "Music and conversation intermingle with one another."
The scent is "The aroma of hot food reaches you."
The exit reminder is "The only door is to the east."

Instead of buying in the Public House, say "[if the enabled of bartender-dialogue-drink is true]To buy a drink, talk to the bartender[otherwise]You aren't in the mood for anything[end if]."
Instead of examining east in the Public House, say "That way lies the door."
Before examining inside in the Public House, try examining the bar and kitchen instead.
Instead of examining outside in the Public House, say "That way lies the door."
Before going inside in the Public House, try entering the bar and kitchen instead.
Before going outside in the Public House, try going east instead.

Part 3.7.1 - Scenery

The dormitory domiciles are in the Public House.

There is a scenery thing in the Public House called the bar and kitchen.
The description is "Glasses, cups, cutlery, kitchenware, and all the tools of the bartender's trade."
Understand "glass/glasses" or "cup/cups" or "cutlery" or "kitchenware" or "tool/tools" or "item/items" as the bar and kitchen.
Before putting something on the bar and kitchen, try putting the noun on the serving counter instead.
Before removing something from the bar and kitchen, try removing the noun from the serving counter instead.
Instead of entering the bar and kitchen, say "You don't have any business behind the counter."
Instead of looking under the bar and kitchen, say "The bartender is behind the counter."
Instead of searching the bar and kitchen, say "There are plenty of items here, but nothing of interest."
Instead of taking the bar and kitchen, say "That's property of the public house."

Part 3.7.2 - Door of the Public House

The door of the public house is a scenery door. It is east of the Public House and west of the Dormitory Block.
The description is "[if the player is in the Public House]It leads out to the atrium.[otherwise]It leads into the public house."
The sound is "[if the player is in the Public House]It's quiet outside.[otherwise]You hear the sounds of the public house."
Understand "to" as the public house door.
Understand "exit" as the public house door when the location is the Public House.
Instead of knocking on the public house door, say "There's no need; the public house is open for business."

Part 3.7.3 - Dining Tables

Some dining tables are an enterable scenery supporter in the Public House.
The description is "The tables are laden with food and drink."
Before listening to the dining tables, try listening to the patrons instead.
Before smelling the dining tables, try smelling the food and drink instead.
Understand "chair/chairs" or "table" as the dining tables.

Before searching the dining tables, try examining the patrons instead.
Instead of pushing, pulling, or taking the dining tables, say "You'd get thrown out by the management."

Report entering the dining tables: say "You sit at one of the dining tables."; stop the action.
Report getting off the dining tables: say "You stand up."; stop the action.

Before putting something on the dining tables when the player is not on the dining tables (this is the sit down to put stuff on the dining table rule):
	try silently entering the dining tables;
	say "(first sitting at the dining tables)[command clarification break]".
	
Before getting off the dining tables (this is the get your things before getting up from the dining table rule):
	let things taken be a list of things;
	repeat with current item running through things on the dining tables:
		if current item is not the food and drink and current item is not the player:
			try silently taking current item;
			add current item to things taken;
	if the number of entries in things taken is not 0, say "(first collecting [things taken with definite articles])[command clarification break]".
	
Rule for issuing the response text of room description heading rule response (B) when the player is on the dining tables (this is the print 'at the dining tables' rule):
	say " (at one of the dining tables)".
	
There is some plural-named scenery on the dining tables called food and drink.
The description is "The cooking here is quite highly regarded, and you can see why."
The scent is "It smells good."
Understand "drinks/drinking" or "supper/suppers" or "cooking" or "wine" as the food.
Instead of drinking, eating, taking, or tasting the food, say "[if the enabled of bartender-dialogue-drink is true]To buy a drink, talk to the bartender[otherwise]You aren't in the mood for anything[end if]."
Instead of looking under the food, say "It's on the dining tables."

Part 3.7.4 - Serving Counter

The serving counter is a enterable scenery supporter in the Public House.
Understand "stool/stools" as the serving counter.
Instead of examining the serving counter, say "It's the counter where patrons are served their food and drink. A chalkboard displays the menu."
Instead of looking under the serving counter, say "The bartender is behind the counter."
Instead of searching the serving counter, say "A chalkboard menu is on the counter[if a described thing is on the serving counter]. Beside it [is-are a list of described things on the serving counter][end if]."

Report entering the serving counter: say "You sit at the counter."; stop the action.
Report getting off the serving counter: say "You stand up."; stop the action.

Before putting something on the serving counter when the player is not on the serving counter (this is the sit down to put stuff on the serving counter rule):
	try silently entering the serving counter;
	say "(first sitting at the serving counter)[command clarification break]".
	
Before getting off the serving counter (this is the get your things before getting up from the serving counter rule):
	let things taken be a list of things;
	repeat with current item running through things on the serving counter:
		if current item is not the player and current item is not the chalkboard menu:
			try silently taking current item;
			add current item to things taken;
	if the number of entries in things taken is not 0, say "(first collecting [things taken with definite articles])[command clarification break]".
	
Rule for issuing the response text of room description heading rule response (B) when the player is on the serving counter (this is the print 'at the serving counter' rule):
	say " (at the serving counter)".
	
The chalkboard menu is undescribed scenery on the serving counter.
The description is "It lists the food and drink on offer."
The scent is "It smells of chalk."
Understand "chalk" as the chalkboard menu.
Instead of rubbing or touching the chalkboard menu, say "The bartender would be annoyed if you wiped away the chalk."
Instead of pushing, pulling, swinging, taking, or turning the chalkboard menu, say "You don't think the bartender would appreciate that."
Instead of searching the chalkboard menu, say "[if the enabled of bartender-dialogue-drink is true]To buy a drink, talk to the bartender[otherwise]You aren't in the mood for anything[end if]."

Part 3.7.5 - Patrons

Some patrons are a mixed-race undescribed person in the Public House.
The description is "You don't see anyone you know here."
The sound is "'[one of]...should do something about the situation[or]...really? My condolences[or]...can't believe something like that happened[cycling]...'".
Understand "patron" or "conversation" as the patrons.
Before searching the patrons, try examining the patrons instead.
Instead of talking to the patrons, say "You make idle conversation for a while, but you aren't really in the mood."

Part 3.7.6 - Clockwork Musician

[The clockwork musician plays random music tracks. At the start of each scene, a playlist is shuffled. The musician runs through the playlist while the player is there to observe it, until the playlist is exhausted, at which point the playlist is reshuffled.

Is all this really necessary? Not really, but it makes an awesome worldbuilding prop.]

The clockwork musician is a closed scenery container in the Public House.
The description is "It's an antique automaton fashioned in the likeness of a tuba player. An inscribed cylinder revolves in place of diaphragm, altering the pressure within its windpipe to produce pleasing melodies.

The clockwork musician is currently playing [article in row clockwork musician track number of the Table of the Clockwork Musician's Repertoire][track in row clockwork musician track number of the Table of the Clockwork Musician's Repertoire]."
The sound is "The clockwork musician is playing [article in row clockwork musician track number of the Table of the Clockwork Musician's Repertoire][track in row clockwork musician track number of the Table of the Clockwork Musician's Repertoire]."
The scent is "You smell olive oil and lime. The mechanism must have been recently greased."
Understand "solitary" or "antique" or "automaton" or "tuba" or "player" or "inscribed" or "cylinder" or "diaphragm" or "windpipe" or "mechanism" or "percussive" or "accompaniment" or "music" or "planetaria" or "overture" or "symphony" or "of" or "the" or "primes" or "dance" or "aurora" or "trismegistus" or "instrumental" or "cover" or "amesha" or "song" as the clockwork musician.

Instead of singing in the Public House, say "You hum along to the song."
Instead of switching on the clockwork musician, say "It's already on."
Instead of talking to the clockwork musician, say "You won't get a response; it's little more than a fancy music box."
Instead of opening, pulling, squeezing, switching off, taking, or turning the clockwork musician, say "You don't think you should interfere with the property of the public house."
Instead of inserting something into the clockwork musician, say "You don't think you should interfere with the property of the public house."
Instead of setting the clockwork musician to something, say "You don't think you should interfere with the property of the public house."

The clockwork musician track number is a number that varies.
The clockwork musician track time is a number that varies.

When play begins (this is the initialize the clockwork musician rule): 
	sort the Table of the Clockwork Musician's Repertoire in random order;
	now the clockwork musician track number is 1;
	now the clockwork musician track time is a random number from 1 to 6.
	
When Day One begins:
	follow the initialize the clockwork musician rule.
	
When Day Two begins:
	follow the initialize the clockwork musician rule.

First every turn when the location is the Public House and ambience suppression is false (this is the clockwork musician playing rule):
	choose row clockwork musician track number in the Table of the Clockwork Musician's Repertoire;
	if the previous location is not the Public House:
		say "The clockwork musician is currently playing [article entry][track entry].";
	otherwise if the clockwork musician track time is 0:
		say "The clockwork musician finishes playing [if article entry is empty][otherwise]the [end if][track entry][run paragraph on]";
		let the old track entry be the track entry;
		if the clockwork musician track number is the number of rows in the Table of the Clockwork Musician's Repertoire:
			sort the Table of the Clockwork Musician's Repertoire in random order;
			now the clockwork musician track number is 1;
			say ", pauses as its cylinder rewinds,[run paragraph on]";
		otherwise:
			increment the clockwork musician track number;
		choose row clockwork musician track number in the Table of the Clockwork Musician's Repertoire;
		now the clockwork musician track time is a random number from 5 to 6;
		say " and starts on [article entry][track entry][if the old track entry is the track entry] again[otherwise][end if].";
	otherwise:
		decrement the clockwork musician track time.
		
Table of the Clockwork Musician's Repertoire
article	track
"the "	"[italic type]Planetaria[roman type] Overture"
"the "	"[italic type]Symphony of the Primes[roman type]"
"the "	"[italic type]Sonata Aquifera[roman type]"
"the "	"[italic type]Hunter's March[roman type]"
"the "	"[italic type]Verse of the Queen[roman type]"
"an "	"instrumental cover of [italic type]Amesha, Amesha[roman type]"
"an "	"instrumental cover of the [italic type]Cantata Caelestia[roman type]"
""	"Tristitas's [italic type]Concerto IX[roman type]"
""	"[italic type]Dance, Aurora[roman type]"
""	"[italic type]Trismegistus[roman type]"
""	"[italic type]Seasons' End[roman type]"
""	"[italic type]Magis Quam Amor[roman type]"
""	"[italic type]Alydia[roman type]"
""	"[italic type]Three Nights and a Day[roman type]"
""	"[italic type]Sutor's Lament[roman type]"
""	"[italic type]In Nomine[roman type]"
""	"[italic type]Volo[roman type]"
""	"[italic type]Fireflies[roman type]"
""	"[italic type]Ode to Levitus[roman type]"
"a "	"song you can't remember the name of"
"a "	"song you don't know"

Part 3.7.7 - Bartender

[The bartender is an NPC for Marid to confide in and get all weepy with. Originally you were able to buy food and a bottle of brandy from him as well, but they don't serve any function for the puzzles or the storytelling, so those sections have been commented out. I may add them in later if there's a good reason.]

The bartender is a mutant man in the Public House. "[one of]A smartly-dressed mutant[or]The bartender[stopping] is behind the counter polishing a glass[first time] -- this must be the new bartender[only].[if the previous location is not the Public House] He gives you a nod as you enter."
The description is "He looks to be one of the older generation of mutants, with few features that mark him as having once been human. He wears a dignified wooden mask and a tailcoat that has been modified to accommodate additional limbs."
The scent is "He smells of cologne."
Understand "new" or "smartly-dressed" or "cologne" as the bartender.

A dignified wooden mask is worn by the bartender.
The description is "Its simple lines evoke a man's face. It has become fashionable for mutants with unsightly mutations to wear these."
Understand "simple" or "line/lines" or "man's" or "face" or "carved" or "mouth" as the wooden mask.

A modified tailcoat is worn by the bartender.
The description is "He really is quite smartly-dressed."

Some bartender-tentacles are a privately-named thing part of the bartender. The printed name is "bartender's tentacles".
The description is "The bartender's anatomy is certainly very unique."
Understand "bartender's tentacle/tentacles" or "tentacle/tentacles" or "penduncle/penduncles" or "limb/limbs" or "additional" as the bartender-tentacles.

Instead of giving something to the bartender, say "The bartender shrugs."

Chapter 3.7.7.1 - Bartender Dialogue

Section 3.7.7.1.1 - Generic

Some dialogue branches are defined by the Table of Bartender Dialogue.

Instead of talking to the bartender when the player is not on the serving counter (this is the sit down before talking to the bartender rule):
	try silently entering the serving counter;
	say "You sit down at the serving counter. [run paragraph on]";
	continue the action.

Table of Bartender Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
bartender-dialogue	true	false	""	"'Hello[one of][or] again[stopping],' you say.

The bartender stops polishing his glass and regards you thoughtfully."	{bartender-dialogue-name, bartender-dialogue-newguy, bartender-dialogue-business, bartender-dialogue-drink, bartender-dialogue-nevermind}
bartender-dialogue-name	true	true	"'I don't believe we've met. My name is Marid.'"	"'I don't believe we've met,' you say. 'My name is Marid.'

The bartender bows and pantomimes a welcome."	{bartender-dialogue-cantspeak, bartender-dialogue-shakehands, bartender-dialogue-newguy, bartender-dialogue-business, bartender-dialogue-drink, bartender-dialogue-goodbye}
bartender-dialogue-shakehands	true	true	"'It's nice to meet you.' <Offer your hand.>"	"'It's nice to meet you.'

You offer your hand; the bartender bends and touches the wooden mouth of his mask to it."	{bartender-dialogue-name, bartender-dialogue-newguy, bartender-dialogue-business, bartender-dialogue-drink, bartender-dialogue-goodbye}
bartender-dialogue-newguy	true	true	"'You must be the new bartender.'"	"'You must be the new bartender.'

The bartender nods sagely."	{bartender-dialogue-name, bartender-dialogue-shakehands, bartender-dialogue-business, bartender-dialogue-drink, bartender-dialogue-goodbye}
bartender-dialogue-business	false	true	"'How's business?'"	"'How's business?' you ask.

The bartender pauses in thought, then makes a noncommittal gesture with his tentacle."	{bartender-dialogue-name, bartender-dialogue-newguy, bartender-dialogue-drink, bartender-dialogue-goodbye}
bartender-dialogue-cantspeak	true	true	"'You can't speak?'"	"'You can't speak?'

The bartender nods mournfully.

'I'm sorry,' you say, feeling slightly guilty."	{bartender-dialogue-name, bartender-dialogue-shakehands, bartender-dialogue-newguy, bartender-dialogue-business, bartender-dialogue-drink, bartender-dialogue-goodbye}
bartender-dialogue-drink	true	true	"<Order a drink.>"	"'I'd like a glass of spiced wine, please.'

The bartender measures out the wine, waters it down, and tosses it with a bag of spices before handing you the glass. You take your time to nurse the drink: it's sweet, with a pinch of nutmeg and other flavors you don't recognize.

Sweet and sad."	{bartender-dialogue-confide, bartender-dialogue-finishdrinksilent}
bartender-dialogue-confide	true	false	"<Get something off your mind.>"	"Your mind wanders to the things you've seen; the things you've done."	{bartender-dialogue-prologue, bartender-dialogue-dayone, bartender-dialogue-finishdrinksilent}
bartender-dialogue-finishdrink	true	false	"<Finish your drink.>"	"You down the last of your wine.

'Thanks for listening.'

The bartender takes the empty glass, and you feel a little better for having confided in him."	{bartender-dialogue-tip, bartender-dialogue-goodbye}
bartender-dialogue-finishdrinksilent	true	false	"<Finish your drink in silence.>"	"The bartender takes the empty glass with an understanding nod."	{bartender-dialogue-tip, bartender-dialogue-goodbye}
bartender-dialogue-tip	true	true	"<Tip the bartender.>"	"You tip the bartender and he bows."	{bartender-dialogue-goodbye}
bartender-dialogue-nevermind	true	false	"'Actually, never mind.'"	"'Actually, never mind.'

You stand up. The bartender shrugs and goes back to his business."	{}
bartender-dialogue-goodbye	true	false	"'See you soon.'"	"'See you soon.'

You stand up. The bartender goes back to his business; you suppose you should as well."	{}

The home dialogue branch of the bartender is bartender-dialogue. 
Before reading out bartender-dialogue-newguy: now the enabled of bartender-dialogue-business is true.
After reading out bartender-dialogue-goodbye: try silently getting off the serving counter.
After reading out bartender-dialogue-nevermind: try silently getting off the serving counter.
		
First instead of talking to the bartender when the enabled of bartender-dialogue-name is false and the enabled of bartender-dialogue-newguy is false and the enabled of bartender-dialogue-business is false and the enabled of bartender-dialogue-drink is false (this is the no bartender dialogue right now rule):
	say "You don't need anything from the bartender at present."
	
Section 3.7.7.1.2 - Prologue

Table of Bartender Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
bartender-dialogue-prologue	true	true	"'I watched a man die[if Prologue is happening] tonight[end if]...'"	"'I watched a man die[if Prologue is happening] tonight[otherwise], you know[end if],' you say quietly. 'It was just [if Day One is happening]yesterday[otherwise]around the corner[end if]. In Doctor Cavala's clinic.'

The bartender is silent as you take another sip.

'It all happened too fast. It was only when he collapsed on top of me that we knew, and -- and we rushed him to the surgery room. I was so scared. It was Doctor Cavala who steadied me... who believed we could cure him together. But he died on the gurney. He died just like that.'

You close your eyes.

'[if Prologue is happening or Day One is happening]We aren't even sure what he was suffering from... how he died[otherwise]He was the first. All this -- everyone else -- it all began with his death[end if]. But now... what can we do?'"	{bartender-dialogue-prologue2-1, bartender-dialogue-prologue2-2}
bartender-dialogue-prologue2-1	true	false	"'I became a physician because I wanted to save lives...'"	"You gaze into your glass, watching the wine swirl around and around.

'I became a physician because I wanted to save lives. I... I wanted to make a difference. But for every life I save -- every life we save -- it seems like a dozen people slip away from us. How is that fair? How is it worth it?

'They teach you in the Physicians['] College that you can't save everyone. It just isn't possible...'"	{bartender-dialogue-prologue3-1, bartender-dialogue-prologue3-2}
bartender-dialogue-prologue2-2	true	false	"'Doctor Cavala tried so hard to stabilize him...'"	"You gaze into your glass, watching the wine swirl around and around.

'Doctor Cavala tried so hard to stabilize him... and in the end, he died just the same. All our expertise, all our knowledge -- what is it in the face of death? What can we do against something like that? It seems so hopeless.

'They teach you in the Physicians['] College that you can't save everyone. It just isn't possible...'"	{bartender-dialogue-prologue3-1, bartender-dialogue-prologue3-2}
bartender-dialogue-prologue3-1	true	false	"'...but I keep wondering if we could have saved that man...'"	"'...but I keep wondering if we could have saved that man, if maybe we had done something different. And it's killing me inside.'"	{bartender-dialogue-finishdrink}
bartender-dialogue-prologue3-2	true	false	"'...and now I'm beginning to understand what they meant...'"	"'...and now I'm beginning to understand what they meant. There are so many people out there suffering, and only two of us... so maybe it's not our fault if we can't save everyone.

'Maybe that's just the way it is. And I have to accept that.'"	{bartender-dialogue-finishdrink}

Section 3.7.7.1.3 - Day One

When Walking Home in Fear begins (this is the Day One bartender dialogue rule):
	now the enabled of bartender-dialogue-drink is true;
	now the enabled of bartender-dialogue-dayone is true.

Table of Bartender Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
bartender-dialogue-dayone	false	true	"'Someone almost killed Doctor Cavala [if Day One is happening]tonight[otherwise if Day Two is happening]last night[end if]...'"	"'Someone almost killed Doctor Cavala [if Day One is happening]tonight[otherwise if Day Two is happening]last night[end if].'

The bartender sets down the glass he's polishing. He looks at you.

'It was so close.' you say quietly. 'She didn't know. There was a mutant woman who'd come into the clinic wielding a sword, and... and they fought. There was blood on the floor, blood everywhere, and -- and Doctor Cavala--'

You close your eyes.

'She almost didn't make it.'"	{bartender-dialogue-dayone2-1, bartender-dialogue-dayone2-2}
bartender-dialogue-dayone2-1	true	false	"'I was so scared...'"	"'I was so scared. I saw the gash that'd been torn in her leg. She was bleeding out. I... I grabbed the first aid bag, and--'

Your voice cracks.

'--I don't know. My hands were moving on their own. It seemed so easy at the time, but-- but--'

You feel the tears welling up, the sting and the panic and the terror engulfing you all over again."	{bartender-dialogue-dayone3-1, bartender-dialogue-dayone3-2}
bartender-dialogue-dayone2-2	true	false	"'The Vigiles were useless...'"	"'The Vigiles were useless. They didn't even come until everything was over. Doctor Cavala was [italic type]there,[roman type] and she was going to [italic type]die,[roman type] and--'

Your voice cracks.

'--And I had to save her. I took the first aid bag and put my hands on her leg and-- and--'

You feel the tears welling up, the sting and the panic and the terror engulfing you all over again."	{bartender-dialogue-dayone3-1, bartender-dialogue-dayone3-2}
bartender-dialogue-dayone3-1	true	false	"<Cry.>"	"You cry.

The voices around you hush. People are staring at you. You feel their eyes boring into you. You feel vulnerable, and you feel mortified, and you feel horribly, deeply sick inside.

[wait for any key]But no one says anything. No one ever does.

[wait for any key]You take a deep breath and wipe the tears from your cheeks. You take a fortifying swig from your glass."	{bartender-dialogue-dayone4-1, bartender-dialogue-dayone4-2}
bartender-dialogue-dayone3-2	true	false	"<Bite your lip.>"	"You bite your lip.

You're shaking. You're gripping your glass so tightly you're afraid it will shatter. There's blood in your mouth, and it's pooling around your tongue, and you feel horribly, deeply sick inside.

[wait for any key]But you don't cry. You won't cry. You [italic type]will not[roman type] cry.

[wait for any key]You take a deep breath and wipe the wetness from your eyes. You take a fortifying swig from your glass."	{bartender-dialogue-dayone4-1, bartender-dialogue-dayone4-2}
bartender-dialogue-dayone4-1	true	false	"'I'm going to do better next time...'"	"'I'm going to do better next time,' you whisper. 'I'm going to [italic type]be[roman type] better. I don't know why misfortune keeps following me, but I'm going to be stronger than it the next time, and the next.

'I'm going to overcome this. For Doctor Cavala and Horatio. For my parents who died so that I could live. I'm going to live, and I'm going to survive, and I'm going to find out what's really going on. Because... because after everything... everything that's happened--'

[wait for any key][if Day One is happening]You look at your bloodstained gloves[otherwise]You touch your pendant[end if].

'I can't allow it to have happened in vain.'"	{bartender-dialogue-finishdrink}
bartender-dialogue-dayone4-2	true	false	"'I'm going to find whoever did this...'"	"'I'm going to find whoever did this,' you whisper. 'I don't know who they are, or what they want, or why they want to spread this death and suffering. But I [italic type]will[roman type] hunt them down. And I [italic type]will[roman type] find them.

'For Doctor Cavala and Horatio. For my parents who died so that I could live. I'm going to live, and I'm going to survive, and I'm going to find out what's really going on. Because... because after everything... everything that's happened--'

[wait for any key][if Day One is happening]You look at your bloodstained gloves[otherwise]You touch your pendant[end if].

'I can't allow it to have happened in vain.'"	{bartender-dialogue-finishdrink}

Section 3.7.7.1.99 - The part I commented out
	
[bartender-dialogue-asksomething	true	false	"'I'd like to ask you about something else...'"	"'I'd like to ask you about something else...'

The bartender regards you curiously."	{bartender-dialogue-name, bartender-dialogue-newguy, bartender-dialogue-business, bartender-dialogue-menu2, bartender-dialogue-nevermind}
bartender-dialogue-menu	true	false	"'Could I see the menu?'"	"'Could I see the menu?' you ask.

The bartender [one of]points to the chalkboard mounted on the counter, which lists a variety of things you can order[or]obliges[stopping]."	{bartender-dialogue-buyfood, bartender-dialogue-buywine, bartender-dialogue-buybrandy, bartender-dialogue-asksomething}
bartender-dialogue-menu2	true	false	"'Actually, could I have another look at the menu?'"	"'Actually, could I have another look at the menu?'

The bartender obliges."	{bartender-dialogue-buyfood, bartender-dialogue-buywine, bartender-dialogue-buybrandy, bartender-dialogue-asksomething}
bartender-dialogue-buyfood	true	true	"<Order a meal.>"	"You order [one of]a frumenty of pheasant for one[or]a cold cut olive loaf[or]a Kardiapolitan salad[or]a salad of pheasant and egg[or]a continental pottage[in random order] and finish your meal without much fanfare. The bartender nods as you return the tray to the serving counter."	{bartender-dialogue-tip, bartender-dialogue-buywine, bartender-dialogue-buybrandy, bartender-dialogue-asksomething, bartender-dialogue-goodbye}
bartender-dialogue-buybrandy	true	true	"<Order a bottle of brandy.>"	"You count out fifty librae and hand them to the bartender. 'I'd like a bottle of brandy, please.'

The bartender gives you a look.

'It's not for myself,' you say. 'It's for swabbing wounds. We ran out of spirits at the clinic.'

The bartender seems satisfied. He takes his payment, produces a bottle of brandy from the bar, and deposits it into your hands."	{bartender-dialogue-tip, bartender-dialogue-buyfood, bartender-dialogue-buywine, bartender-dialogue-asksomething, bartender-dialogue-goodbye}]

Part 3.7.8 - Public House during Nine to Five Zombie

Instead of approaching the Public House when Nine to Five Zombie is happening, say "Doctor Cavala is at the clinic. You shouldn't keep her waiting."

Book 3.8 - Marid's Room

Marid's Room is a proper-named room. "[if time is not critical]Though this space of yours is small, you have done your best to furnish it with the comforts of home. [end if]In one corner is a dressing table, piled with stationery and assorted toiletries, and in another is the kitchenette. The only door leads back downstairs to the atrium."
Understand "my" or "own" or "house/home/dormitory/dorm/domicile" as Marid's Room. 

The simple-name is "your dormitory room".
The sound is "[if time is critical]Your heartbeat hammers in your ears.[otherwise]The muffled sounds of adjoining domiciles can be heard through the walls."
The scent is "[if time is critical]You smell your own sweat, your own fear.[otherwise]Your room smells clean enough."
The exit reminder is "[if time is critical]You can't go that way.[otherwise]You can take the stairs down to the atrium."

Before examining north in Marid's Room, try searching the dormitory window instead.
Before examining down in Marid's Room, try searching the dormitory window instead.
Before examining outside in Marid's Room, try searching the dormitory window instead.

Before going outside in Marid's Room, try going down instead.
	
Part 3.8.1 - Scenery

The high-rise buildings, the plaster walls, and the sky are in Marid's Room.

Instead of listening to the plaster walls in Marid's Room, say "[if time is critical]You don't have time for that.[otherwise]The muffled sounds of adjoining domiciles can be heard through the walls."

Some simple furnishings are scenery in Marid's Room.
The description is "Well, 'comforts' might be an exaggeration. But it's home."
The scent is "At least the air isn't dusty."
Understand "comfort/comforts" or "of" or "home" or "furnishing" or "space" or "small" or "corner/corners" or "air" or "dust" as the simple furnishings.

Part 3.8.2 - Dormitory Room Door

The dormitory room door is a scenery door. The dormitory room door is above the Dormitory Block and below Marid's Room. The printed name is "door to your dormitory room".
The description is "A simple wooden door."
Understand "my" or "marid's" or "to" or "simple" or "wooden" or "dorm" or "latch" or "peephole" as the dormitory room door.
Understand "exit" as the dormitory room door when the location is Marid's Room.

Before turning the dormitory room door, try opening the dormitory room door instead.
Instead of knocking on the dormitory room door, say "[if time is critical]This is not the time.[otherwise if the location is Marid's Room]What an odd idea.[otherwise]You live alone; there's no need to knock."
Instead of searching the dormitory room door, say "[if time is critical]You don't have time for that.[otherwise if the location is Marid's Room]You peer around outside, but find nothing of interest.[otherwise]You'd have to go in to take a closer look."
Instead of inserting the endoscope into the dormitory room door, say "You could just use the peephole."

Part 3.8.3 - Dressing Table

[The dressing table is for color. I may put other relevant things on the dressing table, such as a letter opener or something, if a puzzle requires it.]

The dressing table is a scenery supporter in Marid's Room.
The description is "You have little need for vanity, and so use the dressing table as a writing desk. A mirror and some delicate drawers are the only concession to its original purpose."
Understand "vanity" or "writing" or "desk" as the dressing table.
Before examining the dressing table when time is critical, try searching the dressing table instead.
Before inserting the endoscope into the dressing table, try searching the delicate drawers instead.

Instead of searching the dressing table, say "On the dressing table [is-are a list of things that are not the player on the dressing table]. The drawers of the dressing table [if the delicate drawers are open]contain [a list of things in the delicate drawers][otherwise]are closed[end if]."

Instead of pushing, pulling, or turning the dressing table, say "[if time is critical]You can't possibly move any of the furniture in time.[otherwise]There's no need to rearrange the furniture."

Report entering the dressing table: say "You sit at the dressing table."; stop the action.
Report getting off the dressing table: say "You stand up."; stop the action.
Rule for issuing the response text of room description heading rule response (B) when the player is on the dressing table (this is the print 'at the dressing table' rule):
	say " (at the dressing table)".

Chapter 3.8.3.1 - On the Dressing Table

The vanity mirror is scenery on the dressing table.
The description is "[if time is critical]This is not the time.[otherwise]A dark-haired young woman regards you with deep blue eyes, her tattoos sharp against the paleness of her skin."
Instead of looking under the mirror, say "There is nothing behind the mirror."
Before searching the mirror, try examining the mirror instead.

On the dressing table is a scenery thing called the pile of miscellaneous stationery and toiletries.
The description of the pile is "[if time is critical]None of these things matter right now.[otherwise]On the one hand, your pens, ink, medical texts, rent payments, paper correspondence; on the other, your toothbrush, toothpowder, comb, nail file, and other necessities of day-to-day living."
Understand "toiletry" or "assorted" or "my" or "marid's" as the toiletries.

Instead of looking under the toiletries, say "[if time is critical]Nothing.[otherwise]Under the stationery and toiletries is the dressing table."
Instead of pushing, pulling, or turning the toiletries, say "[if time is critical]That won't accomplish anything.[otherwise]That would just make a mess."
Instead of rubbing the toiletries, say "[if time is critical]This is not the time.[otherwise]You don't really have anywhere else to put your things."
Instead of searching or taking the toiletries, say "[if time is critical]Nothing here will help you.[otherwise]You don't need any of these things right now."

Some specific-pile-items are a privately-named scenery thing part of the toiletries. The printed name is "miscellaneous stationery and toiletries".
Understand "pen/pens" or "ink" or "medical" or "text/texts" or "rent" or "payment/payments" or "paper/papers" or "correspondence" or "toothbrush" or "toothpowder" or "comb" or "nail" or "file" or "necessity/necessities" or "and" or "my" or "marid's" as the specific-pile-items.
Before doing anything to the specific-pile-items, say "[if time is critical]That won't save you.[otherwise]That's not something you need to be concerned with." instead.
Before doing anything when the second noun is the specific-pile-items, say "[if time is critical]That won't save you.[otherwise]That's not something you need to be concerned with." instead.

Chapter 3.8.3.2 - Drawers

[I may put relevant things in the drawers later. For now though, there's only some laundry.]

Some delicate drawers are an openable closed scenery container part of the dressing table. Understand "drawer" as the delicate drawers.
Instead of examining the delicate drawers, say "The drawers are [if the delicate drawers are open]open, revealing [a list of things in the delicate drawers][otherwise]closed[end if]."
Before pulling the delicate drawers, try opening the delicate drawers instead.
Before pushing the delicate drawers, try closing the delicate drawers instead.

The folded clothing is a wearable thing in the delicate drawers. The indefinite article is "some".
The description is "[if time is critical]It isn't relevant right now.[otherwise]It's just your spare clothing."
Understand "marid's" or "my" or "spare" as the folded clothing.

Instead of looking under or searching the folded clothing, say "There is nothing in the folded clothing."
Instead of inserting the endoscope into the folded clothing, say "There is nothing in the folded clothing."
Instead of taking the folded clothing, say "[if time is critical]That will only slow you down.[otherwise]You don't need a change of clothes right now."
Instead of pulling, pushing, or turning the folded clothing, say "That won't accomplish anything."
Instead of rubbing or smelling the folded clothing, say "[if time is critical]This is not the time.[otherwise]It's freshly laundered."
Before going from Marid's Room when the delicate drawers are open and time is not critical (this is the Marid is OCD enough to close her drawers rule):
	say "(first closing the drawers)";
	now the delicate drawers are closed;
	continue the action.

Part 3.8.4 - Kitchenette

[The kitchenette is here mainly for color, because it makes sense that the dormitory domicile would come with facilities for cooking. The stove and cold closet help with worldbuilding and hint at Marid's pyrophobia. I have no plans to use them as part of a puzzle right now, but that may change. If they end up being umimportant, I should put something in the cold closet, like medication or something, so it doesn't seem like Marid has a random empty fridge.]

The kitchenette is scenery in Marid's Room.
The description is "[if time is critical]You see nothing that will help you.[otherwise]You are a more diligent disciple of the [italic type]ars vitalis[roman type] than the [italic type]ars coquinae,[roman type] and so the hooks here are bare. Nevertheless, the kitchenette is equipped with a stove and a cold closet."
Understand "kitchen" as the kitchenette.
Instead of entering the kitchenette, say "There is no space to sit there."
Instead of searching the kitchenette, say "A stove and a cold closet are the only things of note."

The kitchen hooks are scenery in Marid's Room.
The description is "[if time is critical]Those won't help you right now.[otherwise]They remind you of the ribs of some small animal. A rat, perhaps."
Understand "hook" as the kitchen hooks.
Instead of putting something on the kitchen hooks, say "[The noun] won't fit on the hooks."

Some glyphs of caloric conduction are a scenery thing part of the kitchenette.
The description is "[if time is critical]Those won't help you right now.[otherwise]Ever since a friend inscribed these glyphs for you, the savings on ice have been considerable."
Understand "complex" or "glyph" or "inscribed" or "pathway/pathways" as the glyphs of caloric conduction.
Instead of searching the glyphs of caloric conduction, say "[if time is critical]This is not the time.[otherwise]You're no sigiler, but nothing seems out of the ordinary."
Instead of touching the glyphs of caloric conduction, say "[if time is critical]This is not the time.[otherwise]You can feel heated air flowing over the inscribed pathways."

Chapter 3.8.4.1 - Stove and Cold Closet

The flameless stove is an openable closed scenery container part of the kitchenette.
The description is "[if time is critical]That won't help you right now.[otherwise]Anything placed in this cast-iron apparatus is heated without flame, thanks to the complex glyphs which funnel warmth to it from the cold closet."
The scent is "The stove has no smell, as it uses neither fuel nor flame."
Understand "cast-iron" or "cast iron" or "apparatus" as the flameless stove.
Instead of burning or switching on the flameless stove, say "It's a flameless stove."
Instead of knocking on or touching the flameless stove, say "You would burn your hand if you did that."
Instead of searching the flameless stove, say "[if time is critical]This is not the time.[otherwise]Nothing is inside."

Instead of opening the flameless stove, say "[if time is critical]That won't help you right now.[otherwise]You don't need to cook anything at the moment.[end if]".
Instead of inserting something into the flameless stove, say "[if time is critical]This is not the time.[otherwise]What a strange notion."

[Check inserting something into the flameless stove (this is the can't put most things in the stove rule):
	say "[if time is critical]You don't have time for that.[otherwise]No; the heat would damage [the noun].";
	stop the action.]
	
The cold closet is an openable closed scenery container part of the kitchenette.
The description is "[if time is critical]That won't help you right now.[otherwise]A simple wooden closet, internally cooled by glyphs that siphon heat from it to the stove." Understand "icebox" or "fridge" or "refrigerator" or "ice" or "empty" or "box" or "cream" or "ice-cream" or "jar/jars" as the cold closet.
Instead of searching the cold closet, say "[if time is critical]This is not the time.[otherwise]Nothing in there but empty ice-cream jars."
Instead of touching the cold closet, say "[if time is critical]This is not the time.[otherwise]It's cold to the touch."

Instead of opening the cold closet, say "[if time is critical]That won't help you right now.[otherwise]You aren't hungry, and there's no wine in the cold closet.[end if]".
Instead of inserting something into the cold closet, say "[if time is critical]This is not the time.[otherwise]What a strange notion."

Part 3.8.5 - Marid's Bed

Marid's bed is a privately-named enterable fixed in place supporter in Marid's Room. "[if time is critical]Moonlight streams through the window above your bed.[otherwise]Your bed is at the end of the room, beside the window."
The printed name is "your bed".
The description is "[if time is critical]You could easily climb out the window using your bed as a step.[otherwise]It looks warm and inviting."
Understand "my" or "marid's" or "bed" or "bedding" or "mattress" as Marid's bed.

Instead of bed-making Marid's bed, say "[if time is critical]This is not the time.[otherwise if Walking Home in Darkness is happening]It's usual to make one's bed [italic type]after[roman type] one has slept in it.[otherwise]Your bed is already made."
Instead of entering Marid's bed, try sleeping.
Instead of inserting the endoscope into Marid's bed, say "Nothing is in the bedding. You'd know if there was."
Instead of pushing, pulling, or turning Marid's bed, say "[if time is critical]You can't possibly move any of the furniture in time.[otherwise]There's no need to rearrange the furniture."
Instead of knocking on or touching Marid's bed, say "[if time is critical]This is not the time.[otherwise]The mattress is soft and springy."
Instead of searching or looking under Marid's bed, say "[if time is critical]There is nowhere to hide.[otherwise]There is nothing but dust under the bed."
Instead of rubbing or smelling Marid's bed, say "[if time is critical]This is not the time.[otherwise]The bedding is still quite clean."

Part 3.8.6 - Dormitory Window

[Eventually, Marid is going to have to abscond through this window for Midnight.]

The dormitory window is an open unopenable scenery door. It is north of Marid's Room and south of the Placeholder Chase Area.
The description is "It's a simple square opening without a pane or a grille. A shadowed rooftop can be seen through it."
The sound is "[if time is critical]This is not the time.[otherwise]You hear the murmuring of the city."
The scent is "[if time is critical]This is not the time.[otherwise]Though you can't see the condemned block from here, a trace of its ash lingers in the air."
Understand "dorm" as the dormitory window.
Before climbing the dormitory window, try entering the dormitory window instead.
Instead of searching the dormitory window, say "You can see little except the view of the rooftop."
Instead of knocking on or touching the dormitory window, say "There's no pane or grille in the window."

Before going through the dormitory window when Midnight is not happening, say "[if Midnight has not happened]There might one day be an extraordinary situation when you would consider braving the fall. Today is not that day.[otherwise]The memories are still fresh. You have no desire to relive them." instead.

The view of the shadowed rooftop is faraway scenery in Marid's Room.
The description is "It might be the roof of one of the condemned buildings north of here."
Understand "roof" or "condemned" or "condemned building" as the rooftop view.
Before entering the rooftop view, try entering the dormitory window instead.

Part 3.8.7 - Housekeeping

[Before going from Marid's Room while time is not critical (this is the tidy up the house before going rule):
	tidy up the house.
	
Before sleeping in Marid's Room while time is not critical (this is the tidy up the house before sleeping rule):
	tidy up the house.
	
To tidy up the house:
	let L be a list of things;
	if the flameless stove is open:
		try silently closing the flameless stove;
		add the flameless stove to L;
	if the cold closet is open:
		try silently closing the cold closet;
		add the cold closet to L;
	if L is not empty and the player is staid, say "(first closing [L with definite articles])[command clarification break]".]

Part 3.8.8 - Marid's Room during Prologue

Chapter 3.8.8.1 - Go to Sleep, Marid

sleeping-reminder-shown is a truth state that varies. sleeping-reminder-shown is false.

 Before reading a command when the player is in Marid's Room and sleeping-reminder-shown is false and Prologue is happening (this is the trigger the Prologue sleeping reminder rule):
	say "You feel tired. Weary.[paragraph break]";
	now sleeping-reminder-shown is true.

First instead of sleeping in Marid's Room during Walking Home in Darkness (this is the Prologue sleeping in Marid's bed rule):
	say "It's been a long day.

You drape your jacket over the head of your bed and settle beneath the covers. Your room fades away as you will your eyes to close. But still your mind drifts, draws you back into the tides of memory, where you can only watch --[paragraph break]";
	wait for any key;
	say "[italic type]-- watch the shimmer of the surgery room; watch Reden's eyes close a thousand times; watch the lights all around --[paragraph break]";
	wait for any key;
	say "-- dancing like --[paragraph break]";
	wait for any key;
	say "[roman type]-- flames --[paragraph break]";
	wait for any key;
	unveil Day One.
	
To unveil Day One: [This is a phrase so we can refer to it when skipping to Day One.]
	clear the screen;
	say "[paragraph break][paragraph break][paragraph break][paragraph break][line break]";
	center "D A Y   O N E";
	wait for any key;
	clear the screen;
	now Reden is on the mortuary slab;
	follow the scene changing rules;
	say "You wake in a cold sweat. The bells of Miller's Gate are ringing.";
	now Marid's bed is undescribed;
	now yourself is in Marid's Room;
	now Marid's bed is described;
	say "Far off, the bells continue to ring: four, five, six, seven. Seven in the morning. You're lucky you haven't overslept. You quickly get dressed and run through your morning routine -- Doctor Cavala will be waiting for you at the clinic."
	
Part 3.8.9 - Marid's Room during Day One

Instead of listening to Marid's Room during Nine to Five Zombie, say "The bells have stopped ringing."

Chapter 3.8.9.1 - Go to Sleep, Marid (Again)

First instead of sleeping in Marid's Room during Walking Home in Fear (this is the Day One sleeping in Marid's bed rule):
	say "You change out of your clothes and curl up beneath the sheets. But sleep does not come easily.

You close your eyes and drift in that listless limbo between wakefulness and slumber. A ticking like a clock echoes in your mind, behind your eyelids, like a promise you've forgotten and cannot remember.[paragraph break]";
	wait for any key;
	say "You barely notice when the world melts away -- when it dissolves, fades, becomes a haze of images and memories.[paragraph break]";
	wait for any key;
	say "Your last thought before you fall asleep is a quiet realization--[paragraph break]";
	wait for any key;
	say "the ticking in your mind is the sound of teeth.[paragraph break]";
	wait for any key;
	unveil Day Two.
	
Part 3.8.10 - Marid's Room during Day Two

Chapter 3.8.9.1 - Rude Awakening

To unveil Day Two:
	clear the screen;
	say "[paragraph break][paragraph break][paragraph break][paragraph break][line break]";
	center "D A Y   T W O";
	wait for any key;
	[to be continued;
	stop;]
	clear the screen;
	now start-of-day-two is true;
	follow the scene changing rules;
	say "A knocking at the door jolts you awake.[paragraph break]";
	say "'Marid?' comes Horatio's voice.";
	start a dialogue with Horatio using dialogue horatio-d2msg-home.
	
Some dialogue branches are defined by the Table of Horatio's Day Two Messenger Dialogue.

Table of Horatio's Day Two Messenger Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
horatio-d2msg-home	true	false	""	""	{horatio-d2msg-ignore, horatio-d2msg-answer}
horatio-d2msg-ignore	true	false	"<Ignore the knocking.>"	"The knocking continues[one of].[or].

'Marid? Are you there?'[or].

You're starting to feel guilty about not answering the door.[or].[stopping]"	{horatio-d2msg-ignore, horatio-d2msg-answer}
horatio-d2msg-answer	true	false	"<Answer the door.>"	"You clamber out of bed, throw on your jacket, and shuffle up to the door."	{horatio-d2msg-peek, horatio-d2msg-horatio, horatio-d2msg-whatisit, horatio-d2msg-opendoor}
horatio-d2msg-peek	true	true	"<Look through the peephole.>"	"A peep reveals a Horatio who looks as tired and disheveled as you are."	{horatio-d2msg-horatio, horatio-d2msg-whatisit, horatio-d2msg-opendoor}
horatio-d2msg-horatio	true	false	"'Horatio?'"	"'Horatio?'

'Marid! So you [italic type]do[roman type] live here.' He sounds relieved. 'Marid, listen. There's been trouble. Doctor Cavala wants you to come down to the clinic as soon as you can.'"	{horatio-d2msg-whatsgoingon, horatio-d2msg-whattrouble, horatio-d2msg-bethere}
horatio-d2msg-whatisit	true	false	"'What is it?'"	"'What is it?'

'Marid! So you [italic type]do[roman type] live here.' He sounds relieved. 'Marid, listen. There's been trouble. Doctor Cavala wants you to come down to the clinic as soon as you can.'"	{horatio-d2msg-whatsgoingon, horatio-d2msg-whattrouble, horatio-d2msg-bethere}
horatio-d2msg-opendoor	true	true	"<Open the door.>"	"[if the enabled of horatio-d2msg-peek is true]A twist of the latch reveals a Horatio who looks as tired and disheveled as you are[otherwise]You open the door and come face to face with him[end if].

'Marid! So you [italic type]do[roman type] live here.' He looks relieved. 'Marid, listen. There's been trouble. Doctor Cavala wants you to come down to the clinic as soon as you can.'"	{horatio-d2msg-whatsgoingon, horatio-d2msg-whattrouble, horatio-d2msg-bethere}
horatio-d2msg-whatsgoingon	true	false	"'What's going on?'"	"You're wide awake now. 'What's going on?'

'We've gotten wind of more deaths in the Channelworks District.[if the enabled of horatio-d2msg-opendoor is false]' Horatio grimaces. '[otherwise] [end if]Doctor Cavala thinks they all died of the same disease as Reden. People are saying it's an epidemic--'

[wait for any key]'Oh Primes--'

'I know. Come down as soon as you can. The doctor will fill you in.'

[wait for any key]Horatio[if the enabled of horatio-d2msg-opendoor is false] disappears[otherwise]'s footsteps disappear[end if] down the stairs. You hurry through your morning routine and slip your boots on."	{}
horatio-d2msg-whattrouble	true	false	"'Trouble? What kind of trouble?'"	"You're wide awake now. 'Trouble? What kind of trouble?'

'Big trouble.[if the enabled of horatio-d2msg-opendoor is false]' Horatio grimaces. '[otherwise] [end if]We've gotten wind of more deaths in the Channelworks District, and Doctor Cavala thinks they all died of the same disease as Reden. People are saying it's an epidemic--'

[wait for any key]'Oh Primes--'

'I know. Come down as soon as you can. The doctor will fill you in.'

[wait for any key]Horatio[if the enabled of horatio-d2msg-opendoor is false] disappears[otherwise]'s footsteps disappear[end if] down the stairs. You hurry through your morning routine and slip your boots on."	{}
horatio-d2msg-bethere	true	true	"'I'll be there.'"	"'I'll be there.'

'See you at the clinic.'

Horatio[if the enabled of horatio-d2msg-opendoor is false] disappears[otherwise]'s footsteps disappear[end if] down the stairs. You hurry through your morning routine and slip your boots on."	{}

After reading out horatio-d2msg-opendoor: now the dormitory room door is open.

Book 3.9 - Via Terminalis, West Street

Via Terminalis West Street is a proper-named room in Outdoors. "You are adrift in the bustle of crowds and carriages, a raucous river that runs through the blood-vessel streets. Signage advertises a profusion of shops and services amid the sounds of leather rollers and stitching machines. In the distant mist, the Bilious Canal spills from the Channelworks into the heart of the city.

The Via runs from west to southeast, where it bridges the canal. A condemned block is visible to the north. A hanging banner obscures an alley to the southwest, and a footpath follows the canal to the south."
It is east of the West End.
The printed name is "Via Terminalis, West Street".

The simple-name is "the West Street".
The sound is "The city buzzes around you like a hive."
Before smelling the West Street, try smelling the mist instead.
The exit reminder of the West Street is "You can go west up the Via Terminalis, southeast to the bridge, north to the condemned block, southwest to the crooked alley, or south following the canal."
The going-in disambiguation of the West Street is "Do you mean going north (to the condemned block) or going southwest (to the crooked alley)?"

Before examining north in the West Street, try examining the view of the condemned block instead.
Before examining northeast in the West Street, try examining the view of the Channelworks instead.
Before examining east in the West Street, try examining the Bilious Canal instead.
Before examining southeast in the West Street, try examining the view of the bridge instead.
Before examining south in the West Street, try examining the view of the footpath instead.
Before examining southwest in the West Street, try examining the hanging banner instead.
Instead of examining west in the West Street, say "The Via Terminalis continues in that direction."
Instead of examining outside in the West Street, say "It's unclear where you want to look."
Instead of examining inside in the West Street, say "It's unclear where you want to look."

Before going east in the West Street, try going southeast instead.

Part 3.9.1 - Scenery

The high-rise buildings, the street-lamps, the mist, the various shops, the city crowd, the Via Terminalis, the view of the condemned block, the Bilious Canal, the view of the Channelworks, the view of the bridge, the view of the footpath, and the Upper Perioch ambience are in the West Street.
Before entering the view of the condemned block in the West Street, try going north instead.
Before entering the view of the bridge in the West Street, try going southeast instead.
Before entering the view of the footpath in the West Street, try going south instead.

Understand "street/streets/river" as the city crowd when the location is the West Street.

Some sounds of commercial machinery are faraway scenery in the West Street.
Understand "leather/-- roller/rollers" or "stitching/-- machine/machines" as the sounds of commercial machinery.
Instead of listening to the sounds of commercial machinery, say "The machines clank and whirr and hiss like a metal menagerie."
Instead of doing anything when the noun is the sounds of commercial machinery or the second noun is the sounds of commercial machinery, say "The machines aren't here, though their sounds can be heard."

Part 3.9.2 - Hanging Banner

The hanging banner is an open unopenable scenery door. It is southwest of the West Street and northeast of the Crooked Alley.
The description is "The banner is an advertisement for a night market, now three weeks out of date. You can't see much behind it."
The scent is "You smell a hint of foul smoke coming from the alley."
Understand "advertisement" or "alley" as the hanging banner.
Instead of searching the hanging banner, say "You can't see much behind the banner."
Instead of touching the hanging banner, say "The banner is ragged and covered in dust."

After going through the hanging banner while the player is staid: say "You duck under the banner..."; continue the action.

Part 3.9.3 - West Street during Day One

Chapter 3.9.3.1 - Guards on the Thoroughfare

Some guards on the thoroughfare are a human person in the West Street. "Some civic guards are keeping vigil on the thoroughfare. Among them you see your friend, Horatio."
The description of the guards on the thoroughfare is "They cut an imposing figure in the black livery of the Philosophers['] Cabal. Your friend Horatio is among them."
Understand "civic" or "guard" or "vigil" or "vigile/vigiles" or "men" or "decanus" or "woman/women" or "black/-- livery" as the guards on the thoroughfare.
Instead of attacking or cutting the guards on the thoroughfare, say "That would only get you arrested."
Instead of searching the guards on the thoroughfare, say "There's Horatio, winking at you while the decanus isn't looking."

Instead of talking to the guards on the thoroughfare:
	now journal-riggertown-detour-known is true;
	now ambience suppression is true;
	say "[one of]'Excuse me, officer,' you ask one of the guards. 'Do you know the way to the basilica?'

The guard points southeast. 'Cross the bridge and you'll see it.'

'What about Riggertown? How do I get there?'

'Well, the footpath is closed at the moment, miss, so I'd advise waiting until tomorrow if you have business in Riggertown.' He scratches his chin. 'The only other way is through the Shanty Quarter, and that's no place for a lady like you to be. No offense, of course.'

'I see,' you say. 'You've been a big help.'[or]'Have you seen anything interesting lately?' you ask one of the guards.

'Not that I can tell,' she replies. 'But don't worry, miss. You'll be safe with us around.'[or]You shouldn't bother the guards too much. They have a job to do, after all.[stopping]".

Chapter 3.9.3.2 - Despawning the Guards on the Thoroughfare

When Cavala's Errands ends (this is the despawn Horatio and the guards at the end of Cavala's Errands rule):
	now Horatio is nowhere;
	now the guards on the thoroughfare are nowhere.

Chapter 3.9.3.3 - Horatio during Day One

Horatio is in the West Street.
	
Before knocking on, squeezing, or touching Horatio during Day One, try talking to Horatio instead.

Instead of talking to Horatio when Cavala's Errands is happening and the enabled of horatio-dayone-intro is false, say "You shouldn't. Any more chat and he'll be told off for shirking duty."
	
Section 3.9.3.3.1 - Horatio's Day One Dialogue

Some dialogue branches are defined by the Table of Horatio's Day One Dialogue.

Table of Horatio's Day One Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
horatio-dayone-intro	true	true	""	"You smile at him. 'Good morning, Horatio.'

He grins. 'Hey, Marid. Out and about early?'"	{horatio-dayone-samething, horatio-dayone-errand}
horatio-dayone-samething	true	false	"'I should be asking you the same thing...'"	"'I should be asking you the same thing,' you say dryly. 'You're up unusually early. Did your mother force you to get out of bed?'

'Hey! I'll have you know I wake up on time now.' He scratches his tousled hair. 'Mostly. It was that or water-closet duty for another week.'

'Is that why I haven't seen you around recently?'

'Um, yes... yes it is.'"	{horatio-dayone-vigiles, horatio-dayone-errand, horatio-dayone-seeyou}
horatio-dayone-vigiles	true	true	"'How is life in the Vigiles?'"	"'How is life in the Vigiles?'

Horatio folds his arms. 'I've hardly done anything. It's been nothing but closet-scrubbing and guard duty. I thought I'd had enough of that after boot camp.'

'I know the feeling.'

'I'm getting antsy, you know?' He drums his fingers on the hilt of his saber. 'I want to be out there stopping burglaries and giving criminals what for. Not standing around. I want to see some [italic type]action[roman type] once in a while.'"	{horatio-dayone-errand, horatio-dayone-seeyou}
horatio-dayone-errand	true	true	"'I'm on an errand for Doctor Cavala...'"	"'I'm on an errand for Doctor Cavala,' you explain. 'I'm on my way to deliver some documents to the basilica.'

'No wonder you looked like you were in a hurry,' Horatio muses. 'Well, I shan't hold you up. You do know the way, don't you?'

'Even if I didn't, I'd know better than to ask you.'

He hangs his head. 'Fair enough.'"	{horatio-dayone-vigiles, horatio-dayone-seeyou}
horatio-dayone-seeyou	true	false	"'See you soon, Horatio.'"	"'See you soon, Horatio.'

'You too, Marid.'

You hug each other goodbye, and he returns to his post."	{}

The home dialogue branch of Horatio is horatio-dayone-intro.

Chapter 3.9.3.4 - Blocking the Bridge during Returning to a Break-In

returning-breakin-bridgeblock-quipped is a truth state that varies.

Instead of going to the Via Terminalis Bridge when Returning to a Break-In is happening:
	if returning-breakin-bridgeblock-quipped is true:
		say "The bridge is blocked by a cleaning crew, and you can't cross.";
	otherwise:
		now returning-breakin-bridgeblock-quipped is true;
		now the Via Terminalis Bridge is goto-impassable;
		if exterminators-profession-known is true:
			say "[path-walked so far]You follow the Via Terminalis southeast, only to discover that the bridge is blocked by a cleaning crew. It seems one of the exterminators['] demijohns ruptured on their way out of the district. ";
		otherwise:
			say "[path-walked so far]You follow the Via Terminalis southeast, only to discover that the bridge is blocked by a cleaning crew. It seems there's been a spill of dangerous caustic alkali, and you can't cross. ";
		say "[paragraph break]You have no recourse but to retrace your footsteps.";
		now ambience suppression is true;

The bridge cleaning crew is a faraway scenery thing.
The description is "It's almost as though events conspire to make your life difficult."
The sound is "The crew sounds tired and exasperated."
Understand "spill" or "of" or "dangerous" or "caustic" or "alkali" or "blockage" or "exterminator/exterminators" or "demijohn/demijohns" as the bridge cleaning crew.

When Returning to a Break-In begins (this is the spawn the bridge cleaning crew rule):
	now the bridge cleaning crew is in the West Street.
	
When Returning to a Break-In ends (this is the despawn the bridge cleaning crew rule):
	now the Via Terminalis Bridge is goto-passable;
	now the bridge cleaning crew is nowhere.
	
Part 3.9.4 - West Street during Day Two

Chapter 3.9.4.1 - Hubbub during The Game is Afoot

weststreet-gameafoot-quipped is a truth state that varies.

First every turn when the location is the West Street and The Game is Afoot is happening and weststreet-gameafoot-quipped is false:
	say "'That poor doctor!' you overhear someone in the crowd say. 'What is the world coming to?...'";
	now weststreet-gameafoot-quipped is true;
	now ambience suppression is true.

Book 3.10 - Crooked Alley

The Crooked Alley is a proper-named room in Outdoors. "A thin, twisting thread that winds between buildings. Rubbish accumulates around pipes and corners, not quite blocking the smoking vents of underground distilleries.

You can escape by a gap between buildings to the north or a hanging banner to the northeast."

The simple-name is "the crooked alley".
The sound is "You hear boilers and underground machinery."
The scent is "You take a deep breath and instantly regret it."
The exit reminder is "You can return to the Via Terminalis by going north or northeast."
Instead of going outside in the Crooked Alley, say "Do you mean going north (to the west end) or northeast (to the west street)?"

Before examining north in the Crooked Alley, try searching the gap between buildings instead.
Before examining northwest in the Crooked Alley, try searching the hanging banner instead.
Before examining south in the Crooked Alley, try examining the smoking vents instead.
[Before examining inside in the Crooked Alley, try examining the lit vent instead.]
Instead of examining outside in the Crooked Alley, say "The alley opens out into the Via Terminalis."

Part 3.10.1 - Scenery

The high-rise buildings, the mist, and the view of the Via Terminalis are in the Crooked Alley.
Instead of entering the view of the Via Terminalis in the Crooked Alley, say "Do you mean going north (to the west end) or northeast (to the west street)?"

The rubbish is scenery in the Crooked Alley. The indefinite article is "some". The description is "Broken chairs, cracked kitchenware, and other urban detritus." Understand "broken" or "chair/chairs" or "cracked" or "kitchenware" or "urban" or "detritus" as the rubbish.
Instead of pushing or pulling the rubbish, say "You find nothing of interest."
Instead of taking the rubbish, say "You've no use for any of it."

Some smoking vents are scenery in the Crooked Alley. The description is "The south wall of the alley is lined with fume-spewing vents." Understand "south/-- wall" or "fume/smoke" or "spewing" or "fume-spewing" or "underground" or "distillery/distilleries" as the smoking vents.
Instead of opening or entering the smoking vents, say "You don't think that will be very productive."
Instead of searching the smoking vents, say "You can't see much through the smoke."
Instead of inserting the endoscope into the smoking vents, say "You can't see much through the smoke."
Instead of smelling the smoking vents, say "Breathing in the smoke makes you feel ill, and you stop for fear of poisoning yourself."
Instead of listening to the smoking vents, say "You hear bubbling, hissing, clanking."

There is a plural-named scenery thing in the Crooked Alley called some pipes and corners. The description is "It seems like the alley is nothing but pipes and corners."
Instead of climbing or entering the pipes and corners, say "The pipes are too thin and flimsy to climb."

[A lit vent is a fixed in place thing in the Crooked Alley. "A sliver of light seems to be shining from one of the vents." The description is "The vent bends at an angle that makes it impossible to see out of the other aperture." Understand "sliver" or "of" or "light" or "conversation" or "bar/bars" or "one" or "of the/--" as the lit vent.
Instead of opening or entering the lit vent, say "The vent is securely barred."
Instead of inserting something into the lit vent, say "That won't fit through the bars."
Instead of searching the lit vent, say "The vent curves out of sight towards an unseen light source."
Instead of smelling the lit vent, say "The hot air rushing from the lit vent is bearable, at least."
Instead of listening to the lit vent, say "You hear muffled conversation, but can make out nothing more."

The lit vent is a puzzle you solve with the endoscope. I haven't actually figured out where to put this puzzle in the narrative though. I might scrap the vent and replace it with something else.]

Book 3.11 - Condemned Block

There is a proper-named room in Outdoors called the Condemned Block. "Here crouch the blackened husks of buildings, now little more than skeletons awaiting demolition. A chained-up gate bars access to the plot.

The only remaining path leads south, back to the lights of the Via Terminalis."
The Condemned Block is north of the West Street.

The simple-name is "the condemned block".
Before listening to the Condemned Block, try listening to the view of the condemned block instead.
Before smelling the Condemned Block, try smelling the view of the condemned block instead.
The exit reminder is "The Via Terminalis lies to the south."

Before examining north in the Condemned Block, try examining the view of the condemned block instead.
Before examining inside in the Condemned Block, try examining the view of the condemned block instead.
Instead of examining outside in the Condemned Block, say "The Via Terminalis lies to the south."
Instead of examining south in the Condemned Block, say "The Via Terminalis lies that way."
Before going inside in the Condemned Block, try going north instead.
Before going outside in the Condemned Block, try going south instead.

Part 3.11.1 - Scenery

The street-lamps, the view of the condemned block, and the view of the Via Terminalis are scenery in the Condemned Block.
Before entering the view of the Via Terminalis in the Condemned Block, try going south instead.

Part 3.11.2 - Chained-Up Gate

The chained-up gate is a closed scenery door. It is north of the Condemned Block and southeast of the Placeholder Chase Area.
The description is "The gate is crisscrossed with chains and rusted shut."
Understand "chain/chains/chained" or "up" as the chained-up gate.

Instead of attacking the chained-up gate, say "The gate doesn't budge."
Instead of climbing the chained-up gate, say "There are not enough handholds, and the gate is too high."
Instead of cutting the chained-up gate, say "It would take months to saw through the gate with your scalpel alone."
Instead of opening the chained-up gate when the chained-up gate is closed, say "The gate won't open."

Book 3.12 - Following the Canal

Following the Canal is a proper-named room in Outdoors. "Glittering waters roar alongside the footpath you stand on, running from north to south in an ever-restless torrent. North lies the Via Terminalis, and beyond it the mouth of the Channelworks; to the south, the path descends by steps and turns, ending in the algae and grime of Upper Riggertown."
It is south of the West Street.
Understand "footpath" as Following the Canal.

The simple-name is "the footpath following the canal".
Before listening to Following the Canal, try listening to the Bilious Canal instead.
Before smelling Following the Canal, try smelling the Bilious Canal instead.
The exit reminder is "You can go north to the Via Terminalis or south to Riggertown."
The going-in disambiguation is "Do you mean going north (to the Via Terminalis) or going south (to Riggertown)?"

Instead of examining north in Following the Canal, say "The Via Terminalis lies that way."
Before examining northeast in Following the Canal, try examining the view of the Channelworks instead.
Before examining east in Following the Canal, try examining the Bilious Canal instead.
Before examining southeast in Following the Canal, try examining the Bilious Canal instead.
Before examining south in Following the Canal, try examining the view of Riggertown instead.
Before examining down in Following the Canal, try examining the canalside manhole instead.
Instead of examining inside in Following the Canal, say "It's unclear where you want to look."
Instead of examining outside in Following the Canal, say "It's unclear where you want to look."
Before going outside in Following the Canal, try going inside instead.
Before going down in Following the Canal, try entering the canalside manhole instead.

Part 3.12.1 - Scenery

The high-rise buildings, the street-lamps, the mist, the view of the Via Terminalis, the Bilious Canal, the view of the Channelworks, the view of the bridge, and the view of Riggertown are scenery in Following the Canal.
Before entering the view of the Via Terminalis in Following the Canal, try going north instead.
Before entering the view of Riggertown in Following the Canal, try going south instead.

The canalside manhole is an openable open faraway undescribed fixed in place container in Following the Canal. "[if the current day is Day One and exterminators-profession-known is true]The exterminators have finished their work. The cordon is gone, and the manhole is shut once more.[otherwise if the canalside manhole is open]There is an open manhole here, leading down into darkness.[otherwise]A closed manhole is recessed into the footpath."
The description is "[if the exterminators are in Following the Canal]Industrial-grade hoses run down into the open manhole. Flashes of lamplight are occasionally visible from within.[otherwise if the canalside manhole is open]You can't see anything in the gloom.[otherwise]The manhole is securely closed."
The sound is "[if the exterminators are in Following the Canal]You hear grunting and sizzling.[otherwise]You hear rushing water below."
The scent is "[if the canalside manhole is open]It smells, unsurprisingly, like a sewer.[otherwise]You can't smell anything while the manhole is closed."
The canalside manhole can be barred or unbarred. The canalside manhole is barred.
Before searching the canalside manhole, try examining the canalside manhole instead.
Instead of entering the canalside manhole when the canalside manhole is closed, say "The manhole is closed."
Instead of opening the canalside manhole when the canalside manhole is closed and the canalside manhole is barred, say "The manhole won't budge."
Instead of throwing something at the canalside manhole when the exterminators are in Following the Canal, say "You don't think [the exterminators] would appreciate that."

Part 3.12.2 - Following the Canal during Day One

Chapter 3.12.2.1 - Exterminators and the Work Cordon

Some exterminators are a hostile mixed-race man in Following the Canal. "[if exterminators-profession-known is false]Some civic work appears to be[otherwise]An extermination is[end if] in progress here[first time], much to your dismay[only]. Men in work coats guard an open manhole, and the way to Riggertown is completely cordoned off."
The printed name is "[if exterminators-profession-known is true]exterminators[otherwise]workmen".
The description is "[one of]Upon closer examination, t[or]T[stopping]he men are professional exterminators from Ciccus's Hunting Company. They sport armored coats and rank insignia, and they bear hoses hooked up to reinforced demijohns."
Before smelling the exterminators, try smelling the dangerous alchemical apparatus instead.
Understand "exterminator" or "in work/-- coat/coats" or "workman/workmen" or "civic" or "work" as the exterminators.
Instead of attacking or cutting the exterminators, say "That seems more likely to land you in prison than in Riggertown."
Instead of kissing or squeezing the exterminators, say "[one of]You give the nearest of the men a peck on the cheek, but he remains unmoved. 'I'm flattered, miss,' he says, 'but I can't let you through.'[or]You've already tried that.[stopping]".
Instead of giving the purse to the exterminators, say "You don't have nearly enough money on you for a bribe."

exterminators-profession-known is a truth state that varies.
After examining the exterminators: now exterminators-profession-known is true; continue the action.

Instead of talking to the exterminators:
	say "[one of]'Excuse me--'

'Not now, miss,' the foremost of the men says gruffly. 'We're investigating reports about a dangerous infestation of acidic slimes. Not to worry, you understand. We'll have this sorted out in a jiffy and be on our way.'[or]'I really need to get to Riggertown,' you say. 'Could you let me through, just this once?'

The foremost exterminator shakes his head. 'I'm afraid not, miss. We're working with dangerous substances here. For your own safety, I can't let you past the cordon.'[or]You won't be able to persuade the men. Perhaps there's another route elsewhere.[stopping]";
	now exterminators-profession-known is true.

Some armored coats are worn by the exterminators.
The description is "Big, bulky garments, styled more in the fashion of the soldier than the alchemist."
Understand "work/-- coat/coats" as the armored coats.

The Ciccus's Hunting Company rank insignia is part of the armored coats. The indefinite article is "some".
The description is "It appears Ciccus's Company is not so different from a military company."
Understand "ranks" as the rank insignia.
Before doing anything other than examining to the rank insignia, now the noun is the armored coats.
Before doing anything when the second noun is the rank insignia, now the noun is the armored coats.

Some dangerous alchemical apparatus is carried by the exterminators.
The description is "The demijohns are labeled VOLATILE ALKALI - DANGER - CAUSTIC."
The scent is "Even from here, the scent of ammonia is unmistakable."
Understand "equipment" or "demijohn/demijohns" or "hose/hoses" or "substance/substances" or "ammonia" or "caustic" or "volatile" or "alkali" as the dangerous alchemical apparatus.

The work cordon is privately-named scenery in Following the Canal.
The printed name is "cordon".
The description is "It doesn't look like you'll be getting through it."
Understand "cordon" as the work cordon.
Before smelling the work cordon, try smelling the dangerous alchemical apparatus instead.
Before climbing or entering the work cordon, try going south instead.

Chapter 3.12.2.2 - Blocked Passage and Set Flags

After going to Following the Canal for the first time:
	now the enabled of cavala-errands2-footpath is true;
	now the enabled of censor-woken-detour is true;
	continue the action.

Instead of entering the canalside manhole in Following the Canal when the exterminators are in Following the Canal, say "[The exterminators] stop you before you cross the cordon."

Instead of going south in Following the Canal when the exterminators are in Following the Canal, say "[one of][The exterminators] stop you with a stern look.[or]You get as far as a third of the way before you are politely restrained and returned to the north side of the cordon.[or]It's too difficult to sneak past [the exterminators]. Perhaps there's another route elsewhere.[stopping]".

Chapter 3.12.2.3 - Despawning the Exterminators

When Cavala's Errands ends (this is the despawn the exterminators and close the manhole rule):
	now the exterminators are nowhere;
	now the work cordon is nowhere;
	now the canalside manhole is not faraway;
	now the canalside manhole is closed;
	now the canalside manhole is described;
	continue the action.

Book 3.13 - Via Terminalis Bridge

The Via Terminalis Bridge is a proper-named room in Outdoors. "Here the voices and bustle wash over the arches and cobblestones. Mist rises from the Bilious Canal below, tarnishing the wayside statues green and gray, and fading into the fog and the overcast sky.

The Via Terminalis stretches away to the northwest and southeast, while a clandestine stairway descends to the south."
The Via Terminalis Bridge is southeast of the West Street.

The simple-name is "the Via Terminalis bridge".
The sound is "The traffic runs beside, and the water runs below."
Before smelling the Via Terminalis Bridge, try smelling the Bilious Canal instead.
The exit reminder of the Via Terminalis Bridge is "You can follow the Via Terminalis northwest or southeast, or you can descend south by the canalside steps."

Before going inside in the Via Terminalis Bridge, try going south instead.
Before examining north in the Via Terminalis Bridge, try examining the view of the Channelworks instead.
Before examining northeast in the Via Terminalis Bridge, try examining the view of the Channelworks instead.
Before examining south in the Via Terminalis Bridge, try examining the clandestine stairway instead.
Before examining inside in the Via Terminalis Bridge, try examining the clandestine stairway instead.
Before examining down in the Via Terminalis Bridge, try examining the Bilious Canal instead.
Instead of examining northwest in the Via Terminalis Bridge, say "The Via Terminalis continues in that direction."
Instead of examining southeast in the Via Terminalis Bridge, say "The Via Terminalis continues in that direction."
Instead of examining outside in the Via Terminalis Bridge, say "It's unclear where you want to look."

Before going west in the Via Terminalis Bridge, try going northwest instead.
Before going east in the Via Terminalis Bridge, try going southeast instead.

Part 3.13.1 - Scenery

The mist, the street-lamps, the Bilious Canal, the Via Terminalis, the clandestine stairway, the city crowd, the view of the Channelworks, the view of Riggertown, the view of the basilica, and the Upper Perioch ambience are in the Via Terminalis Bridge.
Before entering the clandestine stairway in the Via Terminalis Bridge, try going south instead.

Some bridgeway arches are scenery in the Via Terminalis Bridge. The indefinite article is "the".
The description is "They bear glyphs of locomotion in electrum filigree."
Understand "arch" as the bridgeway arches.

Some annotated glyphs of locomotion are part of the bridgeway arches.
The description is "You know they're glyphs of locomotion because they've been annotated in a more recent hand."
Understand "electrum" or "filigree" or "annotation/annotations" or "more" or "recent" or "hand" as the annotated glyphs of locomotion.
Instead of knocking on, rubbing, or touching the annotated glyphs of locomotion, say "The glyphs thrum with power."

Some cobblestones along the bridge are scenery in the Via Terminalis Bridge. The indefinite article is "the".
The description is "The stones have been smoothed by decades of traffic."
Understand "cobblestone" or "cobble/cobbles" or "stone/stones" or "floor" or "ground" as the cobblestones along the bridge.
Instead of entering the cobblestones along the bridge, say "You're standing on the bridge."
Instead of looking under the cobblestones along the bridge, say "The Bilious Canal rushes below."

Some statues of the Chorus Metallis are scenery in the Via Terminalis Bridge. The printed name is "statues of the [italic type]Chorus Metallis[roman type]".
The description is "Plaques identify the statues as personifications of the [italic type]Chorus Metallis:[roman type] Lead, Tin, Iron, Copper, Quicksilver, Silver, and Gold[first time]. You could examine them in closer detail if you wished[only]."
Understand "statue" or "plaque/plaque" or "personification/personifications" as the statues of the Chorus Metallis.

The statue of Lead is scenery in the Via Terminalis Bridge.
The description is "A woman scowling into a mirror black as night."
Understand "mirror" or "black" or "woman" as the statue of Lead.

The statue of Tin is scenery in the Via Terminalis Bridge.
The description is "A man frozen in rage, striking Iron with a gleaming white mace."
Understand "gleaming" or "white" or "mace" or "man" as the statue of Tin.

The statue of Iron is scenery in the Via Terminalis Bridge.
The description is "A steadfast woman raising her shield against Tin's attack."
Understand "woman" or "steadfast" or "shield" as the statue of Iron.

The statue of Copper is scenery in the Via Terminalis Bridge.
The description is "An anguished man bearing two staves, one pointing up, the other down."
Understand "anguished" or "man" or "staff/staves" or "pointing up/down/--" as the statue of Copper.

The statue of Quicksilver is scenery in the Via Terminalis Bridge.
The description is "A woman scrying in a bowl of water, her eyes alight with revelation."
Understand "woman" or "bowl" or "of/-- water in/inside/-- the/--" or "eyes" or "mercury" as the statue of Quicksilver.

The statue of Silver is scenery in the Via Terminalis Bridge.
The description is "A kneeling man, pensive, with his sword held horizontal."
Understand "man" or "kneeling" or "pensive" or "horizontal" or "sword" as the statue of Silver.

The statue of Gold is scenery in the Via Terminalis Bridge.
The description is "A woman, blindfolded and holding a lantern to her heart."
Understand "woman" or "blindfolded/blindfold" or "lantern" or "heart" as the statue of Gold.

Book 3.14 - Via Terminalis Junction

The Via Terminalis Junction is a proper-named room in Outdoors. "Traffic revolves every which way around this old-fashioned rotunda, tracing the ancient alchemical lines inscribed on the stonework. An armillary sphere rotates in the center of the junction and guides carriages according to its lights.

The Via Terminalis runs northwest to the bridge and southeast to Miller's Gate. A colonnade to the north marks the entrance of the Channelworks. To the east lies the Turris Infinita, and to the south can be seen the grand forum."
It is southeast of the Via Terminalis Bridge.
Understand "rotunda" as the Via Terminalis Junction.

The simple-name is "the Via Terminalis junction".
The sound is "The armillary sphere thrums with excitement."
The scent is "The heady mist is tinctured with dust from the carriages."
The exit reminder is "You can follow the Via Terminalis northwest to the bridge or southeast to Miller's Gate. The Channelworks concourse lies north, the Turris Infinita lies east, and the grand forum lies south."
The going-in disambiguation is "Do you mean going north (to the Channelworks concourse) or going east (to the Turris Infinita)?"

Before going west in the Via Terminalis Junction, try going northwest instead.
Before examining north in the Via Terminalis Junction, try examining the view of the Channelworks instead.
Before examining east in the Via Terminalis Junction, try examining the view of the Turris Infinita instead.
Before examining south in the Via Terminalis Junction, try examining the view of the grand forum instead.
Before examining west in the Via Terminalis Junction, try examining the view of the bridge instead.
Before examining northwest in the Via Terminalis Junction, try examining the view of the bridge instead.
Instead of examining inside in the Via Terminalis Junction, say "It's unclear where you want to look."
Instead of examining outside in the Via Terminalis Junction, say "It's unclear where you want to look."

Part 3.14.1 - Scenery

The high-rise buildings, the street-lamps, the mist, the city crowd, the Via Terminalis, the Bilious Canal, the view of the Channelworks, the view of the bridge, the view of Miller's Gate, the view of the colonnades, the view of the Turris Infinita, the view of the grand forum, and the Upper Perioch ambience are in the Via Terminalis Junction.
Before entering the view of the Channelworks in the Via Terminalis Junction, try going north instead.
Before entering the view of the bridge in the Via Terminalis Junction, try going northwest instead.
Before entering the view of the Turris Infinita in the Via Terminalis Junction, try going east instead.
Before entering the view of the grand forum in the Via Terminalis Junction, try going south instead.
Before entering the view of Miller's Gate in the Via Terminalis Junction, try going southeast instead.

Some lines crisscrossing the junction are scenery in the Via Terminalis Junction.
The description is "An impossibly complex pattern of glyphs, circuitous and winding underfoot. You could study it for years and never uncover all its intricacies."
Understand "alchemical" or "stonework" or "inscription/pattern" or "glyph/glyphs" or "ancient/circuitous/winding" or "line" or "rotunda" as the crisscrossing lines.
Instead of searching the crisscrossing lines, say "You're no sigiler, but nothing seems out of the ordinary."
Instead of looking under the crisscrossing lines, say "The lines are embedded in the stonework."

An armillary sphere is scenery in the Via Terminalis Junction.
The description is "This device of whirling rings directs carriage traffic around the junction."
The sound is "It thrums with every revolution."
Understand "device" or "ring/rings" or "light/lights" as the armillary sphere.
Instead of attacking or cutting the armillary sphere, say "That would only get you arrested."
Instead of inserting something into the armillary sphere, say "You'd be arrested for obstructing traffic if you did that."
Instead of climbing, pushing, pulling, rubbing, squeezing, swinging, touching, or turning the armillary sphere, say "The rings of the sphere are moving too fast for you to touch safely."
Instead of looking under the armillary sphere, say "The armillary sphere is in the center of the inscribed rotunda."

Part 3.14.2 - Junction during Day Two

Chapter 3.14.2.1 - The Black Banner

The trailing black banner is a fixed in place faraway thing.
"Above the Turris Infinita, a black banner casts its trailing shadow across the sky."
The description is "A black banner is traditionally put up when the head of the house has died."
The sound is "It flaps disconsolately."
Understand "shadow" or "mourning-banner" or "mourning" as the trailing black banner.

After writing a paragraph about the trailing black banner: now ambience suppression is true.

When Day Two begins (this is the spawn the black banner rule):
	now the trailing black banner is in the Junction.
	
When Day Two ends (this is the despawn the black banner rule):
	now the trailing black banner is nowhere.
	
Book 3.15 - Channelworks Concourse

The Channelworks Concourse is a proper-named room in Outdoors. "You stand before the fortress through which all waterways flow. Enormous colonnades line the concourse, flanked by selenite sentinels; hydra-like channels snake in patterns and merge into bas-reliefs of dizzying scale. Before the fosse, the statue of Reason bears aloft the Azoth.

[if the partition bridge is closed]The bridge is currently raised. You can only[otherwise]The bridge is lowered, providing passage across the fosse. You can go north to the Channelworks or[end if] return south to the rest of the district."
It is north of the Junction.

The simple-name is "the Channelworks concourse".
The sound is "The sounds of the city whirl around the Channelworks at their heart."
The scent is "The smell of incense lingers."
The exit reminder is "[if the partition bridge is open]The Channelworks lies to the north and t[otherwise]T[end if]he Via Terminalis junction lies to the south."

Before going outside in the Channelworks Concourse, try going south instead.
Before going down in the Channelworks Concourse, try swimming instead.
Before examining north in the Channelworks Concourse, try examining the façade of the Channelworks instead.
Before examining inside in the Channelworks Concourse, try examining the façade of the Channelworks instead.
Before examining down in the Channelworks Concourse, try examining the fosse instead.
Instead of examining south in the Channelworks Concourse, say "The Via Terminalis runs to the south."
Instead of examining outside in the Channelworks Concourse, say "The Via Terminalis runs to the south."

Part 3.15.1 - Scenery

The high-rise buildings, the street-lamps, the mist, the view of the Via Terminalis, and the Bilious Canal are in the Channelworks Concourse.
Before entering the view of the Via Terminalis in the Channelworks Concourse, try going south instead.

The façade of the Channelworks is scenery in the Channelworks Concourse. The indefinite article is "the".
The description is "The Channelworks is a truly awesome feat of engineering."
The sound is "It thrums with unimaginable power."
Understand "facade" or "fortress" as the façade of the Channelworks.
Before entering the façade of the Channelworks, try going north instead.
Instead of doing anything other than entering, examining, or listening to the façade of the Channelworks, say "You'll have to get closer to do that."
Instead of doing anything when the second noun is the façade of the Channelworks, say "You'll have to get closer to do that."

Some tremendous bas-reliefs are part of the façade of the Channelworks.
The description is "Carved upon the Channelworks are dozens upon dozens of vignettes from history and myth. All of them pertain to water and life."
Understand "bas-relief" or "bas" or "relief" or "vignette/vignettes" as the tremendous bas-reliefs.
Instead of searching the tremendous bas-reliefs, say "The detail is breathtaking."
Instead of doing anything other than examining, listening, or searching to the tremendous bas-reliefs, say "The bas-reliefs are high out of reach."
Instead of doing anything when the second noun is the tremendous bas-reliefs, say "The bas-reliefs are high out of reach."

Some hydra-like channels are scenery in the Channelworks Concourse.
The description is "Steaming water cycles around the fosse and washes into the Bilious Canal."
The sound is "Rushing, splashing, hissing."
The scent is "The water is pure."
Understand "water/waters" or "waterway/waterways" or "channel" or "steam" as the hydra-like channels.
Instead of searching or looking under the hydra-like channels, say "The water is rushing rapidly through the channels."
Instead of putting something on the hydra-like channels, say "That would get you arrested."
Instead of inserting something into the hydra-like channels, say "That would get you arrested."
Instead of touching the hydra-like channels, say "The water is steaming hot."

Some concourse colonnades are scenery in the Channelworks Concourse.
The description is "The pillars are taller than some buildings."
Understand "colonnade" or "pillar/pillars" as the concourse colonnades.
Instead of climbing the concourse colonnades, say "The pillars are are smooth and unimaginably high."

Some selenite sentinels are scenery in the Channelworks Concourse.
The description is "Golems of war. Not even Death fazes them."
The sound is "The sentinels are silent."
Understand "sentinel" or "war" or "golem/golems" or "war-golem/war-golems" or "animic/-- light" or "crystal" as the selenite sentinels.
Instead of attacking or cutting the selenite sentinels, say "Picking a fight with a platoon of war golems seems less than wise."
Instead of climbing the selenite sentinels, say "You have better things to do than that."
Instead of knocking on the selenite sentinels, say "Clink."
Instead of pushing, pulling, swinging, taking, or turning the selenite sentinels, say "You'd have better luck shifting the Channelworks."
Instead of searching the selenite sentinels, say "You can see the animic light pulsing within the crystal."
Instead of talking to the selenite sentinels, say "There is no response."

The fosse is faraway scenery in the Channelworks Concourse.
The description is "An immense water-filled moat bars access to the Channelworks."
The fosse has some text called the faraway response. The faraway response is "The water is out of reach."
Understand "moat" as the fosse.
Before entering the fosse, try swimming instead.
Before listening to the fosse, try listening to the hydra-like channels instead.
Instead of inserting something into the fosse, say "If you did that, you'd never get [regarding the noun][them] back."
Instead of throwing something at the fosse, say "If you did that, you'd never get [regarding the noun][them] back."

The statue of Reason is scenery in the Channelworks Concourse.
The description is "She is sculpted in the image of the Trismegistus. A cloak billows around her, and a blindfold hides her eyes."
Understand "image" or "trismegistus" or "her" or "cloak" or "blindfold" or "eyes" as the statue of Reason.

The replica of the Azoth is scenery in the Channelworks Concourse.
The description is "A representation of the Staff of the Philosophers that stands for the Ineffable Truth. Or so you were taught in school."
Understand "representation" or "staff" or "of" or "philosophers" or "ineffable" or "truth" as the replica of the Azoth.

Part 3.15.2 - Partition Bridge

The partition bridge is a scenery thing in the Channelworks Concourse.
The description is "Curving plates of orichalcum hover in midair over the fosse. You only know them to be parts of a bridge from watching workers cross back and forth."
Understand "curving" or "plate/plates" or "orichalcum" or "part/parts" or "glyph/glyphs" as the partition bridge.
Instead of looking under the partition bridge, say "You see only the churning fosse."
Instead of entering the partition bridge when the partition bridge is closed, say "The distance is too far to jump."
Instead of talking to the partition bridge, say "[one of][italic type]'Aperi!'[roman type] you command.[paragraph break]Nothing happens. Well, it was worth a try[or]You don't know the command word, if there is one[stopping]."
Instead of closing the partition bridge when the partition bridge is closed, say "The bridge is already raised."
Instead of searching the partition bridge when the partition bridge is closed, say "The parts of the bridge are covered in incomprehensible glyphs."
Instead of opening or taking the partition bridge when the partition bridge is closed, say "Yes, but how?"
Instead of pushing, pulling, squeezing, swinging, touching, or turning the partition bridge when the partition bridge is closed, say "The parts of the bridge are out of reach."

The partition bridge can be open or closed. The partition bridge is closed.

Understand "lower [something]" as opening when the location is the Channelworks Concourse.
Understand "raise [something]" as closing when the location is the Channelworks Concourse.

Instead of going north in the Channelworks Concourse when the partition bridge is closed, say "The bridge is up, and you don't know how to lower it."

Book 3.16 - Turris Infinita

There is a proper-named room called the Turris Infinita. "[if the Turris is in mourning]The atmosphere within the tower is utterly still. The lights that normally circle the mirrors have been dimmed, and the chandeliers overhead brood like thunderclouds.[otherwise]Mirrors cover every surface in this avant-garde tower, from the floors to the doors to the chandeliers. The porter's desk is framed in lights, while watchful gargoyles above gaze into infinity.[end if]

A hydraulic lift provides access to [if Day One is happening]the upstairs domiciles[otherwise]Doctor Arturus's upstairs domicile[end if]. Doctor Arturus's clinic is east, and the exit is to the west."

The simple-name is "the Turris Infinita".
The sound is "It's quiet. You could hear a pin drop."
The scent is "The air is cold and sterile."
The exit reminder is "You can take the lift up to [if Day One is happening]the domiciles[otherwise]Doctor Arturus's domicile[end if], go east to Doctor Arturus's clinic, or leave to the west."
The going-in disambiguation is "Do you mean going up (to [if Day One is happening]the domiciles[otherwise]Doctor Arturus's domicile[end if]) or going east (to Doctor Arturus's clinic)?"
Understand "foyer" as the Turris Infinita.

Before examining west in the Turris Infinita, try examining the ornate double doors instead.
Before examining outside in the Turris Infinita, try examining the ornate double doors instead.
Before examining up in the Turris Infinita, try examining the hydraulic lift instead.
Before examining east in the Turris Infinita, try examining the view of Doctor Arturus's clinic instead.
Before going north in the Turris Infinita, try going up instead.
Before going outside in the Turris Infinita, try going west instead.
Instead of examining inside in the Turris Infinita, say "It's unclear where you want to look."

Part 3.16.1 - Scenery

The view of Doctor Arturus's clinic is faraway scenery in the Turris Infinita. The indefinite article is "the".
The description is "There, the mirrors give way to marble and chrome."
The sound is "It's quiet."
Understand "marble" or "and" or "chrome" as the view of Doctor Arturus's clinic.
Before entering the view of Doctor Arturus's clinic, try going east instead.

Some innumerable mirrors are scenery in the Turris Infinita. The indefinite article is "".
The description is "You see yourself reflected a thousandfold. Your many faces blur together; your tattoos flow into a continuous tapestry."
Understand "mirror" or "many" or "face/faces" or "continuous" or "tapestry" or "floor/floors" as the innumerable mirrors.
Before searching the innumerable mirrors, try examining the innumerable mirrors instead.
Instead of attacking, cutting, or knocking on the innumerable mirrors, say "You would have to pay for the damage to the mirrors."
Instead of looking under the innumerable mirrors, say "They are fixed in place."
Instead of touching the innumerable mirrors, say "Your fingerprints stain the glass briefly, then evaporate without a trace."

Some elaborate crystal chandeliers are faraway scenery in the Turris Infinita.
The description is "Elaborate crystal chandeliers, suspended by invisible alchemical lines."
The elaborate crystal chandeliers have some text called the faraway response. The faraway response is "They're high out of reach."
Understand "chandelier" or "invisible" or "alchemical" or "line/lines" as the elaborate crystal chandeliers.

The porter's desk is scenery in the Turris Infinita. The indefinite article is "the".
The description is "[if the tremendous mess is in the Turris Infinita]The desk looks tidier now.[otherwise if the Turris is in mourning]The mourning-light has done nothing to improve the porter's complexion.[otherwise]It's difficult to imagine how anyone could work in that glare."
Understand "light/lights" or "chair" or "glare" as the porter's desk.
Understand "mourning" or "mourning-light" as the porter's desk when Day Two is happening.
Instead of pushing, pulling, swinging, taking, or turning the porter's desk, say "That is fixed in place."
Instead of entering, searching, or looking under the porter's desk, say "[if the tremendous mess is in the Turris Infinita]The look on the porter's face makes you reconsider.[otherwise]There's only one chair, and the porter's sitting in it."

Some security gargoyles are faraway scenery in the Turris Infinita.
The description is "These gargoyles are carved with sigiled masks and lifelike wings. They are utterly unmoving, but you don't doubt they could spring to life with a word from the porter."
The sound is "The gargoyles are utterly silent."
The security gargoyles have some text called the faraway response. The faraway response is "They're high out of reach."
Understand "gargoyle" or "sigiled" or "mask/masks" or "lifelike" or "wing/wings" as the security gargoyles.
Instead of talking to the security gargoyles, say "[one of]'Hello?' you offer.

There is no response, save an exasperated sigh from the porter. 'If you require assistance, miss, you should approach [italic type]me.[roman type] Not the gargoyles.'[or]These gargoyles don't seem like the kind for conversation.[stopping]".

Part 3.16.2 - Ornate Double Doors

Some ornate double doors are a scenery door. They are east of the Via Terminalis Junction and west of the Turris Infinita.
The description is "The doors of the Turris Infinita are as elaborate and futuristic as the rest of the building."
The sound is "[if the ornate double doors are closed]The doors block all sound.[otherwise if the location is the Turris Infinita]The sounds of the city filter in.[otherwise]Silence."
The scent is "[if the ornate double doors are closed]The doors block all scent.[otherwise if the location is the Turris Infinita]The smell of the city reaches you.[otherwise]The air within is impossibly clean."
Understand "door" as the ornate double doors.
Understand "exit" as the ornate double doors when the location is the Turris Infinita.
Instead of searching the ornate double doors, say "[if the ornate double doors are closed]The doors are closed and impenetrable.[otherwise if the location is the Turris Infinita]You see the Via Terminalis.[otherwise]The tower is lined with mirrors."

After deciding the scope of the player while the location is the Turris Infinita:
	if the ornate double doors are open:
		place the sky in scope;
		place the view of the Via Terminalis in scope.
	
Before listening to the view of the Via Terminalis in the Turris Infinita, try listening to the ornate double doors instead.
Before entering the view of the Via Terminalis in the Turris Infinita, try going west instead.

Before going when the location is the Via Terminalis Junction or the location is the Turris Infinita (this is the remember to close the Turris doors rule):
	let D be the door the noun from the location;
	if D is not the ornate double doors and the ornate double doors are open:
		if the player is staid, say "(first closing the ornate double doors)";
		now the ornate double doors are closed.

Part 3.16.3 - Hydraulic Lift

The hydraulic lift is an open unopenable scenery door. It is above the Turris Infinita.
The description is "A silvered contraption of telescoping pistons."
The sound is "The lift is not in use."
Understand "silvered" or "contraption" or "telescoping" or "piston/pistons" as the hydraulic lift.
Instead of opening, closing, switching on, or switching off the lift, say "The lift is of the automatic variety."

After going through the hydraulic lift when the player is staid: say "The lift bears you [if the previous location is the Turris Infinita]upward[otherwise]downward[end if]."; continue the action.

Part 3.16.4 - Porter

The porter is a hostile woman in the Turris Infinita.
The description is "A hawkish woman all in white. [if the Turris is in mourning]Her flashing spectacles make[otherwise]The glare on her spectacles makes[end if] it difficult to look at her directly."
The scent is "She smells as nondescript as the rest of the entrance hall. There isn't even a hint of perfume."
Instead of attacking or cutting the porter, say "As tempting as it is, you don't think that would end well for you."
Instead of giving the bundle of documents to the porter, say "Those aren't appointment papers, and it would be inconvenient if you turned them over to the basilica with the seal broken."
Instead of giving the purse to the porter, say "You doubt your bribe will impress her, considering where she works."

Some reflective spectacles are worn by the porter.
The description is "The spectacles magnify her mirthless expression."
Understand "glasses/eyeglasses" or "spectacle/specs" or "flashing" as the spectacles.

Part 3.16.5 - Turris Infinita during Day One

Chapter 3.16.5.1 - Porter during Day One

porter-firstgreeting-quipped is a truth state that varies.
Rule for writing a paragraph about the porter during Day One:
	if the previous location is not the Turris Infinita:
		if porter-firstgreeting-quipped is false:
			say "The porter smiles coldly as you enter. 'Welcome to the Turris Infinita. Do you require assistance?'";
			now porter-firstgreeting-quipped is true;
		otherwise:
			say "[one of]'Welcome to--' The porter breaks off. 'Oh. It's you again.'[or]The porter regards you coolly and silently.[stopping]";
	otherwise:
		say "The porter regards you coolly and silently.";

Some dialogue branches are defined by the Table of Porter Day One Dialogue.

Table of Porter Day One Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
porter-day1	true	false	""	"You approach the porter's desk. She looks at you, adjusts her glasses, and turns up her nose."	{porter-day1-hello, porter-day1-visiting, porter-day1-clinic, porter-day1-walkaway}
porter-day1-hello	true	true	"'Hello...?'"	"'Hello...?'

'Hello.' The porter's eyes bore into you. 'And what seems to be the problem?'"	{porter-day1-visiting, porter-day1-clinic, porter-day1-nevermind}
porter-day1-visiting	true	true	"'I'd like to visit a friend...'"	"'I'd like to visit a friend,' you say, trying not to blush. 'His... his name is Doctor Justinian Volontis.'

The porter hems and haws for a moment, peering into some aetheric display invisible to you. Then she tut-tuts.

'I'm afraid Doctor Justinian is not in,' she says. 'You will have to come another time.'"	{porter-day1-whenback, porter-day1-clinic, porter-day1-goodbye}
porter-day1-whenback	true	true	"'Do you have any idea when he'll be back?'"	"'Do you have any idea when he'll be back?'

The porter narrows her eyes. 'Miss, I am obliged to protect Doctor Justinian's privacy. Unless you can produce an official warrant, which you clearly do not possess, I suggest you turn your queries elsewhere.'"	{porter-day1-clinic, porter-day1-goodbye}
porter-day1-clinic	true	true	"'I'd like to enter Doctor Arturus's clinic.'"	"'I'd like to enter Doctor Arturus's clinic.'

'Very well.' The porter extends her hand. 'Your letter of appointment, if you please.'

'Um. I don't have one.'

She retracts her hand and gives you a condescending look."	{porter-day1-appointment, porter-day1-visiting, porter-day1-goodbye}
porter-day1-appointment	true	false	"'How do I make an appointment?'"	"'How do I make an appointment?'

The porter peers down her nose at you. 'Doctor Arturus entertains serious clients only. Prospective clients must contact him by correspondence at least three days in advance, or else pay an administrative fee of four talents.'

You fold your arms. '...And if I don't have the money for a correspondence license?'

'Then you don't have an appointment.' The porter leans back in her chair."	{porter-day1-visiting, porter-day1-goodbye}
porter-day1-walkaway	true	false	"<Walk away.>"	"You walk away. The porter rolls her eyes."	{}
porter-day1-nevermind	true	false	"'Nothing, never mind.'"	"'Nothing, never mind.'

'Then we are done here. Good day.'

You turn your back on the desk."	{}
porter-day1-goodbye	true	false	"'Goodbye, then.'"	"'Goodbye, then.'

'Good day to you.'

You turn your back on the desk."	{}

The home dialogue branch of the porter is porter-day1.

After reading out porter-day1: now journal-porter-talkedto is true.

Instead of talking to the porter when the enabled of porter-day1-visiting is false and the enabled of porter-day1-clinic is false, say "There's nothing to be gained in talking to her further."

Chapter 3.16.5.2 - Pissing Off the Porter and Getting Blacklisted

[If you mess around too much in the Turris Infinita, you get thrown out.]

Yourself can be a normal Turris Infinita guest, blacklisted by Turris Infinita security, cowed by Turris Infinita security, or cleared by Turris Infinita security. Yourself is a normal Turris Infinita guest.
once-blacklisted-always-blacklisted is a truth state that varies.
The porter can be mildly irritable or royally pissed off. The porter is mildly irritable.
turris-goingup-day1 is a truth state that varies.
turris-goingeast-day1 is a truth state that varies.
turris-knockingdesk-day1 is a truth state that varies.
turris-smellingdesk-day1 is a truth state that varies.
turris-touchingdesk-day1 is a truth state that varies.

Instead of going up in the Turris Infinita during Day One (this is the can't go up in the Turris during Day One rule):
	if turris-goingup-day1 is false:
		say "'If you intend to visit a resident,' the porter says pointedly, 'you would do well to check in at the desk.'";
		now turris-goingup-day1 is true;
	otherwise:
		say "You make for the lift anyway, but the porter has other ideas.[paragraph break]";
		evict the player from the Turris Infinita.
	
Instead of going east in the Turris Infinita during Day One (this is the can't go east in the Turris during Day One rule):
	if turris-goingeast-day1 is false:
		say "The porter clears her throat. 'Entrance to Doctor Arturus's clinic is by appointment only. I trust you have the necessary papers...?'";
		now turris-goingeast-day1 is true;
	otherwise:
		say "You make for the clinic anyway, but the porter has other ideas.[paragraph break]";
		evict the player from the Turris Infinita.

Instead of knocking on the porter's desk during Day One (this is the can't knock on the porter's desk during Day One rule):
	if turris-knockingdesk-day1 is false:
		say "You rap on the desk. It seems solid enough.

'Yes?' the porter asks testily.

'Um, nothing.'";
		now turris-knockingdesk-day1 is true;
	otherwise:
		piss off the porter.

Instead of smelling the porter's desk during Day One (this is the can't smell the porter's desk during Day One rule):
	if turris-smellingdesk-day1 is false:
		say "You smell nothing unexpected. But the porter is now giving you an incredulous look.";
		now turris-smellingdesk-day1 is true;
	otherwise:
		piss off the porter.

Instead of rubbing or touching the porter's desk during Day One (this is the can't touch the porter's desk during Day One rule):
	if turris-touchingdesk-day1 is false:
		say "The porter watches your investigation with disdain.";
		now turris-touchingdesk-day1 is true;
	otherwise:
		piss off the porter.

To piss off the porter:
	if the porter is mildly irritable:
		say "The porter coughs. 'That's quite enough. My patience is not without limits.'";
		now the porter is royally pissed off;
	otherwise:
		say "The porter has had quite enough of your antics. ";
		evict the player from the Turris Infinita.
		
To evict the player from the Turris Infinita:
	now the player is blacklisted by Turris Infinita security;
	now once-blacklisted-always-blacklisted is true;
	say "'Guards!' she calls. 'Show our guest out.'

Two gargoyles land to your left and right with a thud. They grab your arms and escort you out the doors, which slam behind you.[line break]";
	move the player to the Via Terminalis Junction, without printing a room description;
	now the ornate double doors are closed;
	wait for any key;
	try looking.
	
Instead of opening the ornate double doors when the player is blacklisted by Turris Infinita security (this is the blacklisted by Turris Infinita security during Day One rule):
	say "You have barely made it two steps in before the gargoyles recognize you and throw you out again.";
	now the player is cowed by Turris Infinita security.
	
Before going east in the Via Terminalis Junction when the player is cowed by Turris Infinita security, say "You don't really want to repeat that experience." instead.
Before opening the ornate double doors when the player is cowed by Turris Infinita security, say "You don't really want to repeat that experience." instead.
Before approaching the Turris Infinita when the player is cowed by Turris Infinita security, say "You don't really want to repeat that experience." instead.

Part 3.16.6 - Turris Infinita during Day Two

When Day Two begins (this is the un-blacklist the player in the Turris Infinita rule):
	now the player is cleared by Turris Infinita security.

To decide whether the Turris is in mourning: [This affects descriptions.]
	if Day Two is happening, decide yes;
	decide no.

Chapter 3.16.6.1 - The Game is Afoot Cutscene

Section 3.16.6.1.1 - Beginning the Cutscene

After approaching the Turris Infinita when The Game is Afoot is happening:
	say path-walked so far;
	say line break;
	perform the Game Afoot cutscene.

Last after going to the Turris Infinita when The Game is Afoot is happening and the player is staid:
	perform the Game Afoot cutscene.

To perform the Game Afoot cutscene:
	say "[line break][bold type]Turris Infinita[roman type][line break]";
	say "The atmosphere within the tower is utterly still. The lights that normally circle the mirrors have been dimmed, and the chandeliers overhead brood like thunderclouds. You find yourself treading softly, lightly -- as though if you took a wrong step, the whole glass tower would come crashing down.[paragraph break]";
	say "As you enter the foyer, two gargoyles land to your left and right. They move to seize your arms.[paragraph break]";
	wait for any key;
	if once-blacklisted-always-blacklisted is true:
		now the enabled of porter-afoot-apology is true;
		start a dialogue with the porter using dialogue porter-afoot-bhome;
	otherwise:
		now the enabled of porter-afoot-whyclosed is true;
		start a dialogue with the porter using dialogue porter-afoot-home.

Section 3.16.6.1.1 - Argument with the Porter

Some dialogue branches are defined by the Table of Porter Game Afoot Dialogue.

Table of Porter Game Afoot Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
porter-afoot-home	true	false	""	"'I am sorry to inform you that the Turris Infinita is now [italic type]closed.[roman type]' The porter regards you humorlessly. 'There is to be no trespassing -- no idle journalism--'

[wait for any key]Her lower lip curls.

'No [italic type]gawking.[roman type]'"	{porter-afoot-charmed, porter-afoot-whyclosed, porter-afoot-business}
porter-afoot-bhome	true	false	""	"[italic type]'You,'[roman type] the porter hisses. 'I should have known you would come back.'"	{porter-afoot-charmed, porter-afoot-apology, porter-afoot-business}
porter-afoot-charmed	true	true	"'I'm charmed.'"	"'I'm charmed.'

A hollow smile. 'I'm glad we could come to an understanding. Now, unless you have a good reason I shouldn't evict you this moment--'"	{porter-afoot-whyclosed, porter-afoot-apology, porter-afoot-business}
porter-afoot-whyclosed	false	true	"'Why is the Turris Infinita closed?'"	"'Why is the Turris Infinita closed?'

The porter folds her arms. 'I don't owe you an explanation. You, on the other hand...'"	{porter-afoot-charmed, porter-afoot-business}
porter-afoot-apology	false	true	"'I apologize for my conduct yesterday. I'm sorry.'"	"'I apologize for my conduct yesterday. I'm sorry.'

'Oh?' She wrinkles her nose. 'How very [italic type]contrite[roman type] of you. Do you expect a pardon? I'm afraid none is forthcoming.'"	{porter-afoot-charmed, porter-afoot-business}
porter-afoot-business	true	false	"'I'm here on business.'"	"'I'm here on business,' you say pointedly.

She rolls her eyes. 'You and every dullard that comes through these doors. Do I look as though I give a whit about your business? Which part of [']no trespassing['] do you not comprehend?'"	{porter-afoot-unreasonable, porter-afoot-showsignum}
porter-afoot-unreasonable	true	false	"'You're being completely unreasonable!'"	"'You're being completely unreasonable!'

The porter laughs. 'Unreasonable? Oh, that's rich! As if you had any inkling -- a mud-soaked vagrant like you--'

She leans back at her desk, and flashes you the most infuriating smirk.

'I have no obligation,' she tells you, 'to provide you [italic type]anything[roman type].'"	{porter-afoot-showsignum, porter-afoot-actuallyfuckyou}
porter-afoot-actuallyfuckyou	true	false	"'You know what? Screw you.' <Trash her desk.>"	"'You know what? [italic type]Screw you.'[roman type]

'Wha--'

You sweep the contents of her desk onto the floor. Pens, papers, tacks, inkpots -- all tumble in a sloshing splattering mess. The floor is carpeted in a remarkable stygian shade of ink.

[wait for any key]The gargoyles wrench your arms behind your back. The porter gives you a slowly erupting volcano of a glare.

[italic type]'You,'[roman type] she says. 'You [italic type]miserable fucking--'[roman type]

[Justinian's glorious entrance]"	{justinian-afoot-thanks, justinian-afoot-goodtosee, justinian-afoot-flirt}
porter-afoot-showsignum	true	false	"'Doctor Cavala has authorized me...' <Present the signum.>"	"You hold up the signum. 'Doctor Cavala has authorized me to investigate the death of Doctor Arturus in her stead. If you have a problem with that, you can take it up with Doctor Cavala.'

The porter's gaze falls on the slip of paper in your hand. The corner of her mouth twitches.

[wait for any key]'Is that so?' she says. 'I believe I [italic type]shall[roman type] take the matter up with her. Thank you for the kind offer, and [italic type]do[roman type] inform the good doctor to arrange a meeting at her earliest convenience. Until then... the gargoyles will escort you to the door.'

[wait for any key]Your face flushes. 'You--'

[Justinian's glorious entrance]"	{justinian-afoot-thanks, justinian-afoot-goodtosee, justinian-afoot-flirt}

After reading out porter-afoot-actuallyfuckyou (this is the spawn the tremendous mess rule):
	now the tremendous mess is in the Turris Infinita.

Section 3.16.6.1.1 - Justinian's Glorious Entrance

To say Justinian's glorious entrance:
	wait for any key;
	say "A curtain rattles open. Surgical boots click on glass.[paragraph break]";
	wait for any key;
	say "'What's going on here?' a smoky voice demands.[paragraph break]";
	wait for any key;
	say "You turn, and a young man with auburn hair is striding purposefully from the arch of Doctor Arturus's clinic. His coat ripples with natron filigree. There is an intensity in his expression, his visage.[paragraph break]";
	wait for any key;
	say "Your heart skips a beat.[paragraph break]";
	say "'D-- Doctor Justinian,' you say.[paragraph break]";
	wait for any key;
	say "'Marid?' He furrows his brow. '[italic type]Excubitores![roman type] Unhand this woman. She is a guest.'[paragraph break]";
	say "The gargoyles release you and vanish into the rafters. The porter looks accusingly at him.[paragraph break]";
	wait for any key;
	say "'Doctor Justinian,' she says. 'This is [italic type]exceedingly[roman type] irregular--'[paragraph break]";
	wait for any key;
	say "'Regulations be damned,' he replies. 'This is my [italic type]friend,[roman type] porter. I don't care what she's done. We'll have words about this later.'[paragraph break]";
	wait for any key;
	say "'But--'[paragraph break]";
	say "He holds up a hand, and the porter falls silent.[paragraph break]";
	wait for any key;
	say "'Good,' he says.[paragraph break]";
	wait for any key;
	say "He turns to you, and his voice loses its edge, grows gentle.[paragraph break]";
	wait for any key;
	say "'Marid,' he says. 'I thought you might be coming.' ";
	now the conversational partner text is "Talking to Justinian";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	redraw status line;

Section 3.16.6.1.1 - Justinian's Dialogue

Some dialogue branches are defined by the Table of Justinian Game Afoot Dialogue.

Table of Justinian Game Afoot Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
justinian-afoot-thanks	true	false	"'Thanks for that.'"	"'Thanks... thanks for that,' you say lamely.

'It's the least I can do.' He nods. 'Come with me. We can speak more freely in the clinic proper...'[line break][justinian-afoot-toclinic]"	{justinian-afoot-sorryabout, justinian-afoot-cantbelieve, justinian-afoot-cavalasentme}
justinian-afoot-goodtosee	true	false	"'It's good to see you, Doctor Justinian.'"	"'I-- It's good to see you,' you stutter. 'Doctor Justinian.'

Oh Primes, are you [italic type]blushing?[roman type] You're making a fool of yourself--

'It's just Justinian, remember?' He smiles. 'Come with me. We can speak more freely in the clinic proper...'[line break][justinian-afoot-toclinic]"	{justinian-afoot-sorryabout, justinian-afoot-cantbelieve, justinian-afoot-cavalasentme}
justinian-afoot-flirt	true	false	"'I wouldn't miss a chance to see you, Doctor Justinian.'"	"[italic type]I wo--[roman type]

No! No no no! That's much too forward. You wouldn't be caught dead saying that."	{justinian-afoot-thanks, justinian-afoot-goodtosee}

To say justinian-afoot-toclinic:
	move the player to Arturus's Clinic, without printing a room description;
	wait for any key;
	center "* * *";
	say paragraph break;
	say line break;
	wait for any key;
	redraw status line;
	say "[bold type]Arturus's Clinic[roman type][line break]";
	say "This upscale clinic exudes a muted elegance. Chrome fixtures are lit by surgically placed spotlights and underscored by dizzyingly intricate sigil-work. But you can't bring yourself to focus on your surroundings -- not when Justinian's hand feels so warm around yours, and demands so much of your attention.[paragraph break]";
	say "You know, intellectually, that it is normal for girls to develop crushes. That doesn't stop you from wanting to bury yourself in a hole right now. Why do you have to be so [italic type]awkward?[roman type][paragraph break]";
	wait for any key;
	say "Justinian leads you to a coffee table and gestures to one of the armchairs. 'Please,' he says. 'Take a seat.'[paragraph break]";
	wait for any key;
	say "You sit down, and he sits opposite you. His eyes -- those eyes! -- they study you. Troubled. Concerned.[paragraph break]";
	wait for any key;
	say "'This is about Doctor Arturus's death, I take it?' ";

Table of Justinian Game Afoot Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
justinian-afoot-sorryabout	true	true	"'I'm so sorry you have to go through this, Justinian.'"	"'I-- I'm so sorry you have to go through this, Justinian.'

He lowers his eyes. 'I appreciate it, Marid. Doctor Arturus -- I haven't always been on the best of terms with him. But he was like a father to me.'"	{justinian-afoot-cantbelieve, justinian-afoot-cavalasentme}
justinian-afoot-cantbelieve	true	true	"'I can't believe something like this is happening.'"	"'I can't believe something like this is happening.'

'I know what you mean.' Justinian shakes his head. 'Everything is happening so quickly -- and it's spiraling out of control. I imagine things will only get worse in the coming days...'"	{justinian-afoot-sorryabout, justinian-afoot-cavalasentme}
justinian-afoot-cavalasentme	true	false	"'Doctor Cavala sent me. We're investigating the disease that killed Doctor Arturus...'"	"'Doctor Cavala sent me,' you say. 'We're -- we're investigating the disease that killed Doctor Arturus. Now that we three are the only medical professionals in the district, we -- we have to work together. If we're going to get through this.'

Why are you blushing at a time like this? What is [italic type]wrong[roman type] with you?

[wait for any key]Justinian leans forward and clasps his hands. 'Marid,' he says. 'I wish I could be of more help, but I'm afraid last night took its toll on me -- I'm as clueless as you are. I don't know what I can provide that you don't already know...'

[wait for any key]You try to compose your thoughts."	{justinian-afoot-encourage, justinian-afoot-discovery, justinian-afoot-patients, justinian-afoot-disease, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-encourage	true	true	"'I believe in you, Justinian.'"	"[italic type]I--[roman type]

You can already feel the blood rising in your cheeks. Justinian-- you-- no. No!

You can't say it. You just can't."	{justinian-afoot-discovery, justinian-afoot-patients, justinian-afoot-disease, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-discovery	true	true	"'Can you tell me about how you discovered the body?'"	"'Can you... can you tell me about how you discovered the body?'

He shakes his head. 'It's all a blur. Doctor Arturus had cloistered himself in the back of the clinic. I was instructed not to disturb him -- he seemed fine when I left in the evening. It was only when he didn't turn up for work this morning that I thought...'

'...You thought something might have happened?'

'Exactly.' Justinian looks at his hands. 'When I called on him in his domicile -- the disease had taken him.'"	{justinian-afoot-patientrecords, justinian-afoot-cautious, justinian-afoot-patients, justinian-afoot-disease, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-patients	true	true	"'Can you tell me anything about Doctor Arturus's patients?'"	"'Can you tell me anything about Doctor Arturus's patients?'

Justinian's jaw hardens. 'I know very little,' he says. 'Doctor Arturus... even in this clinic, with his aide, he was circumspect about his clients. They looked like anyone else -- they were just people, like anyone else who might pass by the Turris Infinita. I'm afraid I can't help you more.'"	{justinian-afoot-patientrecords, justinian-afoot-cautious, justinian-afoot-discovery, justinian-afoot-disease, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-patientrecords	false	true	"'Do you know where the patient records are kept?'"	"You squirm in your seat. 'Do you know where the patient records are kept?'

He pauses in thought.

'Try Doctor Arturus's domicile,' he says. 'He was obsessed with control. It would be like him to have every record on hand.'"	{justinian-afoot-cautious, justinian-afoot-discovery, justinian-afoot-disease, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-disease	true	true	"'What are your thoughts on the disease?'"	"'What are your thoughts on... on the disease?'

A serious cast comes over Justinian's features, and he pauses before speaking.

'I know only that it is dangerous, Marid. It has killed dozens in mere days -- not even Doctor Arturus was safe, and he was the most cautious man I ever knew. If you plan to investigate this -- you must be careful, Marid. Very careful.'"	{justinian-afoot-patientrecords, justinian-afoot-cautious, justinian-afoot-discovery, justinian-afoot-patients, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-assassin	true	true	"'There was an attempt on Doctor Cavala's life. Do you have any idea why?'"	"'There was... there was an attempt on Doctor Cavala's life. Do you have any idea why?'

'Hmm?'

You relate your recollection of last night's events, and Justinian purses his lips.

'I don't know what that's all about,' he says. 'It sounds like Doctor Cavala is the one you should ask. Considering her involvement with the district's underworld... I wouldn't be surprised if some unfinished business came back to haunt her.'"	{justinian-afoot-patientrecords, justinian-afoot-cautious, justinian-afoot-discovery, justinian-afoot-patients, justinian-afoot-disease, justinian-afoot-lookaround}
justinian-afoot-cautious	false	true	"'Was Doctor Arturus a cautious man? Doctor Cavala didn't give me that impression.'"	"'Was Doctor Arturus a cautious man?' you ask. 'Doctor Cavala... didn't give me that impression.'

Justinian looks almost disappointed for a moment, and the look in his eyes breaks your heart.

'Doctor Cavala didn't know him like I did,' he says, quietly. 'Doctor Arturus was cautious -- perhaps too cautious.'"	{justinian-afoot-patientrecords, justinian-afoot-discovery, justinian-afoot-patients, justinian-afoot-assassin, justinian-afoot-lookaround}
justinian-afoot-lookaround	true	false	"'I'll look around the clinic. Perhaps I'll find something the Vigiles have missed.'"	"'I'll... I'll look around the clinic. Perhaps I'll find something the Vigiles have missed.'

You stand up a little too anxiously -- [italic type]no, Marid, you're blowing it[roman type] -- and then Justinian grabs your wrist and you react in an entirely unladylike fashion but his attention is focused completely on you.

'Marid,' he says.

[wait for any key]'J-- Justinian?'

'Be careful.' His voice is trembling. 'I don't want anything to happen to you. If -- if it's too dangerous -- you can just go back to Doctor Cavala. No one will begrudge you for it.'

[wait for any key]His words wrench at your heartstrings. For a moment you have the urge to hug him and forget about everything -- forget about blood, forget about tears, forget about the dying and the dead.

[wait for any key]But when you close your eyes, you know you'd never forgive yourself. Not for the rest of your life.

[wait for any key]'I'll be careful,' you tell him. 'Thanks, Justinian. I appreciate it.'

[wait for any key]He reluctantly lets go.

[wait for any key]You turn and make your way into the frigid light.[line break][look pending]"	{}

After reading out justinian-afoot-discovery:
	now clue-arturus-timeofdeath is true;
	now clue-arturus-discovery-justinian is true.
	
After reading out justinian-afoot-patients:
	now the enabled of justinian-4inv-patients is false;
	now the enabled of justinian-afoot-patientrecords is true;
	now the enabled of justinian-4inv-patientrecords is true.
	
After reading out justinian-afoot-patientrecords:
	now the enabled of justinian-4inv-patientrecords is false;
	now the enabled of justinian-4inv-patientrecords2 is true;
	now clue-patientrecords-justinian is true.
	
After reading out justinian-afoot-disease:
	now the enabled of justinian-afoot-cautious is true.

Chapter 3.16.6.2 - The Tremendous Mess and Porter during Four Investigations

The tremendous mess is a faraway scenery thing.
The description is "Oceans of ink. Mountains of stationery."
The tremendous mess has some text called the faraway response. The faraway response is "The porter's hands are already full with the mess. You'd best leave it alone."
Understand "ocean/oceans" or "of" or "ink" or "mountain/mountains" or "stationery" as the tremendous mess.

Rule for writing a paragraph about the porter when Four Investigations is happening:
	if the tremendous mess is in the Turris Infinita:
		say "The porter is on her hands and knees cleaning up the tremendous mess you made earlier. She appears to be steadfastly ignoring you.";
	otherwise:
		say "The porter is silent at her desk."
		
Instead of examining the porter during Four Investigations, say "She looks peeved."
Instead of attacking or cutting the porter when the tremendous mess is in the Turris Infinita, say "There's no need. She's already received her comeuppance."
Instead of talking to the porter when Four Investigations is happening, say "[one of]'Excuse me--'

She doesn't acknowledge your presence[or]The porter is ignoring you[stopping]."

When Four Investigations ends (this is the despawn the tremendous mess rule):
	now the tremendous mess is nowhere.

Book 3.17 - Grand Forum

There is a proper-named room in Outdoors called the Grand Forum. "[if Day One is happening]This immense paved square is alive with people of all kinds: couples, merchants, buskers. There are children flying their paper kites and old men watching the clouds drift by. A brilliant mural of Furopolis and Solphos hovers at the heart of it all[otherwise]Aside from the mural of Solphos, this immense paved square is largely deserted. There are no couples, no merchants, no buskers -- nothing except for a chilly breeze that you can feel in your bones[end if].

The arch of Miller's Gate rules the east, and the curving canal cradles the basilica to the west. From the northern Via Terminalis junction, the Via Mercurii splits off and travels south."
It is south of the Junction.

The simple-name is "the grand forum".
The sound is "[if Day One is happening]The sounds of music and laughter fill the forum[otherwise]You hear only the whistling of the wind[end if]."
The scent is "[if Day One is happening]You smell ice cream and flowers mingling in the mist[otherwise]You smell only the canal mist[end if]."
The exit reminder is "You can go east to Miller's Gate[if Day One is happening], west to the basilica,[end if] north to the Via Terminalis junction, or south along the Via Mercurii."

Before going inside in the Grand Forum, try going west instead.
Before examining west in the Grand Forum, try examining the view of the basilica instead.
Before examining inside in the Grand Forum, try examining the view of the basilica instead.
Before examining north in the Grand Forum, try examining the view of the junction instead.
Instead of examining east in the Grand Forum, say "Miller's Gate rises triumphant in the mist."
Instead of examining outside in the Grand Forum, say "It's unclear where you want to look."
Before examining south in the Grand Forum, try examining the view of the Via Mercurii instead.
Before examining down in the Grand Forum, try examining the Bilious Canal instead.

Part 3.17.1 - Scenery

The high-rise buildings, the street-lamps, the mist, the city crowd, the view of the Via Terminalis, the view of the junction, the Bilious Canal, the view of the basilica, the view of Miller's Gate, the view of the Via Mercurii, and the Upper Perioch ambience are in the Grand Forum.
Before entering the view of the Via Terminalis in the Grand Forum, try going north instead.
Before entering the view of the junction in the Grand Forum, try going north instead.
Before entering the view of the Via Mercurii in the Grand Forum, try going south instead.
Before entering the view of the basilica in the Grand Forum, try going west instead.
Before entering the view of Miller's Gate in the Grand Forum, try going east instead.

The immense paved square is scenery in the Grand Forum.
The description is "There are faded colors, patterns that have grown arcane with age."
The scent is "Dusty."
Understand "faded" or "color/colors" or "pattern/patterns" as the immense paved square.
Instead of knocking on or touching the immense paved square, say "You'd only get your gloves dusty."
Instead of searching the immense paved square, say "[if Day One is happening]There are lots of people milling around.[otherwise]It is practically empty.[end if]"

Chapter 3.17.1.1 - Mural of Solphos

The mural of Solphos is scenery in the Grand Forum.
The description is "The mural is a three-dimensional work of art magically inscribed upon the aether. Walking through it you see the world exquisitely captured, so finely detailed that you can make out the pinprick-lights of the constellations. There are the continents Terra Munda and Terra Nova, the great black sea of the Pelagus, and the four domed periochs -- Kardiapolis, Kreopolis, Furopolis, and Neopolis."
The sound is "The mural hums faintly."
The scent is "The mural smells of aetheric air."
Understand "aether" or "aetheric air/--" or "world" or "work" or "of/-- art" as the mural of Solphos.
Instead of entering the mural of Solphos, say "Walking through the mural, you feel like a goddess observing the cosmos."
Before searching the mural of Solphos, try examining the depiction of the Lake District instead.
Instead of pushing, pulling, knocking on, looking under, rubbing, swinging, taking, touching or turning the mural of Solphos, say "The mural is immaterial."
Before doing anything other than examining to something part of the mural of Solphos, now the noun is the mural of Solphos.
Before doing anything when the second noun is something part of the mural of Solphos, now the second noun is the mural of Solphos.

The depiction of Terra Munda is part of the mural of Solphos.
The description is "The Old Continent is captured with precise black strokes, perfectly tracing its coastline, its mountainous ridges and valleys. The four periochs glow amid the darkened wastes; to the north spreads a solemn spiderweb of golden."
Understand "darkened/-- waste/wastes" or "coast/coastline" or "ridge/ridges" or "valley/valleys" or "mountain/mountains" or "precise" or "black" or "stroke/strokes" or "old" or "continent" as the depiction of Terra Munda.

The depiction of the golden scar is part of the mural of Solphos.
The description is "The philosopher's gold. It nearly engulfed the world in its deathly beauty, until Philosopher Scepter's sacrifice turned it to orichalcum and birthed the [italic type]Luna[roman type]."
Understand "philosopher's/-- gold" or "gold-stained/stained" or "spiderweb" or "spider" or "web" or "orichalcum" or "hydropolis" or "chancery" as the depiction of the golden scar.

The depiction of Terra Nova is part of the mural of Solphos.
The description is "It is little more than a shadow, thick with fantastic silhouettes and the promises of things to be."
Understand "shadow" or "fantastic" or "silhouette/silhouettes" or "continent" as the depiction of Terra Nova.

The depiction of the Pelagus is part of the mural of Solphos.
The description is "A vast dark expanse that seems to undulate as you move around the mural."
Understand "great" or "black" or "salt" or "sea/ocean" as the depiction of the Pelagus.

The depiction of Kardiapolis is part of the mural of Solphos.
The description is "At this scale, the capital city looks like a fairy-tale palace on the ocean."
Understand "capital" or "fairytale/fairy-tale" or "fairy" or "tale" or "palace" or "perioch" or "dome/domes/domed" or "city" as Kardiapolis.

The depiction of Kreopolis is part of the mural of Solphos.
The description is "Massive with its multiple domes, and ensconced amid the mountains."
Understand "dome/domes/domed" or "perioch" or "city" as the depiction of Kreopolis.

The depiction of Furopolis is part of the mural of Solphos.
The description is "The artist has magnified the image of the city so that the forty-nine districts are reproduced. There is the Upper Perioch with its breathtaking spires, and the gold-stained rows of the Lower Perioch; and on the boundary, caught between worlds, you see the tiny Channelworks District and the even tinier forum nestled within."
Understand "city" or "dome/domes/domed" or "perioch" or "upper" or "lower" or "spire/spires" or "row/rows" or "tiny/tinier" or "districts" or "boundary" or "worlds" as the depiction of Furopolis.

The depiction of the Channelworks District is part of the mural of Solphos.
The description is "It is a lovingly detailed miniature of the area you now stand in."
Understand "forum" or "miniature" as the depiction of the Channelworks District.

The depiction of the Lake District is part of the mural of Solphos.
The description is "There it is, so small and fragile.[first time] The Lake District, your old home.[only]".
Understand "lake district/--" or "old/-- home district/--" as the depiction of the Lake District.

The depiction of Neopolis is part of the mural of Solphos.
The description is "Neopolis is still sparse in comparison to the other periochs, but there is a haunting wonder to its symmetry."
Understand "symmetry" or "dome/domes/domed" or "perioch" or "city" as the depiction of Neopolis.

The depiction of the Luna is part of the mural of Solphos.The printed name is "depiction of the [italic type]Luna[roman type]".
The description is "The silver sphere hovers always in the periphery of the mural, inscrutable, unknowable."
Understand "moon" or "silver" or "sphere" or "periphery of/-- the/-- mural/--" as the depiction of the Luna.

Some depicted constellations are part of the mural of Solphos.
The description is "The Ouroboros, the Hierophant, the Alembicus Major..."
Understand "ouroboros" or "hierophant" or "alembicus" or "major" or "constellation" or "star/stars" or "pinprick/pinprick-light/pinprick-lights" or "light/lights" as the depicted constellations.

Understand "continents" as the depiction of Terra Munda and the depiction of Terra Nova.
Understand "periochs" or "cities" as the depiction of Kardiapolis, the depiction of Kreopolis, the depiction of Furopolis, and the depiction of Neopolis.
Does the player mean examining something that is part of the mural of Solphos: it is likely.

Part 3.17.2 - Grand Forum during Day One

Instead of going south in the Grand Forum when the bundle of documents is undelivered, say "Hold on. Since the basilica is right there, you might as well drop off the bundle of documents first."

Chapter 3.17.2.1 - Normal Lives

Some promenading couples are undescribed mixed-race people in the Grand Forum.
The description is "You recognize them by their closeness."
The sound is "They are chatting and laughing."
The scent is "You smell perfume and cologne."
Understand "couple" or "woman/women" as the promenading couples.
Instead of talking to the promenading couples, say "It wouldn't be polite to intrude on the couples."

Some traveling merchants are undescribed mixed-race people in the Grand Forum.
The description is "Carts selling flowers, books, ice cream."
The sound is "They're peddling their wares."
The scent is "The merchants' wares smell sweet."
Understand "cart/carts" or "flower/flowers" or "book/books" or "ice-cream/ice-creams" or "ice" or "cream/creams" or "merchant" or "wares" or "woman/women" as the traveling merchants.
Before buying when the traveling merchants are in the location, try talking to the traveling merchants instead.
Instead of talking to the traveling merchants, say "You don't have much money to spend on luxuries. Perhaps another time."

Some street buskers are undescribed mixed-race people in the Grand Forum.
The description is "[one of]You watch a ventriloquist and his irreverent dolls for a while.[or]You enjoy a spontaneous folk rendition of [italic type]The Words I Couldn't Say[roman type].[or]You watch a bawdy puppet show about the adventures of a three-legged mutant.[or]You watch a stage illusionist perform increasingly implausible card tricks, much to her audience's delight.[or]That's enough entertainment for one day. You shouldn't keep Doctor Cavala waiting.[stopping]".
Before listening to the street buskers, try examining the street buskers instead.
The scent is "Fantastic smells abound."
Understand "busker" or "ventriloquist/ventriloquists" or "doll/dolls" or "puppet/puppets" or "stage/-- illusionist" or "card/-- trick/tricks" or "show/shows" or "woman/women" as the street buskers.
Instead of talking to the street buskers, say "The buskers are too busy for conversation."
After examining the street buskers:
	now ambience suppression is true;
	now journal-buskers-examined is true;
	continue the action.

Some playing children are undescribed mixed-race people in the Grand Forum.
The description is "Human, goblin, mutant. They remind you of your own childhood in the Lake District, not so long ago."
The sound is "They're making a lot of lively noise, as children do."
The scent is "Some of these kids will have to take a shower later."
Understand "boy/boys" or "girl/girls" or "child" or "kid/kids" or "lively" or "noise" as the playing children.
Instead of talking to the playing children, say "You play with the children for a while."

Some paper kites are faraway scenery in the Grand Forum.
The description is "Simple childrens['] kites. Some have sigils of suspension on them, perhaps drawn by parents or older siblings."
The sound is "The kites flap in the breeze."
Understand "childrens'" or "kite" or "sigil/sigils of/-- suspension/--" or "wooden/-- frame/frames" or "string/strings" as the paper kites.
Instead of looking under the paper kites, say "The paper kites flap on wooden frames."
Instead of attacking or cutting the paper kites, say "That would make the children cry."
Instead of pulling, pushing, rubbing, swinging, taking, touching, or turning the paper kites, say "You're too old for games like that."

Some amicable old men are undescribed mixed-race men in the Grand Forum.
The description is "Amicable old men, puffing on pipes and discussing old friendships."
The sound is "It's all war stories and nostalgia."
The scent is "Tobacco smoke wafts around them."
Understand "pipe/pipes" or "tobacco" or "smoke" as the amicable old men.
Instead of talking to the amicable old men, say "You make some small talk with the old men, who look quite delighted to have someone new to talk to."

When Day One ends (this is the despawn all the people in the grand forum rule):
	now the promenading couples are nowhere;
	now the traveling merchants are nowhere;
	now the street buskers are nowhere;
	now the playing children are nowhere;
	now the paper kites are nowhere;
	now the amicable old men are nowhere.

Chapter 3.17.2.2 - Newsboy

The newsboy is a human male person in the Grand Forum. "A newsboy is handing out copies of the [italic type]Libri Liberi[roman type] to passers-by."
The description is "A little human boy with ruddy cheeks and blond hair. His white cap marks him as an errand-boy for Revelaris Press."
The scent is "He smells like newspaper ink."
Understand "boy" or "errand/errand-boy" or "ruddy/-- cheek/cheeks" or "blond" or "hair" or "little" as the newsboy.
Understand "libri" or "liberi" or "newspaper/news/paper" as the newsboy when newsboy-delivered is false.
Before taking the newsboy when newsboy-delivered is false, try talking to the newsboy instead.
Instead of talking to the newsboy, say "He's too busy handing out newspapers to chat."

The white cap is worn by the newsboy.
The description is "It's a very nifty cap."

newsboy-delivered is a truth state that varies.
Instead of talking to the newsboy when newsboy-delivered is false:
	say "'Good morning,' you say.

'Morning, miss.' He thrusts a newspaper into your hands. 'Compliments of the press.'

'Um, thanks.'";
	now the player carries the day-one copy of the Libri Liberi;
	now newsboy-delivered is true.
	
When Day One ends (this is the despawn the newsboy rule):
	now the newsboy is nowhere.

Chapter 3.17.2.3 - Day-One Copy of the Libri Liberi

The day-one copy of the Libri Liberi is a proper-named thing.
The printed name is "[if the current day is Day One]today's[otherwise if the current day is Day Two]yesterday's[otherwise if Day Two has ended]Fourth of Aquaria[end if] copy of the [italic type]Libri Liberi[roman type]".
The description is "[if time is critical]The newspaper can't help you.[otherwise]The headline article reads 'DEBATE: IS ANIMUS POWER ETHICAL?' It documents the little-understood discipline of animology and the recent controversy surrounding post-mortem animus donation."
The scent is "[if the current day is Day One]The ink is still fresh.[otherwise]It smells of ink."
Understand "newspaper/news/paper" or "headline/headlines" or "article/articles" as the day-one copy of the Libri Liberi.
Understand "today's" or "today" as the day-one copy of the Libri Liberi when the current day is Day One.
Understand "yesterday's" or "yesterday" as the day-one copy of the Libri Liberi when the current day is Day Two.
Understand "fourth/four/4th/4/iv" or "of" or "aquaria" as the day-one copy of the Libri Liberi when Day Two has ended.

Instead of searching the day-one copy of the Libri Liberi, say "[if time is critical]This is not the time.[otherwise]You flip through the newspaper for a while, but there isn't much of interest beyond the main headline."
Instead of eating the day-one copy of the Libri Liberi, say "[if time is critical]This is not the time.[otherwise]While the [italic type]Libri Liberi[roman type] is technically edible, it doesn't strike you as the most appropriate midday snack."

Instead of giving the day-one copy of the Libri Liberi to someone when Day One is happening (this is the giving away the day-one newspaper rule):
	if time is critical:
		say "This is not the time.";
		stop the action;
	if the second noun is a creature:
		say "There is no response.";
		stop the action;
	if the second noun is:
		-- the newsboy:
			say "The newsboy takes back the newspaper. 'Thanks for reading, miss.'";
			now the day-one copy of the Libri Liberi is nowhere;
		-- Doctor Cavala:
			if Cavala's Errands is happening:
				say "'Today's newspaper? Thank you, Marid.' Doctor Cavala takes the newspaper with a prim nod before returning to her work.";
			otherwise:
				say "She accepts the newspaper, chuckling. 'I suppose any reading material will do when you're bedridden.'";
			now the day-one copy of the Libri Liberi is nowhere;
		-- Horatio:
			if Cavala's Errands is happening:
				say "Horatio is on duty. You'd better not.";
			otherwise:
				say "Horatio takes the newspaper. 'Thanks, Marid.'";
				now the day-one copy of the Libri Liberi is nowhere;
		-- the guards on the thoroughfare:
			say "The guards respectfully decline.";
		-- the exterminators:
			say "[The exterminators] accept the newspaper graciously. 'Thank you kindly, miss, but we still can't let you through.'";
			now the day-one copy of the Libri Liberi is nowhere;
		-- the porter:
			say "The porter regards you humorlessly.";
		-- the street buskers:
			say "The buskers are too busy performing.";
		-- the playing children:
			say "The children are too busy playing.";
		-- the censor:
			say "He accepts the newspaper. 'Hmm! The news! Hmm! Thank you kindly.'";
			now the day-one copy of the Libri Liberi is nowhere;
		-- the forewoman:
			say "The forewoman doesn't even look at it.";
		-- otherwise:
			say "[The second noun] accept[if the second noun is singular-named]s[end if] the newspaper graciously.";
			now the day-one copy of the Libri Liberi is nowhere.
			
Instead of giving the day-one copy of the Libri Liberi to someone when Day One is not happening (this is the can't give away the day-one newspaper after Day One rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the second noun is a creature:
		say "There is no response.";
	otherwise if the second noun is friendly:
		say "You don't think [the second noun] is interested in [if Day Two is happening]yesterday's[otherwise]old[end if] news.";
	otherwise:
		say "You don't see what that would accomplish.";

day-one-newspaper-was-destroyed is a truth state that varies.

Instead of attacking or cutting the day-one copy of the Libri Liberi (this is the destroying the day-one newspaper rule):
	say "You reduce the newspaper to a collection of scraps, which flutter away in the wind[if the newsboy is in the location]. The newsboy looks horrified[end if].";
	now the day-one copy of the Libri Liberi is nowhere;
	now day-one-newspaper-was-destroyed is true.

Instead of dropping the day-one copy of the Libri Liberi (this is the how to drop a day-one newspaper rule):
	if the location is in Outdoors:
		say "The newspaper flutters away in the wind[if the newsboy is in the location]. The newsboy looks saddened[end if].";
		now the day-one copy of the Libri Liberi is nowhere;
		now day-one-newspaper-was-destroyed is true;
	otherwise if time is critical:
		say "This is not the time.";
	otherwise if the location is not Marid's Room:
		say "You shouldn't leave the newspaper lying around here.";
	otherwise:
		continue the action.

Instead of talking to the newsboy when day-one-newspaper-was-destroyed is true:
	say "'Sorry, miss,' he says, flinching. 'Didn't mean to hurt your feelings or nothing. I'm just the newsboy.'

'Um, no, it's fine. Really.'";
	now day-one-newspaper-was-destroyed is false.
	
After going while day-one-newspaper-was-destroyed is true:
	now day-one-newspaper-was-destroyed is false;
	continue the action.
	
Part 3.17.3 - Grand Forum during Day Two

The chilly breeze is a faraway scenery thing.
The description is "It is only felt, never seen."
The chilly breeze has some text called the faraway response. The faraway response is "The wind eludes you."
Understand "cold" or "wind" or "whistling" as the chilly breeze.
Before listening to the chilly breeze, try listening to the location instead.
Before smelling the chilly breeze, try smelling the location instead.

When Day Two begins (this is the spawn the chilly breeze rule):
	now the chilly breeze is in the Grand Forum.
	
Instead of going to the Basilica during Day Two:
	say "[path-walked so far][one of]You make your way to the basilica, only to find it closed for an emergency council meeting. You have no choice but to return to the grand forum[or]The basilica is closed for an emergency council meeting[stopping].";
	now the Basilica is goto-impassable.
	
When Day Two ends (this is the now you can go to the basilica again i guess rule):
	now the Basilica is goto-passable.

Book 3.18 - Canalside Steps

The Canalside Steps are a proper-named room in Outdoors. "The mist of the Bilious Canal slicks this cramped and winding stairway, and the rusted railings are battered with white spray. The bustle of the bridge reverberates cascading down the steps until they sink beneath the dark rushing water.

Among the moss and graffiti of the east embankment, a mysterious iron door is set into the stone. The only other way lies back up to the Via Terminalis bridge."
They are below Via Terminalis Bridge and south of Via Terminalis Bridge.
Understand "stairway" as the Canalside Steps.

The simple-name is "the canalside steps".
The sound is "The sounds of the city echo strangely through the stone."
The scent is "The odor of the canal is thick here."
The exit reminder is "You can [if the mysterious iron door is closed]only[end if] go [if the mysterious iron door is open]east to the sewer enclave or[otherwise]back[end if] up to the Via Terminalis bridge."

Before going down in the Canalside Steps, try swimming instead.
Before going inside in the Canalside Steps, try going east instead.
Before going outside in the Canalside Steps, try going up instead.
Before examining north in the Canalside Steps, try examining the view of the bridge instead.
Before examining east in the Canalside Steps, try examining the mysterious iron door instead.
Before examining up in the Canalside Steps, try examining the view of the bridge instead.
Before examining down in the Canalside Steps, try examining the up-close Canal instead.
Before examining inside in the Canalside Steps, try examining the mysterious iron door instead.
Before examining outside in the Canalside Steps, try examining the up-close Canal instead.

Part 3.18.1 - Scenery

The mist, the up-close Canal, and the view of the bridge are in the Canalside Steps.

Some slippery steps are scenery in the Canalside Steps.
The description is "It's a minor challenge to keep your footing."
The scent is "The stone is old and rotten."
Understand "canalside" or "step" or "stair/stairs" or "stairway" or "cramped" or "winding" as the slippery steps.
Before putting something on the slippery steps, try dropping the noun instead.
Before entering the slippery steps, try going up instead.
Instead of looking under the slippery steps, say "The Bilious Canal opens below."

The pelagic moss is scenery in the Canalside Steps. The indefinite article is "some".
The description is "Grim tufts of pelagic moss; a Dark Lands weed notoriously difficult to eradicate."
The sound is "The moss is thankfully inanimate."
The scent is "Perhaps not. You've heard horror stories of the stuff growing in people's lungs."
Understand "grim" or "tuft/tufts" or "weed/weeds" as the pelagic moss.
Before removing the pelagic moss from something, try taking the pelagic moss instead.
Instead of burning the pelagic moss, say "...Perhaps. But that task is better left to the Council of Works."
Instead of cutting the pelagic moss, say "If you did that, moss might start growing on your scalpel."
Instead of looking under the pelagic moss, say "The moss is growing on the stone embankment."
Instead of searching the pelagic moss, say "It's moss all the way through."
Instead of pulling, rubbing, or taking the pelagic moss, say "The most common way to remove pelagic moss involves a flamethrower."
Instead of touching the pelagic moss, say "The surface is furred and entirely unpleasant."

Some rusted railings are scenery in the Canalside Steps.
The description is "The posts are badly rusted. You wouldn't trust them to support your weight in a hurry."
The sound is "You hear only the water beyond the railings."
The scent is "The railings smell of rust."
Understand "post/posts" or "railing" or "rail/rails" or "rust/rusty" or "flake/flakes" as the rusted railings.
Before climbing the rusted railings, try swimming instead.
Instead of entering the rusted railings, say "You'd fall into the canal."
Instead of attacking, cutting, pushing, pulling, swinging, taking, or turning the rusted railings, say "Perhaps tearing down the only railing along the slippery steps isn't such a good idea."
Instead of rubbing, knocking on, or touching the rusted railings, say "Your gloves come away red with rusty flakes."
Instead of searching or looking under the rusted railings, say "You see only the water rushing beneath the railings."

The ancient embankment is scenery in the Canalside Steps.
The description is "The years have tarnished the embankment and filled its cracks with moss."
The scent is "It smells of water and grime."
Understand "stone/stones/stonework" or "crack/cracks in/-- the/--" as the ancient embankment.
Instead of climbing the ancient embankment, say "You would much rather take the steps."
Instead of knocking on the ancient embankment, say "The embankment is solid."
Instead of searching the ancient embankment, say "The embankment is covered with moss and graffiti."
Before touching the ancient embankment, try touching the aspirated graffiti instead.

Part 3.18.2 - Mysterious Iron Door

The mysterious iron door is a scenery door.
The description is "An iron door flush with the embankment. It is dirty, but without rust, and unmarked except for a crescent-shaped window. There is no handle."
The sound is "You hear nothing beyond the door."
The scent is "There is a hint of incense from the window."
It is east of the Canalside Steps and west of the Sewer Enclave.
It is better left open.
Instead of opening or closing the mysterious iron door, say "The door has no handle[if the player carries the bundle of documents]. In any case, you don't think the basilica is this way[end if]."
Instead of cutting the mysterious iron door, say "The iron is thick and sturdy, and you give up after a few minutes of scratching the surface."
Instead of attacking, pushing, or pulling the mysterious iron door, say "The door doesn't budge."
Instead of looking under the mysterious iron door, say "The gap under the door is too small to look through."
Before searching the mysterious iron door, try searching the crescent-shaped window instead.

The crescent-shaped window is part of the mysterious iron door.
The description is "A barred, crescent-shaped window, with the horns pointing upward."
Understand "bar/bars/barred" or "horn/horns" or "crescent shaped/-- window" as the crescent-shaped window.
Instead of entering the crescent-shaped window, say "The window is barred."
Instead of cutting the crescent-shaped window, say "You scratch at the bars for a few minutes, but find them too thick and too closely spaced to saw through efficiently."
Instead of searching the crescent-shaped window, say "Through the window you see only darkness."
Instead of inserting something that is not the endoscope into the crescent-shaped window, say "The window is barred."

Part 3.18.3 - Graffiti and Crescent Keyhole

steps-keyhole-known is a truth state that varies.

The aspirated graffiti is scenery in the Canalside Steps. The indefinite article is "some".
The description is "Various vandalisms in aspirated paint. There are the usual signatures and faux-alchemical designs, as well as more esoteric images of the celestial and fantastical. Here, a three-headed sphinx; there, a crescent inscribed among stars.[if steps-keyhole-known is true]

Concealed in the graffiti, in the shadow of the crescent, is a keyhole.[end if]".
The scent is "The paint is long dry."
Understand "design/designs" or "signatures" or "faux/-- alchemical" or "faux-alchemical" or "paint" or "three headed" or "three-headed" or "sphinx" or "image/images" as the aspirated graffiti.
Before knocking on the aspirated graffiti, try knocking on the ancient embankment instead.
Instead of looking under, rubbing, searching, or touching the aspirated graffiti (this is the find the keyhole in the graffiti rule):
	if steps-keyhole-known is false:
		say "Running your fingers over the graffiti, you are startled to discover that the crescent in the graffiti conceals some kind of keyhole.";
		now steps-keyhole-known is true;
	otherwise:
		say "The crescent in the graffiti conceals an irregularly shaped slot that can only be some kind of keyhole."
		
The crescent keyhole is a privately-named thing part of the aspirated graffiti.
Rule for printing the name of the crescent keyhole when steps-keyhole-known is false: say "crescent in the graffiti" instead.
Understand "crescent" or "in the/-- graffiti" or "inscribed" or "among/-- stars" as the crescent keyhole.
Understand "keyhole" or "irregular/irregularly" or "shaped" or "slot" or "hole" as the crescent keyhole when steps-keyhole-known is true.
Before examining, looking under, knocking on, rubbing, searching, smelling, or touching the crescent keyhole, try searching the aspirated graffiti instead.
Instead of inserting something carried by the player into the crescent keyhole when steps-keyhole-known is true:
	if the noun is the endoscope:
		say "You find the keyhole to be filled with complex interlocking teeth.";
	otherwise:
		say "[The noun] doesn't fit into the hole."

Book 3.19 - Miller's Gate

There is a proper-named room in Outdoors called Miller's Gate. "Here at district's end, in the searchlights and the shadows, you see the great white arch that opens onto Greater Furopolis and beyond. The carriageways clatter with cabriolets, the airships sway on their tethers, the tram-lines are all aglow; and standing in the crowd, you can't help but feel like a minnow in the sea.

To the northwest is the Via Terminalis, and to the west is the grand forum. The Via Regia stretches east from Miller's Gate."
It is southeast of the Via Terminalis Junction and east of the Grand Forum.

The sound is "Shouting, booming, clanking, whistling, rattling."
The scent is "You smell the steam of trains and the smoke of phlogiston engines."
The exit reminder is "You can only go northwest to the Via Terminalis junction or west to the grand forum."

Before going inside in Miller's Gate, try going east instead.
Before going outside in Miller's Gate, try going east instead.
Before examining east in Miller's Gate, try examining the view of the Commercial District instead.
Before examining inside in Miller's Gate, try examining the view of the Commercial District instead.
Before examining outside in Miller's Gate, try examining the view of the Commercial District instead.
Before examining northwest in Miller's Gate, try examining the Via Terminalis instead.
Before examining west in Miller's Gate, try examining the view of the grand forum instead.

Part 3.19.1 - Scenery

The high-rise buildings, the city crowd, the Via Terminalis, the view of the grand forum, and the Upper Perioch ambience are in Miller's Gate.

Before entering the view of the grand forum in Miller's Gate, try going west instead.

Some gate-mounted searchlights are faraway scenery in Miller's Gate.
The description is "Enormous mounted cathode lamps. The watchmen sweep them back and forth across the crowd."
Understand "searchlight" or "mounted" or "cathode" or "lamp/lamps" or "light/lights" or "shadow/shadows" as the gate-mounted searchlights.
Instead of looking under the gate-mounted searchlights, say "Watchmen are operating the searchlights."

The arch of Miller's Gate is scenery in Miller's Gate. The indefinite article is "the".
The description is "The venerable battlements are cast in concrete and furnished with marble. Seven bell-towers run the length of the arch, carefully attended by numerous gargoyles and watchmen, and a giant clock is set in the keystone."
Understand "battlement/battlements" or "great" or "white" or "concrete" or "marble" or "venerable" as the arch of Miller's Gate.
Before searching the arch of Miller's Gate, try examining the view of the Commercial District instead.
Before entering the arch of Miller's Gate, try going east instead.
Instead of climbing the arch of Miller's Gate, say "There are no handholds, and you'd likely be arrested if you brought a ladder."
Instead of looking under the arch of Miller's Gate, say "There are too many people to count."
Instead of touching the arch of Miller's Gate, say "The marble is smooth and cold."

Some timekeeping bells are faraway scenery in Miller's Gate. The indefinite article is "the".
The description is "These enormous bells keep time in the Channelworks District."
The sound is "You know the sound well: an elaborate scale of chimes repeated for every hour."
Understand "bell" or "bell-tower/bell-towers/belltower/belltowers" or "tower/towers" as the timekeeping bells.

Some borderpost gargoyles are faraway scenery in Miller's Gate.
The description is "They are refurbished antiques, dating all the way back to the Corindian Empire. Not that that makes them any less effective."
The sound is "The gargoyles are silent."
Understand "gargoyle" or "antique/antiques" or "refurbished" as the borderpost gargoyles.
Instead of talking to the borderpost gargoyles, say "You'd feel like a fool yelling at the battlements."

Some borderpost watchmen are faraway undescribed mixed-race men in Miller's Gate.
The description is "Imposing black-coated figures. Some say they're appointed from the Philosophers['] own personal guard."
The sound is "You can't hear much over the traffic."
Understand "watchman" as the borderpost watchmen.
Instead of talking to the borderpost watchmen, say "You'd feel like a fool yelling at the battlements."

The keystone clock is faraway scenery in Miller's Gate. The indefinite article is "the".
The description is "It's still quite early."
Understand "giant" or "time" as the keystone clock.

Some clattering carriageways are scenery in Miller's Gate.
The description is "Well-dressed travelers come and go in their chartered cabriolets."
The sound is "The cabriolets clatter merrily along the street."
The scent is "You smell the dust kicked up by the vehicles."
Understand "carriage/carriages" or "way/ways" or "cabriolet/cabriolets" or "traveler/travelers" or "chartered" as the clattering carriageways.
Instead of entering the clattering carriageways, say "You don't have any carriage chartered, and it's dangerous to walk on the carriageways."
Instead of searching the clattering carriageways, say "None of the carriages catch your eye."

Some docked airships are scenery in Miller's Gate.
The description is "The docking lines are crowded with aeronautical craft of all varieties. There's even a well-trained drake or two."
The sound is "All of the airships are quietly docked."
The scent is "You smell the leftover smoke of phlogiston engines."
Understand "airship" or "docking/dock/docks" or "tether/tethers/tethered" or "line/lines" or "aeronaut" or "aeronautical" or "craft" or "drake" or "phlogiston" or "engine/engines" or "leftover" or "smoke" as the docked airships.
Instead of entering or taking the docked airships, say "Those are private craft. You'd be arrested without the proper papers."
Instead of attacking the docked airships, say "You'd be arrested on the spot if you tried that."
Instead of cutting the docked airships, say "While your scalpel could probably saw through the docking lines, that doesn't strike you as the wisest idea in the long term."
Instead of looking under the docked airships, say "The airships are tethered to the docks."
Instead of searching the docked airships, say "None of the airships catch your eye."
Instead of inserting the endoscope into the docked airships, say "Those are private craft. You'd be arrested without the proper papers."

Some tram-lines are scenery in Miller's Gate.
The description is "Trams fly past on the luminifers, trailing sparks as they go."
The sound is "The luminifers sing with power."
The scent is "The smell of ozone is unmistakable."
Understand "tram" or "line/lines" as the tram-lines.
Before entering the tram-lines, try going east instead.
Instead of looking under the tram-lines, say "The trams run along blazing luminifers."
Instead of searching the tram-lines, say "None of the trams catch your eye."

Some luminiferous rails are scenery in Miller's Gate.
The description is "A luminifer is a solid frictionless beam of light. These ones are unfiltered, and so requires less power to maintain at the cost of being incredibly dangerous to touch."
Before listening to or smelling the luminiferous rails, now the noun is the tram-lines.
Understand "luminifer/luminifers" or "spark/sparks" or "beam of/--" or "light" as the luminiferous rails.
Instead of cutting the luminiferous rails, say "You don't see what that would accomplish besides irrevocably damaging your scalpel."
Instead of looking under the luminiferous rails, say "Complex glyphs are inscribed along the ground under the luminifers."
Instead of searching the luminiferous rails, say "The light is blinding."
Instead of inserting something into the luminiferous rails, say "That would destroy [the noun], along with most of your hand."
Instead of attacking, knocking on, pushing, pulling, rubbing, swinging, touching, or turning the luminiferous rails, say "You would prefer to keep all ten of your fingers."

Some glyphs along the rails are scenery in Miller's Gate.
The description is "You have no idea. You studied medicine, not optics."
Understand "complex" or "glyph" or "inscribed/inscription/inscriptions" or "ground" as the glyphs along the rails.
Before listening to or smelling the glyphs along the rails, now the noun is the tram-lines.
Before searching the glyphs along the rails, try examining the glyphs along the rails instead.
Instead of knocking on, pushing, pulling, rubbing, swinging, touching, or turning the the glyphs along the rails, say "That would require you to stand in the path of oncoming trams."

The view of the Commercial District is faraway scenery in Miller's Gate. The indefinite article is "the".
The description is "All you can see of the Commercial District is a glittering blur. The spires are taller there, the lights brighter."
The sound is "You can't hear much over the traffic."
Understand "via" or "regia" or "greater/-- furopolis" as the view of the Commercial District.

Part 3.19.2 - You Can't Just Leave Town

Instead of going east in Miller's Gate (this is the can't just leave town rule):
	if Cavala's Errands is happening:
		say "You can't just leave town. You have an errand to finish.";
	otherwise:
		say "You have no reason to leave town.";

Book 3.20 - Basilica

There is a proper-named room called the Basilica. "Footsteps and whispers echo through these high-vaulted halls. The aisles on either side are lined with the doorways of countless clerical offices, and surrounding the raised chancel are the seats of the Magistrates['] Court. The exit is to the east."

[Inscribed among the glyphs on the marble floor is an electrum-inlaid map of the Channelworks District.]
It is west of the Grand Forum.

The simple-name is "the basilica".
The sound is "Wind whispers in the clerestories. Snatches of discussion snake through the aisles."
The scent is "The air has the tang of wet ink."
The exit reminder is "The exit is to the east."

Before going outside in the Basilica, try going east instead.
Before going west in the Basilica, try searching the chancel instead.
Instead of going inside in the Basilica, say "You don't have business in any of the offices."
Before examining inside in the Basilica, try searching the aisles instead.
Before examining west in the Basilica, try examining the chancel instead.
Instead of examining east in the Basilica, say "You see the bustle of the grand forum."
Instead of examining outside in the Basilica, say "You see the bustle of the grand forum."

Part 3.20.1 - Scenery

The view of the grand forum is in the Basilica.

Before entering the view of the grand forum in the Basilica, try going east instead.

Some busy clerks are a undescribed mixed-race person in the Basilica.
The description is "They look very busy."
The sound is "They sound very busy."
Understand "clerk" or "pigeonhole/pigeonholes" or "pigeon" or "hole/holes" or "forest" or "of/-- discussion" or "snatch/snatches" as the busy clerks.
Instead of doing anything other than listening to or examining to the busy clerks, say "You shouldn't disturb the clerks."

Some aisles are scenery in the Basilica.
The description is "Doorways line the arcades, each labeled with an important-sounding title."
The sound is "Rustling papers and conversation."
The scent is "The aisles are awash in the scent of fresh ink."
Understand "aisle" or "doorway/doorways" or "door/doors" or "label/labels" or "title/titles" or "arcade/arcades" or "side/sides" or "clerical" or "office/offices" as the aisles.
Before entering the aisles, try going inside instead.
Instead of searching the aisles, say "You see clerks poring over a truly daunting forest of pigeonholes."

Some clerestory windows are faraway scenery in the Basilica.
The description is "Light streams through the rows of windows above."
The sound is "You can faintly hear rushing water."
Understand "hall/halls" or "row/rows" or "window" or "clerestory/clerestories" or "vault" or "high-vaulted" as the clerestory windows.

[Some administrative glyphs are scenery in the Basilica.
The description is "The glyphs describe lines of correspondence between the offices. They circle a stylized map of the Channelworks District which you suspect is as alchemically significant as it is decorative."
The sound is "You tap your foot on the floor and the echo carries through the building."
Understand "glyph" or "line/lines" or "of/-- correspondence" or "marble" or "floor" as the administrative glyphs.
Before knocking on the administrative glyphs, try listening to the administrative glyphs instead.
Instead of touching the administrative glyphs, say "You feel power sizzling in each glyph."]

The chancel is faraway scenery in the Basilica.
The description is "The court is a meeting venue for the various district councils, as well as a judicial venue for crimes that are brought to trial."
The sound is "The chancel is silent; no court is in session."
The scent is "The chancel smells of musty seats and expensive snuff."
The chancel has some text called the faraway response. The faraway response is "You snoop around the chancel a bit, but find nothing of interest and eventually return to the main hall."
Understand "court" or "magistrates'" or "raised" or "seat/seats" as the chancel.

[The electrum-inlaid map of the Channelworks District is scenery in the Basilica. The printed name is "map of the Channelworks District".
The description is "Viewed from above, the Channelworks District is shaped like a ring. The residential area to the northwest is connected by the Via Terminalis bridge to the administrative area in the northeast. As the Bilious Canal flows southward, the buildings become more ramshackle and run-down, ending in Riggertown on the southwest bank and the Shanty Quarter to the southeast."
Understand "electrum" or "inlaid/leaf" or "alchemical/-- representation" as the electrum-inlaid map.
Instead of knocking on or touching the electrum-inlaid map, say "There's a jolt of magical potential. You jerk your hand away from the electrum leaf."
Before searching the electrum-inlaid map, try examining the specific details of the district map instead.

Some specific details of the district map are privately-named scenery in the Basilica.
The description is "The map is too stylized to make out the details of specific buildings. Perhaps it's an alchemical representation of the district rather than a literal one."
Understand "ring" or "residential" or "area" or "via" or "terminalis" or "administrative" or "bridge" or "bilious" or "canal" or "specific" or "building/buildings" or "riggertown" or "shanty" or "quarter" as the specific details of the district map.
Does the player mean doing something with the specific details of the district map: it is unlikely.
Before doing anything other than examining when the noun is the specific details of the district map, now the noun is the electrum-inlaid map.
Before doing anything when the second noun is the specific details of the district map, now the second noun is the electrum-inlaid map.]

Part 3.20.2 - Basilica during Day One

Chapter 3.20.2.1 - The Censor and his Desk

The censor is a human man in the Basilica. "[censor-initial-appearance]".
The description is "A middle-aged man with a receding hairline[if the censor is asleep]. He's slumped over his desk, fast asleep[end if]."
The sound is "[if the censor is asleep]He's snoring rather indecorously.[otherwise]He's being very quiet."
The scent is "He smells of ink and dandruff."
Understand "provis" as the censor.
Understand "snore/snoring" as the censor when the censor is asleep.
Instead of looking under the censor, say "The censor is [if the censor is asleep]slumped over[otherwise]sitting at[end if] his desk."

The censor can be asleep or awake. The censor is asleep.

To say censor-initial-appearance:
	if the censor is asleep:
		say "Nearby is the censor[one of] -- but he appears to have fallen[or], fast[stopping] asleep at his desk. ";
	otherwise:
		say "The censor is at his desk nearby. "
		
The censor's desk is a scenery supporter in the Basilica.
The description is "The plaque on the desk reads 'CENSOR PROVIS.'"
Understand "plaque" or "aqueous" or "condensation" or "chair" as the censor's desk.
Instead of entering the censor's desk, say "The desk is already occupied."
Instead of cutting the censor's desk, say "You'd be arrested for vandalism."
Instead of putting something on the censor's desk, say "[if the censor is asleep]The desk is already occupied.[otherwise]You shouldn't interrupt the censor's work."
Instead of swinging the censor's desk, say "[if the censor is asleep]That is made considerably harder by the presence of the censor on it.[otherwise]That's hardly portable."
Instead of touching the censor's desk, say "[if the censor is asleep]Aqueous condensation has formed on the desk from the censor's snoring. It's really rather unpleasant.[otherwise]You shouldn't interrupt the censor's work."
		
Chapter 3.20.2.2 - The Censor's Nap

The bundle of documents can be delivered or undelivered. The bundle of documents is undelivered.

Instead of going from the Basilica during The Censor's Nap, say "You still have to deliver the bundle of documents to the censor."

Instead of cutting the censor during The Censor's Nap, say "You'd have to defend your actions in court afterwards. Not exactly the ideal solution."
Instead of waking the censor during The Censor's Nap, say "Yes, but how?"
Instead of singing during The Censor's Nap, say "[one of]Sing? In public? Surely... surely there must be another way[or]You are not going to sing to the censor[stopping]."
Instead of giving the bundle of documents to the censor during The Censor's Nap, say "He doesn't appear to be in a state to receive anything."

Instead of attacking or knocking on the censor during The Censor's Nap:
	say "You give the censor a good hard knock on the brachial plexus. He yelps and sits bolt upright.

'Beebles in a bomb factory!' he splutters. 'What was [italic type]that[roman type] for?'";
	now the censor is awake;
	start a dialogue with the censor using dialogue censor-woken.
	
Instead of attacking the censor's desk during The Censor's Nap:
	say "You give the desk a hearty kick. The censor yelps and sits bolt upright.

'Great galumphing hellkites!' he splutters. 'What was [italic type]that[roman type] for?'";
	now the censor is awake;
	start a dialogue with the censor using dialogue censor-woken.
	
Instead of kissing the censor during The Censor's Nap:
	say "You lean in and give the censor a peck on the cheek. He flushes in his sleep. 'Oh, dear Anea,' he mumbles, 'you have come home to me at last...'

Then a funny look comes over him. Gradually he stirs. His eyes meet yours.

'Angels and archons!' he splutters, sitting bolt upright. 'What-- what was--'[line break]";
	now the censor is awake;
	start a dialogue with the censor using dialogue censor-woken.
	
Instead of pushing, pulling, or turning the censor's desk during The Censor's Nap:
	say "An idea strikes you. You grip the side of the desk and heave with all your might, putting all your body weight into it, until you feel the desk move with a great groan -- and the censor is dragged along and nearly falls out of his chair.

'Canines in a cloakroom!' he splutters, sitting bolt upright. (You quickly remove yourself from the desk.) 'What was [italic type]that[roman type] for?'";
	now the censor is awake;
	start a dialogue with the censor using dialogue censor-woken.

censor-nap-talk-counter is a number that varies.
Instead of talking to the censor during The Censor's Nap:
	increment censor-nap-talk-counter;
	if censor-nap-talk-counter is:
		-- 1:
			say "'Excuse me?'

The censor snores by way of response.";
		-- 2:
			say "'Hello?'

More snoring.";
		-- 3:
			say "'...You can't hear me at all, can you?'

He continues to snore.";
		-- otherwise:
			try scaring the censor.
			
Before screaming during the Censor's Nap, try scaring the censor instead.
Instead of scaring the censor during The Censor's Nap:
	say "You take a deep breath and yell, 'Censor, in the name of Earth, Water, Fire, Air, Natron, Mercury, and Sulfur, would you [italic type]kindly. Wake. Up!'[roman type]

There is a very long silence.

The censor is wide awake now. He scrambles to a seated position, staring at you all the while.

'Er,' he says. 'Um.'";
	now the censor is awake;
	start a dialogue with the censor using dialogue censor-woken.
			
censor-nap-touch-counter is a number that varies.
Instead of touching or tickling the censor during The Censor's Nap:
	increment censor-nap-touch-counter;
	if censor-nap-touch-counter is:
		-- 1:
			say "You tickle the censor's forehead and nose. He shifts and groans a little, and furrows his brow in his sleep.";
		-- otherwise:
			say "You move on to prodding his eyelids and pulling on his nose hairs. He fidgets and tosses and starts uttering a series of remarkable, if incomprehensible, vocalizations. Then you squeeze his nose and he nearly falls out of his chair.

'Trismegistus's tush!' he splutters, sitting bolt upright. 'What was [italic type]that[roman type] for?'";
			now the censor is awake;
			start a dialogue with the censor using dialogue censor-woken.
			
censor-nap-shake-counter is a number that varies.
Instead of taking, swinging, pushing, pulling, squeezing, or turning the censor during The Censor's Nap:
	increment censor-nap-shake-counter;
	if censor-nap-shake-counter is:
		-- 1:
			say "You grab the censor's shoulders and give him a firm couple of shakes.

He sniffs. He sighs. And then he keels over and resumes snoring.";
		-- otherwise:
			say "You shake him more vigorously and he nearly falls out of his chair.

'Merciful bleeding Primes!' he splutters, sitting bolt upright. 'What was [italic type]that[roman type] for?'";
			now the censor is awake;
			start a dialogue with the censor using dialogue censor-woken.
			
censor-nap-knockdesk-counter is a number that varies.
Instead of knocking on the censor's desk during The Censor's Nap:
	increment censor-nap-knockdesk-counter;
	if censor-nap-knockdesk-counter is:
		-- 1:
			say "You rap your knuckles on the desk. The censor frowns in his sleep and shifts irritably.";
		-- otherwise:
			say "You wind up and pound the desk as hard as you can, and the censor nearly jumps out of his chair.

'By Ath and Zei and Bis and Nux!' he splutters, sitting bolt upright. 'What was [italic type]that[roman type] for?'";
			now the censor is awake;
			start a dialogue with the censor using dialogue censor-woken.
			
Chapter 3.20.2.3 - Censor Woken Dialogue

Some dialogue branches are defined by the Table of Censor Woken Dialogue.

Table of Censor Woken Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
censor-woken	true	false	""	""	{censor-woken-clearthroat, censor-woken-sorry}
censor-woken-clearthroat	true	false	"<Clear your throat.>"	"You put your hands on your hips and clear your throat.

The censor sighs. 'Of course. Of course. Right then.' He adjusts his collar and puffs out his chest. 'Censor Provis at your service, miss. What can I do for you today?'"	{censor-woken-documents, censor-woken-address, censor-woken-detour}
censor-woken-sorry	true	false	"'Sorry...'"	"'Sorry,' you say, a little sheepishly. 'It's just that you were asleep at your desk, and...'

The censor turns red. 'Of course, of course. Let's not speak of that. Entirely understandable. On to business.' He adjusts his collar and puffs out his chest. 'Censor Provis at your service, miss. What can I do for you today?'"	{censor-woken-documents, censor-woken-address, censor-woken-detour}
censor-woken-documents	true	true	"'I have documents from Doctor Cavala's clinic...'"	"'I have documents from Doctor Cavala's clinic regarding the death of a Channelworks District citizen,' you say. 'A middle-aged goblin man by the name of Reden.'

You hand the bundle of documents to the censor, who regards it with an appraising eye.

'Let me see.' He breaks the seal and quickly scans the contents. 'Yes. Hmm. Unfortunate, this. Not to worry. All shall be in order...'

[wait for any key]The censor's gaze pauses on one section of the report. He reads it -- rereads it.

[wait for any key]'Hmm!' he says. 'Well excuse [italic type]me![roman type] An unknown disease? Hmm! Now this is highly irregular. Highly irregular. I will have to contact my superiors.'

[wait for any key]He puts a big red stamp on the bundle and files it away in a clattering of drawers, muttering to himself all the while. At last he pats the desk and nods with an air of self-importance.

'Very good, miss,' he says. 'Thank you for bringing this to our attention. Now was there anything else you needed?'"	{censor-woken-address, censor-woken-detour, censor-woken-thanks}
censor-woken-address	true	true	"'I need the address of a Channelworks District citizen...'"	"'I need the address of a Channelworks District citizen. His name is Zoiro.'

The censor furrows his brow. 'Right then,' he says. 'Just a moment. Wait here, if you please.'

He gets up and vanishes into one of the side doorways of the basilica, muttering a stream of incomprehensible jargon involving coordinates and street names. You hear the sounds of wooden scroll cases being rifled through, and furtive frantic consultations among the clerks.

[wait for any key]After an appreciable wait, he emerges from the doorway flush-faced and triumphant.

[wait for any key]'Seventh on Layabout Row,' he proclaims, 'Upper Riggertown. Property under the name of Zoiro and Koriph. And his place of employment, which I've taken the liberty to look up, is the Riggertown Mechanistry. Here, let me write it down for you--'

[wait for any key]He scribbles on a scrap of paper, hands it to you, and sits back down at his desk looking eminently satisfied.

'There we go,' he says. 'Now was there anything else you needed?'"	{censor-woken-documents, censor-woken-detour, censor-woken-thanks}
censor-woken-detour	false	true	"'The footpath from the Via Terminalis to Riggertown is blocked...'"	"'The footpath from the Via Terminalis to Riggertown is blocked,' you say. 'Do you know if there's any other way to get to Riggertown?'

'Hm. Yes, I recall issuing the license. The footpath...' The censor's eyes light up. 'Ah! You could take Cadaver Walk -- by way of the Shanty Quarter. It's just down the Via Mercurii from here--'

He frowns.

'But come to think of it,' he says, 'that's rather a suspect part of town, if you get my meaning. Is it rather... [italic type]urgent[roman type] for you to get to Riggertown?'

[wait for any key]'Yes,' you say. 'Yes it is.'

'Well...' He shrugs. 'If you run into any trouble, holler for the guards. Now was there anything else you needed?'"	{censor-woken-documents, censor-woken-address, censor-woken-thanks}
censor-woken-thanks	false	false	"'Nothing, thank you.'"	"'Nothing, thank you.'

The censor beams. 'Have a good day, miss. [italic type]Per radium sophia.'[roman type]

You step away from the censor's desk."	{}
censor-woken-returning	true	false	""	"You approach the censor's desk, and he looks up like a startled animal.

'Yes, miss?' he says. 'Was there something you needed?'"	{censor-woken-address, censor-woken-detour, censor-woken-thanks}

The home dialogue branch of the censor is censor-woken-returning.

After reading out censor-woken-documents (this is the delivering the documents to the censor rule):
	now the bundle of documents is nowhere;
	now the bundle of documents is delivered;
	now the enabled of censor-woken-thanks is true.
	
After reading out censor-woken-address (this is the learning Zoiro's address from the censor rule):
	now the player carries the note with Zoiro's address;
	now journal-zoiro-address-known is true;
	now the enabled of donti-address is false.
	
After reading out censor-woken-detour (this is the learning the Riggertown detour from the censor rule):
	now journal-riggertown-detour-known is true.
	
Instead of talking to the censor when the enabled of censor-woken-documents is false and the enabled of censor-woken-address is false and the enabled of censor-woken-detour is false (this is the no more censor dialogue rule):
	say "You've already gotten all you need from the censor."
	
Chapter 3.20.2.4 - Note with Zoiro's Address

There is a thing called a note with Zoiro's address.
The description is "It's the scrap of paper the censor gave you. It reads:

[italic type]Home address: VII Layabout Row, Upper Riggertown[line break]Employment address: Riggertown Mechanistry, Upper Riggertown[roman type]".
Understand "scrap" or "of/-- paper" as the note with Zoiro's address.
Instead of eating the note with Zoiro's address, say "[if time is critical]This is not the time.[otherwise]What is this, a spy novel?"

Instead of attacking or cutting the note with Zoiro's address (this is the destroying the note with Zoiro's address rule):
	say "You reduce the note to a collection of scraps, which flutter away in the wind[if the censor is in the location]. The censor blanches. 'Young people these days,' he mutters[end if].";
	now the note with Zoiro's address is nowhere.

Instead of dropping the note with Zoiro's address (this is the dropping the note with Zoiro's address rule):
	say "The note flutters away in the wind.";
	now the note with Zoiro's address is nowhere.
	
Chapter 3.20.2.5 - Despawning the Censor and his Desk

When Day One ends (this is the despawn the censor and his desk rule):
	now the censor is nowhere;
	now the censor's desk is nowhere.

Book 3.21 - Via Mercurii

There is a proper-named room in Outdoors called the Via Mercurii. "The Road of Change is a snaking, secretive thing. It curls in the side streets and in the dark places. Here along the canal, the opulence of the Upper Perioch peels away to reveal midnight hues and scarlet lamps, cabarets and pawnbrokers and establishments of ill repute -- but for now, at least, they slumber in the daylight.

To the north is the grand forum, vibrant and lively, while to the south the Shanty Quarter begins."
It is south of the Grand Forum.

The simple-name is "the Via Mercurii".
The sound is "The noises of the city run with strains of decadent music."
The scent is "Beneath the flowers and incense is an unmistakable air of rottenness."
The exit reminder is "The grand forum is to the north, and the Shanty Quarter is to the south."

Instead of buying in the Via Mercurii, say "You have no interest in the things that are sold here."
Before going inside in the Via Mercurii, try entering the shady side streets instead.
Before examining north in the Via Mercurii, try examining the view of the grand forum instead.
Before examining south in the Via Mercurii, try examining the view of the Shanty Quarter instead.
Before examining inside in the Via Mercurii, try examining the shady side streets instead.
Instead of examining outside in the Via Mercurii, say "It's unclear where you want to look."

Part 3.21.1 - Scenery

The high-rise buildings, the city crowd, the Bilious Canal, the view of the grand forum, the view of the Shanty Quarter, and the Upper Perioch ambience are in the Via Mercurii.

Before entering the view of the grand forum in the Via Mercurii, try going north instead.
Before entering the view of the Shanty Quarter in the Via Mercurii, try going south instead.

Some shady side streets are faraway scenery in the Via Mercurii.
The description is "You are uncomfortable in this place."
The sound is "There are a hundred secrets whispered out of earshot."
The scent is "You smell incense and vice."
Understand "dark" or "place/places" or "street" or "midnight" or "hue/hues" as the shady side streets.
The shady side streets has some text called the faraway response. The faraway response is "You don't want anything to do with these streets."
Instead of entering the shady side streets, say "Nothing good can come of exploring this side of town."

Some fitful lamps are scenery in the Via Mercurii.
The description is "The lights here are more fitful. Perhaps their bound aurorae are not so subservient."
The sound is "You hear the hum of galvanism."
The scent is "The lamps smell of phlogiston."
Understand "street" or "lamp" or "post/posts" or "lamp-post/lamp-posts" or "lamppost/lampposts" or "streetlamp/streetlamps" or "lamplight/lamplights" or "light/lights" or "aurora/aurorae" or "animus/animii" or "spark/sparks" or "phlogiston" or "street-lamps" or "scarlet" or "bound" as the fitful lamps.
Instead of searching the fitful lamps, say "At the heart of each lamp is the spark of a bound animus."

Some cabarets are scenery in the Via Mercurii.
The description is "The signs advertise fire-eaters and daemon-tamers and even stranger things."
The sound is "The cabarets are quiet during the day."
The scent is "You smell tobacco smoke and lingering alcohol."
Understand "cabaret" or "sign/signs" or "venue/venues" or "shop/shops" as the cabarets.
Instead of entering the cabarets, say "Perhaps not. These venues are a little more libertine than you're comfortable with."
Before searching the cabarets, try examining the cabarets instead.

Some pawnbrokers are scenery in the Via Mercurii.
The description is "The displays of the pawnbrokers are cluttered with pocket watches, cast-off jewelry, and heirlooms long since forgotten."
The sound is "You can hear the watches endlessly ticking."
The scent is "There is the musty smell of bygone years."
Understand "pawnbroker" or "pawnshop/pawnshops" or "pawn" or "broker/shop/shops" or "pocket/-- watch/watches" or "cast-off/-- jewelry/jewellery" or "heirloom/heirlooms" as the pawnbrokers.
Instead of entering the pawnbrokers, say "You aren't planning on pawning anything, nor are you planning on any purchases."
Before searching the pawnbrokers, try examining the pawnbrokers instead.

Some brothels are scenery in the Via Mercurii.
The description is "You weren't the only youth who fell on hard times after the troubles, and not everyone had the luxury of an inheritance."
The sound is "The brothels are quiet during the day."
The scent is "They are thick with sweat and incense."
Understand "shop/shops" or "establishment/establishments" or "of" or "ill" or "repute" or "brothel" as the brothels.
Instead of entering the brothels, say "No. These places sicken you."
Before searching the brothels, try examining the brothels instead.

Part 3.21.2 - Via Mercurii during Day One

Chapter 3.21.2.1 - Fortune-Teller

[A cameo by Nasperge. Apologies to RavenoftheBlack.]

The fortune-teller is a man in the Via Mercurii. "A fortune-teller is plying his trade by the road. [one of]As you pass him, he meets your gaze and beckons you with a smile.[or]He smiles at you as you pass by.[stopping]".
The description is "He wears a blue hooded cloak that hides his face, and gold gloves that glitter and gleam. In his hands a strange deck of cards is weaving, weaving, weaving."
The sound is "He is silent but for his shuffling cards."
The scent is "He smells of exotic incense."
Understand "fortune" or "teller" or "magician" or "blue" or "hooded" or "cloak" or "gold" or "glove/gloves" or "exotic" or "incense" as the fortune-teller.

The strange deck of cards is carried by the fortune-teller.
The description is "The cards are lavishly illustrated, from what you can see, but they don't correspond to any arcana you know."
Understand "aubedore" or "strange" or "deck" or "of/-- card/cards" or "arcana/arcanum/arcani/arcanae" or "illustration/illustrations" or "shuffling" as the strange deck of cards.
Instead of pushing, pulling, rubbing, swinging, squeezing, taking, touching, or turning the strange deck of cards, say "The fortune-teller is busy with the cards."

Chapter 3.21.2.2 - Divining Table

The divining table is an undescribed enterable supporter in the Via Mercurii. "The divining table sits vacant by the road."
The description is "A simple tin-framed table with two matching chairs."
Understand "matching" or "chair/chairs" or "tin" or "framed" or "tin-framed" as the divining table.

Before entering the divining table when the fortune-teller is in the Via Mercurii, try talking to the fortune-teller instead.

Instead of pushing, pulling, swinging, taking, or turning the divining table:
	if the fortune-teller is in the Via Mercurii:
		say "The table seems to be occupied.";
	otherwise:
		say "You have better things to do than muck about with furniture.";
		
Instead of knocking on the divining table when the fortune-teller is in the Via Mercurii, say "Words will suffice to get the fortune-teller's attention."

Report entering the divining table: say "You sit at the divining table."; stop the action.
Report getting off the divining table: say "You stand up."; stop the action.
	
Rule for issuing the response text of room description heading rule response (B) when the player is on the divining table (this is the print 'at the divining table' rule):
	say " (at the divining table)".

Chapter 3.21.2.3 - Fortune-Teller Dialogue

Some dialogue branches are defined by the Table of Fortune-Teller Dialogue.

Table of Fortune-Teller Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
teller-home	true	false	""	"You approach the fortune-teller's table.

'Hello,' you offer.

'Good afternoon, young one.' His accent is disarming. 'Have you come in search of answers?'"	{teller-ihave, teller-ubeckoned, teller-curious}
teller-ihave	true	false	"'I have.'"	"'I have.'

'Then you've come to the right place.' The fortune-teller spreads his hands, and the deck of cards seems to leap and dance through his fingers. 'The Fates provide answers when life will not. What should you do? Where will you go? The cards can show us all these things and more.'"	{teller-cards, teller-work, teller-patrons, teller-reading, teller-anothertime}
teller-ubeckoned	true	false	"'I came because you beckoned me.'"	"'I came because you beckoned me.'

'Yes, of course -- but there are a dozen buskers on these streets every day. Do you approach each of them when they beckon you?'

The fortune-teller continues to smile. He spreads his hands, and the deck of cards seems to cascade like water.

'The cards tell me all I need to know. I can see the thoughts and dreams that trouble you. What should you do? Where will you go? The Fates can show us all these things and more.'"	{teller-dontknowme, teller-cards, teller-work, teller-patrons, teller-reading, teller-anothertime}
teller-dontknowme	true	false	"'You don't know me.'"	"You narrow your eyes. 'You don't know me.'

The fortune-teller bows his head. 'My apologies. We are strangers, of course. I don't presume to know the challenges you face--'

He pauses mid-shuffle, the gilding on the cards glittering.

'But the cards do.'

Then he resumes, and pours the deck into another waterfall."	{teller-cards, teller-work, teller-patrons, teller-reading, teller-anothertime}
teller-curious	true	false	"'I was curious.'"	"'I was curious.'

'Ah, curiosity. I can hardly fault you. It's only natural to be curious about a tradition such as mine.'

The fortune-teller spreads his hands, and the deck of cards seems to fly apart and flow into itself.

'I am a reader of messages, of portents. We often ask -- What should I do? Where will I go? The cards can show us all these things and more.'"	{teller-cards, teller-work, teller-patrons, teller-reading, teller-anothertime}
teller-cards	true	true	"'I've never seen cards like these before.'"	"'I've never seen cards like this before.'

The fortune-teller nods enigmatically, and slowly riffles the deck for you to see. The card backs are baroque, inlaid with gold, brilliant with light as they collapse inward.

'The Aubedore,' he murmurs. 'The lost art. Here, you may not have heard of it. But the tradition exists, and I assure you that it is real.'"	{teller-lostart, teller-work, teller-disbelieve1, teller-patrons, teller-reading, teller-anothertime}
teller-lostart	false	true	"'What did you mean by [']the lost art?['] '"	"'What did you mean by [']the lost art?[']' you ask.

He only smiles. 'Perhaps I've said too much. A magician can only reveal so many secrets.'"	{teller-work, teller-disbelieve1, teller-patrons, teller-reading, teller-anothertime}
teller-work	true	true	"'How does it work?'"	"'How does it work?'

The fortune-teller holds the cards close to his chest. 'The strings of fate -- but perhaps you know them better as the chains of causality. They are intimately connected to all things in ways you can't imagine. By shuffling the cards, I am attuning them to your past, present, and future, to the parallels and possibilities.'"	{teller-cards, teller-lostart, teller-work, teller-disbelieve1, teller-patrons, teller-reading, teller-anothertime}
teller-disbelieve1	false	true	"'I don't believe in fate.'"	"'I don't believe in fate.'

He smiles politely. His hands continue to weave the deck of cards, back and forth and over and under."	{teller-cards, teller-lostart, teller-patrons, teller-reading, teller-anothertime}
teller-patrons	true	true	"'Do you get many patrons?'"	"'Do you get many patrons?' you ask.

'Many,' the fortune-teller replies. 'I've told the fortunes of the rich and poor, young and old. They all sought answers in their lifetime, and the cards helped them discover the way.'"	{teller-cards, teller-lostart, teller-work, teller-disbelieve1, teller-reading, teller-anothertime}
teller-reading	true	true	"'I'd like a reading.'"	"'I'd like a reading,' you say cautiously.

'Very well,' he replies. 'Please, sit down. What question do you wish to ask the Fates?'

You take your seat at the table, facing the fortune-teller. After a long moment, you give your answer."	{teller-love1, teller-work1, teller-past1}
teller-love1	true	false	"'There's a boy I like...'"	"'There's a -- a boy I like. I want to know if... if I'll be with him.'

You feel your cheeks heating up. You hate yourself for asking such a stupid, inane question. But you have to know.

'Ah, love.' The fortune-teller smiles. 'It tangles the strings of fate and leads us in mysterious ways. The pattern for it is sometimes known as the Dove's Tail, but I prefer to call it the Heart.'

He sweeps the deck across the table with a flourish, spreading out five cards in the shape of an arrowhead -- or, you suppose, a symbolic heart. At its very tip, he lays another card perpendicular over the first.

[wait for any key]'A pattern of meetings,' the fortune-teller murmurs. 'The Heart is the most selfless of the Aubedore patterns. It shows us how people are drawn together from the chambers...'

He traces from the wings of the pattern to the tip.

'What awaits them at their shared destination.'

You nod, transfixed.

[wait for any key]'Now we will reveal the cards, two by two, and see what they reveal about your future.'

His gold-gloved hands hover over the chambers.

'Shall we begin?'"	{teller-love2}
teller-love2	true	false	"<Watch him reveal the chambers.>"	"You nod. He touches the chambers of the heart, and brings them to light.

[wait for any key]On the left you see a pair of skeletons, one male and one female, and a young girl between them gripping their hands.

Your breath catches in your throat.

[wait for any key]'The Orphan,' says the fortune-teller quietly. 'I take it you have lost someone.'

'I'm... I'm fine,' you say after a moment. 'I was taken aback. That's all.'

'Very well.'

[wait for any key]On the right is an upside-down card, illustrated with an indecipherable chimera of feathers and fur. But the fortune-teller seems to know it well.

'The Griffin,' he says. 'Your love is of high birth.  And it is inverted, showing he is magnanimous rather than proud: a man of noble spirit.'

You smile inwardly.

[wait for any key]'The chambers mark your beginnings,' he continues. 'Now we move on to the paths which brought you together...'"	{teller-love3}
teller-love3	true	false	"<Watch him reveal the paths.>"	"The left path turns out to be a woman in archaic blue robes, bowed before a seemingly endless array of bookshelves. As you scrutinize the image, you realize she is only one of many supplicants, in one of many halls of an infinite library.

[wait for any key]On the right, upside-down, is a dark illustration of someone holding a lantern. You can barely make out the figure's outstretched hand, framed in flames and grasping for something out of sight.

[wait for any key]'The Student and the inverted Seeker,' says the fortune-teller. 'You went on a journey of learning, while your love became a man who commanded the attention of others. During your studies you met him -- perhaps a fellow student, or a young prodigy you looked up to. You learned from him and followed in his footsteps. Am I right?'

Your cheeks heat up again, and you can't find it in yourself to speak.

[wait for any key]'And now, the nexus,' he continues. 'Your meeting at the destination...'"	{teller-love4}
teller-love4	true	false	"<Watch him reveal the nexus.>"	"He slides out the bottom card first, and reveals it to be a depiction of a storm at sea, heaving with rain-lashed ships and alive with forked lightning. Above all in the sky is a terrible sphere that can only be the [italic type]Luna[roman type].

'The Tempest,' he whispers. 'You will be drawn together in a time of change and turmoil. Perhaps years from now. Perhaps tomorrow. Only time will tell -- and the final card, your fate, the answer to your question...'

[wait for any key]The last card is a woman all in white, kneeling beside a dying man.

[wait for any key]The fortune-teller picks up the sideways card, his hand trembling slightly. You realize he is holding it upside down.

'The Healer,' he says. 'Inverted.'

[wait for any key]You inhale sharply.

'Don't -- don't worry. It's not as literal as it might seem.' He takes a deep breath. 'The inverted Healer is a symbol of renouncement and parting. All it means is... that you and your love will one day be separated. Your relationship will not last forever. You should cherish it as long as you can.'

His hand continues to tremble."	{teller-isee, teller-lovereallymeans}
teller-lovereallymeans	true	false	"'Tell me what it really means.'"	"You look him in the eye. 'Tell me what it really means.'

The fortune-teller regards you for a long moment.

At last he says, 'One of you is fated to die.'

He places the Healer face down."	{teller-isee, teller-disbelieve2}
teller-work1	true	false	"'A man died in the clinic where I work...'"	"'A man died in the clinic where I work. I want to know what happened to him.'

The fortune-teller's smile fades, and he nods more seriously.

'You pose me a sober question, my friend,' he says. 'I will endeavor to ask the cards on your behalf. Let's see what the River pattern has to tell us about your patient.'

He upturns his hand. Cards slide off the deck and onto the table in a flowing line. With his other hand, he turns the path of the cascade until a curving tangent has been formed.

[wait for any key]'The River flows from the source,' he says, 'through the upper course and the bend, into the lower course and the delta; here, the tributary is fed by the lake.'

He gestures to each of the face-down cards in sequence.

'Now we will reveal the cards, one by one, and see what they reveal about the flow of causality.'

[wait for any key]His gold-gloved hand hovers over the source.

'Shall we begin?'"	{teller-work2}
teller-work2	true	false	"<Watch him reveal the upper river.>"	"You nod. The fortune-teller touches the source, and brings it to light.

[wait for any key]The illustration is of an ancient forge, immaculately detailed and filled with artifacts of esoteric design. You see swords and cups, cloaks and crowns. But in front and center, set above the rest, is a band of purest, most exalted gold.

[wait for any key]'The Ring,' says the fortune-teller. 'The most brilliant of the Fixtures. The source was a device, or perhaps a discovery, that possessed vast potential.'

[wait for any key]The next card is upside down, and all you can make out is a crowded and colorful vignette. But in the center, almost unnoticeable, is one stooped figure devoid of color.

[wait for any key]'The Servant. The lowliest in the realm of the court, so humble as to go unnoticed. But it is inverted; I dare say your patient drew unexpected attention, for good or for ill.'

[wait for any key]The third card bears a young woman's face in stark definition, with blue eyes eerily like your own, but with only pale skin where her mouth should have been. You involuntarily touch your lips.

[wait for any key]The fortune-teller shakes his head. 'The bend is the Mute. The event, then, the death, had to do with silence. But did your patient die because he did not speak out... or was he killed to ensure he never did?'

[wait for any key]He purses his lips.

'Let us take a step back, and see if the tributary sheds light on the mystery.'"	{teller-work3}
teller-work3	true	false	"<Watch him reveal the tributary.>"	"He reveals the card, and it turns out to be an idyllic scene of the land before the Darkening, a picture of a forest with green trees and blue skies. In its center is a body of still and silvery water.

[wait for any key]'The Pond,' says the fortune-teller. 'It represents a place far from civilization where one can reflect and find reflection. It is the indirect cause -- could the discovery have been made in such a place? The place your patient drew attention? Or did he not speak out because civilization would not have heard him?'

[wait for any key]You frown. 'I came here for answers, not more questions.'

'I am sorry you feel that way, my friend,' he replies. 'I can only convey what I can see with my own eyes, and what the cards see fit to provide. The Fates can be temperamental even at the best of times.

'But look! There are still three cards we have not revealed.'"	{teller-work4}
teller-work4	true	false	"<Watch him reveal the rest of the river.>"	"'We have seen what has come to pass,' he says, reaching for the lake. 'Now we see what could have been...'

[wait for any key]The card bears the image of an old woman in a dungeon. She is strung up by iron manacles and horribly withered, with her emaciation illustrated in exacting detail.

[wait for any key]'The Manacles.' A grimace. 'If not for your patient's death, someone would have been imprisoned. Yes, an unpleasant picture is beginning to emerge...'

[wait for any key]The fortune-teller turns over the lower course, revealing it to be another dark and disturbing illustration; but upside-down, so that you can only see a bone-white figure.

[wait for any key]'Ah!' he declares. 'The Ghost appears, but inverted. The dire message it brings is not heard, and the course of fate is not changed. And that brings us to our final card, the delta--'

[wait for any key]The delta is a storm at sea, heaving with rain-lashed ships and alive with forked lightning. Above all in the pitch-black sky is a terrible sphere that can only be the [italic type]Luna[roman type].

[wait for any key]The fortune-teller sets the card down.

'The Tempest,' he whispers. 'The future will be filled with change and turmoil. It could be in many years, or it could be tomorrow. And all because of a humble man who drew the wrong attention -- and was silenced.'

A long pause."	{teller-isee, teller-areyousure, teller-drivel}
teller-past1	true	false	"'I've been having nightmares...'"	"'I've been having nightmares. I've had them for years. I thought I got over them, but... I had another one, just last night.'

The fortune-teller grows sober. 'Dreams,' he says. 'Nightmares. They show us truths that cannot be found in the daylight. If you wish to learn how to conquer them, one pattern will prove most illuminating...'

He casts his hands apart, scattering the top cards of the deck with the sudden motion, and at first you wonder if he's dropped them by accident. But when the loose cards come to rest, they have landed in an deliberate, intricate pattern -- a cross.

[wait for any key]'The corners,' he says, tapping the cards at the end of each of the four arms. 'The spokes,' he continues, moving inward in counter-clockwise fashion. 'And the nexus--'

He taps the two cards in the center, one laid perpendicular over the other, and you nod transfixed.

[wait for any key]'The Crossroads.' he says. 'It shows us the paths that lead to our destination. Now we will reveal the cards, one by one, and see what they reveal about you.'

His gold-gloved hand hovers over the top left corner. 'Shall we begin?'"	{teller-past2}
teller-past2	true	false	"<Watch him reveal the corners.>"	"With great showmanship, he turns over the first card.

[wait for any key]Some kind of hound or beast stares out at you, with smoke-grey fur and menacing slitted eyes. The visage is unfamiliar, terrifying.

'The Wolf,' says the fortune-teller. 'It represents danger, and the fear that comes with isolation.'

[wait for any key]The next card depicts a girl at an old-fashioned spindle, with strings wound through her hands and feet and hair. But to your surprise, the card is upside down.

'The Seamstress, inverted.' the fortune-teller continues. 'In the past, you experienced a traumatic event -- one that severed the ties binding you to friends and family. You were set adrift.'

You feel a hollowness within you.

[wait for any key]The lower right card is a young girl flanked by skeletons, one male and one female, staring at you with hollow eye sockets, and you freeze.

[wait for any key]'The Orphan,' says the fortune-teller. 'I take it you have lost someone.'

[wait for any key]You can't find it in yourself to breathe.

'How are you doing this?' you whisper.

[wait for any key]His voice is quiet. 'I know only what the cards have shown me. But I see now why you might be plagued by nightmares.'"	{teller-paststop, teller-past3}
teller-paststop	true	false	"<Get up and walk away.>"	"You take a deep breath.

You choke on it. Tears well up in your eyes.

You look at the skeletons and you --

[wait for any key][italic type]-- see the flames -- the smoke --

[wait for any key]-- hear his last words --

[wait for any key]-- all over again --[roman type]

[wait for any key]You squeeze your eyes shut.

[wait for any key]When you open your eyes, you're back at the table.

[wait for any key]You take a deep breath.

Running won't solve anything. It won't make the nightmares go away.

[wait for any key]You have to see this through."	{teller-past3}
teller-past3	true	false	"<Stay seated.>"	"You grit your teeth. You grip your seat until your knuckles whiten.

'Are you all right?' The fortune-teller sounds genuinely concerned.

'I'm [italic type]fine.'[roman type]

A long pause.

'No,' he replies. 'You're not fine. You have been badly wounded.'

[wait for any key]The card in the lower left is a woman in white, kneeling beside a dying man, and it is upside down.

[wait for any key]You start to cry.

[wait for any key]It is the fortune-teller who first speaks again.

'There is no shame in tears,' he says. 'No one is so strong that she cannot weep.'

[wait for any key]Some time passes. You aren't sure how much.

[wait for any key]But it is with a defiant breath that you wipe away the last of your tears."	{teller-past4}
teller-past4	true	false	"'I'm all right. Let's move on.'"	"'I'm all right,' you say. 'Let's move on.'

The fortune-teller looks at you, then nods. His hand moves inward, to the top left spoke.

[wait for any key]Inward from the Wolf is a slab of horned metal, massive and unyielding. It glows with the heat of the flames surrounding it.

'The Anvil,' says the fortune-teller. 'Your trials have strengthened you more than you think. Fire will never break or bend you.'

[wait for any key]The spoke from the Seamstress shows an ancient road, leading straight ahead into the dawn on the horizon.

'The Path. Without ties to bind you, you are free to move ahead. You should look to the future, not the past.'

[wait for any key]From the Orphan, you see a woman in slumber, encircled by a tapestry of images executed in dizzying detail.

'The Dreamer. Yes, you are a dreamer in more than one sense, whether or not you realize it...'

[wait for any key]The final spoke is upside down, and it is illustrated only with a morass of dark shapes -- but the fortune-teller nods with apparent understanding.

'And from the Healer,' he says, 'the Shadows. Also inverted. Something will soon emerge from the shadows and be made known to you... and I suspect it is linked to everything that has gone before. But only you will see it.'

[wait for any key]The fortune-teller inclines his head.

'There are only two cards left. Let us see what the Fates have in store for you.'"	{teller-past5}
teller-past5	true	false	"<Watch him reveal the destination.>"	"He holds the upper card in place, while drawing out the lower. 'The destination,' he says, 'reveals the truth -- the true path that you must take...'

[wait for any key]The card is inverted. It shows a gray stone tablet, planted alongside flowers; the inscription is slick with rain, and there is a melancholy quality to the illustration.

'The Gravestone,' he says curiously. 'It represents mortality, inevitability. But inverted...'

[wait for any key]He furrows his brow, and without another word, turns over the other card.

[wait for any key]A storm at sea, heaving with rain-lashed ships and alive with forked lightning. Above all in the pitch-black sky is a terrible sphere that can only be the [italic type]Luna[roman type].

[wait for any key]'The fate--' he breathes. 'The Tempest.'

He clasps his hands and leans heavily on the table. For a long while, he is silent."	{teller-isee, teller-whatmean}
teller-isee	true	false	"'...I see.'"	"'...I see,' you say at last.

He is still and pensive. The wind grasps his hood, making its edges billow.

At length, he places a hand on his deck. His eyes flicker to it; his lips twitch. Then he picks up his cards, one by one, and shuffles them away and out of sight.

'I should go,' he murmurs. 'I have other places to be.'"	{teller-goodbye, teller-wait}
teller-areyousure	true	false	"'Are you sure?'"	"'Are you sure?' you ask.

He nods. 'It is what the Fates have shown me.'"	{teller-isee, teller-disbelieve3, teller-drivel}
teller-disbelieve2	true	false	"'...I don't believe in fate.'"	"'...I don't believe in fate.'

He bows his head. The wind grasps his hood, making its edges billow.

At length, he places a hand on his deck. His eyes flicker to it; his lips twitch. Then he picks up his cards, one by one, and shuffles them away and out of sight.

'I should go,' he murmurs. 'I have other places to be.'"	{teller-goodbye, teller-wait}
teller-disbelieve3	true	false	"'I don't believe in fate.'"	"'I don't believe in fate.'

He bows his head. The wind grasps his hood, making its edges billow.

At length, he places a hand on his deck. His eyes flicker to it; his lips twitch. Then he picks up his cards, one by one, and shuffles them away and out of sight.

'I should go,' he murmurs. 'I have other places to be.'"	{teller-goodbye, teller-wait}
teller-drivel	true	false	"'I hope you aren't expecting me to believe this drivel.'"	"'I hope you aren't expecting me to believe this drivel.'

He starts. He meets your eye for the first time -- his irises are the color of smoke. Then he closes his eyes and smiles.

'Ah -- my age is showing. I have been a performer too long, and old habits die hard.'

He picks up his cards, one by one, and shuffles them away and out of sight.

'Drivel or not -- well. The cards have fallen as the Fates have willed them. But there are many interpretations... and perhaps I have not seen the one that is true. Only time will tell. But I have lingered too long--'

[wait for any key]The wind grasps his hood, making its edges billow.

'It's time for me to go,' he murmurs."	{teller-goodbye, teller-wait}
teller-whatmean	true	false	"'...What does it mean?'"	"'...What does it mean?'

He is still and pensive. The wind grasps his hood, making its edges billow.

At length, he places a hand on his deck. His eyes flicker to it; his lips twitch. Then he picks up his cards, one by one, and shuffles them away and out of sight.

'I should go,' he murmurs. 'I have other places to be.'"	{teller-wait, teller-waitgrab}
teller-anothertime	true	false	"'Perhaps another time.'"	"'Perhaps another time.'

The fortune-teller bows his head. 'Until we meet again...'

You step away from the fortune-teller's table."	{}
teller-home2	true	false	""	"You approach the fortune-teller, and he smiles.

'The young one returns. Have you come for a reading?'"	{teller-cards, teller-lostart, teller-work, teller-disbelieve1, teller-patrons, teller-reading, teller-nevermind}
teller-nevermind	true	false	"'Actually, never mind.'"	"'Actually, never mind,' you say.

The fortune-teller bows his head. 'Fate works in strange ways.'

You step away from the fortune-teller's table."	{}
teller-goodbye	true	false	"'Goodbye.'"	"'Goodbye.'

He stands up, nodding at you, and you stand after him.

'Goodbye,' he says. 'Live on, my friend. Live well.'

And he vanishes with a whirl of his cloak, leaving only a whiff of incense on the wind."	{}
teller-wait	true	false	"'Wait...'"	"'Wait...'

He gets to his feet. You rise, your mind buzzing with questions. 'Wait!' you cry. 'Wait...'

[wait for any key]'Goodbye,' he says. 'Live on, my friend. Live well.'

And he vanishes with a whirl of his cloak, leaving only a whiff of incense on the wind.

[wait for any key]It's a while before you notice the sounds of the city around you again."	{}
teller-waitgrab	true	false	"<Grab him.>"	"He gets to his feet. You lunge after him. 'Wait!' you cry. 'Wait--'

[wait for any key]Your fingertips brush empty air.

[wait for any key]It's a while before you notice the sounds of the city around you again."	{}

The home dialogue branch of the fortune-teller is teller-home.
After reading out teller-cards: now the enabled of teller-lostart is true.
After reading out teller-work: now the enabled of teller-disbelieve1 is true.
After reading out teller-home: now the home dialogue branch of the fortune-teller is teller-home2.
After reading out teller-goodbye: now the fortune-teller is nowhere; now the divining table is described.
After reading out teller-wait: now the fortune-teller is nowhere; now the divining table is described.
After reading out teller-waitgrab: now the fortune-teller is nowhere; now the divining table is described.

Chapter 3.21.2.4 - Despawning the Fortune-Teller and his Table

When Cavala's Errands ends (this is the despawn the fortune-teller and his table rule):
	now the fortune-teller is nowhere;
	now the divining table is nowhere.

Book 3.22 - Shanty Quarter / Shanty Maze

There is a proper-named goto-impassable room in Outdoors called the Shanty Quarter. "A labyrinthine morass of concrete and claustrophobia. You know this place better now that you've seen the worst of it -- you know which paths to take, which alleys to avoid -- but there is a horror here that sinks its teeth into you, and does not lets go.

Tangled rope ladders lead up and down. A crumbling flophouse lies to the east. Somewhere to the north is the Via Mercurii, and to the west, Cadaver Walk."
It is south of the Via Mercurii.

The simple-name is "the Shanty Quarter".
The sound is "The walls echo with the sounds of laughter and tears."
The scent is "It smells horrible in here."
The exit reminder is "You can go up to the rooftops, down [if Rats' Run is visited]to Rats' Run[otherwise]to the pits[end if], east to the flophouse, north to the Via Mercurii, or west to Cadaver Walk."
The going-in disambiguation is "Do you mean going down ([if Rats' Run is visited]to Rats' Run[otherwise]to the pits[end if]) or going east (to the flophouse)?"

Before examining east in the Shanty Quarter, try examining the view of the crumbling flophouse instead.
Instead of examining north in the Shanty Quarter, say "The Via Mercurii lies in that direction."
Instead of examining west in the Shanty Quarter, say "Cadaver Walk lies in that direction."
Instead of examining up in the Shanty Quarter, say "The rooftops are that way."
Instead of examining down in the Shanty Quarter, say "There, the labyrinth sinks into dark water."
Instead of going outside in the Shanty Quarter, say "Do you mean going north (to the Via Mercurii) or going west (to Cadaver Walk)?"
Instead of examining outside in the Shanty Quarter, say "It's unclear where you want to look."

Part 3.22.1 - Scenery

The nightmarish architecture, the slum-dwellers, and the offal are in the Shanty Quarter.

Some tangled rope ladders are scenery in the Shanty Quarter.
The description is "Fraying things, held together by lashings and prayers."
Understand "ladder" or "ropes" as the tangled rope ladders.
Before climbing the tangled rope ladders, try going up instead.
Instead of entering the tangled rope ladders, say "Do you mean going up (to the rooftops) or going down ([if Rats' Run is visited]to Rats' Run[otherwise]to the pits[end if])?"

The view of the crumbling flophouse is faraway scenery in the Shanty Quarter.
The description is "There are flickering lights in the windows, the cracks."
The sound is "Silence."
Understand "light/lights" or "crack/cracks" or "window/windows" or "flickering" or "house" as the view of the crumbling flophouse.
Before entering the view of the crumbling flophouse, try going east instead.

Part 3.22.2 - Shanty Quarter during Day One

Chapter 3.22.2.1 - Shanty Maze

[The first time Marid steps into the Shanty Quarter, she immediately gets lost and walks through a series of atmospheric rooms. These rooms are a fake maze with the intention of making the player freak out. They can't be revisited and are only to provide atmosphere.]

The Shanty Maze is a region.

shanty-quarter-warning-given is a truth state that varies.

Before going south in the Via Mercurii when Day One is happening (this is the Day One Shanty Quarter warning rule):
	if Maze Part One is unvisited:
		if shanty-quarter-warning-given is false:
			say "The cobblestones grow crooked and broken underfoot. The buildings crowd inward until they blot out the darkening sky. You hesitate.

Is there really no other way?";
			now shanty-quarter-warning-given is true;
			now ambience suppression is true;
			stop the action;
		otherwise:
			say "With a deep breath, you press onward.";
			now the player is in Maze Part One;
			now the Shanty Quarter is visited;
			wait for any key;
			say "You instinctively take a step back, only to bump into a wall. You turn around and see a labyrinth of crawlspaces and ladders and rag curtains.

You are lost.";
			stop the action.
		
Instead of approaching when the location is in the Shanty Maze, say "You don't know which way that is."
Instead of approaching the Shanty Quarter when the location is in the Shanty Maze, say "You are already in the Shanty Quarter."
Instead of examining a direction when the location is in the Shanty Maze, say "You see no way out of this place."
Instead of screaming when the location is in the Shanty Maze, say "The walls echo with your scream[first time]. But no one comes[only]."
Rule for printing the name of a room in the Shanty Maze while constructing the status line: say "Shanty Quarter". 

Chapter 3.22.2.2 - Maze Part One (Shanty Quarter)

Maze Part One is a privately-named room in the Shanty Maze. "No words can describe this place. It is claustrophobic, oppressive, a place where light does not reach. The air is heavy with the stench of offal and waste, and other things better left unimagined -- and you are hemmed in by ropes, walled off by concrete, entombed with the walking dead[one of][or].

A labyrinth of crawlspaces and ladders and rag curtains surrounds you[stopping]."

The printed name is "Shanty Quarter".
The sound is "The walls echo with the sounds of laughter and tears."
The scent is "It smells horrible in here."
The exit reminder is "You don't know which way to go."

The nightmarish architecture, the offal, and the slum-dwellers are in Maze Part One.

The Shanty Quarter labyrinth is scenery in Maze Part One. The printed name is "labyrinth".
The description is "You see no way out of this place."
The sound is "A hundred broken voices reach you."
The scent is "You feel the urge to throw up."
Understand "crawlspace/crawlspaces" or "ladder/ladders" or "rag" or "curtain/curtains" or "exit/exits" or "of" or "and" as the Shanty Quarter labyrinth.
Before climbing, entering, or searching the Shanty Quarter labyrinth, try going outside instead.

Instead of going in Maze Part One (this is the wander to Maze Part Two rule):
	say "You wander blindly...";
	now the player is in Maze Part Two;
	start a dialogue saying "Talking to a stranger" using dialogue mazerobbers-home.

Chapter 3.22.2.3 - Maze Part Two (Deeper, Darker)

Maze Part Two is a privately-named room in the Shanty Maze. "And you cannot find your way. All is awash in the spectral light of broken cathode lamps, and in the shadows phantasmagoria creeps. Frightened children eye you from the rooftops. Rats are strung up like hanged men."

The printed name is "Deeper, Darker".
The sound is "The walls echo with the sounds of laughter and tears."
The scent is "It smells horrible in here."
The exit reminder is "You don't know which way to go."

Instead of rubbing the scalpel in Maze Part Two, say "You wipe off your scalpel again, just to be sure."

The nightmarish architecture and the slum-dwellers are in Maze Part Two.

Some broken cathode lamps are scenery in Maze Part Two.
The description is "The bulbs are intact. It's the animii that are shattered."
The sound is "The humming is maddening."
The scent is "The lamps smell of smoke."
Understand "lamp" or "spectral" or "light" or "bulb/bulbs" or "animus/animii" or "of" as the broken cathode lamps.
Before searching the broken cathode lamps, try examining the broken cathode lamps instead.

The Shanty Quarter phantasmagoria is scenery in Maze Part Two. The printed name is "phantasmagoria".
The description is "You're so, so scared."
The sound is "A hundred broken voices reach you."
The scent is "You feel the urge to throw up."
Understand "shadow/shadows" as the Shanty Quarter phantasmagoria.
Before climbing, entering, or searching the Shanty Quarter phantasmagoria, try going outside instead.

Some frightened slum children are a mixed-race undescribed person in Maze Part Two. The printed name is "frightened children".
The description is "The look in their eyes terrifies you."
The sound is "Silence."
The scent is "The children reek."
Understand "rooftop/rooftops" or "child" or "boy/boys" or "girl/girls" as the frightened slum children.
Instead of searching the frightened slum children, say "You don't know them."
Instead of talking to the frightened slum children, say "The children have nothing to say to you."
Instead of giving something to the frightened slum children, say "Misguided acts of charity won't change anything."

Some strung-up rats are scenery in Maze Part Two.
The description is "Dead and disembowelled."
The scent is "They're starting to rot."
Understand "rat" or "string/strings/strung" or "carcass/carcasses" or "hanged men/--" as the strung-up rats.
Instead of eating, pushing, pulling, rubbing, searching, squeezing, swinging, taking, touching, or turning the strung-up rats, say "You don't want anything to do with them."

Instead of going in Maze Part Two (this is the wander to Maze Part Three rule):
	say "You run away...";
	now the player is in Maze Part Three.

Section 3.22.2.3.1 - Robbers in Maze Part Two

Some dialogue branches are defined by the Table of Maze Robber Dialogue.

Table of Maze Robber Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
mazerobbers-home	true	false	""	"[wait for any key]You walk through a broken arch and someone grabs your arm. The point of a knife touches your back.

[wait for any key]'Don't scream,' says a cracked and leathery voice. 'I'll kill you if you scream.'"	{mazerobbers-scream, mazerobbers-silent, mazerobbers-whatuwant}
mazerobbers-scream	true	true	"<Scream.>"	"You scream.

'Bitch!'

The knife jabs painfully deep. [if mazerobbers-pushedtowall is false]You stumble up against a wall. The bricks are hard and cold.[end if]

'I'll kill you. I'll [italic type]kill[roman type] you. Do you understand?'

You feel his breath on your neck."	{mazerobbers-whatuwant, mazerobbers-grabknife, mazerobbers-scalpelstab}
mazerobbers-silent	true	false	"<Remain silent.>"	"The knife blade pushes deeper into your jacket. You're forced up against a wall. The bricks are hard and cold.

'Take out your purse. Nice and slow.'"	{mazerobbers-scream, mazerobbers-grabknife, mazerobbers-okaymoney, mazerobbers-okayscalpel}
mazerobbers-whatuwant	true	true	"'What do you want?'"	"'What do you want?'

[if mazerobbers-pushedtowall is false]The knife blade pushes deeper into your jacket. You're forced up against a wall. The bricks are hard and cold.

[end if]'I want your money. All of it. Now.'"	{mazerobbers-scream, mazerobbers-grabknife, mazerobbers-okaymoney, mazerobbers-okayscalpel}
mazerobbers-okaymoney	true	false	"'Okay...' <Take out your purse.>"	"[take-out-purse-text]"	{}
mazerobbers-okayscalpel	true	false	"'Okay...' <Take out your scalpel.>"	"[take-out-purse-text]"	{}
mazerobbers-grabknife	true	false	"<Try to grab the knife.>"	"You twist and lash out with your elbow. Something cracks.

'Agh! You little--'

He lunges at you. No time to think. You grab his arm -- twist the other way --

[wait for any key]He goes down screaming.

The knife falls into a drain. He grasps for it. You step on his hand.

[wait for any key]'Oh Primes,' comes another voice. 'Who -- you're -- you're the girl from the clinic. Oh Primes--'

You glance up. There's an accomplice. He's backing away.

Your assailant has struggled to his feet. His hand is bleeding. His arm is broken.

[wait for any key]'--oh Primes. I'm sorry. We didn't--'

'--we didn't know. Please don't--'

'--don't tell the Doc--'

[wait for any key]They take off at a run. Their footsteps vanish into the crowd, into the din of the underworld.

You are alone once more."	{}
mazerobbers-scalpelstab	true	false	"<Stab blindly with your scalpel.>"	"You draw your scalpel -- twist -- stab at chest height. You feel something tear. He screams.

[wait for any key]'Who...' splutters another voice. 'Who -- you're -- you're the girl from the clinic. Oh Primes--'

You turn. There's an accomplice. He's frozen in shock.

[wait for any key]Your assailant has backed away from you. There's a spreading stain on his shirt. His face is deathly pale.

[wait for any key]'Oh Primes. I'm sorry. We didn't--'

'--we didn't know. Please don't--'

'--don't tell the Doc--'

[wait for any key]They take off at a run. Their footsteps vanish into the crowd, into the din of the underworld.

Breathing heavily, you wipe the blood off your scalpel."	{}

To say take-out-purse-text:
	say "'Okay,' you say. 'I'm -- I'm getting my purse. Please don't hurt me.'

You reach into your jacket. The knife point trembles -- his hands are shaking. You feel for the familiar weight...

[wait for any key]'Hey,' a different voice says. 'The girl... doesn't she, doesn't she look familiar?'

[wait for any key]'I don't know what you're talking about,' your assailant growls.

'No. Look. I swear she's the girl from the clinic. The [italic type]Doc's[roman type] clinic. She's got the tattoos and everything--'

[wait for any key]The knife recedes.

'Oh Primes.' The voice sounds panicked. 'Oh Primes. I'm sorry. We didn't know. Please don't--'

'Please don't tell anyone. We just--'

'Don't tell the Doc--'

[wait for any key]They take off at a run. Their footsteps vanish into the crowd, into the din of the underworld.

You are alone once more. "

mazerobbers-pushedtowall is a truth state that varies.

After reading out mazerobbers-scream: now mazerobbers-pushedtowall is true.
After reading out mazerobbers-silent: now mazerobbers-pushedtowall is true; now the enabled of mazerobbers-whatuwant is false.
After reading out mazerobbers-whatuwant: now mazerobbers-pushedtowall is true.

Chapter 3.22.2.4 - Maze Part Three (Among the Lost)

Maze Part Three is a privately-named room in the Shanty Maze. "There are so many people here. Mothers. Daughters. You see goblin boys fighting over scraps, and mutant children with two mouths and nothing to eat. You push through the crowd and they barely even notice your presence, so lost are they in their own suffering."

The printed name is "Among the Lost".
The sound is "The walls echo with the sounds of laughter and tears."
The scent is "It smells horrible in here."
The exit reminder is "You don't know which way to go."

The nightmarish architecture and the slum-dwellers are in Maze Part Three.

Some slum women are a hostile undescribed mixed-race woman in Maze Part Three.
The description is "You were like them once. In some ways, you still are."
The sound is "They are voiceless, weightless."
The scent is "No one here has washed themselves in days."
Understand "mother/mothers" or "daughter/daughters" as the slum women.
Instead of talking to the slum women, say "The women have nothing to say to you."
Instead of giving something to the slum women, say "Misguided acts of charity won't change anything."

Some fighting boys are a hostile undescribed goblin man in Maze Part Three.
The description is "They're loud and mad and broken."
The sound is "They express their anger by screaming at the world."
The scent is "No one here has washed themselves in days."
Understand "boy" as the fighting boys.
Instead of talking to the fighting boys, say "You're scared to even approach."
Instead of giving something to the fighting boys, say "Misguided acts of charity won't change anything."

Some food scraps are faraway scenery in Maze Part Three.
The description is "It's barely enough for anyone to live on."
The food scraps have some text called the faraway response. The faraway response is "You're scared to even approach."

Some mutant children are an undescribed mutant person in Maze Part Three.
The description is "Some that have adapted to the living conditions here look more like monsters than people."
The sound is "They are voiceless, weightless."
The scent is "No one here has washed themselves in days."
Understand "child" or "two" or "mouth/mouths" or "monster/monsters" as the mutant children.
Instead of giving something to the mutant children, say "Misguided acts of charity won't change anything."

Section 3.22.2.4.1 - Beggars in Maze Part Three

Some beggars are a hostile mixed-race person in Maze Part Three. "You[one of] find yourself suddenly set upon[or]'re surrounded[stopping] by a legion of beggars, grabbing at your trousers, thrusting empty hats into your face, baying like starving dogs."
The description is "These people are mad from desperation."
The sound is "They're all shouting over each other. You have no idea what they're saying."
The scent is "You wish you hadn't."
Understand "legion of/--" or "beggar" or "empty" or "hat/hats" or "starving" or "dog/dogs" as the beggars.
Before pushing the beggars, try going outside instead.
Instead of attacking or cutting the beggars, say "There are too many of them."
Instead of searching the beggars, say "These people have nothing."
Instead of kissing, knocking on, pulling, rubbing, smelling, squeezing, touching, or turning the beggars, say "That will only encourage them."

[The beggars are accompanied by some ambience that repeatedly forces them to the forefront of the narrative until the player flees from them.]

To print the beggar ambience:
	say "The beggars [one of]clutch at your clothes[or]crush around you[or]are screaming at you[or]try in vain to grab your purse[or]dog your footsteps[or]are chasing you[in random order].";

Every turn when the beggars are in the location (this is the beggar ambience rule):
	if ambience suppression is false:
		print the beggar ambience;
	otherwise:
		now ambience suppression is false.

After looking in Maze Part Three: now ambience suppression is true; continue the action. [We suppress the ambience so it doesn't print the first time the player looks in the room, and so as not to repeat ourselves since the beggars' actions are already mentioned.]
		
Instead of inserting the purse into the beggars, enact the beggarpocalypse.
Instead of putting the purse on the beggars, enact the beggarpocalypse.
Instead of opening the purse when the beggars are in the location, enact the beggarpocalypse.
Instead of giving something to the beggars:
	if the noun is the purse:
		enact the beggarpocalypse;
	otherwise:
		say "That isn't what they want.";

Some dialogue branches are defined by the Table of Beggar Dialogue.

Table of Beggar Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
beggars-home	true	false	""	""	{beggars-leavemealone, beggars-givemoney, beggars-nevermind}
beggars-leavemealone	true	false	"'Leave me alone!'"	"'Leave me alone!' you cry.

But they don't hear you. All they see is a rich stranger."	{}
beggars-givemoney	true	false	"<Give them some money.>"	""	{}
beggars-nevermind	true	false	"<Never mind.>"	""	{}

The home dialogue branch of the beggars is beggars-home.
After reading out beggars-givemoney: enact the beggarpocalypse.
After reading out beggars-nevermind: print the beggar ambience.
	
[Rejected names for the beggarpocalypse: The beggarclysm. The beggastrophe. Begnarok.]

To enact the beggarpocalypse:
	say "You take out your purse and it is like a beacon. Diseased, mottled hands reach out. Bloodshot eyes are glued to your movements. With shivering hands you fish out a five-librae note --

[wait for any key]They come at you like a tidal wave, whooping, screaming, grabbing at your ankles, as though if they pin you down, they will be rich forever.

The note is dropped, lost. You flee from the beggars in a panic...[paragraph break]";
	send Marid into the fire.

Instead of going in Maze Part Three (this is the wander to Maze Part Four rule):
	say "You flee from them...[paragraph break]";
	send Marid into the fire.

Chapter 3.22.2.5 - Maze Part Four (Into the Fire)

[Poor Marid.]

To send Marid into the fire:
	wait for any key;
	move the player to Maze Part Four, without printing a room description;
	say "[bold type][Maze Part Four][roman type][line break]";
	wait for any key;
	say "A garbage fire, roaring and acrid and unmistakably fecal. The flames are green and blue from alchemical decomposition, and dead bodies feed the fire and stoke its insatiable hunger with their animii.[paragraph break]";
	wait for any key;
	say "You sink to your knees.";
	now marid-kneeling-in-maze is true.

Maze Part Four is a privately-named room in the Shanty Maze. "A garbage fire, and the green and blue flames lick at your jacket and sting your eyes raw with tears.

But somewhere far to the west, you think you see sunlight."

The printed name is "Into the Fire".
The sound is "Flames."
The scent is "Smoke."
The exit reminder is "What's that in the west...?"

Instead of examining a direction in Maze Part Four:
	if the noun is west:
		try examining the glimmer of sunlight;
	otherwise:
		say "There is nothing for you there."

The garbage fire is faraway scenery in Maze Part Four.
The description is "The fire burns."
The sound is "Flames."
The scent is "Smoke."
The garbage fire has some text called the faraway response. The faraway response is "No."
Understand "green" or "and" or "blue" or "flame/flames" or "dead" or "body/bodies" or "animus/animii" or "corpse/corpses" as the garbage fire.

Instead of approaching when the garbage fire is in the location, say "That seems an eternity away, now."
Instead of attacking or cutting the player when the garbage fire is in the location, say "No."
Instead of burning when the garbage fire is in the location, say "No."
Instead of crying when the garbage fire is in the location, say "You cry."
Instead of jumping when the garbage fire is in the location, say "You can't bring yourself to."
Instead of examining the player when the garbage fire is in the location, say "You are not okay."
Instead of doing something with something (called the held item) enclosed by the player when the garbage fire is in the location, say "[regarding the held item][They] [don't] matter."
Instead of taking inventory when the garbage fire is in the location, say "It doesn't matter."
Instead of waiting when the garbage fire is in the location, say "Every second is an eternity."

The glimmer of sunlight is faraway scenery in Maze Part Four.
The description is "It's so close."
The sound is "You hear voices."
The scent is "Your senses fail you."
The glimmer of sunlight has some text called the faraway response. The faraway response is "It's so far away."
Before entering the glimmer of sunlight, try going west instead.

marid-kneeling-in-maze is a truth state that varies.

Instead of going in Maze Part Four (this is the exiting the Shanty Maze rule):
	if the noun is west:
		if marid-kneeling-in-maze is true:
			say "You get to your feet.[paragraph break]";
			now marid-kneeling-in-maze is false;
			wait for any key;
		say "Unsteadily, you walk.[paragraph break]";
		wait for any key;
		say "You close your eyes.[paragraph break]";
		wait for any key;
		say "You keep walking.[paragraph break]";
		wait for any key;
		say "You don't stop until you feel the sun on your face once more.[paragraph break]";
		wait for any key;
		now the player is in Cadaver Walk;
	otherwise if the noun is up or the noun is outside and marid-kneeling-in-maze is true:
		say "You get to your feet.";
		now marid-kneeling-in-maze is false;
	otherwise if the noun is up:
		say "There is nothing for you above.";
	otherwise if the noun is down:
		if marid-kneeling-in-maze is true:
			say "There is nothing for you below.";
		otherwise:
			say "You are not going to sink to your knees again.";
	otherwise:
		say "There is nothing for you there."
		
Part 3.22.3 - Shanty Quarter during Day Two

When Day Two begins:
	now the Shanty Quarter is goto-passable.
	
shantyquarter-daytwo-quipped is a truth state that varies.

Before going to the Shanty Quarter when Day Two is happening and shantyquarter-daytwo-quipped is false:
	if the player is hurrying and the final destination is not the Shanty Quarter:
		say "Through the Shanty Quarter?[paragraph break]";
	say "You take a deep breath.[paragraph break]";
	wait for any key;
	now shantyquarter-daytwo-quipped is true.

Book 3.23 - Cadaver Walk

There is a proper-named room in Outdoors called Cadaver Walk. "You[one of][']ve emerged out onto[or] are on[stopping] a bridge, if it can be called that: a haphazard assortment of ropes, planks, chains, warning signs, layers upon layers bound up in incomprehensible knots. Below the lines trail where they have snapped and never been repaired, and the Bilious Canal gobbles them up as they descend.

Riggertown is to the west, while the Shanty Quarter is to the east."
It is west of the Shanty Quarter.

The sound is "The hanging lines clink; the wind blows dire."
The scent is "The bridge is thick with the scent of the canal."
The exit reminder is "You can go west to Lower Riggertown or east to the Shanty Quarter."
The going-in disambiguation is "Do you mean going west (to Lower Riggertown) or east (to the Shanty Quarter)?"

Before going down in Cadaver Walk, try swimming instead.
Before examining west in Cadaver Walk, try examining the view of Riggertown instead.
Before examining east in Cadaver Walk, try examining the view of the Shanty Quarter instead.
Before examining down in Cadaver Walk, try examining the Bilious Canal instead.
Instead of examining inside in Cadaver Walk, say "It's unclear where you want to look."
Instead of examining outside in Cadaver Walk, say "It's unclear where you want to look."

Instead of jumping in Cadaver Walk, say "You lack the nerve."
Check putting it on when the location is Cadaver Walk: say "There's no stable surface to put anything on."
Carry out dropping when the location is Cadaver Walk:
	say "The Bilious Canal swallows [the noun] with a plop.";
	now the noun is nowhere;
	stop the action.

Part 3.23.1 - Scenery

The mist, the Bilious Canal, the view of Riggertown, and the view of the Shanty Quarter are in Cadaver Walk.

Before entering the view of Riggertown in Cadaver Walk, try going west instead.
Before entering the view of the Shanty Quarter in Cadaver Walk, try going east instead.

The haphazard bridge is scenery in Cadaver Walk.
The description is "You can see why they call it Cadaver Walk."
The sound is "The bridge rattles dishearteningly in the wind."
The scent is "The mist has soaked into the bridge, and its smell pervades it."
Understand "cadaver" or "walk" or "assortment" or "layer/layers" or "incomprehensible" or "knot/knots" or "lash/lashes/lashed/lashing/lashings" as the haphazard bridge.
Instead of pushing or swinging the haphazard bridge, try jumping.
Instead of looking under the haphazard bridge, say "The Bilious Canal rushes below."
Instead of attacking, cutting, or opening the haphazard bridge, say "That seems less than wise."
Instead of knocking on or touching the haphazard bridge, say "At least the bridge seems solid enough."
Instead of pulling, squeezing, or taking the haphazard bridge, say "You hold on tight."
Before attacking, cutting, knocking on, opening, pushing, pulling, squeezing, swinging, taking, or touching something part of the haphazard bridge: now the noun is the haphazard bridge.

Some rigging ropes are part of the haphazard bridge.
The description is "Thick, coarse ropes, the kind once used for rigging sails."
The scent is "The ropes smell like brine."
Understand "rope" or "brine" as the rigging ropes.
Instead of tying something to the rigging ropes, say "There's no need to do that."
Instead of tying the rigging ropes to something, say "There's no need to do that."

Some motley planks are part of the haphazard bridge.
The description is "They seem to be supporting your weight. Mostly."
The sound is "The planks creak when you step on them."
The scent is "They smell like mud and canal water."
Understand "plank" or "mud" as the motley planks.

Some corroded chains are part of the haphazard bridge.
The description is "Corrosion is setting in. Not a good omen."
The sound is "The chains rattle like an old machine."
The scent is "The chains have a gritty metallic whiff about them."
Understand "chain" or "rust/rusted/rusty" or "corrosion" as the corroded chains.
Instead of tying something to the corroded chains, say "There's no need to do that."
Instead of tying the corroded chains to something, say "There's no need to do that."

Some ineffectual warning signs are part of the haphazard bridge.
The description is "It seems this bridge was slated to be demolished six years ago."
The sound is "The signs clatter about as the bridge sways."
Understand "sign" as the ineffectual warning signs.

Some trailing lines are faraway scenery in Cadaver Walk.
The description is "They clink when the wind blows, coiling and uncoiling. The lines that touch the water are streaked with slime."
The sound is "There is a dissonant melody to the clinking."
Understand "snapped" as the trailing lines.

Some streaks of canal-slime are part of the trailing lines.
The description is "It's not very appealing to look at."
Understand "streak" or "canal/-- slime" as the streaks of canal-slime.

Part 3.23.2 - Cadaver Walk during Day One

Instead of going east in Cadaver Walk during Day One, say "You don't really want to go back in there."
Instead of approaching the Shanty Quarter when Day One is happening and Cadaver Walk is visited: say "You don't really want to go back in there."

Book 3.24 - Riggertown Lower Level

There is a region in Outdoors called Riggertown.

Riggertown Lower Level is a proper-named room in Riggertown. "This peculiarly goblin neighborhood bristles with mechanical-chymical detritus. There are twisty catwalks made for childlike feet, and sheet-metal shacks you must stoop to enter. Here and there in the shadow of the upper landing, neon lamps glow and windchimes tinkle like laughter.

You can climb a ladder up to the next level, [if Reden's Shack is visited]visit Reden's shack[otherwise]wander among the shacks[end if] to the west, or cross the canal east by way of Cadaver Walk."
It is west of Cadaver Walk.
The printed name is "Riggertown, Lower Level". 

The simple-name is "Lower Riggertown".
The sound is "The goblins chatter; the landings creak."
The scent is "The landing smells of grease and brine."
The exit reminder is "You can go up to Upper Riggertown, west to [if Reden's Shack is visited]Reden's shack[otherwise]the shacks[end if], or east to Cadaver Walk."
The going-in disambiguation is "Do you mean going up (to Upper Riggertown) or west (to [if Reden's Shack is visited]Reden's shack[otherwise]the shacks[end if])?"

Before examining west in Riggertown Lower Level, try examining the sheet-metal shacks instead.
Before examining east in Riggertown Lower Level, try examining the view of Cadaver Walk instead.
Before examining up in Riggertown Lower Level, try examining the view of the upper landing instead.
Before examining down in Riggertown Lower Level, try examining the Bilious Canal instead.
Instead of examining inside in Riggertown Lower Level, say "It's unclear where you want to look."
Instead of examining outside in Riggertown Lower Level, say "It's unclear where you want to look."

Part 3.24.1 - Scenery

The mist, the Bilious Canal, the view of Cadaver Walk, the view of the upper landing, the arcane system of ladders, the twisty catwalks, the Riggertown crowd, and the Riggertown ambience are in Riggertown Lower Level.

Before entering the view of Cadaver Walk in Riggertown Lower Level, try going east instead.
Before entering the view of the upper landing in Riggertown Lower Level, try going up instead.
Before entering the arcane system of ladders in Riggertown Lower Level, try going up instead.

The mechanical-chymical detritus is scenery in Riggertown Lower Level. The indefinite article is "some".
The description is "It looks like it was built out of a junkyard. Then again, it probably was."
The scent is "It smells powerfully of grease and train oil."
Understand "neighborhood/neighbourhood" or "mechanical" or "chymical/chemical" or "junk" or "riggertown" or "lower" or "landing" as the mechanical-chymical detritus.
Before smelling or listening to the mechanical-chymical detritus, now the noun is the location.
Instead of climbing the mechanical-chymical detritus, say "The ladders seem like a much more sensible way to get around."
Instead of entering the mechanical-chymical detritus, say "You're standing in it."
Instead of looking under the mechanical-chymical detritus, say "You can see the water through the gaps in the landing."
Instead of searching the mechanical-chymical detritus, say "This place is full of fascinating but ultimately impractical junk."

Some sheet-metal shacks are scenery in Riggertown Lower Level.
The description is "Squatting in clusters, or suspended from girders, or stacked preposterously on top of each other with ladders and beams."
The sound is "You hear the sounds of everyday living."
The scent is "You smell burnt metal and train oil. Goblin cooking, in other words."
Understand "sheet" or "metal" or "shack" or "door/doors" as the sheet-metal shacks.
Before entering or searching the sheet-metal shacks when Reden's Shack is unvisited, try going west instead.
Instead of entering, knocking on, or searching the sheet-metal shacks, say "You see no reason to disturb the residents."
Instead of climbing the sheet-metal shacks, say "That doesn't seem necessary."

Some neon lamps are scenery in Riggertown Lower Level.
The description is "There is a colorful, childlike wonder to the arrangement."
The sound is "The lamps hum."
The scent is "Unlike with animus lighting, these lamps are odorless."
Understand "lamp" or "arrangement" as the neon lamps.
Instead of looking under the neon lamps, say "You're under them."
Instead of touching the neon lamps, say "The lamps are warm to the touch."

Some tinkling windchimes are scenery in Riggertown Lower Level.
The description is "You've heard that these windchimes evolved from goblin religious practices. These days, they're mostly for decoration."
The sound is "It's a gentle sound they make."
Understand "windchime" or "chime/chimes" as the tinkling windchimes.
Instead of knocking on, pulling, pushing, squeezing, swinging, touching, or turning the tinkling windchimes, say "Tinkle, tinkle, go the windchimes."

The view of Reden's shack is faraway scenery.
The description is "It looks small and sad."
The sound is "It's quiet."
Before entering or searching the view of Reden's shack, try going west instead.
Instead of climbing the view of Reden's shack, say "That strikes you as highly unnecessary."

Part 3.24.2 - Riggertown Lower Level during Day One

Before going west in Riggertown Lower Level when Cavala's Errands is happening:
	say "You wander among the shacks for a bit, but you don't think Zoiro lives there. You return to the main level before you get lost.";
	stop the action.
	
Before going west in Riggertown Lower Level when Returning to a Break-In is happening:
	say "You wander among the shacks for a bit, but it's getting dark out. You return to the main level before you get lost.";
	stop the action.

Chapter 3.24.2.1 - Donti

Donti is an improper-named goblin man in Riggertown Lower Level. "[if Donti is proper-named]Donti is sitting[otherwise]A scruffy old goblin sits[end if] on [if Donti is proper-named]his usual[otherwise]a[end if] post, chewing on [if Donti is proper-named]his[otherwise]a[end if] golden stick and watching the midday crowd."
The indefinite article is "a". The printed name is "scruffy old goblin".
The description is "You're not sure which is wrinklier -- his shirt or his scalp."
The sound is "The stick crunches noisily in his mouth."
The scent is "He smells like old leather and deodorant."
Understand "scruffy" or "old" or "scalp" or "mouth" as Donti.
Instead of looking under Donti when the location of Donti is the location of the little tin post, say "He's sitting on a post."

The crumpled shirt is worn by Donti.
The description is "This shirt looks as though it hasn't been ironed since the Cataclysm."
Understand "wrinkled/wrinkly" as the crumpled shirt.

The half-chewed golden stick is carried by Donti.
The description is "[if the enabled of donti-stick is true]Not a biscuit, but a stick of actual gold[otherwise]The goblin equivalent of junk food, it seems[end if]."
The sound is "The stick crunches noisily in [if Donti is proper-named]Donti[otherwise]the old goblin[end if]'s mouth."
Understand "gold" or "biscuit" or "chewed" or "half" as the half-chewed golden stick.
Instead of doing anything other than listening to or examining with the half-chewed golden stick, say "The stick appears to be in use at the moment."

The little tin post is a scenery supporter in Riggertown Lower Level.
The description is "It's a little tin post just the right height for a goblin to sit on."
The carrying capacity is 1.
Instead of entering the little tin post, say "It's too small for you."
Instead of entering the little tin post when the location of Donti is the location of the little tin post, say "The post is already occupied."
Instead of putting something on the little tin post when the location of Donti is the location of the little tin post, say "The post is already occupied."
Instead of searching the little tin post when the location of Donti is the location of the little tin post, say "[The Donti] is sitting on it."

Section 3.24.2.1.1 - Donti Dialogue

Some dialogue branches are defined by the Table of Donti Dialogue.

Table of Donti Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
donti-home	true	false	""	"The old goblin raises an eyebrow as you approach. He pops the half-chewed stick out of his mouth.

'Something [one of]on your mind[or]else you wanted[stopping], girlie?'"	{donti-greeting, donti-name, donti-stick, donti-goldtaste, donti-address, donti-symptoms, donti-nothingbye}
donti-greeting	true	true	"'Good afternoon, sir.'"	"'Good afternoon, sir.'

His lips curl wryly. 'Don't [']sir['] me, girlie,' he says. 'Ain't no need for your uptown airs here in Riggertown. Good afternoon to you, and Donti's the name.'

'Um... I'm Marid,' you say. 'It's nice to meet you, Donti.'

'That's the spirit.'"	{donti-stick, donti-goldtaste, donti-address, donti-symptoms, donti-bye}
donti-name	false	true	"'By the way, I never caught your name.'"	"'By the way, I never caught your name.'

His lips curl wryly. 'Never caught yours either.'

'Um... I'm Marid,' you say. 'Marid Orpheia.'

'Well, I'm Donti,' he says. 'Just Donti. Good afternoon to you, Marid Orpheia.'"	{donti-stick, donti-goldtaste, donti-address, donti-symptoms, donti-bye}
donti-stick	true	true	"'What's that you're chewing on?'"	"'What's that you're chewing on?'

'This?' He holds up the half-chewed stick. 'It's a stick of gold. I'm sucking on it, see? Brings out the flavor.'

'Oh.'

'Yeah.'"	{donti-goldtaste, donti-name, donti-address, donti-symptoms, donti-bye}
donti-goldtaste	false	true	"'I'm curious. What does gold taste like?'"	"'I'm curious,' you remark. 'What does gold taste like?'

'Ah,' he says. 'Now there's a fine question. Metals, see, all of them have got different flavors. You're a doctor, ain't you?'"	{donti-yesdoctor, donti-nodoctor}
donti-yesdoctor	true	true	"'Um, yes.'"	"'Um, yes.'

'I figured [if the enabled of donti-symptoms is true]from your jacket[otherwise]as much[end if].' He waggles the stick. 'Anyway. You studied all about the metal correspondences, yes? Lead to yellow bile, tin to blood, iron to black bile? It tastes just like that. You can taste them like a bouquet on your tongue -- the correspondences, the extremes.'"	{donti-soundsdisgusting, donti-whataboutgold}
donti-nodoctor	true	false	"'Um, no.'"	"'Um, no.'

'No?' His ears droop. 'I thought I had you figured[if the enabled of donti-symptoms is true] from your jacket[end if]. Anyway -- you've surely heard of the metal correspondences, yes? Lead to yellow bile, tin to blood, iron to black bile? It tastes just like that. You can taste them like a bouquet on your tongue -- the correspondences, the extremes.'"	{donti-soundsdisgusting, donti-whataboutgold}
donti-soundsdisgusting	true	false	"'That doesn't sound very palatable.'"	"'That doesn't sound very palatable.'

[if Donti is proper-named]Donti[otherwise]The goblin[end if] rolls his eyes.

'I'm not chewing on a stick of lead, am I? I'm just comparing. Now gold -- gold is different. Gold tastes like the [italic type]heart[roman type]. It tastes like the [italic type]sun[roman type], the [italic type]soul[roman type]. Biting down on a freshly transmuted nugget -- ah! Now that, I dare say, is a feast fit for a king.'"	{donti-interesting, donti-unhealthy}
donti-whataboutgold	true	false	"'So what does gold taste like?'"	"'So what does gold taste like?'

'Gold, you ask?' [if Donti is proper-named]Donti[otherwise]The goblin[end if] leans forward with shining eyes. 'Gold is different from all of them. Gold corresponds to the [italic type]heart[roman type]. Tasting it is like tasting the [italic type]sun[roman type], the [italic type]soul[roman type]. Biting down on a freshly transmuted nugget -- ah! Now that, I dare say, is a feast fit for a king.'"	{donti-interesting, donti-unhealthy}
donti-interesting	true	false	"'That's... very interesting.'"	"'That's... very interesting.'

'It sure is.' He offers you the half-chewed stick. 'Want some?'

'...I'll pass, thanks.'"	{donti-name, donti-address, donti-symptoms, donti-bye}
donti-unhealthy	true	false	"'Is it healthy to be snacking on gold like this?'"	"'Is it healthy to be snacking on gold like this?'

He shrugs. 'You tell me, Doc.'

[if the enabled of donti-yesdoctor is false]'I... don't know?' you stammer. 'I never studied [italic type]this[roman type] aspect of goblin physiology...' [otherwise]'I -- I already told you, I'm not a doctor...' [end if]

'So it is, so it is. Healthful, not healthful -- who's counting? Not me, that's for certain.'

He takes another bite out of his stick, and grins a toothy grin."	{donti-name, donti-address, donti-symptoms, donti-bye}
donti-address	true	true	"'I'm looking for someone by the name of Zoiro...'"	"'I'm looking for someone by the name of Zoiro,' you explain. 'Do you have any idea where I might find him?'

[if Donti is proper-named]Donti[otherwise]The goblin[end if] scratches his head. 'Zoiro? Yeah, I know the fellow. Never see him without his mate. This time of day, they're probably working at the Riggertown Mechanistry.'

'Which way is the Mechanistry?'

A shrug. 'It's on the upper level. You can't miss it.'"	{donti-name, donti-stick, donti-goldtaste, donti-symptoms, donti-thanksbye}
donti-symptoms	true	true	"'Has anyone in Riggertown come down with a mysterious illness recently?'"	"'Has anyone in Riggertown come down with a mysterious illness recently?' you ask.

'Eh?' [if Donti is proper-named]Donti[otherwise]The goblin[end if] frowns. 'What kind of illness?'

You briefly elucidate the symptoms, and a black look comes over his face.

'Talk about a nasty business,' he remarks. 'No, I can't say I've ever come across something like that before, and I don't know anyone who has. But I'll keep an eye out, and I'll spread the word for you. You'll know if someone so much as sneezes in this town, so it is.'

'That would be a great help,' you say. 'Thank you.'

'Don't mention it. Just doing what I can.'"	{donti-name, donti-stick, donti-goldtaste, donti-address, donti-bye}
donti-bye	true	false	"'[if Donti is proper-named]Talk to you later, Donti[otherwise]I'll be back soon[end if].'"	"'[if Donti is proper-named]Talk to you later, Donti[otherwise]I'll be back soon[end if].'

'Good health to you.'

He waves you off and goes back to chewing on his stick."	{}
donti-nothingbye	true	false	"'Nothing, sorry.'"	"'Nothing, sorry.'

Without a word, he goes back to chewing on his stick."	{}
donti-thanksbye	true	false	"'Thanks. I'll be off, then.'"	"'Thanks. I'll be off, then.'

'Good health to you.'

He waves you off and goes back to chewing on his stick."	{}

The home dialogue branch of Donti is donti-home.

After reading out donti-greeting:
	now Donti is proper-named;
	now the indefinite article of Donti is "";
	now the printed name of Donti is "Donti";
	now the enabled of donti-name is false;
	now the conversational partner text is "Talking to [the Donti]";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	
After reading out donti-name:
	now Donti is proper-named;
	now the indefinite article of Donti is "";
	now the printed name of Donti is "Donti";
	now the enabled of donti-greeting is false;
	now the conversational partner text is "Talking to [the Donti]";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	
After reading out donti-stick:
	if Donti is improper-named, now the enabled of donti-name is true;
	now the enabled of donti-goldtaste is true.
	
After reading out donti-address:
	now journal-zoiro-address-known is true;
	if Donti is improper-named, now the enabled of donti-name is true.
	
After reading out donti-symptoms:
	if Donti is improper-named, now the enabled of donti-name is true.
	
Instead of talking to Donti (this is the no Donti dialogue left rule):
	if the enabled of donti-greeting is false and the enabled of donti-name is false and the enabled of donti-stick is false and the enabled of donti-goldtaste is false and the enabled of donti-address is false and the enabled of donti-symptoms is false:
		say "You can't think of anything to talk about.";
	otherwise:
		continue the action.

Section 3.24.2.1.2 - Despawning Donti

When Cavala's Errands ends:
	now Donti is nowhere.

Book 3.25 - Reden's Shack

There is a proper-named room called Reden's Shack. "This tiny hovel is visibly shabbier than the rest. The roof is uncomfortably low, and the space just a little too cramped to stand in. A pile of bedding dominates the only room, draped in dirty clothing and empty wine bottles.

The only exit is to the east."
It is west of Riggertown Lower Level.

The simple-name is "Reden's shack".
The sound is "No sound but your breathing."
The scent is "The bedding reeks."
The exit reminder is "The only exit lies east, to Lower Riggertown."

Instead of examining east in Reden's Shack, say "The exit is that way."
Instead of examining outside in Reden's Shack, say "The exit is that way."
Before going outside in Reden's Shack, try going east instead.

Before going to Reden's Shack (this is the entering Reden's Shack flavor rule):
	if Reden's Shack is unvisited:
		say "One shack among the others catches your attention. You enter cautiously...";
		now the view of Reden's shack is in Riggertown Lower Level;
	otherwise:
		if the player is staid, say "You duck into the shack...";
		
Before going from Reden's Shack (this is the leaving Reden's Shack flavor rule):
	if the player is staid, say "You emerge from the shack...";
	
Part 3.25.1 - Scenery

An uncomfortably cramped confine is scenery in Reden's Shack.
The description is "You don't think Reden got many human visitors. Or many visitors, for that matter."
Understand "roof" or "space" or "low" or "reden's" or "shack" or "tiny" or "hovel" or "confines" as the uncomfortably cramped confine.
Before listening to or smelling the uncomfortably cramped confine, now the noun is the location.
Before inserting something into the uncomfortably cramped confine, try dropping the noun instead.
Before putting something on the uncomfortably cramped confine, try dropping the noun instead.
Before removing something from the uncomfortably cramped confine, try taking the noun instead.
Instead of entering the uncomfortably cramped confine, say "You're already taking up what space there is to take up."
Instead of searching the uncomfortably cramped confine, say "You find nothing of interest apart from what you've already seen."

A pile of bedding is a scenery supporter in Reden's Shack.
The description is "It's messy and unmade."
The scent is "The smell isn't pleasant."
Understand "bed" or "blanket/blankets" as the pile of bedding.
Before searching the pile of bedding when nothing is on the pile of bedding, try looking under the pile of bedding instead.
Instead of pushing, pulling, looking under, rubbing, swinging, touching, or turning the pile of bedding, say "You poke through the bedding, but find nothing except more bedding."
Instead of inserting the endoscope into the pile of bedding, say "You poke through the bedding, but find nothing except more bedding."
Instead of bed-making the pile of bedding, say "There's a time and place to be fastidious about cleanliness. This isn't it."
Instead of entering the pile of bedding, say "You aren't comfortable getting into in a dead man's bed."
Instead of taking the pile of bedding, say "You'd look like a fool lugging all these blankets around."

The dirty clothing is scenery in Reden's Shack. The indefinite article is "some".
The description is "The clothing is crumpled and dirty, but otherwise unmarked. They smell like their owner has been wading around in canal-water."
The scent is "The odor is unmistakably that of the Bilious Canal."
Understand "crumpled" as the dirty clothing.
Before removing the dirty clothing from something, try taking the dirty clothing instead.
Instead of pushing, pulling, looking under, searching, swinging, or turning the dirty clothing, say "You find nothing in the clothing, or the bedding."
Instead of inserting the endoscope into the dirty clothing, say "You find nothing in the clothing, or the bedding."
Instead of rubbing the dirty clothing, say "You aren't about to do a dead man's laundry."
Instead of taking the dirty clothing, say "You can't imagine any reason to take the clothing with you."

Some empty wine bottles are scenery in Reden's Shack.
The description is "The labels denote shoddy liquor, third-pressed or fourth-pressed. It's charitable to call it wine at all."
The scent is "The scent in the bottles could, if you were feeling imaginative, be described as wine."
Understand "label/labels" or "liquor" or "shoddy" or "bottle" as the empty wine bottles.
Before removing the empty wine bottles from something, try taking the empty wine bottles instead.
Instead of drinking or opening the empty wine bottles, say "All of the bottles are empty. Besides, you aren't sure you'd want to drink any."
Instead of closing the empty wine bottles, say "You don't see any corks here."
Instead of inserting something into the empty wine bottles, say "That seems entirely unwise."
Instead of inserting the endoscope into the empty wine bottles, say "You see some reddish wine stains around the base of the bottles, but nothing out of the ordinary."
Instead of searching the empty wine bottles, say "Nothing about these bottles seems out of the ordinary."
Instead of taking the empty wine bottles, say "You don't need any of these bottles."

Part 3.25.2 - Drink Coupons

Some scattered coupons are a thing in Reden's Shack. "[one of]You notice some paper tickets[or]Some paper tickets are[stopping] scattered among the wine bottles."
The description is "[one of]Upon closer examination, t[or]T[stopping]hey appear to be coupons from an establishment called the 'Crow's Nest,' located in the rooftops of the Shanty Quarter. Each coupon entitles the holder to a free drink and a spin of the 'Daemon's Wheel.'"
Understand "drink" or "coupon" or "paper" or "ticket/tickets" as the scattered coupons.

After examining the scattered coupons:
	now clue-crowsnest is true;
	continue the action.
	
A drink coupon is a kind of thing.
The description of a drink coupon is usually "A paper ticket you found in Reden's shack. Each one entitles the holder to a free drink at the 'Crow's Nest,' located in the rooftops of the Shanty Quarter, as well as a spin of the 'Daemon's Wheel.'"
Understand "paper" or "ticket" as a drink coupon. Understand "tickets" or "coupons" as the plural of a drink coupon.

The Reden's Shack coupon container is a container. It contains three drink coupons.

Instead of taking the scattered coupons:
	now the scattered coupons are nowhere;
	now all drink coupons in the Reden's Shack coupon container are carried by the player;
	now clue-crowsnest is true;
	say "Taken.";
	
Instead of giving a drink coupon to someone, say "[if time is critical]This is not the time.[otherwise]You don't think [the second noun] would appreciate the gift."

Instead of attacking or cutting a drink coupon:
	say "You tear up the drink coupon.";
	now the noun is nowhere.
	
Instead of dropping a drink coupon:
	if the location is in Outdoors:
		say "The coupon flutters away in the wind.";
		now the noun is nowhere;
	otherwise if the location is not Marid's Room:
		say "You shouldn't leave the coupon lying around here.";
	otherwise:
		continue the action.

Book 3.26 - Riggertown Upper Level

Riggertown Upper Level is a proper-named room in Riggertown. "This is the more industrial part of Riggertown. The buildings here are scrap-heap spires that twist and turn around each other, with cubby-carts trundling along cables strung between them. Amidst horns honking advertisements, there is a great mess of little people shuffling about, and roads winding in ways wholly inexplicable to your human sensibilities.

To the south looms [first time]an enormously noisy factory, which signage identifies as [only]the Riggertown Mechanistry[one of]. A[or], while a[stopping] quieter road leads southwest to the suburbs. You could also descend a series of ladders to Lower Riggertown, or take a footpath north along the Bilious Canal."
It is south of Following the Canal. It is above Riggertown Lower Level.
The printed name is "Riggertown, Upper Level".

The simple-name is "Upper Riggertown".
The sound is "Noise drowns out more noise."
The scent is "The air is heavy with rust."
The exit reminder is "You can go south to the Riggertown Mechanistry, southwest to Layabout Row, down to Lower Riggertown, or north following the canal."
The going-in disambiguation is "Do you mean going south (to the Riggertown Mechanistry), southwest (to Layabout Row) or down (to Lower Riggertown)?"

Before examining south in Riggertown Upper Level, try examining the view of the Riggertown Mechanistry instead.
Before examining southwest in Riggertown Upper Level, try examining the quiet suburbs instead.
Before examining down in Riggertown Upper Level, try examining the arcane system of ladders instead.
Before examining north in Riggertown Upper Level, try examining the view of the footpath instead.
Instead of examining inside in Riggertown Upper Level, say "It's unclear where you want to look."
Instead of examining outside in Riggertown Upper Level, say "It's unclear where you want to look."

Part 3.26.1 - Scenery

The street-lamps, the mist, the Bilious Canal, the view of the footpath, the arcane system of ladders, the twisty catwalks, the Riggertown crowd, the scrap-heap spires, the view of the Riggertown Mechanistry, and the Riggertown ambience are in Riggertown Upper Level.

Before entering the view of the Riggertown Mechanistry in Riggertown Upper Level, try going south instead.
Before entering the arcane system of ladders in Riggertown Upper Level, try going down instead.

Some cubby-carts are faraway scenery in Riggertown Upper Level.
The description is "A series of belts conveys materials from building to building."
The sound is "The cubby-carts whir continuously along their paths."
Understand "cubby" or "cart/car/cars/carriage/carriages" or "cable/cables/belt/belts" or "trundling" or "conveyor" or "material/materials" or "path/paths" as the cubby-carts.
Instead of climbing or entering the cubby-carts, say "The cubby-carts are for materials, not people."
Instead of inserting something into the cubby-carts, say "That seems unwise. [regarding the noun][They]'d be ground into powder, or made into cubes, or who knows what else."

Some advertising horns are faraway scenery in Riggertown Upper Level.
The description is "[one of]'FRACTALOBELEMNOID SOLUTION: FOR AN AETHERICALLY AESTHETIC YOU.'[or]'LIGHT UP YOUR LIFE WITH CAMINUS CANDLES.'[or]'HISTORY IS OBSCURED NO MORE. EXPERIENCE THE ALL-NEW, ALL-MECHANICAL CAMERA OBSCURA.'[or]'DOCTOR CAVALA: PHYSICIAN. SURGEON. ACCREDITED APOTHECARY.'[or]'KEEP YOUR LOVED ONES SAFE. BUY FERROQUE AND SONS.'[or]'REDEFINE YOURSELF WITH GILLIAN'S GLAMERS.'[or]'AS ABOVE, SO BELOW. MERCURIAL MIRRORS.'[or]'DO YOU FEEL LUCKY? VISIT FISCO'S HOUSE OF SMOKE.'[in random order]".
Before listening to the advertising horns, try examining the advertising horns instead.
Understand "advertisement/advertisements" or "horn" or "honking" as the advertising horns.

Some quiet suburbs are faraway scenery in Riggertown Upper Level.
The description is "A sign reads 'Layabout Row.'"
The sound is "It's quiet."
Understand "sign" or "suburb" or "quieter road" or "layabout" or "row" as the quiet suburbs.
Before entering the quiet suburbs, try going southwest instead.

Part 3.26.2 - Riggertown Upper Level during Day One

Instead of going north in Riggertown Upper Level while Cavala's Errands is happening:
	say "You shouldn't go back yet. You still have to find Zoiro in Riggertown."
	
returning-breakin-riggertown-quip is a truth state that varies.

When Returning to a Break-In begins:
	now returning-breakin-riggertown-quip is true.

First every turn when the location is Riggertown Upper Level and returning-breakin-riggertown-quip is true (this is the Returning to a Break-In Riggertown Upper Level quip rule):
	say "It's getting dark out. The spires and factories are closing for the day.";
	now returning-breakin-riggertown-quip is false;
	now ambience suppression is true;

Book 3.27 - Riggertown Mechanistry

There is a proper-named room called the Riggertown Mechanistry. "This building is just as haphazard inside as it is on the outside. Assembly lines run up and down and all around the many levels of this building, weighed down by unfinished, not-quite-manufactured things. At stations along the lines, factory workers are hunched over workbenches, welding disparate parts together within acceptable margins of irregularity.

To the north, through a series of raised metal shutters, is the exit."

The simple-name is "the Riggertown Mechanistry".
The sound is "The assembly lines creak along."
The scent is "The smell of grease is overwhelming here."
The exit reminder is "The exit is to the north."

Before examining north in the Riggertown Mechanistry, try examining the raised metal shutters instead.
Before examining outside in the Riggertown Mechanistry, try examining the raised metal shutters instead.
Before examining up in the Riggertown Mechanistry, try examining the factory floors instead.
Before going outside in the Riggertown Mechanistry, try going north instead.
Before going up in the Riggertown Mechanistry, try entering the factory floors instead.

Part 3.27.1 - Scenery

Some assembly lines are a scenery supporter in the Riggertown Mechanistry.
The description is "The conveyor belts are held together with paper, rubber, string, and faith."
The sound is "The machinery is extremely loud."
The scent is "The mechanisms have been rather overzealously greased."
Understand "line" or "conveyor" or "belt/belts" or "paper" or "rubber" or "string" or "faith" or "machinery" or "mechanism/mechanisms" as the assembly lines.
Instead of attacking, cutting, entering, knocking on, pushing, pulling, rubbing, squeezing, switching on, switching off, taking, touching, or turning the assembly lines, forbid factory interference.
Instead of inserting something into the assembly lines, forbid factory interference.
Instead of putting something on the assembly lines, forbid factory interference.
Instead of throwing something at the assembly lines, forbid factory interference.
Instead of searching the assembly lines, say "The assembly lines are laden with unfinished goods."
Instead of looking under the assembly lines, say "The assembly lines crisscross over each other."

Some factory floors are faraway scenery in the Riggertown Mechanistry.
The description is "This building must have five or six floors."
The sound is "Grinding and chugging echoes from every floor."
The scent is "You smell grease from one level, and phlogiston from the next."
Understand "many/-- level/levels" or "floor" or "of/-- this/-- building" or "ground" as the factory floors.
Instead of entering the factory floors, say "You poke around the upper floors for a while, but find only more of the same, and eventually return to the ground floor."

Some unfinished goods are scenery on the assembly lines.
The description is "Everything from kettles to kitchen sinks is assembled here."
The sound is "The goods grind along on the conveyor belts."
The scent is "You smell glue and varnish."
Understand "not-quite-manufactured" or "thing/things" or "good" or "kettle/kettles" or "kitchen" or "sink/sinks" or "disparate" or "part/parts" as the unfinished goods.
Instead of attacking, cutting, entering, knocking on, pushing, pulling, rubbing, squeezing, taking, touching, or turning the unfinished goods, forbid factory interference.
Instead of looking under the unfinished goods, say "The goods are sitting on the assembly lines."
Instead of searching the unfinished goods, say "There's far too much to take in."

Some factory workbenches are a scenery supporter in the Riggertown Mechanistry.
The description is "At each bench, a worker."
The scent is "You smell the various substances of the manufacturing trade."
Understand "station/stations" or "workbench" or "work" or "bench/benches" as the factory workbenches.
Before listening to the factory workbenches, try listening to the factory workers instead.
Instead of attacking, cutting, entering, knocking on, pushing, pulling, rubbing, squeezing, taking, touching, or turning the factory workbenches, forbid factory interference.
Instead of putting something on the factory workbenches, forbid factory interference.
Instead of searching the factory workbenches, say "The workers are assembling unfinished goods."

Some factory workers are an undescribed goblin person in the Riggertown Mechanistry.
The description is "They are a nameless mass of low-cost labor. They all wear the same dungarees, and they all have the same numb look in their eyes."
The sound is "Welding, clicking, and the odd uttered curse word."
The scent is "They're drenched in the odor of grease and welding fluid."
Understand "goblins" or "worker" or "nameless" or "mass" or "eye/eyes" or "staff" as the factory workers.
Instead of searching the factory workers, say "The workers all look the same. You can't tell one from another."
Instead of talking to the factory workers, say "None of them look like they have time for you."

Some identical dungarees are worn by the factory workers.
The description is "Gray corduroy dungarees with iron-rivet buttons."
Understand "gray" or "corduroy" or "iron" or "rivet" or "iron-rivet" or "button/buttons" as the identical dungarees.

Some raised metal shutters are an open unopenable scenery door.
They are south of Riggertown Upper Level and north of the Riggertown Mechanistry.
The description is "The shutters lead [if the location is Riggertown Upper Level]inside the Riggertown Mechanistry[otherwise]outside to Riggertown[end if]."
The sound is "It's hard to hear anything over the din."
The scent is "You can't smell anything over the odor of grease."
Understand "shutter" or "exit" as the raised metal shutters.
Before listening to or smelling the raised metal shutters when the location is Riggertown Upper Level, now the noun is the view of the Riggertown Mechanistry.
Instead of closing the raised metal shutters, forbid factory interference.
Instead of knocking on the raised metal shutters, say "The shutters are open."
Before searching the raised metal shutters, try examining the raised metal shutters instead.

Part 3.27.2 - Factory Interference

To forbid factory interference: say "[one of]Despite appearances, this is a real factory. You shouldn't interfere with the work going on[or]You shouldn't interfere with the workings of the factory[stopping]."; stop the action.

Part 3.27.3 - Riggertown Mechanistry during Day One

Chapter 3.27.3.1 - Forewoman

The forewoman is a hostile goblin woman in the Riggertown Mechanistry. "[one of]A large gobliness is walking among the workers, pausing now and then to dish out a tongue-lashing. This must be the forewoman of the shift[or]The forewoman is pacing around the factory floor, keeping an irritable eye on her staff[stopping]."
The description is "She's the largest, most intimidating goblin you've ever seen. The effect is somewhat diminished by her being a head and a half shorter than you are."
The sound is "You don't envy the workers who have to listen to her shouting all day."
The scent is "The forewoman smells of starch and phlogiston."
Understand "foreman" or "large" or "gobliness" or "of/-- the/-- shift" as the forewoman.

Chapter 3.27.3.2 - Forewoman Dialogue

Some dialogue branches are defined by the Table of Forewoman Dialogue.

Table of Forewoman Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
forewoman-home	true	false	""	"As the forewoman finishes lecturing one of her workers, you take the opportunity to approach her.

'Excuse me,' you say[one of]. 'Are you the forewoman here?'

She turns and grimaces. 'What do you want? Make it quick. I'm busy.'[or].

'You again?' She turns and crosses her arms. 'What do you want [italic type]now?'[roman type][stopping]"	{forewoman-attitude, forewoman-lookingfor, forewoman-nevermind}
forewoman-attitude	true	true	"'Do you greet everyone like that?'"	"'Do you greet everyone like that?'

'Only the wiseacre humans,' she replies, 'who don't know how to get to the bloody point.'"	{forewoman-lookingfor, forewoman-nevermind}
forewoman-lookingfor	true	false	"'I'm looking for a man named Zoiro...'"	"'I'm looking for a man named Zoiro. [if journal-zoiro-address-known is true]I have it on good authority that he's employed here.[otherwise]Would you happen to know him by any chance?[end if]'

'[if journal-zoiro-address-known is false]Know him? I [italic type]hired[roman type] him[otherwise]Yeah, he is[end if].' The forewoman narrows her eyes. 'What's this about? He miss a payment for something?'"	{forewoman-sthlikethat, forewoman-message, forewoman-badnews}
forewoman-sthlikethat	true	false	"'Something like that.'"	"'Something like that.'

She rolls her eyes. 'That's what I thought. Bloody layabout never gets anything done. Chats with his mate when he thinks I'm not looking.' She glances at you. 'You're from the clinic, right?'

'Um, yes.'

'Good, good. He'll listen to a doctor's authority. Give him a piece of my mind for me, would you?'

[wait for any key]The forewoman leads you in a circuit around the factory floor. You find yourself before a pair of men who are hard at work assembling animus lanterns. As she clears her throat, both of them look up with trepidation."	{zoiro-mechanistry-um, zoiro-mechanistry-hello, zoiro-mechanistry-whichzoiro}
forewoman-message	true	false	"'I have a message for him. From Doctor Cavala.'"	"'I have a message for him. From Doctor Cavala.'

'From Doctor Cavala?'

There's a tincture of surprise in the forewoman's voice. She shakes her head and begins to pace.

'Of course. Don't know why I didn't recognize you sooner. I saw Doctor Cavala for my shingles once, and -- well, that old warhorse doesn't pussyfoot around, does she? If you're on business from her, don't let me stop you...'

[wait for any key]She leads you in a circuit around the factory floor. You find yourself before a pair of men who are hard at work assembling animus lanterns. As the forewoman clears her throat, both of them look up with trepidation."	{zoiro-mechanistry-um, zoiro-mechanistry-hello, zoiro-mechanistry-whichzoiro}
forewoman-badnews	true	false	"'There's been a death in the family. I'm here to break the bad news.'"	"'There's been a death in the family. I'm here to break the bad news.'

She covers her mouth.

'Oh,' she says. 'Oh dear. I didn't think...'

She shakes her head and trails off. With a wave of her hand she beckons you to follow, and the two of you make your way across the factory floor.

'Damned unlucky business,' she mutters. 'Was it violence or disease that -- oh, it doesn't matter. I suppose I'll have to give him compassionate leave either way...'

[wait for any key]She leads you to one of the side stations, where a pair of men are hard at work assembling animus lanterns. They look up with trepidation as you approach."	{zoiro-mechanistry-um, zoiro-mechanistry-hello, zoiro-mechanistry-whichzoiro}
forewoman-nevermind	true	false	"'Never mind. Forget I asked.'"	"You sigh. 'Never mind. Forget I asked.'

The forewoman returns to her rounds, grumbling about tourists wasting her time."	{}

The home dialogue branch of the forewoman is forewoman-home.
After reading out forewoman-sthlikethat: perform the forewoman-Zoiro switcheroo.
After reading out forewoman-message: perform the forewoman-Zoiro switcheroo.
After reading out forewoman-badnews: perform the forewoman-Zoiro switcheroo.

To perform the forewoman-Zoiro switcheroo:
	say line break;
	say wait for any key;
	now the forewoman is nowhere;
	now the conversational partner text is "Talking to two goblins";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	redraw status line;
	say "'Zoiro!' she says. 'This here lady's got a message for you. Listen up, because she's only going to say it once.'

[wait for any key]You glance at her. She inclines her head, as if to say [italic type]you're on your own now,[roman type] before turning and disappearing into the forest of assembly lines.

You're left with the two goblins, who are more than a little nonplussed. They look at you. You look at them.";
	
Chapter 3.27.3.3 - Zoiro Mechanistry Dialogue

Some dialogue branches are defined by the Table of Zoiro Mechanistry Dialogue.

Table of Zoiro Mechanistry Dialogue
dialogue branch	enabled	one-shot	prompt	description	 choices
zoiro-mechanistry-um	true	true	"'Um.'"	"'Um,' you say.

[if zoiro-mechanistry-namesknown is true]Zoiro[otherwise]The goblin on the left[end if] gives you a sympathetic look.

'Relax,' he says. 'Take your time. The longer you keep us, the longer we get paid for not working.'

'Right.'

A beat.

'...But don't stand here too long,' [if zoiro-mechanistry-namesknown is true]Koriph[otherwise]the goblin on the right[end if] adds. 'The glue's liable to dry, and nobody wants that.'"	{zoiro-mechanistry-hello, zoiro-mechanistry-whichzoiro, zoiro-mechanistry-badnews}
zoiro-mechanistry-hello	true	true	"'Hello...'"	"'Hello,' you say. 'My name is Marid. Marid Orpheia.'

The goblins look at each other and shrug.

'I'm Koriph,' says the goblin on the right.

'I'm Zoiro,' says the goblin on the left. 'But you knew that already.'"	{zoiro-mechanistry-um, zoiro-mechanistry-badnews}
zoiro-mechanistry-whichzoiro	true	true	"'Which one of you is Zoiro?'"	"'Which one of you is Zoiro?' you ask.

'Oh, I am,' says the goblin on the left.

'I'm Koriph,' the goblin on the right adds. 'I'm his mate. Also co-worker.'

'We work together.'"	{zoiro-mechanistry-immarid, zoiro-mechanistry-um, zoiro-mechanistry-badnews}
zoiro-mechanistry-immarid	true	false	"'I'm Marid.'"	"'I'm Marid,' you say.

'Marid?' Zoiro blinks. 'Wait, you're the girl from the clinic, aren't you?'

'Uh...'

Koriph scratches his head. 'What brings you here?' he asks. 'Don't you have work on?'"	{zoiro-mechanistry-um, zoiro-mechanistry-badnews}
zoiro-mechanistry-badnews	false	false	"'I have some bad news.'"	"You take a deep breath.

'I have some bad news.'

The goblins look at each other. The atmosphere has grown abruptly heavier.

'Shit,' Zoiro says, after a pause. 'What kind of bad news?'

[wait for any key]'This isn't the best place,' you tell him. 'Is there a smoking room around here? Somewhere we'll have peace and quiet?'

Zoiro licks his lips nervously. 'The... the smoking room, yeah. Come on. I'll show you. Come on, Koriph -- you too. Let's get this over with.'

[wait for any key]You are brought into a little cubbyhole of a room, past a curtain you have to stoop to go through. The odor of smoke lingers uncomfortably in the air, just on the edge of your nostrils.

[wait for any key]Zoiro sits in an armchair. Koriph sits next to him. You take a seat opposite, going over your words in your mind."	{zoiro-mechanistry-bedirect, zoiro-mechanistry-begentle, zoiro-mechanistry-beprofessional}
zoiro-mechanistry-bedirect	true	false	"<Be direct.>"	"'It's about your brother, Reden.'

Zoiro leans forward. 'Why? What happened to him?'

'He staggered into Doctor Cavala's clinic last night. He was suffering from an acute illness that Doctor Cavala couldn't identify -- and he-- he--'

[wait for any key]You look down.

'He died on the gurney.'

'He [italic type]what?'[roman type]

'I'm sorry. We couldn't save him.'

[wait for any key]Zoiro falls silent. His mouth opens, but no words emerge. And he chokes -- h[zoiro-mechanistry-followup]"	{zoiro-mechanistry-sosorry, zoiro-mechanistry-needmoment, zoiro-mechanistry-anyqns, zoiro-mechanistry-saynothing}
zoiro-mechanistry-begentle	true	false	"<Be gentle.>"	"'It's about your brother, Reden.'

Zoiro leans forward. 'Why? What happened to him?'

'It happened last night.' You close your eyes. 'We were packing up for the day when... when he stumbled into our clinic. He was ill. Dying.'

Zoiro's eyes widen. 'He -- he wasn't sick at all when I saw him last.'

[wait for any key]'I don't know what happened either.'

You take a breath, force yourself to make eye contact.

'Doctor Cavala tried to stabilize him, but the affliction was unlike anything we'd ever known. And he--'

'--Oh Primes--'

[wait for any key]You look away.

'I'm sorry,' you whisper. 'I'm so sorry. We couldn't save him.'

[wait for any key]Zoiro falls silent. H[zoiro-mechanistry-followup]"	{zoiro-mechanistry-sosorry, zoiro-mechanistry-needmoment, zoiro-mechanistry-anyqns, zoiro-mechanistry-saynothing}
zoiro-mechanistry-beprofessional	true	false	"<Be professional.>"	"'It's about your brother, Reden.'

Zoiro leans forward. 'Why? What happened to him?'

'Last night, during the last shift at Doctor Cavala's clinic, he staggered through the door seriously ill. His symptoms were unlike anything Doctor Cavala had ever seen.'

Zoiro's eyes widen. 'He -- he wasn't sick at all when I saw him last.'

[wait for any key]You take a breath, keep your eyes fixed on him.

'His heart and lungs had failed. He was hemorrhaging badly. We rushed him to the surgery room, but-- but--'

'--Oh Primes--'

[wait for any key]You look away.

'I'm sorry,' you whisper. 'He died on the gurney. We couldn't save him.'

[wait for any key]Zoiro falls silent. H[zoiro-mechanistry-followup]"	{zoiro-mechanistry-sosorry, zoiro-mechanistry-needmoment, zoiro-mechanistry-anyqns, zoiro-mechanistry-saynothing}

To say zoiro-mechanistry-followup:
	say "e nods, bites his lip, buries his head in his hands.

Koriph puts a hand on his shoulder.[paragraph break]";
	wait for any key;
	say "'Well,' says Zoiro at last. 'I... I shouldn't be surprised. It was bound to happen sooner or later. He was a bum. A fucking disgrace. He was going to catch something, living the way he did...'

[wait for any key]He hangs his head.

'But it hurts,' he says. 'Knowing that he's gone.' "

Table of Zoiro Mechanistry Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
zoiro-mechanistry-sosorry	true	true	"'I'm sorry...'"	"'I'm--'

You blink back tears.

'I'm so sorry. I'm so, so sorry.'

Zoiro shakes his head. 'Don't beat yourself up, kid. It was... it was his time. Like I said... it was bound to happen.'"	{zoiro-mechanistry-youokay, zoiro-mechanistry-saynothing}
zoiro-mechanistry-saynothing	true	true	"<Say nothing.>"	"You look at your feet.

[zoiro-mechanistry-neversaid]"	{zoiro-mechanistry-sosorry, zoiro-mechanistry-youokay, zoiro-mechanistry-anyqns}
zoiro-mechanistry-needmoment	true	false	"'Do you need a moment?'"	"'Do you... do you need a moment?'

Zoiro looks at you.

'Yeah,' he says. 'Yeah, I think I do.'

[wait for any key][zoiro-mechanistry-neversaid]"	{zoiro-mechanistry-sosorry, zoiro-mechanistry-youokay, zoiro-mechanistry-anyqns}

To say zoiro-mechanistry-neversaid:
	say "Silence reigns for the longest of moments. The goblin gazes at his calloused hands, stained black with grease and glue.[paragraph break]";
	wait for any key;
	say "'Lotta things I wanted to say to him,' he mutters. 'Hammer into his head. But none of it matters anymore.'[paragraph break]";
	wait for any key;
	say "He shakes his head and smiles a heartbroken smile. ";

Table of Zoiro Mechanistry Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
zoiro-mechanistry-youokay	true	false	"'Will you be okay?'"	"'Will you be okay?'

Zoiro looks down, and is quiet.

[wait for any key]'There's something I want to know,' he says. 'About Reden.'

A pause, uncertain.

[wait for any key]'Where is his body now?'"	{zoiro-mechanistry-iusmedici, zoiro-mechanistry-unrecoverable}
zoiro-mechanistry-anyqns	true	false	"'You can ask me anything...'"	"'You can ask me anything,' you mumble. 'I'll -- I'll do my best to answer your questions.'

Zoiro looks down, and is quiet.

[wait for any key]'Reden,' he says. 'About him.'

A pause, uncertain.

[wait for any key]'Where is his body now?'"	{zoiro-mechanistry-iusmedici, zoiro-mechanistry-unrecoverable}
zoiro-mechanistry-iusmedici	true	false	"'We're dissecting his body...'"	"'We're... we're dissecting his body,' you tell him. 'Doctor Cavala has invoked the [italic type]ius medici[roman type]--'

'The what?'

'The right of the doctor,' you explain. 'The illness that took Reden's life... it's unlike anything we've encountered before. We don't know how contagious it is, or who else might be at risk. We need to study the cadaver so we can make sure it doesn't kill anyone else.'

Zoiro nods slowly.

[wait for any key]'I... I guess that makes sense,' he says. 'Do what you need to do. Just... promise me you'll cremate him, when this is all over.'

[wait for any key]He clenches his fists.

'And make sure you find out what you're looking for. Promise it.'"	{zoiro-mechanistry-ipromise, zoiro-mechanistry-nopromises}
zoiro-mechanistry-unrecoverable	true	false	"'We couldn't recover his body...'"	"'We... we couldn't recover his body,' you lie. 'The affliction took too much of a toll. You wouldn't want to see what it left behind.'

Zoiro grimaces. He exhales heavily.

[wait for any key]'Forget it,' he says at last. 'We said our goodbyes a long time ago. The pieces, or the slurry, or whatever it is... you can keep it. Just promise me--'

[wait for any key]He clenches his fists.

'You said you didn't know what it was? Find out what happened to my brother. Make sure nobody ever dies like him again. Promise it.'"	{zoiro-mechanistry-ipromise, zoiro-mechanistry-nopromises}
zoiro-mechanistry-ipromise	true	false	"'I promise...'"	"'I promise. On my badge, I promise it.'

Zoiro nods, even as tears well up and glitter on his cheeks.

He stands up and offers his hand. You shake on it.

'Good luck,' he says. 'Make sure my brother didn't die in vain.'

[zoiro-mechanistry-end]"	{}
zoiro-mechanistry-nopromises	true	false	"'I can't make that promise...'"	"'I... I can't make that promise.'

Your voice trembles. You look into his eyes.

'I don't make promises I don't know if I can keep. I don't know if I'm strong enough. I don't know if Doctor Cavala can do it.

[wait for any key]'But I promise that we will try.'

[wait for any key]Zoiro nods, even as tears well up and glitter on his cheeks.

He stands up and offers his hand. You shake on it.

'Good luck.' He squeezes your hand. 'I believe in you.'

[zoiro-mechanistry-end]"	{}

To say zoiro-mechanistry-end:
	wait for any key;
	say "He takes Koriph's hand and nods at you in lieu of farewell.

'Come on, Koriph. Let's talk to the forewoman about compassionate leave...'

You get up and make your way back to the Mechanistry floor. Your work here is done. It's time to go. ";

zoiro-mechanistry-namesknown is a truth state that varies.

After reading out zoiro-mechanistry-hello:
	now the enabled of zoiro-mechanistry-whichzoiro is false;
	now the enabled of zoiro-mechanistry-badnews is true;
	now zoiro-mechanistry-namesknown is true;
	now the conversational partner text is "Talking to Zoiro and Koriph";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;

After reading out zoiro-mechanistry-whichzoiro:
	now the enabled of zoiro-mechanistry-hello is false;
	now the enabled of zoiro-mechanistry-badnews is true;
	now zoiro-mechanistry-namesknown is true;
	now the conversational partner text is "Talking to Zoiro and Koriph";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;

Book 3.28 - VII Layabout Row

VII Layabout Row is a proper-named room in Riggertown. "This rustic little house is one of many that squat here and there along the lane. A pair of scrap-metal sculptures flank the steps to the front door. Beside it is a tarnished old pull-bell, dangling from a rope that has seen better days.

You can enter the front door of the house to the west, or return along the walkway to the northeast."
It is southwest of Riggertown Upper Level.
Understand "seven/seventh on/--" or "7" as VII Layabout Row.

The simple-name is "Layabout Row".
The sound is "The canal wind whistles through the railings."
The scent is "You smell rust and train oil."
The exit reminder is "The front door is to the west, and Upper Riggertown is to the northeast."

Before examining west in VII Layabout Row, try examining the front door of Zoiro's house instead.
Before examining inside in VII Layabout Row, try examining the front door of Zoiro's house instead.
Before examining northeast in VII Layabout Row, say "The rest of Upper Riggertown is that way."
Before examining outside in VII Layabout Row, say "The rest of Upper Riggertown is that way."
Before examining east in VII Layabout Row, try examining the view of the Riggertown Mechanistry instead.
Before going inside in VII Layabout Row, try going west instead.
Before going outside in VII Layabout Row, try going northeast instead.

Part 3.28.1 - Scenery

The street-lamps, the mist, the twisty catwalks, the Riggertown crowd, the scrap-heap spires, the view of the Riggertown Mechanistry, and the Riggertown ambience are in VII Layabout Row.

The rustic little house is scenery in VII Layabout Row.
The description is "It looks like something that might have been in a picture-book, if picture-books were made out of sheet metal."
The sound is "[if Day One is happening]Nobody seems to be home.[otherwise]You hear someone moving around inside."
The scent is "You smell leftovers. Something fried."
Understand "home" or "zoiro's" or "koriph's" or "residence" as the rustic little house.
Before entering the rustic little house, try going west instead.

Some other houses along Layabout Row are scenery in VII Layabout Row.
The description is "These suburbs are home to the majority of the Channelworks District's goblin population."
The sound is "Doors closing, frying-pans tossing, and other sounds of mundane life."
The scent is "All of the houses here smell like rust."
Understand "suburb/suburbs" or "many" or "lane" as the other houses along Layabout Row.
Instead of entering or searching the other houses along Layabout Row, say "You don't have any business in the other houses."

Some scrap-metal sculptures are scenery in VII Layabout Row.
The description is "Twin dragons. One is painted blue, the other green."
Understand "pair" or "of" or "dragons" or "scrap" or "metal" or "painted" or "sculpture" as the scrap-metal sculptures.

The blue dragon is scenery in VII Layabout Row.
The description is "This one has its mouth open, as though threatening to swallow intruders whole."
Understand "mouth" as the blue dragon.

The green dragon is scenery in VII Layabout Row.
The description is "This one has its claws raised, as though threatening to slice intruders apart."
Understand "claw/claws" as the green dragon.

Some entrance steps are scenery in VII Layabout Row.
The description is "The steps lead up to the front door."
Before climbing or entering the entrance steps, try going west instead.
Before putting something on the entrance steps, try dropping the noun instead.

The tarnished old pull-bell is scenery in VII Layabout Row.
The description is "It looks like this is the doorbell."
The sound is "You'll have to ring the bell to hear its sound."
Understand "pull" or "doorbell" or "bell" or "rope" as the tarnished old pull-bell.
Before pulling the tarnished old pull-bell, try swinging the tarnished old pull-bell instead.
Instead of pushing the tarnished old pull-bell, say "It's a pull-bell, not a push-bell."
Instead of turning the tarnished old pull-bell, say "It's a pull-bell, not a turn-bell."
Instead of tying the tarnished old pull-bell to something, say "That won't accomplish anything."
Instead of tying something to the tarnished old pull-bell, say "That won't accomplish anything."

Instead of swinging the tarnished old pull-bell:
	if the front door of Zoiro's house is locked:
		say "The bell clatters noisily, but no one answers the door.";
	otherwise:
		say "The bell clatters noisily. 'Come in!' you hear Zoiro call."

Part 3.28.2 - Front Door of Zoiro's House

The front door of Zoiro's house is a lockable locked scenery door.
It is west of VII Layabout Row and east of Zoiro's Residence.
The description is "The plaque on the front door informs you that this house is the residence of Zoiro and Koriph."
Understand "plaque" or "koriph's" or "residence" as the front door of Zoiro's house.
Instead of searching the front door of Zoiro's house, say "The door [if the front door of Zoiro's house is open and the location is VII Layabout Row]leads into the house.[otherwise if the front door of Zoiro's house is open]leads out of the house.[otherwise]is closed."
Does the player mean doing something with the front door of Zoiro's house: it is unlikely. [As opposed to Zoiro's house.]

Instead of knocking on the front door of Zoiro's house:
	if the front door of Zoiro's house is locked:
		if Cavala's Errands is happening:
			say "There is no response. Zoiro must not be home at the moment.";
		otherwise:
			say "There is no response. Perhaps you should come back later.";
	otherwise:
		say "'Come in!' you hear Zoiro call."

Part 3.28.4 - VII Layabout Row during Day Two

When Reden Investigation begins (this is the unlock the door to Zoiro's house rule):
	now the front door of Zoiro's house is unlocked.

Book 3.29 - Arturus's Clinic

There is a proper-named room called Arturus's Clinic.
The description is "This upscale clinic exudes a muted elegance. Chrome fixtures are lit by surgically placed spotlights and underscored by dizzyingly intricate sigil-work[first time]. Yet for all its technical mastery, the space seems somehow empty, somehow melancholy[only].

An arch to the west leads back to the Turris Infinita foyer."
Understand "doctor" or "arturus/arturus'" as Arturus's Clinic.

The simple-name is "Doctor Arturus's clinic".
The sound is "It's quiet."
The scent is "There is an antiseptic quality to the air."
The exit reminder is "The Turris Infinita foyer is to the west."

Before examining west in Arturus's Clinic when the player is not engaged in endoscopy, try examining the view of the foyer instead.
Before examining outside in Arturus's Clinic when the player is not engaged in endoscopy, try examining the view of the foyer instead.

Before going outside in Arturus's Clinic when the player is not engaged in endoscopy, try going west instead.

Part 3.29.1 - Scenery

The view of the foyer is faraway scenery in Arturus's Clinic. The indefinite article is "the".
The description is "It's darker, there."
The sound is "There is no sound."
Understand "turris" or "infinita" as the view of the foyer.
Before entering the view of the foyer, try going west instead.

Some chrome fixtures are scenery in Arturus's Clinic.
The description is "Racks of gleaming equipment; gurneys that bristle with instrumentation. But none of them are useful at the moment."
Understand "gleaming" or "equipment" or "gurney/gurneys" or "instrument/instruments/instrumentation" or "fixture" as the chrome fixtures.
Instead of entering the chrome fixtures, say "You have better things to do than that."
Instead of looking under, searching, or taking the chrome fixtures, say "As well-equipped as Doctor Arturus's clinic is, its fixtures are irrelevant to your interests."

Some surgically placed spotlights are faraway scenery in Arturus's Clinic.
The description is "The lighting is cold and clean."
The surgically placed spotlights have some text called the faraway response. The faraway response is "The spotlights are out of reach."
Understand "spotlight/light/lights" as the surgically placed spotlights.

The dizzyingly intricate sigil-work is scenery in Arturus's Clinic. The indefinite article is "some".
The description is "The sigils encircle the fixtures and link them with exquisite precision."
Understand "sigil/sigils" or "marble" as the dizzyingly intricate sigil-work.
Instead of touching the dizzyingly intricate sigil-work, say "You feel the tingling potential in the marble."
Instead of attacking, cutting, or rubbing the dizzyingly intricate sigil-work, say "That might get you thrown out of the Turris Infinita[if once-blacklisted-always-blacklisted is true] again[end if]."

The melancholy space is faraway scenery in Arturus's Clinic.
The description is "You could get lost in the emptiness here."
The sound is "It's too quiet."
The melancholy space has some text called the faraway response. The faraway response is "That doesn't make any sense."
Before smelling the melancholy space, try smelling the location instead.
Understand "empty/emptiness" or "upscale" or "clinic" or "muted" or "elegance" as the melancholy space.
Before inserting something into the melancholy space, try dropping the noun instead.
Before putting something on the melancholy space, try dropping the noun instead.
Before searching the melancholy space, try looking instead.
Instead of entering the melancholy space, say "You're standing in it."

The calomel arch is an open unopenable scenery door.
It is east of the Turris Infinita and west of Arturus's Clinic.
The description is "The arch is austere and forbidding."
Understand "archway" as the calomel arch.
Instead of knocking on or touching the calomel arch, say "It's cold to the touch."

After going through the calomel arch when the player is staid: say "A chill washes over you as you step through the arch."; continue the action.

The little coffee table is a scenery supporter in Arturus's Clinic.
The description is "It's hard to focus on the coffee table when Justinian is sitting at it."
Instead of entering the little coffee table, try talking to Justinian instead.
Instead of putting something on the little coffee table, say "No! Justinian's right there. That would be so awkward."

Part 3.29.2 - Dead Bodies

Chapter 3.29.2.1 - In General

Some tarpaulin-covered bodies are scenery in Arturus's Clinic.
The description is "[if Meeting the Patients has ended]The four bodies are lying on a slab.[otherwise]You can't see much of the bodies beneath the tarpaulins."
The sound is "You hear nothing unexpected[first time], and indeed it would be rather troubling if you did[only]."
The scent is "There's no smell at all[first time]. The clinic's environment must be too sterile for bloat to set in[only]."
Understand "covered" or "tarpaulin covered" or "corpses/cadavers/victims" or "dead" or "slab" as the tarpaulin-covered bodies.
Understand "doctor/-- arturus/arturus's" or "body/corpse/cadaver/victim" as the tarpaulin-covered bodies when Meeting the Patients is happening.

Before doing anything when the current action involves the tarpaulin-covered bodies and 4inv-vigiles-permission is false:
	if the current action is examining, continue the action;
	if the current action is listening, continue the action;
	if the current action is smelling, continue the action;
	if the home dialogue branch of Examiner Velox is examiner-home:
		start a dialogue with Examiner Velox using dialogue examiner-confront;
		now Examiner Velox is proper-named;
		stop the action;
	otherwise:
		say "The investigators stop you.";
		stop the action.

Instead of attacking or cutting the tarpaulin-covered bodies, say "You agreed not to damage the bodies. You shouldn't push your luck."
Instead of giving something to the tarpaulin-covered bodies, say "You won't get much of a response."
Instead of knocking on or touching the tarpaulin-covered bodies, say "The bodies are all cold."
Instead of pushing, pulling, squeezing, taking, or turning the tarpaulin-covered bodies, say "You shouldn't unduly disturb the bodies."
Instead of looking under the tarpaulin-covered bodies, say "The bodies are lying on a slab."
Instead of searching the tarpaulin-covered bodies, say "You will have to specify which one to search."
Instead of waking the tarpaulin-covered bodies, say "If only."

Some forensic tarpaulins are scenery in Arturus's Clinic.
The description is "If you had to guess, they're for ensuring that the bodies aren't disturbed or contaminated."
Before listening to the forensic tarpaulins, try listening to the tarpaulin-covered bodies instead.
Before smelling the forensic tarpaulins, try smelling the tarpaulin-covered bodies instead.
Understand "tarpaulin" or "sheet/sheets" as the forensic tarpaulins.
Before looking under or searching the forensic tarpaulins, try examining the tarpaulin-covered bodies instead.
Instead of entering the forensic tarpaulins, say "The notion is entirely distasteful."
Instead of pushing, pulling, squeezing, taking, or turning the forensic tarpaulins, say "You shouldn't unduly disturb the bodies."

The dried black blood is a scenery thing. The indefinite article is "some".
The description is "You know these symptoms all too well, now."
Understand "droplet/droplets/stain/stains/inkstain/inkstains/ink/bloodstain/bloodstains/trail/trails/ichor" as the dried black blood.
Instead of doing anything other than examining or listening with the dried black blood, say "That could be dangerous. You shouldn't."

Before doing anything when the current action involves the forensic tarpaulins and 4inv-vigiles-permission is false:
	if the current action is examining, continue the action;
	if the current action is listening, continue the action;
	if the current action is smelling, continue the action;
	if the home dialogue branch of Examiner Velox is examiner-home:
		start a dialogue with Examiner Velox using dialogue examiner-confront;
		now Examiner Velox is proper-named;
		stop the action;
	otherwise:
		say "The investigators stop you.";
		stop the action.
		
[Here we define the body the player has most recently examined as the body that it's most likely the player wants to examine. This was previously accomplished with a clusterfuck of "if the noun part of the current action was X..." constructs, but that ended up being a large processing bottleneck during the update chronological records rule, and made the game basically unplayable on Quixe.]

The body-currently-being-examined is a thing that varies.
Does the player mean doing something with the body-currently-being-examined: it is very likely.
Does the player mean inserting the endoscope into the body-currently-being-examined: it is very likely.
Does the player mean doing something with something that is enclosed by the body-currently-being-examined: it is likely.
Does the player mean inserting the endoscope into something that is enclosed by the body-currently-being-examined: it is likely.

Chapter 3.29.2.2 - Doctor Arturus

Doctor Arturus is a dead undescribed man.
Understand "arturus's body/corpse/cadaver" or "victim" as Doctor Arturus.
Understand "arturus" or "doctor's" or "arturus'" as something enclosed by Doctor Arturus.

Does the player mean doing something with Doctor Arturus: it is very likely.
Does the player mean inserting the endoscope into Doctor Arturus: it is very likely.
		
Before doing something with Doctor Arturus: now the body-currently-being-examined is Doctor Arturus.
Before doing something with something enclosed by Doctor Arturus: now the body-currently-being-examined is Doctor Arturus.
		
Rule for clarifying the parser's choice of Doctor Arturus: do nothing.
Rule for clarifying the parser's choice of something enclosed by Doctor Arturus: do nothing.

Before listening to Doctor Arturus, try listening to the tarpaulin-covered bodies instead.
Before smelling Doctor Arturus, try smelling the tarpaulin-covered bodies instead.
Before attacking or cutting Doctor Arturus, try attacking the tarpaulin-covered bodies instead.
Instead of looking under Doctor Arturus, say "A quick check shows that the [italic type]livor mortis[roman type], the settling of the blood, is consistent with a body that has lain on its back for some time."
Instead of knocking on, pushing, pulling, rubbing, squeezing, or taking Doctor Arturus, say "[italic type]Rigor mortis[roman type] is in full effect. You can't move him at all."

Before attacking or cutting something that is part of Doctor Arturus, try attacking the tarpaulin-covered bodies instead.
Before smelling something that is part of Doctor Arturus, try smelling Doctor Arturus instead.
Before touching something that is part of Doctor Arturus, try touching Doctor Arturus instead.
Before knocking on, pushing, pulling, rubbing, squeezing, or taking something that is part of Doctor Arturus, try pushing Doctor Arturus instead.

arturus-examined-quip is a truth state that varies.
Instead of examining Doctor Arturus:
	if arturus-examined-quip is false:
		say "You approach the body.[paragraph break]";
		say "The first time you saw Doctor Arturus's face was in [italic type]De historia medica[roman type], your first-year medical textbook. You still remember it -- sharp, black and white, with a jaw like a the edge of a knife. You were nervous, when you moved to the Channelworks District, to meet the famed pathologist in the flesh.[paragraph break]";
		wait for any key;
		say "But the man who you met that day was smaller, somehow. His features, so arresting in his youth, had crinkled under the burden of years. He did not look you in the eye when he shook your hand.[paragraph break]";
		wait for any key;
		say "'His time is past,' Doctor Cavala had said, afterwards. 'He hardly practices these days...'[paragraph break]";
		wait for any key;
	say "The body laid before you is gaunt, almost pitiful. The sleeves of his natron coat are completely soaked in eerie black stains. His glasses are stained opaque, and his mouth is frozen open in horror.[paragraph break]";
	if arturus-examined-quip is false:
		wait for any key;
		now arturus-examined-quip is true;
	say "You could examine Doctor Arturus's head, his torso, his arms, or his legs.";

Instead of searching Doctor Arturus, say "You could examine Doctor Arturus's head, his torso, his arms, or his legs."

arturus-body-completion-quip is a truth state that varies.
Before reading a command when Arturus Investigation is happening and clue-arturus-gloves is true and clue-arturus-animus is true and arturus-body-completion-quip is false:
	say "(You think you've learned all you can from Doctor Arturus's body. You should look for more clues elsewhere.)";
	now arturus-body-completion-quip is true.

Section 3.29.2.2.1 - Head

Doctor Arturus's head is part of Doctor Arturus.
The description is "Death has not been kind to Doctor Arturus. The black blood from his eyes and mouth has seeped into his wrinkles, crisscrossing his face with a spiderweb of decay[if clue-arturus-animus is false].

His mouth is wide open. [one of]It occurs to you that y[or]Y[stopping]ou could put your endoscope in and look around inside[end if]."
Understand "spiderweb/web" or "decay" or "wrinkle/wrinkles" or "face" as Doctor Arturus's head.
Before searching Doctor Arturus's head, try inserting the endoscope into Doctor Arturus instead.
Before inserting the endoscope into Doctor Arturus's head, try inserting the endoscope into Doctor Arturus instead.

Doctor Arturus's eyes are a plural-named thing part of Doctor Arturus.
The description is "His eyes are open."
Understand "eye" as Doctor Arturus's eyes.
Instead of opening Doctor Arturus's eyes, say "His eyes are already open."
Instead of closing Doctor Arturus's eyes, say "That would be dangerous. His eyes are coated in black blood."
Instead of searching Doctor Arturus's eyes, say "No answers are forthcoming."
Before rubbing or touching Doctor Arturus's eyes, try touching the dried black blood instead.

Doctor Arturus's mouth is part of Doctor Arturus.
The description is "You could put your endoscope in and look around inside."
Understand "jaw" as Doctor Arturus's mouth.
Before searching Doctor Arturus's mouth, try inserting the endoscope into Doctor Arturus instead.
Before inserting the endoscope into Doctor Arturus's mouth, try inserting the endoscope into Doctor Arturus instead.
Instead of opening Doctor Arturus's mouth, say "His mouth is already open."
Instead of closing Doctor Arturus's mouth, say "[italic type]Rigor mortis[roman type] has locked his jaw in place."
Instead of inserting something into Doctor Arturus's mouth, say "Don't be ridiculous."

Doctor Arturus's glasses are a plural-named thing worn by Doctor Arturus.
The description is "Black blood covers his glasses."
Understand "stained" or "opaque" as Doctor Arturus's glasses.
Before knocking on, pushing, pulling, rubbing, squeezing, or touching Doctor Arturus's glasses, try touching the dried black blood instead.
Before looking under or searching Doctor Arturus's glasses, try examining Doctor Arturus's eyes instead.
Instead of taking Doctor Arturus's glasses, say "You don't think you ought to carry a pair of potentially biohazardous glasses around."

Section 3.29.2.2.2 - Torso

Doctor Arturus's torso is part of Doctor Arturus.
The description is "The doctor is a thin man, shrunken with age. His natron coat is of that old-fashioned button-up sort you see in [italic type]laterna magica[roman type] pictures. Your eyes are drawn to his ruined sleeves, which cling to his skin like grotesque pelagic rays."
Before knocking on, looking under, rubbing, searching, squeezing, or touching Doctor Arturus's torso, say "You pat him down but find nothing of interest." instead.

Doctor Arturus's natron coat is a thing worn by Doctor Arturus.
The description is "You'd think those were inkstains if you didn't know better."
Understand "shroud" or "button-up" as Doctor Arturus's natron coat.
Instead of knocking on, looking under, rubbing, searching, squeezing, taking off, or touching Doctor Arturus's natron coat, try searching Doctor Arturus's torso instead.

Some old-fashioned buttons are part of Doctor Arturus's natron coat.
The description is "Beady bloodstained buttons."
Understand "button" as the old-fashioned buttons.
Instead of doing anything other than examining with the old-fashioned buttons, say "The buttons don't seem pertinent to the investigation."

Section 3.29.2.2.3 - Arms

Doctor Arturus's arms are a plural-named thing part of Doctor Arturus.
The description is "Doctor Arturus's sleeves are streaked with black blood. Like a living thing, it seems to have oozed up from his hands, twisting and squirming and crawling up his forearms. His gloves are almost completely black[if clue-arturus-gloves is false].

But something's not right here. If his gloves were the rubber-natron surgical standard, like yours are, skin contact shouldn't have been possible. You should take a closer look[end if]."
Understand "streak/streaks" or "arm/forearm/forearms" or "sleeve/sleeves" or "skin" or "grotesque" or "pelagic" or "ray/rays" as Doctor Arturus's arms.
Before knocking on, pushing, pulling, rubbing, squeezing, touching, or taking Doctor Arturus's arms, try touching the dried black blood instead.

arturus-gloves-examined is a truth state that varies.
Before examining Doctor Arturus's arms when clue-arturus-gloves is false:
	if arturus-gloves-examined is false:
		now arturus-gloves-examined is true;
	otherwise:
		try examining Doctor Arturus's gloves instead.

Doctor Arturus's gloves are a plural-named thing part of Doctor Arturus.
Understand "glove" or "hand/hands" or "sigil/sigils" or "rubber/rubber-natron" or "natron" as Doctor Arturus's gloves.

Instead of examining Doctor Arturus's gloves:
	if clue-arturus-gloves is false:
		say "You get a loupe and a pair of tweezers, and carefully -- very carefully -- you inspect Doctor Arturus's bloodstained gloves.[paragraph break]";
		say "Your heart hammers in your ears. Your breath condenses on the tarpaulins.[paragraph break]";
		wait for any key;
		say "[italic type]There! Is that--[roman type][paragraph break]";
		wait for any key;
		say "Nothing.[paragraph break]";
		wait for any key;
		say "There's nothing at all. The gloves are perfectly sealed. Brand new, in fact -- if you brush away the blood, you can see the sigils glowing softly on the rubber.[paragraph break]";
		wait for any key;
		say "That means there are two possibilities. Either this disease can somehow be transmitted [italic type]through[roman type] an alchemically-sealed waterproof barrier -- which is in defiance of everything you learned in school, and besides you and Doctor Cavala are still alive, so that can't be right --[paragraph break]";
		wait for any key;
		say "Or there's something else at work here. Something more insidious.[paragraph break]";
		wait for any key;
		say "You carefully decontaminate the equipment you borrowed and return it to the clinic. You're going to have to keep investigating.[paragraph break]";
		now clue-arturus-gloves is true;
	otherwise:
		say "Although the gloves are coated in blood, they're brand new. You can still see the sigils glowing on the rubber."

Before knocking on, pushing, rubbing, squeezing, or touching Doctor Arturus's gloves, try touching the dried black blood instead.
Before looking under, opening, pulling, searching, taking, or taking off Doctor Arturus's gloves, say "[one of]You get a pair of tweezers and carefully pull off one of the gloves. His hands are shriveled -- gnarled, black things, like dead tree branches. They have been utterly ruined by the disease.[paragraph break]You replace the glove and decontaminate the tweezers, suppressing a shudder.[or]The other hand doesn't look any better.[or]You've already inspected both hands and found them to be ruined by the disease.[stopping]" instead.
Instead of swinging Doctor Arturus's gloves, say "Very funny." [">shake hand"]

Section 3.29.2.2.4 - Legs

Doctor Arturus's legs are a plural-named thing part of Doctor Arturus.
The description is "Doctor Arturus is wearing formal trousers and rubber boots -- relatively dignified, in comparison with the rest of his body."
Understand "trousers/trouser" or "formal" or "rubber/-- boot/boots" as Doctor Arturus's legs.
Instead of opening, taking, or taking off Doctor Arturus's legs, say "You can't imagine why you would want to."

Chapter 3.29.2.3 - Arturus Endoscopy

Instead of inserting the endoscope into Doctor Arturus:
	start an endoscopy on "Doctor Arturus" via "Doctor Arturus's mouth" to arturus-endoscopy-mouth.
	
Section 3.29.2.3.1 - Mouth
	
arturus-endoscopy-mouth is a privately-named room.
The printed name is "Mouth".
The description is "A cavern ringed with tombstones. The cavity glistens black -- the capillaries are visible behind the membranes, diseased and withered and creeping. It is almost impossible to distinguish blood from shadow.

Light streams in from outside. The pharynx lies further in."

Doctor Arturus's teeth are plural-named scenery in arturus-endoscopy-mouth.
The description is "At this scale, Doctor Arturus's teeth are colossal bone plinths."
Understand "tombstone/tombstones" or "tooth" or "colossal" or "bone" or "plinth/plinths" as Doctor Arturus's teeth.

Doctor Arturus's oral cavity is scenery in arturus-endoscopy-mouth.
The description is "The walls are streaked ebon where the diseased blood has set."
Understand "cavern/mouth" or "capillary/capillaries/membrane/membranes/vessel/vessels" or "blood" or "shadow" or "wall/walls" or "black/ebon" or "diseased" as Doctor Arturus's oral cavity.

The view of Doctor Arturus's pharynx is scenery in arturus-endoscopy-mouth.
The description is "A black arch, infested with blacker capillaries."
Understand "arch" as the view of Doctor Arturus's pharynx.
Before entering or searching the view of Doctor Arturus's pharynx, try going down instead.

Section 3.29.2.3.2 - Pharynx

arturus-endoscopy-pharynx is a privately-named room. It is below arturus-endoscopy-mouth.
The printed name is "Pharynx".
The description is "A tunnel splitting, twisting darkly. Fleshy folds press inward, tight bundles of muscle and cartilage frozen in black ivy.

The esophagus is blocked by the epiglottis. You can only descend through the larynx."

Doctor Arturus's pharyngeal folds are plural-named scenery in arturus-endoscopy-pharynx.
The description is "The scutiform cartilage. The smuggler's fossa. The ventricular folds."
Understand "fleshy" or "muscle/muscles" or "bundle/bundles" or "of" or "tight" or "and" or "cartilage" or "black" or "ivy" or "scutiform" or "smuggler's" or "fossa" or "ventricular" or "fold/tunnel/pharynx" as the pharyngeal folds.

Doctor Arturus's epiglottis is scenery in arturus-endoscopy-pharynx.
The description is "The epiglottis is frozen in [italic type]rigor mortis,[roman type] and will not move."
Understand "esophagus/oesophagus" as Doctor Arturus's epiglottis.

The view of Doctor Arturus's larynx is scenery in arturus-endoscopy-pharynx.
The description is "Darkness."
Before searching or entering the view of Doctor Arturus's larynx, try going down instead.

Section 3.29.2.3.3 - Trachea

arturus-endoscopy-trachea is a privately-named room. It is below arturus-endoscopy-pharynx.
The printed name is "Trachea".
The description is "It is almost completely dark, save the small ring of light from your lens. Your world is a hollow pit with no beginning and no end.

Below are the lungs."

Doctor Arturus's trachea is scenery in arturus-endoscopy-trachea.
The description is "There is no life, no breath."
Understand "hollow" or "pit" or "darkness" as Doctor Arturus's trachea.

The view of Doctor Arturus's lungs is scenery in arturus-endoscopy-trachea.
The description is "Somewhere beneath are the bronchi, the bronchioles."
Understand "bronchus/bronchi/bronchiole/bronchioles" as the view of Doctor Arturus's lungs.
Before searching or entering the view of Doctor Arturus's lungs, try going down instead.

Section 3.29.2.3.3 - Lungs

arturus-endoscopy-lungs is a privately-named room. It is below arturus-endoscopy-trachea.
The printed name is "Lungs".
The description is "The terminus of the respiratory system. A thousand dead ends, holes, alveoli -- they greet you like blood-choked eye sockets[one of].

[wait for any key]Something is wrong here.

[wait for any key]The pattern of decay isn't consistent with an airborne pathogen. If the disease were transmitted by air or aether, it would attack from the alveoli inward. Here, it looks like the infection spread [italic type]outward,[roman type] from the blood vessels into the lungs.

[wait for any key][or].

[stopping]Further on, you see the cast-off tethers of Doctor Arturus's animus still lingering in the aetheric weave[if clue-arturus-animus is false]. But the skeins are fragmented, somehow. Different from the textbooks[end if]."

Doctor Arturus's alveoli are plural-named scenery in arturus-endoscopy-lungs.
The description is "Black blood has burst from the capillaries, choking the airways."
Understand "alveole/capillary/capillaries/lung/lungs/vessel/vessels/socket/sockets/hole/holes/end/ends/airway/airways" or "blood" or "blood-choked" or "dead" or "eye/eyes/eyesocket/eyesockets/eye-socket/eye-sockets" as Doctor Arturus's alveoli.

Some skeins of Doctor Arturus's animus are scenery in arturus-endoscopy-lungs. The indefinite article is "the".
Understand "cast-off" or "tether/tethers/soul/skein/fragment/fragments" or "fragmented" or "aetheric/etheric/animic/auroral" or "weave" or "seat" as the skeins of Doctor Arturus's animus.

Instead of examining the skeins of Doctor Arturus's animus:
	if clue-arturus-animus is false:
		say "The animus, colloquially known as the soul, is bound to a person's body by aetheric skeins. When the body dies, the skeins are loosened, and the animus drifts apart from the corpus. Every first-year medical student knows that.

Here, the animic skeins were not loosened. They were ripped apart.

[wait for any key]You can see auroral fragments flickering in the halo of your lens-light. They shine weakly, painfully, unable to fade away.

[wait for any key]What are you looking at here? What kind of disease attacks the [italic type]soul?[roman type][line break]";
		now clue-airborne-vector is true;
		now clue-arturus-animus is true;
	otherwise:
		say "The fragments shine weakly, painfully, unable to fade away."
		
Before going up when the endoscopic location is arturus-endoscopy-lungs, try going outside instead.

Chapter 3.29.2.4 - Creditor Nacarat

Creditor Nacarat is a dead undescribed man.
The description is "There is a certain poise surrounding this man, even in death. His facial hair is immaculately trimmed; his features are not diminished by the black trails that stain them. But something in his bearing sends a shiver up your spine, one that is cold and callous and utterly without sympathy.

You could examine Creditor Nacarat's head, his torso, his arms, or his legs."
Understand "nacarat's body/corpse/cadaver" or "victim/patient" or "bearing/poise" as Creditor Nacarat.
Understand "creditor's" or "nacarat" as something enclosed by Creditor Nacarat.

Does the player mean doing something with Creditor Nacarat: it is very likely.
Does the player mean inserting the endoscope into Creditor Nacarat: it is very likely.

Before doing something with Creditor Nacarat: now the body-currently-being-examined is Creditor Nacarat.
Before doing something with something enclosed by Creditor Nacarat: now the body-currently-being-examined is Creditor Nacarat.
		
Rule for clarifying the parser's choice of Creditor Nacarat: do nothing.
Rule for clarifying the parser's choice of something enclosed by Creditor Nacarat: do nothing.

Before listening to Creditor Nacarat, try listening to the tarpaulin-covered bodies instead.
Before smelling Creditor Nacarat, try smelling the tarpaulin-covered bodies instead.
Before attacking or cutting Creditor Nacarat, try attacking the tarpaulin-covered bodies instead.
Instead of looking under Creditor Nacarat, say "A quick check shows that the [italic type]livor mortis[roman type], the settling of the blood, is consistent with a body that has lain on its back for some time."
Instead of knocking on, pushing, pulling, rubbing, squeezing, or taking Creditor Nacarat, say "[italic type]Rigor mortis[roman type] is in full effect. You can't move him at all."

Before attacking or cutting something that is part of Creditor Nacarat, try attacking the tarpaulin-covered bodies instead.
Before smelling something that is part of Creditor Nacarat, try smelling Creditor Nacarat instead.
Before touching something that is part of Creditor Nacarat, try touching Creditor Nacarat instead.
Before knocking on, pushing, pulling, rubbing, squeezing, or taking something that is part of Creditor Nacarat, try pushing Creditor Nacarat instead.

Instead of searching Creditor Nacarat, say "You could examine Creditor Nacarat's head, his torso, his arms, or his legs."

nacarat-body-completion-quip is a truth state that varies.
Before reading a command when Nacarat Investigation is happening and clue-nacarat-stomach is true and clue-nacarat-pocketbook is true and clue-nacarat-recording is true and clue-nacarat-raven is true and nacarat-body-completion-quip is false:
	say "(You think you've learned all you can from Creditor Nacarat's body. You should look for more clues elsewhere.)";
	now nacarat-body-completion-quip is true.

Section 3.29.2.4.1 - Head

Creditor Nacarat's head is part of Creditor Nacarat.
The description is "Like you, he bears tattoos on his face, but his are in the mode of the Austri rather than the alchemical. Alongside, his pearl earrings catch the light -- his face is framed in pale off-white[if clue-nacarat-stomach is false].

Blood runs from his open mouth. [one of]It occurs to you that y[or]Y[stopping]ou could put your endoscope in and look around inside[end if]."
Understand "face/features" as Creditor Nacarat's head.
Before searching Creditor Nacarat's head, try inserting the endoscope into Creditor Nacarat instead.
Before inserting the endoscope into Creditor Nacarat's head, try inserting the endoscope into Creditor Nacarat instead.

Creditor Nacarat's eyes are a plural-named thing part of Creditor Nacarat.
The description is "His eyes are dark."
Understand "eye" as Creditor Nacarat's eyes.
Instead of opening Creditor Nacarat's eyes, say "His eyes are already open."
Instead of closing Creditor Nacarat's eyes, say "That would be dangerous. His eyes are coated in black blood."
Instead of searching Creditor Nacarat's eyes, say "No answers are forthcoming."
Before knocking on, pushing, pulling, rubbing, squeezing, touching, or taking Creditor Nacarat's eyes, try touching the dried black blood instead.

Creditor Nacarat's mouth is part of Creditor Nacarat.
The description is "You could put your endoscope in and look around inside."
Before searching Creditor Nacarat's mouth, try inserting the endoscope into Creditor Nacarat instead.
Before inserting the endoscope into Creditor Nacarat's mouth, try inserting the endoscope into Creditor Nacarat instead.
Instead of opening Creditor Nacarat's mouth, say "His mouth is already open."
Instead of closing Creditor Nacarat's mouth, say "[italic type]Rigor mortis[roman type] has locked his jaw in place."
Instead of inserting something into Creditor Nacarat's mouth, say "Don't be ridiculous."

Creditor Nacarat's facial hair is part of Creditor Nacarat.
The description is "He has the look of a house model or play-actor."
Understand "beard/goatee" or "moustache/mustache" or "chin" as Creditor Nacarat's facial hair.
Before rubbing or touching Creditor Nacarat's facial hair, try touching the dried black blood instead.

Creditor Nacarat's tattoos are a plural-named thing part of Creditor Nacarat.
The description is "The Austri believed in spirits. In time, they were proven right."
Understand "tattoo" or "austri" as Creditor Nacarat's tattoos.
Before rubbing or touching Creditor Nacarat's tattoos, try touching the dried black blood instead.
Instead of looking under Creditor Nacarat's tattoos, say "They're stained directly on his skin."

Creditor Nacarat's earrings are a plural-named thing worn by Creditor Nacarat.
The description is "They strike you as slightly ostentatious."
Understand "pearl" or "earring" or "off-white" as Creditor Nacarat's earrings.
Instead of taking Creditor Nacarat's earrings, say "You don't need money [italic type]that[roman type] desperately."

Section 3.29.2.4.2 - Torso

Creditor Nacarat's jacket is part of Creditor Nacarat.
The description is "The creditor's jacket is dark, embellished with buttons of brass and mother-of-pearl. There are black stains here and there, where blood has run down from his chin and seeped into the fabric.

The jacket has been partially undone, revealing a quicksilver glyph embroidered in the lining."
Understand "torso" or "flap" or "fabric" as Creditor Nacarat's jacket.
Before looking under, opening, or searching Creditor Nacarat's jacket, try examining the glyph of recording instead.
Before knocking on, squeezing, or touching Creditor Nacarat's jacket, say "You pat him down but find nothing else of interest."
Before closing Creditor Nacarat's jacket, say "You hold up the jacket flap for a moment, but glean no useful clues from the way his jacket looks fully buttoned." instead.
Before taking Creditor Nacarat's jacket, say "The jacket is a deadly biohazard. Besides, you'd get caught." instead.

The glyph of recording is part of Creditor Nacarat's jacket.
The printed name is "glyph in Creditor Nacarat's jacket lining".
The description is "It appears to be a glyph of recording. Although it has suffered partial bloodstain damage, it still appears to be functional[if clue-nacarat-recording is false]. You could listen to it if you wanted[otherwise]."
Understand "quicksilver" or "lining" or "geometric" or "construct/inscription/index" or "stored" or "in [Creditor Nacarat's jacket]" as the glyph of recording.
Instead of rubbing or touching the glyph of recording, say "You don't want to damage the glyph any further."

Instead of listening to or talking to the glyph of recording:
	say "[italic type]'Sonate,'[roman type] you say.

The glyph flickers aglow, coursing with stained quicksilver, and the inscription begins to revolve around the index.[paragraph break]";
	wait for any key;
	say "'--for your hospitality, Doctor,' a bass voice crackles. 'I hope you will consider what I have said.'[paragraph break]";
	wait for any key;
	say "There is noise for a few seconds -- a clink that sounds like porcelain or glass. An inhalation.[paragraph break]";
	wait for any key;
	say "The crash of shards shattering.[paragraph break]";
	wait for any key;
	say "'Creditor?' you hear Doctor Arturus's voice echo. 'Are you feeling quite all right? Perhaps we should--'[paragraph break]";
	wait for any key;
	say "The words are drowned out by coughing. You hear the sound of friction on fabric, growing louder and louder.[paragraph break]";
	wait for any key;
	say "The recording cuts out. The glyph returns to its resting state.";
	if clue-nacarat-recording is false:
		say line break;
		wait for any key;
		say "It sounds like Creditor Nacarat was taking tea with Doctor Arturus when his symptoms emerged.";
		now clue-nacarat-recording is true.

Some mother-of-pearl buttons are part of Creditor Nacarat's jacket.
The description is "A jacket like this can't have been cheap."
Understand "button" or "brass" or "creditor" or "nacarat/nacarat's" as the mother-of-pearl buttons.
Before doing anything other than examining with the mother-of-pearl buttons, say "The buttons don't seem pertinent to the investigation." instead.

Section 3.29.2.4.3 - Arms

Creditor Nacarat's gloves are a plural-named thing part of Creditor Nacarat.
The description is "He wears the smooth black gloves of a businessman. Decorative gilding plays across the back of each hand, surrounding the faint molded silhouette of a raven."
Understand "arm/arms" or "glove/hand/hands/leather" or "smooth" or "black" as Creditor Nacarat's gloves.
Before looking under, opening, pulling, searching, taking, or taking off Creditor Nacarat's gloves, say "You get a pair of tweezers and pull off Creditor Nacarat's gloves, revealing slender hands that could have belonged to a stage magician. Nothing about his hands seems pertinent to the investigation, though, so you replace the gloves and return the tweezers to the clinic." instead.
Instead of swinging Creditor Nacarat's gloves, say "Very funny."

After examining Creditor Nacarat's gloves:
	now the molded ravens are part of Creditor Nacarat's gloves;
	if clue-nacarat-raven is false:
		increment clue-ravens-sighted;
		now clue-nacarat-raven is true;
	continue the action.

The decorative glove-gilding is part of Creditor Nacarat's gloves. The indefinite article is "some".
The description is "It echoes the form of alchemical sigil-work without conveying any actual meaning."
Understand "gilding" or "back" or "of" or "each" as the decorative glove-gilding.

Some molded ravens are a thing.
The description is "[if clue-tradingcompany is true]It's the symbol of the Greater Corindia Trading Company. Creditor Nacarat must have been connected to them somehow.[otherwise]You have a nagging feeling that you've seen the symbol somewhere before."
Understand "raven" or "silhouette/silhouettes/symbol" or "faint" or "of" as the molded ravens.
Instead of touching the molded ravens, say "You can feel the ravens molded in the leather."

Section 3.29.2.4.4 - Legs

Creditor Nacarat's legs are a plural-named thing part of Creditor Nacarat.
The description is "Elegant pin-striped trousers. There appear to be some items in his pockets."
Understand "leg" or "trouser/trousers" or "pinstriped/pin-striped/pinstripe/pin-stripe" or "pin" or "stripe/striped" as Creditor Nacarat's legs.
Instead of opening, taking, or taking off Creditor Nacarat's legs, say "You can't imagine why you would want to."

Creditor Nacarat's pockets are a plural-named unopenable open container part of Creditor Nacarat.
Instead of examining Creditor Nacarat's pockets, say "Most of the things in Creditor Nacarat's pockets are detritus, but that black pocketbook looks interesting."
Understand "pocket" or "detritus" or "item/items" as Creditor Nacarat's pockets.
Instead of inserting something into Creditor Nacarat's pockets, say "This is a dead body, not your personal chest-of-drawers."

A black pocketbook is in Creditor Nacarat's pockets.
Understand "coded" or "record/records of/--" or "business" or "transaction/transactions" or "last" or "chronological" or "entry" or "book" as the black pocketbook.
Before pulling, opening, or searching the black pocketbook, try examining the black pocketbook instead.
Instead of taking the black pocketbook, say "The pocketbook is evidence. You should leave it for the Vigiles investigators."

Before taking the pocketbook when clue-nacarat-pocketbook is false, try examining the black pocketbook instead.

Instead of examining the black pocketbook:
	say "It appears to be a coded record of business transactions. Of particular interest is the last chronological entry, which records a significant sum made out to 'S&P'.";
	if clue-nacarat-pocketbook is false:
		say line break;
		say "Strange. You don't know any company in the Channelworks District with those initials. Unless...[paragraph break]";
		wait for any key;
		say "The fact that Sal and Piper have those initials can't be a coincidence. Can it?";
		now clue-nacarat-pocketbook is true.

Chapter 3.29.2.5 - Nacarat Endoscopy

Instead of inserting the endoscope into Creditor Nacarat:
	start an endoscopy on "Creditor Nacarat" via "Creditor Nacarat's mouth" to nacarat-endoscopy-mouth.
	
Section 3.29.2.3.1 - Mouth
	
nacarat-endoscopy-mouth is a privately-named room.
The printed name is "Mouth".
The description is "The tongue is a diseased behemoth. It wallows in a pool of dark dried blood, broken by stained folds and bleached teeth. On the tip a piercing has become infected, revealing the ragged holes at either side.

Light streams in from outside. The pharynx lies further in."

Creditor Nacarat's tongue is scenery in nacarat-endoscopy-mouth.
The description is "Withered within and without."
Understand "diseased" or "behemoth" as Creditor Nacarat's tongue.

Creditor Nacarat's oral cavity is scenery in nacarat-endoscopy-mouth.
The description is "The shadows are opaque."
Understand "stained/stains" or "blood" or "fold/folds" or "sea/pool/mouth" or "dark" or "dried" or "sunless" as Creditor Nacarat's oral cavity.

Creditor Nacarat's teeth are plural-named scenery in nacarat-endoscopy-mouth.
The description is "Markers in a sunless sea. There are white trails where his tooth-powder has melted."
Understand "bleach/bleached" or "tooth" or "powder/tooth-powder" or "white" or "trail/trails/marker/markers" as Creditor Nacarat's teeth.

Creditor Nacarat's piercing is scenery in nacarat-endoscopy-mouth.
The description is "Blood leaks beneath the engraved orichalcum."
Understand "tip" or "hole/holes" or "ragged/engraved" or "metal" or "engraving" or "tongue piercing" or "orichalcum" as Creditor Nacarat's piercing.

The view of Creditor Nacarat's pharynx is scenery in nacarat-endoscopy-mouth.
The description is "A ruined arch."
Understand "ruined" or "arch" as the view of Creditor Nacarat's pharynx.
Before entering or searching the view of Creditor Nacarat's pharynx, try going down instead.

Section 3.29.2.3.2 - Pharynx

nacarat-endoscopy-pharynx is a privately-named room. It is below nacarat-endoscopy-mouth.
The printed name is "Pharynx".
The description is "This grotto is barely recognizable. Flesh has corroded, sloughed from cartilage. The throat weeps with the ruins of ruptured blood vessels.

The epiglottis blocks the larynx. You can only descend into the esophagus."

Creditor Nacarat's pharyngeal folds are plural-named scenery in nacarat-endoscopy-pharynx.
The description is "Something terrible has happened here."
Understand "flesh" or "cartilage" or "throat" or "pharynx" as Creditor Nacarat's pharyngeal folds.

Some ruptured pharyngeal blood vessels are scenery in nacarat-endoscopy-pharynx.
The description is "Striated, honeycombed, bleeding."
Understand "honeycomb/honeycombed" or "rupture/striated/striation/striations" or "ruin/ruins" or "vessel" or "bleeding" as the ruptured pharyngeal blood vessels.

Creditor Nacarat's epiglottis is scenery in nacarat-endoscopy-pharynx.
The description is "The epiglottis is frozen in [italic type]rigor mortis,[roman type] and will not move."
Understand "larynx" as Creditor Nacarat's epiglottis.

The view of Creditor Nacarat's esophagus is scenery in nacarat-endoscopy-pharynx.
The description is "A ravaged tunnel."
Understand "oesophagus" as nacarat-endoscopy-pharynx.
Before searching or entering the view of Creditor Nacarat's esophagus, try going down instead.

Section 3.29.2.3.3 - Esophagus

nacarat-endoscopy-esophagus is a privately-named room. It is below nacarat-endoscopy-pharynx.
The printed name is "Esophagus".
The description is "You hang between sphincters, slashed apart and seized with [italic type]rigor mortis[roman type]. The walls, flickering in your unsteady lens-light, run with black streaks into the yawning darkness.

The stomach lies beneath."

Creditor Nacarat's esophageal walls are plural-named scenery in nacarat-endoscopy-esophagus.
The description is "Death flows through this place."
Understand "streak/streaks" or "black" or "wall" or "esophagus/oesophagus/oesophageal" as Creditor Nacarat's esophageal walls.

Creditor Nacarat's esophageal sphincters are plural-named scenery in nacarat-endoscopy-esophagus.
The description is "Rings of decaying muscle."
Understand "sphincter" or "ring/rings" or "decay/decaying" or "muscle/muscles" or "oesophageal" as Creditor Nacarat's esophageal sphincters.

The view of Creditor Nacarat's stomach is scenery in nacarat-endoscopy-esophagus.
The description is "An all-consuming void."
Understand "yawning" or "darkness" or "beneath" or "all-consuming" or "void" as the view of Creditor Nacarat's stomach.
Before entering or searching the view of Creditor Nacarat's stomach, try going down instead.

Section 3.29.2.3.4 - Stomach

nacarat-endoscopy-stomach is a privately-named room. It is below nacarat-endoscopy-esophagus.
The printed name is "Stomach".
The description is "The stain of disease is everywhere. The humidity is almost palpable. The pylorus is stopped -- a glistening black expanse rises in the light, residual bile and vitriolic secretions unable to drain into the small intestine.

There are [italic type]things[roman type] drifting lazily in the body-of-stomach. You can see festering tumors that have crawled up the stomach lining, embedded themselves in the mucosa, insinuated themselves into the circulatory system. And from them, sickly veins crawl outward, each a deadly trail that points back to the heart."

Every turn when the endoscopic location is nacarat-endoscopy-stomach and clue-nacarat-stomach is false (this is the clue-nacarat-stomach discovery rule):
	wait for any key;
	say "There is no doubt. This stomach -- this [italic type]spawning pit[roman type] -- this must have been the origin of Creditor Nacarat's infection.[paragraph break]";
	now clue-nacarat-stomach is true;
	wait for any key;
	if clue-ingestion-vector is false:
		say "But what does that imply? Was the disease in something the man [italic type]ingested?[roman type] Was it something he ate, something he drank?[paragraph break]";
		wait for any key;
		say "There's too little evidence. You have to keep investigating.";
		now clue-ingestion-vector is true;
	otherwise:
		say "That isn't at all comforting. It raises more questions than it answers."
	
Creditor Nacarat's stomach interior is scenery in nacarat-endoscopy-stomach.
The printed name is "Creditor Nacarat's stomach".
The description is "Unidentifiable boli drift across the pool's surface."
Understand "glistening/inky" or "black" or "pool/pool's/expanse" or "surface" or "bile" or "residual" or "secretion/secretions" or "vitriol/vitriolic" as Creditor Nacarat's stomach interior.

Creditor Nacarat's pylorus is scenery in nacarat-endoscopy-stomach.
The description is "Nothing of it is visible beneath the pool of vitriol."
Understand "small" or "intestine" or "drain" as Creditor Nacarat's pylorus.
Before entering or searching Creditor Nacarat's pylorus, try going down instead.

Some unidentifiable boli are scenery in nacarat-endoscopy-stomach.
The description is "Black. Bloody. Spherical. They elude description."
Understand "thing/things" or "ball/balls/bolus" or "body-of-stomach" or "body of stomach" as the unidentifiable boli.

Some festering tumors are scenery in nacarat-endoscopy-stomach.
The description is "You have the urge to throw up just looking at them."
Understand "tumor/tumour/tumours" or "stomach/-- lining" or "mucus/mucosa" or "circulatory" or "system" or "sickly" or "vein/veins/trail/trails" as the festering tumors.

Before going up when the endoscopic location is nacarat-endoscopy-stomach, try going outside instead.

Chapter 3.29.2.6 - Sal

Sal is a dead undescribed man.
The description is "The man on the slab is muscle-bound -- built like a gray longhorn, with a countenance to match. His coat has the whiff of sweat and blood. It does not quite conceal the scars that split his knuckles, nor the black lines that crisscross his chest.

You could examine Sal's head, his torso, his arms, or his legs."
Understand "salio" or "salio's/sal's body/corpse/cadaver" or "victim/patient/thug" as Sal.
Understand "sal" as something enclosed by Sal.

Does the player mean doing something with Sal: it is very likely.
Does the player mean inserting the endoscope into Sal: it is very likely.

Before doing something with Sal: now the body-currently-being-examined is Sal.
Before doing something with something enclosed by Sal: now the body-currently-being-examined is Sal.
		
Rule for clarifying the parser's choice of Sal: do nothing.
Rule for clarifying the parser's choice of something enclosed by Sal: do nothing.

Before listening to Sal, try listening to the tarpaulin-covered bodies instead.
Before smelling Sal, try smelling the tarpaulin-covered bodies instead.
Before attacking or cutting Sal, try attacking the tarpaulin-covered bodies instead.
Instead of looking under Sal, say "A quick check shows that the [italic type]livor mortis[roman type], the settling of the blood, is consistent with a body that has lain on its back for some time."
Instead of knocking on, pushing, pulling, rubbing, squeezing, or taking Sal, say "[italic type]Rigor mortis[roman type] is in full effect. You can't move him at all."

Before attacking or cutting something that is part of Sal, try attacking the tarpaulin-covered bodies instead.
Before smelling something that is part of Sal, try smelling Sal instead.
Before touching something that is part of Sal, try touching Sal instead.
Before knocking on, pushing, pulling, rubbing, squeezing, or taking something that is part of Sal, try pushing Sal instead.

Instead of searching Sal, say "You could examine Sal's head, his torso, his arms, or his legs."
Before inserting the endoscope into Sal, say "There's no suitable point of entry." instead.

sal-body-completion-quip is a truth state that varies.
Before reading a command when Thugs Investigation is happening and clue-sal-raven is true and the battered keyring is carried and sal-body-completion-quip is false:
	say "(You think you've learned all you can from Sal's body. You should look for more clues elsewhere.)";
	now sal-body-completion-quip is true.

Section 3.29.2.6.1 - Head

Sal's head is part of Sal.
The description is "His skull is monstrous and chiseled. His eyes bleed, glisten, like orbs of bloodshot onyx. But beneath the brutishness so prominent in his features, there is an indescribable and all-too-familiar sadness[first time].

His mouth is closed. An endoscopy will not be possible here[only]."
Understand "block" or "of/-- granite" or "skull" or "feature/features" as Sal's head.
Before searching Sal's head, try opening Sal's mouth instead.

Sal's eyes are a plural-named thing part of Sal.
The description is "Small and sunken."
Understand "eye" or "orb/orbs" or "bloodshot" or "onyx" as Sal's eyes.
Instead of opening Sal's eyes, say "His eyes are already open."
Instead of closing Sal's eyes, say "That would be dangerous. His eyes are coated in black blood."
Instead of searching Sal's eyes, say "No answers are forthcoming."
Before rubbing or touching Sal's eyes, try touching the dried black blood instead.

Sal's mouth is part of Sal.
The description is "Sal's chin is streaked with black blood from his mouth."
Understand "chin/jaw" as Sal's mouth.
Before inserting something into Sal's mouth, try opening Sal's mouth instead.
Before searching Sal's mouth, try opening Sal's mouth instead.
Instead of closing Sal's mouth, say "His mouth is already closed."
Instead of opening Sal's mouth, say "[italic type]Rigor mortis[roman type] has locked his jaw in place."

Section 3.29.2.6.2 - Torso

Sal's torso is part of Sal.
The description is "If Sal wasn't a canal-man, he had the dress sense of one. His work coat is an intimidating leather mass that could stop knife blades, and looks like it has. Beneath is an unbuttoned shirt, revealing a mass of savage black scars.

[if sal-knuckles-quipped is false]You notice a bit of metal glinting[otherwise]There is a set of knuckle-dusters[end if] in his coat pocket."
Before knocking on, looking under, rubbing, searching, squeezing, or touching Sal's torso, say "You pat him down but find nothing else of interest." instead.

Sal's work coat is a thing worn by Sal.
The description is "It's a crinkly brown, with unprepossessing stains splashed here and there.

[if sal-knuckles-quipped is false]You notice a bit of metal glinting[otherwise]There is a set of knuckle-dusters[end if] in his coat pocket."
The scent is "It smells of the Bilious Canal."
Understand "cloth/leather" or "mass" or "stain/stains" as Sal's work coat.
Before knocking on, rubbing, squeezing, taking off, or touching Sal's work coat, try searching Sal's torso instead.
Before looking under or searching Sal's work coat, try examining Sal's pockets instead.
Before inserting something into Sal's work coat, now the second noun is Sal's pockets.

Sal's shirt is a thing worn by Sal.
The description is "Some unbutton their shirts to look fashionable. Others do so because they sweat a great deal in their line of work. You suspect Sal falls into the latter category."
Understand "unbuttoned" as Sal's shirt.
Before knocking on, looking under, rubbing, searching, squeezing, taking off, or touching Sal's shirt, try searching Sal's torso instead.

Sal's chest scars are a plural-named thing part of Sal.
The description is "Once, these would have been red. Now they are black and diseased."
Understand "scar" or "line/lines" or "black" or "diseased" or "mass" or "of" or "savage" as Sal's chest scars.
Before rubbing or touching Sal's chest scars, try touching the dried black blood instead.

Sal's pockets are a plural-named container part of Sal's work coat.
Understand "[Sal's work coat] pocket/pockets" or "of [Sal's work coat]" as Sal's pockets.
Instead of examining Sal's pockets, say "There's [if sal-knuckles-quipped is false]something[otherwise]a set of knuckle-dusters[end if] inside."
Before searching Sal's pockets when sal-knuckles-quipped is false, try examining Sal's knuckle-dusters instead.
Instead of inserting something into Sal's pockets, say "This is a dead body, not your personal chest-of-drawers."

sal-knuckles-quipped is a truth state that varies.
Sal's knuckle-dusters are a plural-named thing in Sal's pockets.
The description is "A set of steel knuckle-dusters. Each has a raven engraved in place of the manufacturer's logo."
Understand "brass" or "knuckle/knuckles" or "duster/dusters/knuckleduster/knuckledusters/knuckle-duster" or "bit" or "of/-- metal/steel" or "in" or "set/pair of/--" or "implement/implements" or "hole/holes" or "nub/nubs" as Sal's knuckle-dusters.
Instead of taking Sal's knuckle-dusters, say "The knuckle-dusters are evidence. You should leave them for the Vigiles investigators."

First instead of examining or taking Sal's knuckle-dusters when sal-knuckles-quipped is false:
	say "You draw back the leather, revealing a pair of knuckle-dusters. Wicked-looking implements, with holes for the fingers, and grim stains surrounding the pointed nubs.

Weapons like these aren't uncommon in the Channelworks District. Even Horatio used to own a set. One can't be too careful living and working in the less-frequented parts of the city.

[wait for any key]But you don't often see a knuckle-duster with a raven engraved in place of the manufacturer's logo.";
	now sal-knuckles-quipped is true;
	now the engraved ravens are part of Sal's knuckle-dusters.
	
Some engraved ravens are a thing.
The description is "[if clue-tradingcompany is true]It's the symbol of the Greater Corindia Trading Company. Sal must have been connected to them somehow.[otherwise]The symbol rings a bell, but you can't quite place it."
Understand "raven" or "engraving" or "symbol" or "of" as the engraved ravens.
Instead of touching the engraved ravens, say "The engraving is of very fine quality."

After examining the engraved ravens when clue-sal-raven is false:
	increment clue-ravens-sighted;
	now clue-sal-raven is true;
	continue the action.
	
Section 3.29.2.6.3 - Arms

Sal's arms are a plural-named thing part of Sal.
The description is "The sleeves of his coat are partially rolled up, revealing forearms like tree trunks. You can see diseased veins, deformed black things that weave and wither under the skin."
Understand "arm" as Sal's arms.

Sal's forearms are a plural-named thing part of Sal.
The description is "The sight is manifestly disturbing."
Understand "vein/veins" or "diseased" or "deformed" or "black" or "thing/things" or "under/-- the/-- skin" or "forearm" or "tree/-- trunk/trunks" or "sleeve/sleeves" as Sal's forearms.

Section 3.29.2.6.4 - Legs

Sal's legs are a plural-named thing part of Sal.
The description is "Tough trousers and work boots. There are clumps of grime encrusted in his soles, and other things that you don't really want to dwell on[if the battered keyring is undescribed].

Hanging from Sal's belt is a battered keyring[end if]."
Understand "leg" or "trouser/trousers" or "boot/boots" as Sal's legs.
Instead of opening, taking, or taking off Sal's legs, say "You can't imagine why you would want to."

Some clumps of grime are part of Sal's legs.
The description is "You've learned to stomach a lot of things as a doctor's apprentice, but this is something else entirely."
Understand "clump" or "sole/soles" as the clumps of grime.
Before doing anything other than examining or listening with the clumps of grime, say "You would rather not." instead.

Sal's belt is a thing worn by Sal.
The description is "A rugged leather belt[if the battered keyring is undescribed]. There's a keyring hanging from it[end if]."
Understand "leather" as Sal's belt.
Instead of opening, taking, or taking off Sal's belt, say "You shouldn't unduly disturb the body."

After examining Sal's legs when the battered keyring is nowhere:
	now the battered keyring is in Arturus's Clinic;
	now the enabled of examiner-thugs-keyring is true;
	continue the action.

After examining Sal's belt when the battered keyring is nowhere:
	now the battered keyring is in Arturus's Clinic;
	now the enabled of examiner-thugs-keyring is true;
	continue the action.

The battered keyring is an undescribed key-item.
The description is "A loop of steel wire[if the battered keyring is described] you found on Sal's body[end if]. It holds a pair of crudely fashioned keys, the sort used in old buildings and cheap locks[if the battered keyring is undescribed and keyring-permission-granted is false].

You wonder if Examiner Velox will allow you to borrow it[otherwise if the battered keyring is undescribed].

Examiner Velox gave you implicit permission to borrow this keyring[end if]."
Understand "key/keys" or "crude/crudely" or "fashioned" or "ring" or "steel" or "loop" or "wire" as the battered keyring.
Instead of attacking or cutting the battered keyring, say "This keyring is technically still evidence. The Vigiles wouldn't appreciate you returning it piecemeal."
Instead of swinging the battered keyring, say "The keys jangle on the wire."

keyring-permission-granted is a truth state that varies.
After taking the battered keyring when the battered keyring is undescribed:
	now the battered keyring is described;
	now the enabled of examiner-thugs-keyring is false;
	now the enabled of landlord-d2-actuallyihavekey is true;
	now the enabled of landlord-d2-imkeybearer is true;
	if keyring-permission-granted is false:
		say "You glance at Examiner Velox. 'There's a keyring on Sal's body. Do you mind if I borrow it for a while?'

'Well--' His mustache wriggles. 'You are not [italic type]officially[roman type] permitted, Servator, but if you believe it will further your investigation... let us agree that my attention is divided, focused elsewhere. Just be sure to return it to the basilica when you are finished.'

[wait for any key]'I will,' you reply. 'Thank you.'

You pocket the keyring.";
	otherwise:
		continue the action.

Chapter 3.29.2.7 - Piper

Piper is a dead undescribed woman.
The description is "A tall, thin specimen of a woman with arms and legs like sea-stilts.  Of all the patients, her posture is the most contorted, as though her body had convulsed in the hour of death: she is a broken marionette, loosed from its strings and cast aside.

You could examine Piper's head, her torso, her arms, or her legs."
Understand "piper's body/corpse/cadaver" or "victim/patient/thug" or "posture" as Piper.
Understand "piper" as something enclosed by Piper.

Does the player mean doing something with Piper: it is very likely.
Does the player mean inserting the endoscope into Piper: it is very likely.

Before doing something with Piper: now the body-currently-being-examined is Piper.
Before doing something with something enclosed by Piper: now the body-currently-being-examined is Piper.

Rule for clarifying the parser's choice of Piper: do nothing.
Rule for clarifying the parser's choice of something enclosed by Piper: do nothing.

Before listening to Piper, try listening to the tarpaulin-covered bodies instead.
Before smelling Piper, try smelling the tarpaulin-covered bodies instead.
Before attacking or cutting Piper, try attacking the tarpaulin-covered bodies instead.
Instead of looking under Piper, say "A quick check shows that the [italic type]livor mortis[roman type], the settling of the blood, is consistent with a body that has lain on its back for some time."
Instead of knocking on, pushing, pulling, rubbing, squeezing, or taking Piper, say "[italic type]Rigor mortis[roman type] is in full effect. You can't move her at all."

Before attacking or cutting something that is part of Piper, try attacking the tarpaulin-covered bodies instead.
Before smelling something that is part of Piper, try smelling Piper instead.
Before touching something that is part of Piper, try touching Piper instead.
Before knocking on, pushing, pulling, rubbing, squeezing, or taking something that is part of Piper, try pushing Piper instead.

Instead of searching Piper, say "You could examine Piper's head, her torso, her arms, or her legs."

piper-body-completion-quip is a truth state that varies.
Before reading a command when Thugs Investigation is happening and clue-piper-namelist is true and clue-piper-raven is true and clue-piper-stomach is true and piper-body-completion-quip is false:
	say "(You think you've learned all you can from Piper's body. You should look for more clues elsewhere.)";
	now piper-body-completion-quip is true.

Section 3.29.2.7.1 - Head

Piper's head is part of Piper.
The description is "A dark thin face with dark thin hair. Her lips are colorless, foul with trails of long-dried ichor; her eyes, glassy and expressionless, are buried in black rings of decay[if clue-piper-stomach is false].

Her mouth is slightly parted. [one of]It occurs to you that y[or]Y[stopping]ou could put your endoscope in and look around inside[end if]."
Understand "face" or "hair" or "dark" or "thin" as Piper's head.
Before searching Piper's head, try inserting the endoscope into Piper instead.
Before inserting the endoscope into Piper's head, try inserting the endoscope into Piper instead.

Piper's eyes are a plural-named thing part of Piper.
The description is "Her eyes are empty."
Understand "eye" or "ring/rings" or "decay" as Piper's eyes.
Instead of opening Piper's eyes, say "Her eyes are already open."
Instead of closing Piper's eyes, say "That would be dangerous. Her eyes are coated in black blood."
Instead of searching Piper's eyes, say "No answers are forthcoming."
Before rubbing or touching Piper's eyes, try touching the dried black blood instead.

Piper's mouth is part of Piper.
The description is "You could put your endoscope in and look around inside."
Understand "lip/lips" as Piper's mouth.
Before searching Piper's mouth, try inserting the endoscope into Piper instead.
Before inserting the endoscope into Piper's mouth, try inserting the endoscope into Piper instead.
Instead of opening Piper's mouth, say "Her mouth is already open."
Instead of closing Piper's mouth, say "[italic type]Rigor mortis[roman type] has locked her jaw in place."
Instead of inserting something into Piper's mouth, say "Don't be ridiculous."

Section 3.29.2.7.2 - Torso

Piper's torso is part of Piper.
The description is "Piper's clothes are muted and loosely fitted. She wears a cut-off frock, and above it a watchwoman's jacket with unidentifiable stains along the flaps. She would have been difficult to pick out in a working crowd -- or in a dark alley.

[if clue-piper-namelist is false]You notice a square, flat outline[otherwise]The list of names you found is[end if] in one of her jacket pockets."
Before knocking on, looking under, rubbing, searching, squeezing, or touching Piper's torso, say "You pat her down but find nothing else of interest." instead.
After examining Piper's torso when Piper's name list is nowhere: now Piper's name list is in Piper's pocket; continue the action.

Piper's frock is a thing worn by Piper.
The description is "A worn black dress that has been patched to the point of unrecognizability. Midway along the thigh, a tell-tale fray of the hem shows where the dress has been shortened."
Understand "worn" or "black dress" or "dress" or "hem" or "cut" or "off" or "cut-off" or "patch/patches" as Piper's frock.
Instead of looking under, opening, taking, or taking off Piper's frock, say "There's nothing under there that you're interested in."

Piper's jacket is a container worn by Piper.
The description is "This jacket was either stolen or poorly tailored. Possibly both.

[if clue-piper-namelist is false]You notice a square, flat outline[otherwise]The list of names you found is[end if] in one of the jacket pockets."
Understand "watchwoman/watchwoman's" or "watch" or "woman/woman's" or "stain/stains" or "flap/flaps/fold/folds" as Piper's jacket.
Instead of inserting something into Piper's jacket, say "This is a dead body, not your personal chest-of-drawers."
Instead of looking under, taking, or taking off Piper's jacket, say "The jacket is a biohazard, and not terribly fashionable either."
Instead of opening Piper's jacket, say "Piper's jacket is already open."
Instead of closing Piper's jacket, say "You see no reason to do that."
After examining Piper's jacket when Piper's name list is nowhere: now Piper's name list is in Piper's pocket; continue the action.

Piper's pocket is a transparent closed openable container part of Piper's jacket.
Understand "jacket pocket/pockets" or "pockets" as Piper's pocket.
Instead of inserting something into Piper's pocket, say "This is a dead body, not your personal chest-of-drawers."
Instead of examining or searching Piper's pocket:
	if clue-piper-namelist is false:
		try examining Piper's name list;
	otherwise:
		say "The list of names you found is inside."

Piper's name list is a thing. [This was bleached with hydrogen peroxide, a.k.a. caustic baryta.]
The description is "A list of names followed by sums of money. All of the names have check marks beside them; some of them are crossed out. The reverse side, for some reason, has been bleached a blank white."
The scent is "The paper has no distinct smell."
Understand "square" or "flat" or "outline" or "folded" or "scrap" or "the/-- paper" or "of" or "names" or "check" or "mark/marks" or "reverse" or "side" as Piper's name list.
Before taking Piper's name list, say "The name list is evidence. You should leave it for the Vigiles investigators." instead.

Instead of examining or taking Piper's name list when clue-piper-namelist is false:
	say "A folded scrap of paper. Further investigation reveals it to be a list of names followed by -- numbers? Prices?

[wait for any key]Sums of money.

[wait for any key]You recognize some of the names on here, too -- you've bought your groceries, or your clothes, from these people in the past. All of the names have check marks beside them. Some of them are crossed out.

[wait for any key]Has Piper been collecting debts?

[wait for any key]You reach the end of the page, and turn it over only to find the reverse side blank.

[wait for any key]Only... hold on a second.

[wait for any key]The front of the paper was slightly yellowed, but this side is completely white. It looks almost -- almost [italic type]bleached[roman type].

[wait for any key]Yes. It's not just your imagination. The texture is different. The stains have been removed.

[wait for any key]The reverse side of the paper wasn't blank. Someone [italic type]blanked[roman type] it.";
	now clue-piper-namelist is true.

Section 3.29.2.7.3 - Arms

Piper's arms are a plural-named thing part of Piper.
The description is "Her arms are surprisingly toned, beneath the concealing folds of her jacket. There are calluses on her hands, clumps of dirt under her fingernails."
Understand "arm" as Piper's arms.

Piper's hands are a plural-named thing part of Piper.
The description is "Piper was no stranger to rough work."
Understand "hand" or "finger/fingers" or "nail/nails/fingernail/fingernails" or "of/-- dirt" or "clump/clumps" or "callus/calluses" as Piper's hands.
Instead of swinging Piper's hands, say "Hilarious."

Section 3.29.2.7.4 - Legs

Piper's legs are a plural-named thing part of Piper.
The description is "Piper wears jackboots and a tattered half slip, leaving her thighs mostly exposed. Close to the pelvis, you can see ink-black blood vessels running perversely beneath the skin.

[one of]You notice[or]There is[stopping] an inconspicuous leather strap around her right thigh."
Understand "leg" as Piper's legs.

Piper's jackboots are a plural-named thing worn by Piper.
The description is "Heavy, hobnailed things."
Understand "jackboot" or "boot/boots" or "hobnail/hobnails/hobnailed" or "footwear" as Piper's jackboots.
Instead of opening, taking, or taking off Piper's jackboots, say "You don't think the Vigiles will appreciate you running off with a victim's footwear."

Piper's half slip is a thing worn by Piper.
The description is "It's seen better days."
The scent is "The smell is not pleasant."
Understand "tattered" or "unmentionables" as Piper's half slip.
Instead of opening, taking, or taking off Piper's half slip, say "Surely you can solve this investigation [italic type]without[roman type] carting a dead woman's unmentionables around."

Piper's thighs are a plural-named thing part of Piper.
The description is "The color has drained from her skin."
Understand "thigh" or "blood/-- vessel/vessels" or "pelvis" or "skin" as Piper's thighs.

Piper's thigh strap is a transparent openable closed container worn by Piper.
Instead of examining Piper's thigh strap, say "[if Piper's throwing knives are nowhere]The strap looks like it can be opened.[otherwise if Piper's thigh strap is open]The false lining is open, revealing a set of throwing knives.[otherwise]The false lining is closed."
Understand "right thigh" or "leather" or "inconspicuous" or "false" or "lining" as Piper's thigh strap.
Instead of inserting something into Piper's thigh strap, say "This is a dead body, not your personal chest-of-drawers."
After opening Piper's thigh strap:
	say "You draw back the false lining, revealing a set of throwing knives.";
	now Piper's throwing knives are in Piper's thigh strap.
	
Piper's throwing knives are a plural-named thing.
The description is "On the hilt of each knife is embossed the symbol of a raven."
Understand "knife" or "set" or "of" as Piper's throwing knives.
Instead of taking the throwing knives, say "You shouldn't disturb the evidence. You already have your scalpel if you need a cutting implement."

Some embossed ravens are part of Piper's throwing knives.
The description is "[if clue-tradingcompany is true]It's the symbol of the Greater Corindia Trading Company. Piper must have been connected to them somehow.[otherwise]The symbol is oddly familiar, but you can't quite put your finger on it."
Understand "raven" or "hilt" or "symbol" or "of" as the embossed ravens.
Instead of touching the embossed ravens, say "It's stunning work. The knives can't have been easy to acquire."

After examining Piper's throwing knives when clue-piper-raven is false:
	increment clue-ravens-sighted;
	now clue-piper-raven is true;
	continue the action.

Chapter 3.29.2.8 - Piper Endoscopy

Instead of inserting the endoscope into Piper:
	start an endoscopy on "Piper" via "Piper's mouth" to piper-endoscopy-mouth.
	
Section 3.29.2.8.1 - Mouth

piper-endoscopy-mouth is a privately-named room.
The printed name is "Mouth".
The description is "It is dark. What little light filters through the lips is absorbed by countless black ulcers, each an eruption of effluvium and contagion. Between them run stains on a stained tongue, and capillaries that have shriveled and died.

The light leads out. The pharynx leads in."

Piper's lips are plural-named scenery in piper-endoscopy-mouth.
The description is "At this magnification they are monstrous, engorged."
Understand "lip" as Piper's lips.

Piper's mouth ulcers are plural-named scenery in piper-endoscopy-mouth.
The description is "You feel your own mouth tingling."
Understand "black" or "ulcer" or "eruption/eruptions" or "effluvium" or "contagion" as Piper's mouth ulcers.

Piper's tongue is scenery in piper-endoscopy-mouth.
The description is "It's utterly black."
Understand "stain/stains/stained" as Piper's tongue.

Piper's oral capillaries are plural-named scenery in piper-endoscopy-mouth.
The description is "Like the corpses of worms."
Understand "capillary" or "corpse/corpses" or "worm/worms" as Piper's oral capillaries.

The view of Piper's pharynx is scenery in piper-endoscopy-mouth.
The description is "A swollen arch."
Understand "swollen" or "arch" as the view of Piper's pharynx.
Before entering or searching the view of Piper's pharynx, try going down instead.

Section 3.29.2.8.2 - Pharynx

piper-endoscopy-pharynx is a privately-named room. It is below piper-endoscopy-mouth.
The printed name is "Pharynx".
The description is "Dead flesh constricts you. Muscles seized by [italic type]rigor mortis[roman type] impede your entry, distended as though in a perpetual scream. The walls stain trails on the endoscope lenses.

The epiglottis blocks the larynx. You can only descend into the esophagus."

Piper's pharyngeal muscles are plural-named scenery in piper-endoscopy-pharynx.
The description is "Masses like black bezoars."
Understand "dead" or "flesh" or "muscle" or "bezoar/bezoars" or "wall/walls" as Piper's pharyngeal muscles.

Piper's epiglottis is scenery in piper-endoscopy-pharynx.
The description is "The epiglottis, too, is frozen in [italic type]rigor mortis,[roman type] and will not move."
Understand "larynx" as Piper's epiglottis.

The view of Piper's esophagus is scenery in piper-endoscopy-pharynx.
The description is "A forbidding abyss."
Understand "oesophagus" as the view of Piper's esophagus.
Before entering or searching the view of Piper's esophagus, try going down instead.

Section 3.29.2.8.3 - Esophagus

piper-endoscopy-esophagus is a privately-named room. It is below piper-endoscopy-pharynx.
The printed name is "Esophagus".
The description is "A well without an end. You stare into a palpable darkness that goes on and on, a purgatory of black branches and devouring rings.

The stomach is beneath."

Piper's esophageal blood vessels are plural-named scenery in piper-endoscopy-esophagus.
The description is "Arteries, veins, twisting and spiraling into the dark."
Understand "black" or "branch/branches" or "artery/arteries" or "vein/veins" or "purgatory/darkness" or "palpable" as Piper's esophageal blood vessels.

Piper's esophageal sphincters are plural-named scenery in piper-endoscopy-esophagus.
The description is "Sphincters."
Understand "sphincter" or "oesophageal" or "devouring" or "ring/rings" as Piper's esophageal sphincters.

The view of Piper's stomach is scenery in piper-endoscopy-esophagus.
The description is "You can see nothing."
Understand "end" as the view of Piper's stomach.
Before entering or searching the view of Piper's stomach, try going down instead.

Section 3.29.2.8.4 - Stomach

piper-endoscopy-stomach is a privately-named room. It is below piper-endoscopy-esophagus.
The printed name is "Stomach".
The description is "A flooded cavern. You hang terrifyingly over a pitch-dark expanse of undigested bile. The stomach walls are ruptured and lacerated and pockmarked with ulcers that leer evilly in your lens-light.

And in the center of it all there is a [italic type]mass,[roman type] an island in the body-of-stomach. Sickening boli that have clumped together and extended their tendrils into the surrounding vitriol and flesh -- infected the bloodstream."

Every turn when the endoscopic location is piper-endoscopy-stomach and clue-piper-stomach is false (this is the clue-piper-stomach discovery rule):
	wait for any key;
	say "These are the things that killed Piper. These -- these [italic type]things[roman type] -- they must have grown inside her stomach. They must have destroyed her from the inside.[paragraph break]";
	now clue-piper-stomach is true;
	wait for any key;
	if clue-ingestion-vector is false:
		say "But how did they get here? Did she eat something that was contaminated? Did she [italic type]drink[roman type] something?[paragraph break]";
		wait for any key;
		say "You don't know. All you can do is keep investigating.";
		now clue-ingestion-vector is true;
	otherwise:
		say "Not a comforting thought. It raises more questions than it answers."
	
The undigested bile is scenery in piper-endoscopy-stomach. The indefinite article is "some".
The description is "Acid. Mucus. Chyme."
Understand "acid/vitriol" or "mucus" or "chyme" or "flooded" or "cavern" or "pitch" or "dark/pitch-dark" or "expanse" as the undigested bile.

Piper's stomach walls are plural-named scenery in piper-endoscopy-stomach.
The description is "Layers of flesh have been flayed away."
Understand "wall" or "rupture/ruptured" or "laceration/lacerated" or "layer/layers" or "flesh" or "ulcer/ulcers" or "bloodstream" as Piper's stomach walls.

An abominable mass is scenery in piper-endoscopy-stomach.
The description is "You hope it's your hands that are trembling, and not the mass."
Understand "island" or "body-of-stomach" or "sickening" or "bolus/boli" or "tendril/tendrils" as the abominable mass.

Before going up when the endoscopic location is piper-endoscopy-stomach, try going outside instead.

Chapter 3.29.2.9 - Raven Questions

Every turn when Four Investigations is happening and clue-ravens-sighted is greater than 1 and clue-raven is false (this is the unlocking raven symbol questions rule):
	say "That's the second time you've seen that raven symbol today. Is it connected to these deaths somehow? Perhaps someone will know something about the symbol's significance.";
	unlock raven questions.
	
To unlock raven questions:
	now the enabled of examiner-raven is true;
	now the enabled of justinian-4inv-raven is true;
	now the enabled of cavala-4inv-raven is true;
	now the enabled of horatio-4inv-raven is true;
	now clue-raven is true.
	
To discover the Trading Company connection:
	now the enabled of examiner-raven is false;
	now the enabled of justinian-4inv-raven is false;
	now the enabled of cavala-4inv-raven is false;
	now the enabled of horatio-4inv-raven is false;
	now clue-tradingcompany is true.

Part 3.29.3 - Arturus's Clinic during Day Two

Rule for writing a paragraph about Justinian when Four Investigations is happening:
	say "[An Examiner Velox] and his investigators are huddled around [if Meeting the Patients has ended]the bodies of Doctor Arturus, Creditor Nacarat, Sal, and Piper[otherwise]a group of tarpaulin-covered bodies[end if]. Beside them, Justinian sits at a coffee table, brooding.";
	now the Vigiles investigators are mentioned;
	now Examiner Velox is mentioned;
	now Justinian is mentioned.

Chapter 3.29.3.1 - Vigiles and Examiner Velox

Some Vigiles investigators are women in Arturus's Clinic.
The description is "A pair of women in formal coats. You recognize them by their military bearing."
The sound is "They're discussing causes of death."
Understand "investigator/detective/detectives" or "pair" or "of" or "team" as the Vigiles investigators.

Some formal coats are worn by the Vigiles investigators.
The description is "Long, thin, and black, like a pair of chocolate stovepipes."
Understand "coat" or "stovepipe/stovepipes" or "black" or "long" or "thin" or "chocolate" as the formal coats.

Examiner Velox is an improper-named mutant man in Arturus's Clinic.
The indefinite article is "a".
The description is "[one of][The Examiner Velox] appears to be the one in charge of the team. He looks surprisingly human, if you discount his quivering mustache[or]The examiner and his team are keeping watch over the bodies[stopping]."
The sound is "He's puttering about and making observations about the deceased."
Rule for printing the name of Examiner Velox when Examiner Velox is improper-named: say "Vigiles examiner".
Understand "coroner" or "medical" or "vigiles" or "examiner" as Examiner Velox.

The mustache of cilia is part of Examiner Velox.
The description is "[one of]Are those hairs or cilia? It's not polite to ask[or]They're probably cilia[stopping]."
Understand "hair/hairs/cilium/ciliolate" or "quivering" or "moustache" as the mustache of cilia.

Before showing Doctor Cavala's signum to the Vigiles investigators, try talking to Examiner Velox instead.
Before showing Doctor Cavala's signum to Examiner Velox, try talking to Examiner Velox instead.
Before talking to the Vigiles investigators, try talking to Examiner Velox instead.
Before talking to Examiner Velox for the first time: now Examiner Velox is proper-named; continue the action.

Section 3.29.3.1.1 - Vigiles Examiner Dialogue

Some dialogue branches are defined by the Table of Vigiles Examiner Dialogue.

Table of Vigiles Examiner Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
examiner-home	true	false	""	"You approach the team of Vigiles, signum in hand. The examiner's cilia twitch as he looks you over.

'Examiner Velox,' he says. 'Channelworks Division. And who might you be?'

[wait for any key]'My name is Servator Marid Orpheia,' you reply. 'I'm here on behalf of Doctor Cavala. I need to study the bodies so we can develop a cure for the affliction.'

[wait for any key]'The [italic type]ius medici?'[roman type] He nods. 'Very well, Servator. You may inspect these bodies at your own risk. Do not damage them, however -- we are considering the possibility of quarantine, and they may be used as evidence in the tribunal.'"	{examiner-quarantine, examiner-tribunal, examiner-agree, examiner-refuse}
examiner-confront	true	false	""	"As you approach the bodies, the examiner places an arresting hand on your shoulder.

'Examiner Velox,' he says. 'Channelworks Division. And who might you be?'

[wait for any key]'My name is Servator Marid Orpheia,' you reply. 'I'm here on behalf of Doctor Cavala. I need to study the bodies so we can develop a cure for the affliction.'

[wait for any key]'The [italic type]ius medici?'[roman type] He pauses, then nods. 'Very well, Servator. You may inspect these bodies at your own risk. Do not damage them, however -- we are considering the possibility of quarantine, and they may be used as evidence in the tribunal.'"	{examiner-quarantine, examiner-tribunal, examiner-agree, examiner-refuse}
examiner-quarantine	true	true	"'Quarantine?'"	"'Quarantine?'

'Indeed.' His mustache bristles vigorously. 'If there is even a possibility that Doctor Justinian's fears ring true, it is imperative that the spread of the disease be contained -- if not within the Turris, then within the Channelworks District.'"	{examiner-redentoo, examiner-mentionedtribunal, examiner-agree, examiner-refuse}
examiner-iequarantine	true	true	"'You mean quarantine?'"	"'You mean quarantine?'

'Indeed.' His mustache bristles. 'If there is even a possibility that Doctor Justinian's fears ring true, it is imperative that the spread of the disease be contained -- if not within the Turris, then within the Channelworks District.'"	{examiner-redentoo, examiner-agree, examiner-refuse}
examiner-redentoo	true	false	"'The disease isn't confined to the Turris.'"	"'The disease isn't confined to the Turris.'

He frowns. 'Then the situation is worse than I had imagined. We [italic type]must[roman type] quarantine the district in the name of the public good.'"	{examiner-mentionedtribunal, examiner-agree, examiner-refuse}
examiner-tribunal	true	true	"'Tribunal?'"	"'Tribunal?'

Examiner Velox taps the pin on his coat. 'We are here on behalf of the district councils. At this very moment, a hearing is under way regarding measures to be taken against the disease.'"	{examiner-iequarantine, examiner-agree, examiner-refuse}
examiner-mentionedtribunal	true	true	"'You mentioned a tribunal?'"	"'You mentioned a tribunal?'

Examiner Velox flashes his badge. 'We are here on behalf of the district councils. At this very moment, a hearing is under way regarding measures to be taken against the disease.'"	{examiner-agree, examiner-refuse}
examiner-refuse	true	false	"'I can't promise that I won't damage the bodies...'"	"'I can't promise that I won't damage the bodies. What if I need to perform a dissection for more information?'

He shrugs. 'In that case, I cannot promise that you will be allowed to examine the bodies in the first place.'"	{examiner-justinianvouch, examiner-justphoto, examiner-fineagree, examiner-illbeback}
examiner-justinianvouch	true	true	"'Doctor Justinian will vouch for me.'"	"'Doctor Justinian will... will vouch for me.'

Examiner Velox inclines his head. 'You must understand, Servator, that this is a district-level matter. I respect Doctor Justinian's opinion of you, but even his authority does not stretch that far.'"	{examiner-justphoto, examiner-fineagree, examiner-illbeback}
examiner-justphoto	true	true	"'Can't you just take a negative or something?'"	"'Can't you just take a negative or something?'

He shakes his head. 'The Channelworks Division is not well funded -- as it stands, my department can barely keep the lights on. I'm afraid a man-portable [italic type]camera obscura[roman type] is out of the question.'"	{examiner-justinianvouch, examiner-fineagree, examiner-illbeback}
examiner-illbeback	true	false	"'Fine. I'll be back later.'"	"'Fine,' you say. 'I'll be back later.'

'As you wish. I will be here if you change your mind.'

You step back, and Examiner Velox returns to inspecting the victims."	{}

The home dialogue branch of Examiner Velox is examiner-home.

After reading out examiner-quarantine: now the enabled of examiner-iequarantine is false.
After reading out examiner-iequarantine: now the enabled of examiner-quarantine is false.
After reading out examiner-tribunal: now the enabled of examiner-mentionedtribunal is false.
After reading out examiner-mentionedtribunal: now the enabled of examiner-tribunal is false.

Section 3.29.3.1.2 - Vigiles Permission and the Examiner's Exposition

4inv-vigiles-permission is a truth state that varies.

After reading out examiner-illbeback: now the home dialogue branch of Examiner Velox is examiner-home2.

Table of Vigiles Examiner Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
examiner-home2	true	false	""	"You approach the team of Vigiles.

'You're back,' Examiner Velox observes. 'Have you changed your mind about needing to damage the bodies?'"	{examiner-justinianvouch, examiner-justphoto, examiner-fineagree, examiner-illbeback2}
examiner-illbeback2	true	false	"'No. I haven't.'"	"'No,' you say. 'I haven't.'

You step back. He shakes his head and returns to inspecting the victims."	{}
examiner-agree	true	false	"'I'll do my best to avoid damaging the bodies.'"	"'I'll do my best to avoid damaging the bodies.'

He nods. 'Excellent. To business, then. If you'll follow me...'

[examiner-exposition]"	{examiner-causeofdeath, examiner-arturus-ask, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-fineagree	true	false	"'Fine. I'll do as you ask.'"	"'Fine. I'll do as you ask.'

He nods. 'I'm glad you came around. To business, then. If you'll follow me...'

[examiner-exposition]"	{examiner-causeofdeath, examiner-arturus-ask, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}

To say examiner-exposition:
	now 4inv-vigiles-permission is true;
	now the dried black blood is in Arturus's Clinic;
	now Piper is in Arturus's Clinic;
	now Sal is in Arturus's Clinic;
	now Creditor Nacarat is in Arturus's Clinic;
	now Doctor Arturus is in Arturus's Clinic;
	now the home dialogue branch of Examiner Velox is examiner-home3;
	wait for any key;
	say "You follow him to the slab, where he draws back the tarpaulin. You recognize Doctor Arturus, but there are three others: a man dressed in finery, a man built like a fighter, and a reedy young woman. All have black stains around their mouths and eyes.[paragraph break]";
	wait for any key;
	say "'Here are the four victims of the disease,' Examiner Velox says. 'We've made some preliminary investigations into their identities. Looking for identification on the bodies, cross-referencing against our records, [italic type]et cetera...'[roman type][paragraph break]";
	wait for any key;
	say "'What can you tell me?' you ask.

'The man on the left is Doctor Arturus -- I see you're already familiar with him. Very good. The one beside him, the well-dressed man, is Creditor Nacarat of the Furopolis Securities Exchange. He's rather well-known in certain circles of society -- has been implicated in some fraud allegations, but nothing concrete.'[paragraph break]";
	wait for any key;
	say "'What about the other two?'

'Ah.' Examiner Velox furrows his mustache. 'They are more of an enigma. They carry no identification; they are not in our records. We believe they were unregistered criminals hiding in the Shanty Quarter. According to our contacts, they match the description of Sal and Piper, a villainous duo of some notoriety. They were underworld enforcers, and not particularly well liked.'[paragraph break]";
	wait for any key;
	say "You consider the facts laid before you. ";

Section 3.29.3.1.3 - Individual Discussions

Table of Vigiles Examiner Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
examiner-home3	true	false	""	"You approach the team of Vigiles, and Examiner Velox looks up from the bodies.

'Servator,' he says. 'What can I do for you?'"	{examiner-causeofdeath, examiner-raven, examiner-arturus-ask, examiner-nacarat-ask, examiner-thugs-ask, examiner-nevermind}
examiner-causeofdeath	true	true	"'The victims all died of the same disease?'"	"'The victims all died of the same disease?'

Examiner Velox shrugs. 'Like you, we cannot damage the bodies, making any detailed examination impossible. It seems clear, however, that these deaths were all caused by the same affliction of the blood.'"	{examiner-raven, examiner-arturus-ask, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-raven	false	true	"'Does a raven mean anything to you?'"	"'Does a raven mean anything to you?'

The examiner raises an eyebrow. 'It... it does, now that you mention it. The raven is one of the symbols of the Greater Corindia Trading Company -- it's a criminal syndicate, one of the biggest in Furopolis. If some of these people had been involved...'

That can't be good. You make a mental note of the connection."	{examiner-arturus-ask, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-arturus-ask	true	false	"'Regarding Doctor Arturus...'"	"'Regarding Doctor Arturus...'"	{examiner-arturus-id, examiner-arturus-found, examiner-arturus-timeofdeath, examiner-arturus-notable, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-arturus-id	true	true	"'You're certain about his identity?'"	"'You're certain about his identity?'

Examiner Velox's mustache wriggles. 'You and Doctor Justinian have both identified the body. We have detected no illusions, if that is what you are asking. The body on the slab is, without a doubt, that of Doctor Arturus.'"	{examiner-arturus-found, examiner-arturus-timeofdeath, examiner-arturus-notable, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-arturus-found	true	false	"'What was the state his body was found in[if examiner-arturus-found-asked is true], again[end if]?'"	"'What was the state his body was found in[if examiner-arturus-found-asked is true], again[end if]?'

'Doctor Justinian notified the Vigiles at five in the morning,' Examiner Velox replies. 'When we arrived at quarter-past five, we found Doctor Arturus's body already laid out here on the slab. Doctor Justinian testified that he had found Doctor Arturus motionless in his domicile, and moved him here in an attempt to revive him.'"	{examiner-arturus-id, examiner-arturus-timeofdeath, examiner-arturus-notable, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-arturus-timeofdeath	true	false	"'What was the time of death[if examiner-arturus-timeofdeath-asked is true], again[end if]?'"	"'What was the time of death[if examiner-arturus-timeofdeath-asked is true], again[end if]?'

His mustache squirms. 'The varying temperatures in the Turris Infinita make the precise time difficult to ascertain. Complicating matters is the fact that Doctor Justinian moved the body, interfering with the natural processes of [italic type]rigor mortis[roman type] and [italic type]livor mortis[roman type]. All we can gather is that he died last night -- sometime between eight and twelve hours ago.'"	{examiner-arturus-id, examiner-arturus-found, examiner-arturus-notable, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-arturus-notable	true	false	"'Is there anything I should be aware of[if examiner-arturus-notable-asked is true], again[end if]?'"	"'Is there anything I should be aware of[if examiner-arturus-notable-asked is true], again[end if]?'

'We believe that he was infected through his gloves,' Examiner Velox replies. 'They are stained with black effluvium both within and without. If you are concerned with the method of transmission, you might examine them further[if examiner-arturus-notable-asked is false and clue-arturus-gloves is false].'[paragraph break]Through his [italic type]gloves?[roman type] That shouldn't be possible...[otherwise].'"	{examiner-arturus-id, examiner-arturus-found, examiner-arturus-timeofdeath, examiner-nacarat-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-nacarat-ask	true	false	"'Regarding Creditor Nacarat...'"	"'Regarding Creditor Nacarat...'"	{examiner-nacarat-id, examiner-nacarat-timeofdeath, examiner-nacarat-circum, examiner-nacarat-notable, examiner-arturus-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-nacarat-id	true	false	"'Who was he again?'"	"'Who was he again?'

'Creditor Nacarat was a businessman with the Furopolis Securities Exchange,' the examiner says. 'We are acquainted with him from investigating allegations of fraud.'"	{examiner-nacarat-timeofdeath, examiner-nacarat-circum, examiner-nacarat-notable, examiner-arturus-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-nacarat-timeofdeath	true	false	"'What was the time of death[if examiner-nacarat-timeofdeath-asked is true], again[end if]?'"	"'What was the time of death[if examiner-nacarat-timeofdeath-asked is true], again[end if]?'

'By my estimation,' he replies, 'and assuming his body has remained in the clinic the whole time -- he died [if examiner-thugs-timeofdeath-asked is true]around the same time as Sal and Piper. A[otherwise]a[end if] little over thirty hours ago, on the night of the Third[if examiner-thugs-timeofdeath-asked is false].'[paragraph break][italic type]The night Reden died,[roman type] you mentally append.[otherwise].'"	{examiner-nacarat-id, examiner-nacarat-circum, examiner-nacarat-notable, examiner-arturus-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-nacarat-circum	true	false	"'What do you know about the circumstances of his death[if examiner-nacarat-circum-asked is true], again[end if]?'"	"'What do you know about the circumstances of his death[if examiner-nacarat-circum-asked is true], again[end if]?'

He shrugs. 'Creditor Nacarat was a patient here before he died. All the signs suggest he died here, together with Sal and Piper.'"	{examiner-nacarat-id, examiner-nacarat-timeofdeath, examiner-nacarat-notable, examiner-arturus-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-nacarat-notable	true	false	"'Is there anything I should be aware of[if examiner-nacarat-notable-asked is true], again[end if]?'"	"'Is there anything I should be aware of[if examiner-nacarat-notable-asked is true], again[end if]?'

A twitch of the mustache. 'There is a glyph of recording in the inner lining of his jacket. It holds an intriguing, if fragmented, phonographic transcription. We did not find it particularly useful, but it may be worth listening to regardless.'"	{examiner-nacarat-id, examiner-nacarat-timeofdeath, examiner-nacarat-circum, examiner-arturus-ask, examiner-thugs-ask, examiner-thanksbye}
examiner-thugs-ask	true	false	"'Regarding Sal and Piper...'"	"'Regarding Sal and Piper...'"	{examiner-thugs-id, examiner-thugs-timeofdeath, examiner-thugs-circum, examiner-thugs-notable, examiner-thugs-keyring, examiner-arturus-ask, examiner-nacarat-ask, examiner-thanksbye}
examiner-thugs-id	true	false	"'Who were they again?'"	"'Who were they again?'

'We believe Sal and Piper to have been criminals operating out of the Shanty Quarter,' he replies. 'They were notorious underworld enforcers, according to our contacts.'"	{examiner-thugs-timeofdeath, examiner-thugs-circum, examiner-thugs-notable, examiner-thugs-keyring, examiner-arturus-ask, examiner-nacarat-ask, examiner-thanksbye}
examiner-thugs-timeofdeath	true	false	"'What were the times of death[if examiner-thugs-timeofdeath-asked is true], again[end if]?'"	"'What were the times of death[if examiner-thugs-timeofdeath-asked is true], again[end if]?'

'Both of them died around the same time,' Examiner Velox replies, 'though the precise time is uncertain. I am given to believe that they died [if examiner-nacarat-timeofdeath-asked is true]around the same time as Creditor Nacarat -- [end if]around thirty hours ago, on the night of the Third[if examiner-nacarat-timeofdeath-asked is false].'[paragraph break][italic type]The night Reden died,[roman type] you mentally append.[otherwise].'"	{examiner-thugs-id, examiner-thugs-circum, examiner-thugs-notable, examiner-thugs-keyring, examiner-arturus-ask, examiner-nacarat-ask, examiner-thanksbye}
examiner-thugs-circum	true	false	"'What do you know about the circumstances of their deaths[if examiner-thugs-circum-asked is true], again[end if]?'"	"'What do you know about the circumstances of their deaths[if examiner-thugs-circum-asked is true], again[end if]?'

'As they were patients in the clinic,' he replies, 'they likely died here, together with Creditor Nacarat. The signs they exhibit corroborate that.'"	{examiner-thugs-id, examiner-thugs-timeofdeath, examiner-thugs-notable, examiner-thugs-keyring, examiner-arturus-ask, examiner-nacarat-ask, examiner-thanksbye}
examiner-thugs-notable	true	false	"'Is there anything I should be aware of[if examiner-thugs-notable-asked is true], again[end if]?'"	"'Is there anything I should be aware of[if examiner-thugs-notable-asked is true], again[end if]?'

'We found some things in their pockets,' the examiner says. 'You may wish to look at their possessions... although I am uncertain, personally, how relevant they are to this series of deaths.'"	{examiner-thugs-id, examiner-thugs-timeofdeath, examiner-thugs-circum, examiner-thugs-keyring, examiner-arturus-ask, examiner-nacarat-ask, examiner-thanksbye}
examiner-thugs-keyring	false	true	"'There's a keyring on Sal's body. Do you mind if I borrow it for a while?'"	"'There's a keyring on Sal's body. Do you mind if I borrow it for a while?'

'Well--' His mustache wriggles. 'You are not [italic type]officially[roman type] permitted, Servator, but if you believe it will further your investigation... let us agree that my attention is divided, focused elsewhere. Just be sure to return it to the basilica when you are finished.'

'I will,' you reply. 'Thank you.'"	{examiner-thugs-id, examiner-thugs-timeofdeath, examiner-thugs-circum, examiner-thugs-notable, examiner-arturus-ask, examiner-nacarat-ask, examiner-thanksbye}
examiner-thanksbye	true	false	"'I'll keep investigating.'"	"'I'll keep investigating.'

'Very well. I will be here if you have any further questions.'

You step back, and Examiner Velox returns to his work."	{}
examiner-nevermind	true	false	"'Nothing, never mind.'"	"'Nothing, never mind.'

You step back, and Examiner Velox returns to his work."	{}

After reading out examiner-raven: discover the Trading Company connection.

examiner-arturus-found-asked is a truth state that varies.
examiner-arturus-timeofdeath-asked is a truth state that varies.
examiner-arturus-notable-asked is a truth state that varies.

After reading out examiner-arturus-found:
	if examiner-arturus-found-asked is not true, now the enabled of justinian-4inv-movedbody is true;
	now examiner-arturus-found-asked is true.
	
After reading out examiner-arturus-timeofdeath:
	now clue-arturus-timeofdeath is true;
	now examiner-arturus-timeofdeath-asked is true.
	
After reading out examiner-arturus-notable: now examiner-arturus-notable-asked is true.

examiner-nacarat-timeofdeath-asked is a truth state that varies.
examiner-nacarat-circum-asked is a truth state that varies.
examiner-nacarat-notable-asked is a truth state that varies.
After reading out examiner-nacarat-timeofdeath: now examiner-nacarat-timeofdeath-asked is true.
After reading out examiner-nacarat-circum: now examiner-nacarat-circum-asked is true.
After reading out examiner-nacarat-notable: now examiner-nacarat-notable-asked is true.

examiner-thugs-timeofdeath-asked is a truth state that varies.
examiner-thugs-circum-asked is a truth state that varies.
examiner-thugs-notable-asked is a truth state that varies.
After reading out examiner-thugs-timeofdeath: now examiner-thugs-timeofdeath-asked is true.
After reading out examiner-thugs-circum: now examiner-thugs-circum-asked is true.
After reading out examiner-thugs-notable: now examiner-thugs-notable-asked is true.
After reading out examiner-thugs-keyring: now keyring-permission-granted is true.

Chapter 3.29.3.2 - Justinian during Four Investigations

Justinian is in Arturus's Clinic.

Section 3.29.3.1.1 - In Which Justinian is Mostly Unhelpful

Some dialogue branches are defined by the Table of Justinian 4inv Dialogue.

Table of Justinian 4inv Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
justinian-4inv-home	true	false	""	"Justinian brightens up as you approach him.

'Marid,' he says."	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-patients, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-nevermind}
justinian-4inv-discovery	true	false	"'Can you tell me again about how you discovered the body?'"	"'Can you tell me again about... about how you discovered the body?'

He closes his eyes. 'Doctor Arturus had cloistered himself in the back -- he had instructed me not to disturb him. When I left him in the evening, he seemed his usual self... but when I called on him this morning, he was already dead in his domicile.'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-patients, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-patients	true	true	"'Can you tell me anything about Doctor Arturus's patients?'"	"'Can you tell me anything about Doctor Arturus's patients?'

'I know very little,' he says. 'Doctor Arturus... even in this clinic, with his aide, he was circumspect about his clients. They looked like anyone else -- they were just people, like anyone else who might pass by the Turris Infinita. I'm afraid I can't help you more.'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-patientrecords	false	true	"'Do you know where the patient records are kept?'"	"'Do you -- do you know where the patient records are kept?'

He pauses in thought.

'Try Doctor Arturus's domicile,' he says. 'He was obsessed with control. It would be like him to have every record on hand.'"	{justinian-4inv-discovery, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-patientrecords2	false	false	"'Where are the patient records, again?'"	"'Where are the patient records, again?'

'Try Doctor Arturus's domicile,' he replies."	{justinian-4inv-discovery, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-disease	true	false	"'What are your thoughts on the disease again?'"	"'What are your thoughts on the disease, again?'

Justinian shakes his head. 'I don't have any more idea than you do. Even Doctor Arturus was at a loss, and he was one of the most renowned pathologists in the region.'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-patients, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-movedbody	false	true	"'The Vigiles told me that you moved Doctor Arturus's body.'"	"'The -- The Vigiles told me that you moved Doctor Arturus's body.'

Justinian looks down. 'I thought -- I believed he was unconscious at first. I thought he could have been revived...'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-patients, justinian-4inv-disease, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-raven	false	true	"'Does a raven mean anything to you?'"	"'Does a raven mean anything to you?'

'A raven?'

Justinian furrows his brow.

'I'm sorry, Marid,' he says after a pause. 'Nothing comes to mind. Perhaps the symbol of a company...'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-patients, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-debt	false	true	"'Did you know that Doctor Arturus was in debt?'"	"'Did you know that Doctor Arturus was in debt?'

He blinks. 'I... no. I did not. That [italic type]is[roman type] rather intriguing... and it does paint recent events in a different light.'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-patients, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-wineglass, justinian-4inv-raven, justinian-4inv-goodbye}
justinian-4inv-wineglass	false	true	"'A wineglass was missing from Doctor Arturus's domicile...'"	"'A wineglass was missing from Doctor Arturus's domicile. Do you have any idea why?'

Justinian regards you curiously. 'I believe a guest broke one of the glasses. Do you... do you think it was relevant to Doctor Arturus's death?'

You can already feel yourself reddening. 'Never mind,' you say. 'Forget I asked.'"	{justinian-4inv-patientrecords, justinian-4inv-patientrecords2, justinian-4inv-discovery, justinian-4inv-patients, justinian-4inv-disease, justinian-4inv-movedbody, justinian-4inv-raven, justinian-4inv-debt, justinian-4inv-goodbye}
justinian-4inv-nevermind	true	false	"'Nothing, never mind!'"	"'Nothing -- nothing. Never mind!'

You scurry away in a fluster of embarassment."	{}
justinian-4inv-goodbye	true	false	"'I'll keep investigating.'"	"'I'll keep investigating.'

He nods. 'Be careful, Marid.'

You scurry away before you start blushing."	{}

The home dialogue branch of Justinian is justinian-4inv-home.

After reading out justinian-4inv-patients:
	if the Nacarat file is nowhere, now the enabled of justinian-4inv-patientrecords is true.

After reading out justinian-4inv-patientrecords:
	if the Nacarat file is nowhere, now the enabled of justinian-4inv-patientrecords2 is true;
	now clue-patientrecords-justinian is true.

After reading out justinian-4inv-discovery:
	now clue-arturus-timeofdeath is true;
	now clue-arturus-discovery-justinian is true.
	
After reading out justinian-4inv-wineglass:
	now clue-arturus-wineglassbroken is true.

Book 3.30 - Arturus's Domicile

Arturus's Domicile is a proper-named room. "This suspended mansion echoes with a grandiose hollowness. There is no comfort to be found in these faux hearths and chaise longues, these mantelpieces burdened by decades of history.

A study lies to the north. The hydraulic lift leads back down to the foyer."
It is above the hydraulic lift.
Understand "doctor" or "arturus/arturus'" as Arturus's Domicile.

The simple-name is "Doctor Arturus's domicile".
The sound is "You hear ticking from the study."
The scent is "Cold, clean air."
The exit reminder is "You can go north to Doctor Arturus's study or down to the Turris Infinita foyer."

Before going inside in Arturus's Domicile, try going north instead.
Before going outside in Arturus's Domicile, try going down instead.
Before going south in Arturus's Domicile, try going down instead.
Before examining north in Arturus's Domicile, try examining the view of Doctor Arturus's study instead.
Before examining inside in Arturus's Domicile, try examining the view of Doctor Arturus's study instead.
Before examining outside in Arturus's Domicile, try examining the ominous stormclouds instead.
Before examining northwest in Arturus's Domicile, try examining the ominous stormclouds instead.
Before examining west in Arturus's Domicile, try examining the ominous stormclouds instead.
Before examining southwest in Arturus's Domicile, try examining the ominous stormclouds instead.
Before examining south in Arturus's Domicile, try examining the hydraulic lift instead.
Before examining down in Arturus's Domicile, try examining the hydraulic lift instead.

Part 3.30.1 - Scenery

A grandiose hollowness is faraway scenery in Arturus's Domicile.
The description is "This place is uncomfortably empty."
Before listening to the grandiose hollowness, try listening to the location instead.
The grandiose hollowness has some text called the faraway response. The faraway response is "The [italic type]whole[roman type] domicile?"
Understand "suspended" or "mansion" or "echo/echoes" or "empty" or "space" as the grandiose hollowness.

Some faux hearths are an open unopenable scenery container in Arturus's Domicile.
The scent is "Nothing has ever been burned here."
Instead of examining the faux hearths, say "Empty stone fixtures. They're more for decoration than anything."
Understand "hearth" or "stone" or "fixture/fixtures" as the faux hearths.
Instead of burning the faux hearths, say "These are purely decorative fixtures. They don't even have chimneys."
Instead of inserting something into the faux hearths, say "You have better things to do."

Some chaise longues are a scenery supporter in Arturus's Domicile.
The description is "Long, intimidating chairs of brass and leather."
The scent is "The leather smells of beeswax and other preservatives."
Understand "furniture" or "longue/long" or "chair/chairs" or "brass" or "leather" as the chaise longues.
Instead of entering the chaise longues, say "You aren't in the mood for a rest right now."
Instead of pushing, pulling, taking, or turning the chaise longues, say "You don't see any reason to rearrange the furniture."
Instead of looking under the chaise longues, say "There isn't a mote of dust to be seen."

Some baroque mantelpieces are a scenery supporter in Arturus's Domicile.
The description is "Arrayed on the mantelpieces are photographic impressions, trinkets, and other mementos. Here is a painting of Doctor Arturus in his youth; there, an antique cast-iron scalpel, and a reliquary containing a shard of lapis lazuli."
The scent is "There is no dust."
Understand "mantelpiece/mantel/mantels" as the baroque mantelpieces.
Before searching the baroque mantelpieces, try examining the baroque mantelpieces instead.
Instead of putting something on the baroque mantelpieces, say "There's no space on the mantelpieces."

Some mantelpiece trinkets are privately-named scenery in Arturus's Domicile.
The description is "Relics of another time."
Understand "photo/photos/photograph/photographs/photographic" or "impression/impressions" or "trinket/trinkets" or "memento/mementos" or "history" or "decade/decades" or "of" as the mantelpiece trinkets.
Instead of looking under the mantelpiece trinkets, say "The trinkets are displayed on the mantelpieces."
Instead of pushing, pulling, taking, or turning the mantelpiece trinkets, say "You don't think the trinkets are important to your investigation."

There is a scenery thing in Arturus's Domicile called a painting of Doctor Arturus in his youth.
The description is "You recognize the illustration from your textbooks."
Instead of taking the painting of Doctor Arturus, say "You feel like you should leave Doctor Arturus's things as they were."
Instead of looking under, searching, or turning the painting of Doctor Arturus, say "There is nothing behind the painting."

The antique cast-iron scalpel is scenery in Arturus's Domicile.
The description is "It's hard to imagine surgeons once used these."
Understand "stand" as the antique cast-iron scalpel.
Instead of looking under the antique cast-iron scalpel, say "The scalpel is displayed on a stand."
Instead of taking the antique cast-iron scalpel, say "You feel like you should leave Doctor Arturus's things as they were."

The lapis lazuli reliquary is a closed unopenable transparent scenery container in Arturus's Domicile.
Instead of examining the lapis lazuli reliquary, say "Genuine lapis lazuli, not alchemically transmuted."
Understand "shard" or "containing" or "of" as the lapis lazuli reliquary.
Instead of opening the lapis lazuli reliquary, say "The reliquary is beautiful, but you don't think it's pertinent to the investigation."
Instead of inserting something into the lapis lazuli reliquary, say "There's no space for anything but the shard of lapis lazuli."
Instead of searching the lapis lazuli reliquary, say "A shard of lapis lazuli is stored inside."
Instead of looking under the lapis lazuli reliquary, say "There is nothing under the reliquary."
Instead of taking the lapis lazuli reliquary, say "You feel like you should leave Doctor Arturus's things as they were."

Some frosted-glass windows are scenery in Arturus's Domicile.
The description is "The sky masses with stormclouds."
The sound is "The windows muffle sound."
Understand "window" or "frosted" or "glass" as the frosted-glass windows.
Before searching or looking under the frosted-glass windows, try examining the frosted-glass windows instead.
Instead of opening or closing the frosted-glass windows, say "These windows aren't the kind that open."
Instead of rubbing the frosted-glass windows, say "The windows don't get any clearer."
Instead of touching the frosted-glass windows, say "The windows are cold to the touch."

Some ominous stormclouds are faraway scenery in Arturus's Domicile.
The description is "It's going to rain tonight."
The sound is "The windows muffle sound."
The ominous stormclouds have some text called the faraway response. The faraway response is "That's on the other side of the windows."
Understand "storm" or "cloud/clouds/stormcloud" or "dark" or "sky" or "mass/masses" as the ominous stormclouds.

[The black mourning-banner is faraway scenery in Arturus's Domicile.
The description is "A black banner is traditionally put up when the head of the house has died."
The sound is "The windows muffle sound."
The black mourning-banner has some text called the faraway response. The faraway response is "The banner is outside, on the roof of the Turris Infinita."
Understand "shadow" or "banner" or "trailing" or "mourning" as the black mourning-banner.]

The view of Doctor Arturus's study is faraway scenery in Arturus's Domicile.
The description is "You can't see much in the gloom."
Understand "doctor's" or "arturus" or "arturus'" as the view of Doctor Arturus's study.
Before entering the view of Doctor Arturus's study, try going north instead.

Part 3.30.2 - Coffee Table

The vintage coffee table is a fixed in place supporter in Arturus's Domicile.

Rule for writing a paragraph about the vintage coffee table:
	say "By the frosted-glass windows, a coffee table has been set for three.";
	now the vintage coffee table is mentioned;
	now all things enclosed by the vintage coffee table are mentioned.
	
Instead of examining the vintage coffee table:
	say "A dark wooden table set with linen and porcelain. There is a serving platter of crackers and cheese, barely touched; surrounding it, there are three smaller plates, two of which are accompanied by wineglasses.[line break]";
	if clue-arturus-coffeetable is false:
		say "[line break]The third wineglass is nowhere to be seen.";
		now clue-arturus-coffeetable is true;
		now the enabled of justinian-4inv-wineglass is true.

The scent of the vintage coffee table is "The table smells of red wine and sharp cheese."
Understand "dark" or "wood/wooden" or "linen" or "porcelain" as the vintage coffee table.
Instead of entering the vintage coffee table, say "You aren't in the mood for a rest right now."
Instead of looking under the vintage coffee table, say "There is nothing under the table, not even dust."
Instead of putting something on the vintage coffee table, say "You aren't comfortable leaving your things in this place."
Instead of pushing, pulling, taking, or turning the vintage coffee table, say "You don't see any reason to rearrange the furniture."
Instead of searching the vintage coffee table, say "On the coffee table are a serving platter, three plates, and two wineglasses."

The serving platter is a portable supporter on the vintage coffee table.
Before smelling the serving platter, try smelling the crackers and cheese instead.
Instead of examining or searching the serving platter, say "It has some crackers and cheese on it."
Instead of putting something on the serving platter, say "There's no space on the platter for anything else."
Instead of looking under or taking the serving platter, say "You lift up the serving platter, but there's nothing underneath."

There is a plural-named thing on the serving platter called the crackers and cheese.
The description is "Water crackers and sharp cheese slices."
The scent is "You smell the sharpness of the cheese."
Understand "cracker" or "slice/slices" or "water" or "food" as the crackers and cheese.
Instead of taking, touching, tasting, or eating the crackers and cheese, say "[one of]After a careful look-over, you sneak a bite. Not bad, but it would go better with wine[or]You sneak another bite[stopping]."
Instead of searching the crackers and cheese, say "You see nothing strange about the food."
Instead of looking under the crackers and cheese, say "The food is on a serving platter."

Some smaller plates are a portable supporter on the vintage coffee table.
The scent is "There is no smell."
Understand "plate" or "3/three" as the smaller plates.
Instead of examining or searching the smaller plates, say "The plates are clean."
Instead of looking under the smaller plates, say "The plates are on the coffee table."
Instead of putting something on the smaller plates, say "You have better things to do."
Instead of taking the smaller plates, say "You feel like you should leave Doctor Arturus's things as they were."

Some leftover wineglasses are a portable open unopenable container on the vintage coffee table.
Understand "wineglass/glass/glasses" or "wine glass/glasses" or "2/two" as the leftover wineglasses.
Before smelling the leftover wineglasses, try smelling the leftover stains of red wine instead.
Before emptying the leftover wineglasses into, try drinking the leftover wineglasses instead.
Instead of examining or searching the leftover wineglasses, say "The wineglasses still contain traces of red wine."
Instead of drinking, turning, or tasting the leftover wineglasses, say "You tilt one of the glasses experimentally, but there isn't enough wine left to form even a drop."
Instead of inserting something into the leftover wineglasses, say "You can't imagine why you would want to do that."
Instead of looking under the leftover wineglasses, say "The wineglasses are on the coffee table."
Instead of rubbing the leftover wineglasses, say "You're here to investigate a series of deaths, not to polish Doctor Arturus's tableware."
Instead of taking the leftover wineglasses, say "You feel like you should leave Doctor Arturus's things as they were."
Instead of touching the leftover wineglasses, say "The glass is cold."

Some leftover stains of red wine are scenery in the leftover wineglasses.
The description is "An expensive claret, if you had to guess."
The scent is "You smell nothing strange from the leftover stains."
Understand "stain" or "faint" as the leftover stains of red wine.
Before drinking, taking, or tasting the leftover stains of red wine, try drinking the leftover wineglasses instead.
Before rubbing the leftover stains of red wine, try rubbing the leftover wineglasses instead.
Instead of searching the leftover stains of red wine, say "There's nothing apart from the faint stains."
Instead of touching the leftover stains of red wine, say "That would only dirty your gloves."

Book 3.31 - Arturus's Study

There is a proper-named room called Arturus's Study. "A chamber decked with aging bookcases and dusty plaques. The frieze that circles the walls is engraved with scenes from antiquity, lines in the [italic type]lingua libria;[roman type] by the exit to the south, a clock ticks the minutes and seconds away.

A rosewood desk stands in the heart of the room. Beside it, there is a storage cabinet."

It is north of Arturus's Domicile.
Understand "doctor" or "arturus'" as Arturus's Study.

The simple-name is "Doctor Arturus's study".
The sound is "You hear the ticking of the clock."
The scent is "The room smells of ink and tobacco."
The exit reminder is "The exit is to the south."

Before examining outside in Arturus's Study, try examining the view of Doctor Arturus's domicile instead.
Before examining south in Arturus's Study, try examining the view of Doctor Arturus's domicile instead.

Before going outside in Arturus's Study, try going south instead.

Part 3.31.1 - Scenery

Some aging bookcases are an open unopenable scenery container in Arturus's Study.
Understand "bookcase" or "bookshelf/bookshelves" or "secret" or "compartment" as the aging bookcases.
Before smelling the aging bookcases, try smelling the antique medical texts instead.
Instead of examining or searching the aging bookcases, say "Doctor Arturus has a small collection of antique medical texts."
Instead of opening, pushing, pulling, or turning the aging bookcases, say "[one of]You find the catch and open up the secret compartment that is so common in old bookcases. Unfortunately, Doctor Arturus doesn't appear to have made use of it, and you close the secret compartment back up with some disappointment[or]You've already checked the secret compartment[stopping]."
Instead of inserting something into the aging bookcases, say "You shouldn't leave your things lying around in old houses."

Some antique medical texts are scenery in the aging bookcases.
The description is "Mostly outdated, but they have historical value."
The scent is "The books are old and moldy."
Understand "collection" or "of" or "text" or "book/books" as the antique medical texts.
Before opening, pushing, pulling, turning, or looking under the antique medical texts, try opening the aging bookcases instead.
Instead of searching the antique medical texts, say "You don't have the time to look through them. In any case, you doubt they're relevant to the investigation."
Instead of taking the antique medical texts, say "You don't need any of these texts."

Some dusty plaques are scenery in Arturus's Study.
The description is "Various awards and certificates."
The scent is "You sneeze."
Understand "plaque" or "award/awards" or "certificate/certificates" as scenery in Arturus's Study.
Instead of looking under the dusty plaques, say "The plaques are firmly affixed to the wall."

The decorative frieze is scenery in Arturus's Study.
The description is "The wood has been carefully carved and sigiled."
Understand "wood" or "carved/engraved" or "sigil/sigils/sigiled" as the decorative frieze.
Instead of searching the decorative frieze, say "There are some scenes from antiquity, and lines in the [italic type]lingua libria[roman type]."

Some scenes from antiquity are part of the decorative frieze.
The description is "One scene depicts Pharmacos discovering the humors. Another shows Merula and Collis treating refugees during the Corindian Civil War."
Understand "scene" as the scenes from antiquity.
Does the player mean doing something with the scenes from antiquity: it is likely.

The decorative frieze incorporates a thing called the scene of Pharmacos.
The description of the scene of Pharmacos is "Pharmacos the Wise was the first to name the four humors of the body."
Understand "humor/humors" or "four/4" or "wise" as the scene of Pharmacos.

The decorative frieze incorporates a thing called the scene of Merula and Collis.
The description of the scene of Merula is "The two lovers would eventually found the Physicians['] College."
Understand "two/2" or "lover/lovers" or "refugee/refugees" or "corindia/corindian" or "civil" or "war" as the scene of Merula.

The decorative frieze incorporates a plural-named thing called the lines in the lingua libria.
The printed name of the lingua libria lines is "lines in the [italic type]lingua libria[roman type]".
The description of the lingua libria lines is "[italic type]Nascentes morimur finisque ab origine pendet.[roman type] 'When we are born we die; our end is but the pendant of our beginning.'"
Understand "line" as the lingua libria lines.

The view of Doctor Arturus's domicile is faraway scenery in Arturus's Study.
The description is "Light streams in."
The sound is "It's quiet."
Understand "exit" as the view of Doctor Arturus's domicile.
Before entering the view of Doctor Arturus's domicile, try going south instead.

The pendulum clock is scenery in Arturus's Study.
The description is "A pendulum clock. Its arm sways to and fro, never quite finding rest."
The sound is "Tick. Tock."
Understand "arm" as the pendulum clock.
Instead of looking under, opening, pushing, pulling, searching, or turning the pendulum clock, say "You give the clock a once-over, but it isn't hiding any secret compartments or anything like that."

Part 3.31.2 - Rosewood Desk

The rosewood desk is a scenery supporter in Arturus's Study.
The scent is "The smell is overpowering."
Instead of examining the rosewood desk, say "The desk is drenched with tobacco, stained with ink, and weathered by decades of use. It curves around a high-backed armchair, piled with stationery and never-finished drafts.

At the end of the table sits a correspondence machine, accompanied by its box of ticker-tape reels."
Instead of looking under the rosewood desk, say "Nothing is under the desk."
Instead of searching the rosewood desk, say "Apart from the stationery, there is a correspondence machine, and a box of ticker-tape reels."
Instead of pushing, pulling, or turning the rosewood desk, say "You don't see any reason to rearrange the furniture."
Instead of putting something on the rosewood desk, say "You aren't comfortable leaving your things in this place."

Report entering the rosewood desk: say "You sit at the rosewood desk."; stop the action.
Report getting off the rosewood desk: say "You stand up."; stop the action.
	
Rule for issuing the response text of room description heading rule response (B) when the player is on the rosewood desk (this is the print 'at the rosewood desk' rule):
	say " (at the rosewood desk)".
	
Some ancient inkstains are part of the rosewood desk.
The description is "You thought those were bloodstains for a second. Thankfully, that isn't the case."
The scent is "Ink. Definitely ink."
Understand "stain/stains" or "ink" as the ancient inkstains.
Instead of looking under, rubbing, or touching the ancient inkstains, say "The stains are deep in the wood."

The high-backed armchair is a scenery supporter in Arturus's Study.
The scent is "It smells of tobacco."
Understand "chair" as the high-backed armchair.
Before entering the high-backed armchair, try entering the rosewood desk instead.
Before getting off the high-backed armchair, try getting off the rosewood desk instead.
Instead of examining the high-backed armchair, say "It looks to be very old, and not very comfortable."
Instead of looking under the high-backed armchair, say "Nothing is under the chair."
Instead of searching the high-backed armchair, say "Nothing is hidden in the chair."
Instead of pushing, pulling, or turning the high-backed armchair, say "You don't see any reason to rearrange the furniture."
Instead of putting something on the high-backed armchair, say "You aren't comfortable leaving your things in this place."
Instead of inserting something into the high-backed armchair, say "You aren't comfortable leaving your things in this place."

The dreary stationery is scenery on the rosewood desk. The indefinite article is "some".
The description is "A pen and inkpot have been set out, as though Doctor Arturus had been planning to write something."
Understand "pen" or "inkpot" as the dreary stationery.
Instead of looking under the dreary stationery, say "The stationery is on the rosewood desk."
Instead of taking the dreary stationery, say "You don't need either a pen or an inkpot."

Some never-finished drafts are scenery on the rosewood desk.
The description is "You guess that these were addressed to Doctor Arturus's friends once. But the ink has dried on unfinished sentences, leaving the drafts cryptic, without resolution."
The scent is "The paper is old."
Understand "draft" or "never" or "finished/unfinished" or "ink" or "sentence/sentences" as the never-finished drafts.
Instead of looking under the never-finished drafts, say "The drafts are on the rosewood desk."
Instead of searching or taking the never-finished drafts, say "You skim through the drafts, but none of them appear to be relevant to the investigation."

Chapter 3.31.2.1 - Correspondence Machine

Section 3.31.2.1.1 - The Machine

The correspondence machine is scenery on the rosewood desk.
The description is "A complex alchemical-mechanical device which is labelled as a correspondence machine. It purports to receive and transmit messages through the aether without the need for magical training.

The machine consists of a dial, a keyboard, a feed wheel, and a letterpress. Next to the dial, there are three indicator lamps, of which the first and second are lit."
The scent is "It smells... aetheric, for lack of a better word."
The sound is "It isn't making any sound at the moment."
Understand "device" or "bolt/bolts/bolted" as the correspondence machine.
Instead of searching the correspondence machine, say "The machine consists of a dial, a keyboard, a feed wheel, and a letterpress."
Instead of taking, turning, pushing, pulling, or looking under the correspondence machine, say "The machine is bolted to the desk."
Instead of inserting something into the correspondence machine, say "You'll have to specify which part of the correspondence machine you mean."
Instead of putting something on the correspondence machine, say "You'll have to specify which part of the correspondence machine you mean."
Instead of setting the correspondence machine to, say "You'll have to be more specific about how you plan to accomplish that."
Instead of switching on or switching off the correspondence machine, say "You don't see a switch anywhere."

Section 3.31.2.1.1 - Channel Selection Dial

The channel selection dial is a thing part of the correspondence machine.
The description is "It looks as though this machine operates on one of three predefined frequencies. You could set the dial to channel 1, 2, or 3.

The dial is currently set to channel [selected correspondence channel]."
Understand "channels" as the channel selection dial.

Instead of pushing, pulling, squeezing, taking, opening, or closing the channel selection dial, say "You could set the dial to channel 1, 2, or 3."

The selected correspondence channel is a number that varies. The selected correspondence channel is 3.

Instead of turning the channel selection dial:
	if the selected correspondence channel is 3:
		set the correspondence channel to 1;
	otherwise:
		set the correspondence channel to the selected correspondence channel + 1.
		
Instead of setting the channel selection dial to "[a number]":
	set the correspondence channel to the number understood.
		
Instead of setting the channel selection dial to "channel [number]":
	set the correspondence channel to the number understood.

Last instead of setting the channel selection dial to something:
	say "The dial only goes from 1 to 3."

To set the correspondence channel to (proposed setting - a number):
	if the proposed setting is less than 1 or the proposed setting is greater than 3:
		say "The dial only goes from 1 to 3.";
	otherwise:
		say "You set the dial to channel [proposed setting].";
		now the selected correspondence channel is the proposed setting.

Section 3.31.2.1.2 - Keyboard

The keyboard is a thing part of the correspondence machine.
The description is "A piano-style keyboard with letters and numbers printed on the keys. Unfortunately, it doesn't appear to be working. Only the playback key at the end of the keyboard is functional."
Understand "board" or "key board" as the keyboard.
Instead of searching the keyboard, say "It looks like the [']send['] and [']receive['] keys are still functional."
Before pushing or touching the keyboard, try pushing the alphanumeric keys instead.

Some alphanumeric keys are part of the keyboard.
The description is "None of the alphanumeric keys are working."
Understand "letter/letters" or "number/numbers" or "printed" or "a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/q/r/s/t/u/v/w/x/y/z/0/1/2/3/4/5/6/7/8/9 key" or "key" as the alphanumeric keys.
Instead of pushing or touching the alphanumeric keys, say "You press a few of the alphanumeric keys, but none of them are working. Only the playback key appears to be functional."

The playback key is part of the keyboard.
The description is "The key is labeled with a triangular sigil of recall. Presumably, pressing it will play back messages."
Understand "sigil of/--" or "recall" or "play" or "back" or "triangle/triangular" as the playback key.

Instead of pushing or touching the playback key (this is the playback key functionality rule):
	say "The ";
	if the selected correspondence channel is:
		-- 1:
			say "first";
		-- 2:
			say "second";
		-- 3:
			say "third";
	say " lamp starts blinking, and the feed wheel begins to spin. ";
	if the ticker-tape reel is not in the feed wheel:
		say "But after a moment, the wheel makes a hollow clacking noise, and the machine stops as quickly as it started.";
	otherwise:
		if the selected correspondence channel is:
			-- 1:
				say "The ticker tape is rapidly run through the letterpress, which punches out the following message:[paragraph break]";
				say "[fixed letter spacing]RAVEN REMINDS TO SETTLE DEBT SOON[variable letter spacing][line break]";
				if clue-arturus-debt is false:
					say line break;
					wait for any key;
					say "Debt? Was Doctor Arturus in debt? And the raven -- ";
					if clue-tradingcompany is true:
						say "does that mean the Greater Corindia Trading Company was involved, too?";
					otherwise:
						say "who or what could that be referring to?[paragraph break][wait for any key]You'll have to ask around and see if someone knows something.";
						unlock raven questions;
					now clue-arturus-debt is true;
					now the enabled of justinian-4inv-debt is true;
			-- 2:
				say "The ticker tape is rapidly run through the letterpress, which punches out the following message:[paragraph break]";
				say "[fixed letter spacing]ENCOUNTERED DANGEROUS UNKNOWN DISEASE SYMPTOMS BLACK BLOOD RESPIRATORY ATTACKS COME DOWN ASAP RGDS CAVALA[variable letter spacing][line break]";
			-- 3:
				say "The ticker tape is rapidly run through the letterpress. But it emerges blank on the other side, and the machine eventually stops and spins back the unpunched ticker tape.";

Section 3.31.2.1.3 - Feed Wheel

The feed wheel is an open unopenable container part of the correspondence machine.
Instead of examining the feed wheel, say "A revolving wheel with a track on the outer rim. [if the ticker-tape reel is in the feed wheel]It's been freshly stocked with ticker tape[otherwise]It looks like something long and flat is meant to be placed inside[end if]."
Instead of turning, pushing, pulling, touching, or swinging the feed wheel, say "The wheel spins [if the ticker-tape reel is in the feed wheel]merrily[otherwise]hollowly[end if]."
Instead of inserting something that is not the ticker-tape reel into the feed wheel, say "That won't fit in the feed wheel."
Instead of putting something that is not the ticker-tape reel on the feed wheel, say "That won't fit in the feed wheel."

Section 3.31.2.1.4 - Letterpress

The letterpress is a thing part of the correspondence machine.
The description is "A grid of metal punches, each cast in the shape of a letter or number. They are mounted on a crankshaft that allows them to rapidly piston up and down."
Understand "letter press" or "press" or "punch/punches" or "metal" or "crankshaft/mechanism" as the letterpress.
Instead of pushing, pulling, or turning the letterpress, say "You'd better not. You might break the mechanism."
Instead of touching the letterpress, say "The punches are surprisingly sharp."

Section 3.31.2.1.5 - Lamps

Some indicator lamps are a fixed in place thing part of the correspondence machine.
The description is "Each of the lamps seems to be associated with one of the channels on the dial.

Currently, the first and second indicator lamps are lit."
Understand "lamp" or "indicators" or "first/second/third" or "lit" or "three" or "of" or "channel/channels" as the indicator lamps.
Instead of switching on or switching off the indicator lamps, say "You don't see a switch anywhere."

Section 3.31.2.1.6 - Ticker Tape

The box of ticker-tape reels is an open unopenable scenery container on the rosewood desk.
The scent is "It's papery."
Understand "ticker" or "tape" or "reel" as the box of ticker-tape reels.
Instead of examining the box of ticker-tape reels, say "You could take a reel if you wanted."
Instead of searching the box of ticker-tape reels, say "It contains a great quantity of ticker tape."
Instead of inserting something that is not the ticker-tape reel into the box of ticker-tape reels, say "The box is for ticker tape."
Instead of taking the box of ticker-tape reels (this is the taking reels rule):
	if the ticker-tape reel is nowhere:
		say "You fish out a reel of ticker tape.";
		now the ticker-tape reel is carried by the player;
	otherwise:
		say "You already have a reel of ticker tape.";

The ticker-tape reel is an undescribed thing.
The description is "A thin paper strip. You took it from the box beside the correspondence machine."
The scent is "It smells of paper."
Understand "ticker" or "tape" or "thin" or "paper" or "strip" as the ticker-tape reel.
Instead of looking under the ticker-tape reel, say "[if the ticker-tape reel is in the feed wheel]It's mounted in the feed wheel[otherwise]It's blank on both sides[end if]."

Does the player mean doing something with the ticker-tape reel when the location is Arturus's Study: it is likely.

Instead of dropping the ticker-tape reel:
	if the location is in Outdoors:
		say "The ticker tape flutters away in the wind.";
		now the ticker-tape reel is nowhere;
	otherwise:
		say "You shouldn't leave the ticker tape lying around here."

Instead of attacking or cutting the ticker-tape reel:
	say "You tear up the ticker-tape reel, destroying it.";
	now the ticker-tape reel is nowhere.

Instead of inserting the ticker-tape reel into something:
	if the second noun is the box of ticker-tape reels:
		say "You return the reel to the box.";
		now the ticker-tape reel is nowhere;
	otherwise if the second noun is the feed wheel:
		say "You thread the ticker tape into the feed wheel, which it fits perfectly.";
		now the ticker-tape reel is on the feed wheel;
	otherwise:
		say "You shouldn't leave the ticker tape lying around here."
		
Before putting the ticker-tape reel on the feed wheel, try inserting the ticker-tape reel into the feed wheel instead.

After taking the ticker-tape reel when the ticker-tape reel is in the feed wheel:
	say "You pull the ticker tape out of the feed wheel."

Part 3.31.3 - Storage Cabinet

The storage cabinet is a closed openable scenery container in Arturus's Study.
Understand "casework" as the storage cabinet.

Instead of examining the storage cabinet, say "Silver-inlaid casework. The cabinet is [if the storage cabinet is open and the storage cabinet encloses a patient-record file]open, revealing [the list of patient-record files enclosed by the storage cabinet], as well as a stack of miscellaneous patient records[otherwise if the storage cabinet is open]open, revealing [a stack of miscellaneous patient records][otherwise]currently closed[end if]."
Instead of taking, pushing, pulling, or turning the storage cabinet, say "You don't see any reason to rearrange the furniture."
Instead of looking under the storage cabinet, say "Nothing is under the cabinet."
After opening the storage cabinet, say "You open the storage cabinet, revealing [if the storage cabinet encloses a patient-record file][the list of patient-record files enclosed by the storage cabinet], as well as a stack of miscellaneous patient records[otherwise][a stack of miscellaneous patient records][end if]."

The stack of miscellaneous patient records is an open unopenable container in the storage cabinet.
The printed name is "stack of leatherbound files".
Instead of examining or searching the stack of miscellaneous patient records, say "The rest of the files don't look to be relevant to the investigation."
The scent is "Musty."
Understand "record" as the stack of miscellaneous patient records.
Understand "file/files" or "record" or "leatherbound" as the stack of miscellaneous patient records when the printed name of the stack of miscellaneous patient records is "stack of leatherbound files".

Instead of examining or searching the stack of miscellaneous patient records when the printed name of the stack of miscellaneous patient records is "stack of leatherbound files":
	say "Upon closer examination, they appear to be patient records. The three most recently updated files are labeled [']Nacarat,['] [']Salio,['] and [']Piper.['][line break]";
	now the enabled of justinian-4inv-patientrecords is false;
	now the enabled of justinian-4inv-patientrecords2 is false;
	now the printed name of the stack of miscellaneous patient records is "stack of patient records";
	now the Piper file is in the stack of miscellaneous patient records;
	now the Salio file is in the stack of miscellaneous patient records;
	now the Nacarat file is in the stack of miscellaneous patient records.
	
Instead of taking the stack of miscellaneous patient records when the printed name of the stack of miscellaneous patient records is "stack of leatherbound files":
	say "Upon closer examination, they appear to be patient records. You take the three most recently updated files, which are labeled [']Nacarat,['] [']Salio,['] and [']Piper.['][line break]";
	now the enabled of justinian-4inv-patientrecords is false;
	now the enabled of justinian-4inv-patientrecords2 is false;
	now the printed name of the stack of miscellaneous patient records is "stack of patient records";
	now the Piper file is carried by the player;
	now the Salio file is carried by the player;
	now the Nacarat file is carried by the player.
	
Instead of searching or looking under the stack of miscellaneous patient records, say "Nothing else in the cabinet appears to be relevant."
Instead of taking the stack of miscellaneous patient records, say "You don't need these other files."
Instead of inserting something into the stack of miscellaneous patient records:
	if the noun is a patient-record file:
		continue the action;
	otherwise:
		say "That doesn't belong there."
		
Does the player mean doing something with the stack of miscellaneous patient records: it is unlikely.

Before going south in Arturus's Study (this is the restoring the storage cabinet before leaving rule):
	let L be a list of texts;
	if the player carries a patient-record file:
		if the number of patient-record files carried by the player is 1:
			add "replacing the file" to L;
		otherwise:
			add "replacing the files" to L;
		now all patient-record files carried by the player are in the stack of miscellaneous patient records;
	if the storage cabinet is open:
		add "closing the storage cabinet" to L;
		try silently closing the storage cabinet;
	say "(first [L])[command clarification break]";

Chapter 3.31.3.1 - Patient Record Files

A patient-record file is a kind of thing.
	
The Nacarat file is a patient-record file.
The printed name is "[']Nacarat['] file". The indefinite article is "the".
The description is "[if Meeting the Patients has ended]The patient record for Creditor Nacarat[otherwise]This file must be on one of the patients downstairs[end if]. It states that he developed nausea and vomiting during an afternoon visit on Third of Aquaria, and was immediately admitted -- but the handwriting is rushed, and the rest of the file is blank."
The scent is "It smells papery."
Understand "patient" or "record" or "nacarat's" or "creditor/creditor's" as the Nacarat file.

The Salio file is a patient-record file.
The printed name is "[']Salio['] file". The indefinite article is "the".
The description is "[if Meeting the Patients has ended]The patient record for Sal[otherwise]This file must be on one of the patients downstairs[end if]. It states that he was admitted together with [if Meeting the Patients has ended]Piper[otherwise]another patient[end if] on the morning of the Third of Aquaria, complaining of migraines, nausea, and vomiting. Doctor Arturus initially diagnosed food poisoning, but the diagnosis has been scratched out. The rest of the file is blank."
The scent is "It smells papery."
Understand "patient" or "record" or "sal/sal's/salio's" as the Salio file.

The Piper file is a patient-record file.
The printed name is "[']Piper['] file". The indefinite article is "the".
The description is "[if Meeting the Patients has ended]The patient record for Piper[otherwise]This file must be on one of the patients downstairs[end if]. It states that she was admitted together with [if Meeting the Patients has ended]Sal[otherwise]another patient[end if] on the morning of the Third of Aquaria, exhibiting the same symptoms as him. The rest of the file is blank apart from a cryptic note that reads 'cellar in f.h. shanty quarter.'"
The scent is "It smells papery."
Understand "patient" or "record" or "piper's" as the Piper file.

Check dropping a patient-record file:
	say "You shouldn't leave the file lying around." instead.
	
Check putting a patient-record file on:
	say "You shouldn't leave the file lying around." instead.
	
Check inserting a patient-record file into:
	say "You shouldn't leave the file lying around." instead.
	
Before inserting a patient-record file (called the relevant file) into the storage cabinet, try inserting the relevant file into the stack of miscellaneous patient records instead.
Before putting a patient-record file (called the relevant file) on the storage cabinet, try inserting the relevant file into the stack of miscellaneous patient records instead.
Before putting a patient-record file (called the relevant file) on the stack of miscellaneous patient records, try inserting the relevant file into the stack of miscellaneous patient records instead.

Instead of inserting a patient-record file (called the relevant file) into the stack of miscellaneous patient records:
	say "You return the file to the storage cabinet.";
	now the relevant file is in the stack of miscellaneous patient records.
	
A patient-record file can be meticulously digested or callously left unread.
After examining a patient-record file (called the relevant file):
	now the relevant file is meticulously digested;
	if the relevant file is the Piper file:
		now the enabled of landlord-d2-cellar is true;
	if all patient-record files are meticulously digested and clue-patientrecords is false:
		now clue-patientrecords is true;
		say "It's frustrating. All of these files look like they were written in a hurry and left unfinished. Why didn't Doctor Arturus leave more information for you to work with?[paragraph break]";
		wait for any key;
		say "You suppose you'll have to follow up on that cryptic note in the [']Piper['] file. It's the only lead you've found here.";


Book 3.32 - Zoiro's Residence (Zoiro's House)

[I call this Zoiro's Residence internally because I don't want to name clash with the front door or something by accident. In retrospect this has been a sequence of pretty dumb naming decisions.]

Zoiro's Residence is a proper-named room. "The shutters have been drawn in this tiny cottage, cloaking its confines in somber shades. In the shadows glimmer vases, knick-knacks, and wishing-eyes; the furniture is small and faintly unreal.

The front door squats to the east."
The printed name is "Zoiro's House".
Understand "zoiro" or "house" as Zoiro's Residence.

The simple-name is "Zoiro's house".
The sound is "It's quiet, apart from the occasional grunt from Zoiro."
The scent is "There is the inexplicable scent of fritters."
The exit reminder is "The exit is to the east."

Before examining east in Zoiro's Residence, try examining the front door of Zoiro's house instead.
Before examining outside in Zoiro's Residence, try examining the front door of Zoiro's house instead.
Before going outside in Zoiro's Residence, try going east instead.

Part 3.32.1 - Scenery

Some somber shutters are scenery in Zoiro's Residence.
The description is "Light filters through the shutters in uneasy, broken streams."
Understand "shutter" or "shade/shades" as the somber shutters.
Instead of closing the somber shutters, say "The shutters are already drawn."
Instead of opening, pushing, or pulling the somber shutters, say "The shutters were drawn for a reason. You have the feeling it would be very rude to open them."
Instead of searching or looking under the somber shutters, say "It's hard to see anything through the slits."

Some tiny cottage confines are scenery in Zoiro's Residence.
The description is "There's enough room for you to stand, at least."
Understand "confine" as the tiny cottage confines.
Before listening to or smelling the tiny cottage confines, now the noun is the location.
Before inserting something into the tiny cottage confines, try dropping the noun instead.
Before putting something on the tiny cottage confines, try dropping the noun instead.
Before removing something from the tiny cottage confines, try taking the noun instead.
Instead of entering the tiny cottage confines, say "You're standing in it."
Instead of searching the tiny cottage confines, say "You find nothing of interest apart from what you've already seen."

Some ornamental vases are scenery in Zoiro's Residence.
The description is "Ornamental chalices and amphorae."
Understand "vase" or "chalice/chalices" or "amphora/amphorae" as the ornamental vases.
Instead of attacking the ornamental vases, say "That would be both unnecessary and cruel."
Instead of inserting something into the ornamental vases, say "That would be excessively rude. Besides, you'd never get [regarding the noun][them] out again."
Instead of searching the ornamental vases, say "The vases contain nothing but dust."

Some unidentifiable knick-knacks are scenery in Zoiro's Residence.
The description is  "Bric-a-brac, whim-whams, folderol..."
Understand "bric-a-brac" or "folderol/folderols" or "knick" or "knick-knack/knack/knacks" or "whim-wham/whim-whams" as the unidentifiable knick-knacks.

Some wishing-eyes are scenery in Zoiro's Residence.
The description is "Baubles of colorful cloth and shiny stones, made to be strung up and displayed. It's a goblin tradition to give them as gifts."
Understand  "bauble/baubles" or "wishing" or "eye/eyes/wishing-eye" or "colorful/colourful" or "cloth" or "shiny" or "stone/stones" as the wishing-eyes.

Some faintly unreal furniture is scenery in Zoiro's Residence.
The description is "It reminds you quite a bit of dollhouse furniture."
Understand "small and/--" or "dollhouse/doll-house" or "table/tables" or "chair/chairs" or "tableware" or "day-to-day" or "necessity/necessities" as the faintly unreal furniture.
Instead of taking, pushing, pulling, or turning the faintly unreal furniture, say "You don't think you should rearrange the furniture. Even if it [italic type]does[roman type] remind you of dollhouse furniture."
Instead of entering the faintly unreal furniture, say "The tables and chairs are too small for you."
Instead of searching the faintly unreal furniture, say "Just the usual tableware and other day-to-day necessities."

Part 3.32.2 - Zoiro's Residence during Day Two

Chapter 3.32.2.1 - Zoiro

Zoiro is a goblin man in Zoiro's Residence. "Zoiro is here, [one of]looking quite unlike the last time you saw him at the Riggertown Mechanistry. He is dressed in a deep black cassock and lighting beeswax candles around the sitting room[or]lighting beeswax candles and arranging obsidian beads[stopping]."
The description is "An air of solemnity surrounds him."
The sound is "He is quiet."
The scent is "He smells of glue."

The deep black cassock is a thing worn by Zoiro.
The description is "A garment of mourning."
Understand "garment of/--" or "mourning" as the deep black cassock.

The handheld tinderbox is a thing carried by Zoiro.
The description is "A little belligerent sparking thing."

Some beeswax candles are scenery in Zoiro's Residence.
The description is "They glow with eerie light."
The scent is "Scented smoke."
Understand "candle" or "wax" as the beeswax candles.
Instead of burning the beeswax candles, say "Zoiro is already doing that."
Instead of extinguishing, pushing, pulling, squeezing, taking, or turning the beeswax candles, say "That wouldn't be polite."
Instead of rubbing or touching the beeswax candles, say "You don't want to."

Some obsidian beads are scenery in Zoiro's Residence.
The description is "Little black beads placed in asymmetric patterns."
Understand "bead" or "little" or "black" or "pattern/patterns" as the obsidian beads.
Instead of pushing, pulling, taking, or turning the obsidian beads, say "You don't think you should disturb the beads."

Section 3.32.2.1.1 - Zoiro Mourning Dialogue

Some dialogue branches are defined by the Table of Zoiro Mourning Dialogue.

Table of Zoiro Mourning Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
zoiro-mourning-home	true	false	""	"'Zoiro,' you say. 'Hello.'

The goblin pauses mid-motion. He inclines his head respectfully.

'Hello,' he says. 'Marid.'

[wait for any key]He turns around, shuffling his feet on the floor.

'Sorry about the mess. I wasn't expecting a visit so early.'"	{zoiro-mourning-itsok, zoiro-mourning-sorryinterrupt, zoiro-mourning-whatdoing, zoiro-mourning-aboutreden}
zoiro-mourning-itsok	true	true	"'It's okay.'"	"'It's okay.'

'Um.' He waves his tinderbox. 'I'd ask you to have a seat, but I don't think I have any human-sized furniture. Do you... do you want to sit on the table? Or...'

'It's fine,' you tell him. 'Really.'"	{zoiro-mourning-sorryinterrupt, zoiro-mourning-whatdoing, zoiro-mourning-aboutreden}
zoiro-mourning-sorryinterrupt	true	true	"'I didn't mean to interrupt.'"	"'I didn't mean to interrupt.'

'Don't worry about it,' he replies. 'It's nothing all that urgent. What's on your mind?'"	{zoiro-mourning-whatdoing, zoiro-mourning-aboutreden}
zoiro-mourning-whatdoing	true	true	"'What are you doing?'"	"'What are you doing?'

'This?' Zoiro holds up his tinderbox. 'Ah... it's a tradition in my clan. A ritual of mourning -- of remembering.'

'A ritual?'

He looks down. 'I know,' he says. 'I know. It's complete, rank superstition. Total hogwash. But... it feels right. Like something I have to do, you know?'

'...I know what you mean.'"	{zoiro-mourning-sorryinterrupt, zoiro-mourning-aboutreden}

The home dialogue branch of Zoiro is zoiro-mourning-home.

Section 3.32.2.1.2 - Zoiro Mourning Dialogue, Branching Investigative Section

[In this little specimen of spaghetti code, Marid asks Zoiro about various topics, which lead to new potential topics. What happens here is that all of the dialogue branches have every possible choice, but the 'enabled' property is only turned on for the branches once they have been unlocked.

We use the 'one-shot' property to see which branches have already been unlocked before so we don't unlock them again: false means they haven't been unlocked by the player, true means they have.

The starting branch is aboutreden, which branches to:
	-werentclose
	-placesfrequented
	-associations
	
From these we get the following:
	-unemployed
	-heleft
	-drinker
	
And finally the following critical clues:
	-channelworks
	-pub
	-redenshack
	
Once Marid has asked all of the final three, we unlock the final dialogue branch, which is alldone.]

Table of Zoiro Mourning Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
zoiro-mourning-aboutreden	true	false	"'I wanted to ask you some things about Reden...'"	"'I wanted to ask you some things about Reden,' you say. 'We're looking into the transmission vector of the disease -- trying to find out how he could have contracted it. If you could tell us about the places he'd been, or what he'd been doing...'

Zoiro's shoulders slump.

'Yeah,' he says. 'Reden.'

[wait for any key]He shuffles over to an armchair and sits with a sigh. He fidgets with the tinderbox in his hands.

'I suppose I can help. I don't know how much use I'll be, though... practically cut off contact with him before he died.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations}
zoiro-mourning-werentclose	true	true	"'You weren't close to him?'"	"'You weren't close to him?'

'No.'  Zoiro closes his eyes. 'Primes, no. He was a dead weight, always cadging, borrowing money.'

He turns over the box in his hands.

'I hated him. When he walked out the door and never came back, well... I can't say I was sorry to see him go.'"	{zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-placesfrequented	true	true	"'Do you know anything about the places he frequented?'"	"'Do you know anything about the places he frequented?'

Zoiro shakes his head. 'No... not really, no. He was hardly around the house... he'd go out in the morning and come back late, smelling of shitty booze. Some days he was like someone I didn't know.

'I never asked him where he was going. Don't think I cared. When he left... I don't know what happened to him afterward.'"	{zoiro-mourning-werentclose, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-associations	true	true	"'Do you know anyone else that Reden associated with?'"	"'Do you know anyone else that Reden associated with?'

A shake of the head. 'The only thing he associated with was alcohol. He never talked about his friends... never talked about his work. When he got fired, I wouldn't be surprised if no one even batted an eye -- he was that kind of person.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-unemployed	false	false	"'Reden was unemployed?'"	"'Reden was unemployed?'

Zoiro nods. 'He was a janitor at the Channelworks, let go for drunkenness and unprofessional conduct. He was unrepentant -- no company would have him.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-heleft	false	false	"'Reden left and didn't come back?'"	"'Reden left and didn't come back?'

Zoiro gazes at the door.

'Yeah,' he says. 'He just... left. He did it so quietly, I almost didn't realize he was gone.

'I guess he realized this place wasn't his home any more.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-drinker	false	false	"'Reden was a compulsive drinker?'"	"'Reden was a compulsive drinker?'

'The biggest dipsomaniac I ever saw.' Zoiro smiles grimly. 'He'd go through cheap wine by the bottle -- he didn't care what was in the stuff, or who sold it to him, as long as it got him buzzed.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-channelworks	false	false	"'Could you tell me more about what he did at the Channelworks?'"	"'Could you tell me more about what he did at the Channelworks?'

Zoiro shrugs. 'I've never been there myself,' he says. 'Reden wasn't one for talking about his work. It wasn't anything important... he was just a janitor, some kind of canal scrubber or something. I remember he always came back smelling like a wet rag...'

It occurs to you that there was a dampness about Reden on the night he died. It didn't register to you at the time, but... it wasn't raining that day, was it?"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-pub, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-pub	false	false	"'Could there have been a public house he especially frequented?'"	"'Could there have been a public house he especially frequented?' you ask.

Zoiro frowns, and his ears stiffen.

'There could have,' he says, 'now that you mention it. Something about a bird's nest... they sell the cheapest booze in the district, or so Reden used to say. I can't quite remember the name, though.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-redenshack, zoiro-mourning-alldone}
zoiro-mourning-redenshack	false	false	"'Do you know where he could have gone after he left?'"	"'Do you know where he could have gone after he left?'

Zoiro rubs his chin. 'Actually... I did see him once or twice after he left. Or someone who looked a great deal like him. It was around the shacks in Lower Riggertown...'

[if Reden's Shack is visited]'I think I know the place you're talking about,' you say.

Zoiro shrugs. 'Then you already know more than I do. I suppose that's where he stayed after he left here.'[otherwise]'Do you think he might have found someplace to stay?' you ask.

Zoiro shrugs. 'It couldn't hurt to take a look.'"	{zoiro-mourning-werentclose, zoiro-mourning-placesfrequented, zoiro-mourning-associations, zoiro-mourning-unemployed, zoiro-mourning-heleft, zoiro-mourning-drinker, zoiro-mourning-channelworks, zoiro-mourning-pub, zoiro-mourning-alldone}
zoiro-mourning-alldone	false	false	"'That's all the questions I have regarding Reden...'"	"'That's all the questions I have regarding Reden,' you say. 'You've been a great help.'

Zoiro nods. 'If I can help you with anything else, let me know.'

'I will.'

[wait for any key]As Zoiro returns to his work, you step back and mull over what he's told you. Reden's connection to the Channelworks... [if clue-crowsnest is true]the public house called the Crow's Nest[otherwise]a public house involving a [']bird's nest['][end if]... [if Reden's Shack is visited]a place in Lower Riggertown Reden might have stayed[otherwise]Reden's shack in Lower Riggertown[end if].

[wait for any key]Does it mean anything? How much of it is relevant?

[wait for any key]You suppose you'll just have to keep investigating.[line break][look pending]"	{}

After reading out zoiro-mourning-werentclose:
	if the one-shot of zoiro-mourning-unemployed is false:
		now the enabled of zoiro-mourning-unemployed is true;
		now the one-shot of zoiro-mourning-unemployed is true;
	if the one-shot of zoiro-mourning-heleft is false:
		now the enabled of zoiro-mourning-heleft is true;
		now the one-shot of zoiro-mourning-heleft is true;
		
After reading out zoiro-mourning-placesfrequented:
	if the one-shot of zoiro-mourning-drinker is false:
		now the enabled of zoiro-mourning-drinker is true;
		now the one-shot of zoiro-mourning-drinker is true;
	if the one-shot of zoiro-mourning-heleft is false:
		now the enabled of zoiro-mourning-heleft is true;
		now the one-shot of zoiro-mourning-heleft is true;
		
After reading out zoiro-mourning-associations:
	if the one-shot of zoiro-mourning-unemployed is false:
		now the enabled of zoiro-mourning-unemployed is true;
		now the one-shot of zoiro-mourning-unemployed is true;
	if the one-shot of zoiro-mourning-drinker is false:
		now the enabled of zoiro-mourning-drinker is true;
		now the one-shot of zoiro-mourning-drinker is true;
		
After reading out zoiro-mourning-unemployed:
	if the one-shot of zoiro-mourning-channelworks is false:
		now the enabled of zoiro-mourning-channelworks is true;
		now the one-shot of zoiro-mourning-channelworks is true;
		
After reading out zoiro-mourning-heleft:
	if the one-shot of zoiro-mourning-redenshack is false:
		now the enabled of zoiro-mourning-redenshack is true;
		now the one-shot of zoiro-mourning-redenshack is true;
		
After reading out zoiro-mourning-drinker:
	if the one-shot of zoiro-mourning-pub is false:
		now the enabled of zoiro-mourning-pub is true;
		now the one-shot of zoiro-mourning-pub is true;
		
After reading out zoiro-mourning-channelworks:
	now clue-reden-channelworks is true;
	check for Zoiro mourning dialogue completion.
		
After reading out zoiro-mourning-pub:
	now clue-reden-zoironest is true;
	check for Zoiro mourning dialogue completion.
		
After reading out zoiro-mourning-redenshack:
	now clue-reden-shack is true;
	check for Zoiro mourning dialogue completion.
	
To check for Zoiro mourning dialogue completion:
	if the enabled of zoiro-mourning-channelworks is false and
	the one-shot of zoiro-mourning-channelworks is true and
	the enabled of zoiro-mourning-pub is false and
	the one-shot of zoiro-mourning-pub is true and
	the enabled of zoiro-mourning-redenshack is false and
	the one-shot of zoiro-mourning-redenshack is true:
		now the enabled of zoiro-mourning-alldone is true.

Section 3.32.2.1.2 - Zoiro Mourning Dialogue, Post Investigative Section

zoiro-mourning-raven-quipped is a truth state that varies.
Instead of talking to Zoiro when Day Two is happening and the enabled of zoiro-mourning-alldone is true:
	if clue-raven is true and clue-tradingcompany is false and zoiro-mourning-raven-quipped is false:
		say "'By the way,' you say, 'does a raven mean anything to you?'

Zoiro shrugs. 'I can't say that it does.'

'Oh.'";
		now zoiro-mourning-raven-quipped is true;
	otherwise:
		say "You can't think of anything else to ask him about."

Book 3.33 - Rats' Run

Rats' Run is a proper-named room. "The Bilious Canal's runoff rises. It swallows these buildings and alleys in dark writhing water. Unsteady plank bridges run between the few islands of dry stone; hollow-eyed residents crowd around what lanterns pierce the gloom.

A sewage pipe spews outflow from the north. Above, rope ladders climb to the rest of the Shanty Quarter."
It is below the Shanty Quarter.
Understand "rats" or "pits" as Rats' Run.

The sound is "The air is stale, deadened by water."
The scent is "The canal reeks."
The exit reminder is "You can go up to the rest of the Shanty Quarter."

Before examining down in Rats' Run, try examining the Bilious Canal's runoff instead.
Before examining north in Rats' Run, try examining the sewage pipe instead.
Instead of examining up in Rats' Run, say "Crumbling buildings crowd out the sky."
Before going inside in Rats' Run, try going north instead.
Before going down in Rats' Run, try swimming instead.

Part 3.33.1 - Scenery

The mist, the slum-dwellers, and the Bilious Canal's runoff are in Rats' Run.

Some unsteady plank bridges are scenery in Rats' Run.
The description is "They creak and bend with every step."
The sound is "[italic type]Creak[roman type]."
Understand "bridge" as the unsteady plank bridges.
Instead of entering the unsteady plank bridges, say "You're already trying not to think about the way the bridges creak underfoot."
Instead of looking under the unsteady plank bridges, say "Beneath the bridges, the Bilious Canal swims like a predator."
Instead of pushing, pulling, rubbing, taking, touching, or turning the unsteady plank bridges, say "One wrong move could dislodge the bridges. You shouldn't touch them any more than you absolutely have to."

Some few islands of dry stone are scenery in Rats' Run.
The description is "Ruins, husks, collapsed remnants of the buildings that came before. They are nothing but stepping-stones now."
Understand "island" or "stepping" or "stones/stepping-stone/stepping-stones/ground" or "ruin/ruins" or "husk/husks" or "collapsed" or "remnant/remnants" or "building/buildings" or "gloom" as the few islands of dry stone.
Instead of entering the islands of dry stone, say "That's where you're standing."
Instead of searching or looking under the islands of dry stone, say "The canal has already swallowed all their secrets."
Instead of touching the islands of dry stone, say "Well, not all that dry."

Some improvised lanterns are scenery in Rats' Run.
The description is "Hollowed-out tins of phlogiston; ruptured flickering animus lamps."
The scent is "Smoke and ozone."
Understand "lantern" or "tin/tins" or "of" or "phlogiston" or "animus" or "lamp/lamps" as the improvised lanterns.
Instead of burning the improvised lanterns, say "The lanterns are already lit."
Instead of extinguishing the improvised lanterns, say "You see no reason to do that."
Instead of looking under the improvised lanterns, say "Only shadows."
Instead of pushing, pulling, or turning the improvised lanterns, say "The lanterns are fixed in place."
Instead of searching the improvised lanterns, say "They're just lanterns."
Instead of taking the improvised lanterns, say "You don't need a lantern."
Instead of touching the improvised lanterns, say "You don't want to."

The sewage pipe is an open unopenable scenery door. It is north of Rats' Run and south of the Sewer Enclave.
The description is "Black water gushes from a grille of broken teeth."
The sound is "The pipe ululates."
The scent is "It smells awful."
Understand "outflow" or "grille" or "broken" or "teeth" as the sewage pipe.
Before climbing the sewage pipe, try entering the sewage pipe instead.
Instead of looking under the sewage pipe, say "Outflow pours from the sewage pipe into the water."

Some creeping rope ladders are scenery in Rats' Run.
The description is "They hang from above, knotted, rotted."
Understand "knot/knots/knotted" or "rot/rotted" or "ropes" or "ladder" as the creeping rope ladders.
Before climbing or entering the creeping rope ladders, try going up instead.
Instead of looking under the creeping rope ladders, say "The rope ladders dangle just above the ground."

Part 3.33.2 - Rats' Run during Day Two

Instead of going north in Rats' Run, say "Climb into the sewage pipe? You'd rather not."

The dismembered pigeon is a neuter creature animal in Rats' Run. "Nearby, a dismembered pigeon floats in the water."

First before doing anything when the current action involves the dismembered pigeon:
	say "You take a step closer--[paragraph break]";
	wait for any key;
	say "The pigeon's remaining eye snaps open. It twitches madly.[paragraph break]";
	wait for any key;
	say "It opens its beak as though to cry out. Tendons snap and trail free. Canal-water floods into its mouth -- it sinks bloody beneath the surface of the water --[paragraph break]";
	wait for any key;
	say "And it is gone. As though it was never there.";
	now the dismembered pigeon is nowhere;
	stop the action.
	
When Four Investigations ends (this is the despawn the dismembered pigeon rule):
	now the dismembered pigeon is nowhere.

Book 3.34 - Flophouse

There is a room called the Flophouse. "This place was once a beautiful townhouse; now it is a ruin. The walls have been stripped of their furnishings, leaving bone-white plaster and rotting wood. Vagrants sleep on the stairs or in the corridors, curled up in makeshift bedding and doped up on laudanum or alcohol.

To the west is the exit. To the south, [if cellar-access-granted is true]a trapdoor descends to the cellar[otherwise]a passageway leads to the rooms[end if]."
It is east of the Shanty Quarter.

The simple-name is "the flophouse".
The sound is "It's uncannily quiet."
The scent is "The flophouse smells of ash."
The exit reminder is "You can exit the flophouse to the west, or enter [if cellar-access-granted is true]the cellar[otherwise]the rooms[end if] to the south."

Before going inside in the Flophouse, try going south instead.
Before going outside in the Flophouse, try going west instead.
Before going down in the Flophouse when cellar-access-granted is true, try going south instead.
Before examining inside in the Flophouse, try examining south instead.
Before examining down in the Flophouse when cellar-access-granted is true, try examining south instead.
Before examining outside in the Flophouse, try examining west instead.
Instead of examining west in the Flophouse, say "The exit is that way."
Instead of examining up in the Flophouse, say "The stairs are collapsed; they don't actually lead anywhere."

Before examining south in the Flophouse:
	if cellar-access-granted is true:
		try examining the trapdoor to the cellar instead;
	otherwise:
		try examining the crooked little passageway instead.

Part 3.34.1 - Scenery

Some once-beautiful furnishings are scenery in the Flophouse.
The description is "Brass fixtures have been pried from their housing. Sigils have been vandalized beyond recognition."
Understand "beautiful" or "townhouse/house/ruin" or "wall/walls" or "bone-white/white" or "bone" or "plaster" or "rotting" or "wood" or "brass" or "fixture/fixtures" or "housing" or "sigil/sigils" as the once-beautiful furnishings.
Instead of touching the once-beautiful furnishings, say "This is a scarred, broken place."

Some homeless vagrants are an undescribed mixed-race person in the Flophouse.
The description is "They are barely cognizant of this world."
The sound is "Silence."
The scent is "They smell foul."
Understand "man/men" or "woman/women" or "vagrant" as the homeless vagrants.
Instead of setting the homeless vagrants to something, say "That doesn't make any sense."
Instead of taking the homeless vagrants, say "An impossible notion."
Instead of attacking or cutting the homeless vagrants, say "They outnumber you. You'd better not."
Instead of drinking, eating, switching on, switching off, or wearing the homeless vagrants, say "That doesn't make any sense."
Instead of giving something to the homeless vagrants, say "Misguided acts of charity won't change anything."
Instead of kissing, knocking on, pushing, pulling, rubbing, swinging, squeezing, touching, or turning the homeless vagrants, say "You don't want to."
Instead of searching the homeless vagrants, say "No one you know."
Instead of talking to or waking the homeless vagrants, say "There is no response."

Some collapsed stairs are scenery in the Flophouse.
The description is "More rubble than stairs. The steps have splintered, and the banisters are long gone."
Understand "rubble" or "stair/step/steps" or "banister/banisters/bannister/bannisters" or "splinter/splinters/splintered" as the collapsed stairs.
Instead of climbing or entering the collapsed stairs, say "The stairs are collapsed; they don't actually lead anywhere."

Some devastated corridors are scenery in the Flophouse.
The description is "Dead ends."
Understand "dead end" or "dead ends" or "corridor" as the devastated corridors.
Instead of entering the devastated corridors, say "The corridors go nowhere."

The makeshift bedding is scenery in the Flophouse. The indefinite article is "some".
The description is "Mattresses and rags."
Understand "mattress/mattresses" or "rag/rags" or "bed/beds" as the makeshift bedding.
Before entering the makeshift bedding, try sleeping instead.
Instead of looking under the makeshift bedding, say "There's nothing underneath but rubble."
Instead of searching the makeshift bedding, say "Vagrants are sleeping on the bedding."

Some empty apothecary bottles are scenery in the Flophouse.
The description is "The empty bottles here and there are unlabeled, but you can take a guess at what they once contained."
Understand "laudanum/opium/morphine" or "bottle" or "alcohol/wine" or "of" or "unlabeled" or "drug/drugs" as the empty apothecary bottles.
Instead of drinking the empty apothecary bottles, say "The bottles are empty. In any case, you're more of a spiced wine person."
Instead of inserting the endoscope into the empty apothecary bottles, say "You don't need an endoscope to see that these bottles are empty."
Instead of inserting something into the empty apothecary bottles, say "That won't accomplish anything."
Instead of searching the empty apothecary bottles, say "All are empty."
Instead of taking the empty apothecary bottles, say "You don't need these empty bottles."

The crooked little passageway is scenery.
The description is "A crooked little passageway, with flea-eaten carpeting and empty doorways. You can see a total of three rooms."
The sound is "You hear nothing."
Understand "flea-eaten" or "carpet/carpeting" or "empty" or "doorway/doorways" or "passage" or "room/rooms" or "three/3" as the crooked little passageway.
Before entering the crooked little passageway, try going south instead.
Instead of searching the crooked little passageway, say "You can't see much from here."

The flophouse reception office is scenery in the Flophouse. The printed name is "reception office".
The description is "Perhaps it was once a cloakroom, but it's some kind of office now."
Understand "cloakroom" as the flophouse reception office.
Instead of entering the flophouse reception office, say "[if the landlord is in the location]That would put you in uncomfortably close proximity with [the landlord]. You'd better just remain outside[otherwise]You stick your head in, but there's no one there[end if]."
Instead of searching the flophouse reception office, say "[if the landlord is in the location]You can't see much apart from [the landlord] and its keys[otherwise]There is no trace of the landlord[end if]."
Before inserting something into the flophouse reception office:
	if the landlord is in the location:
		try giving the noun to the landlord instead;
	otherwise:
		say "You don't really want to do that." instead.
		
The trapdoor to the cellar is a privately-named closed openable better left open lockable unlocked scenery door.
The description is "[if the trapdoor to the cellar is closed]It's closed[otherwise]It's open[end if]."
Understand "trap" or "door/doors/trapdoor" or "to/into" or "cellar" or "opening" or "ladder" or "darkness" or "half-eaten" or "descending" as the trapdoor to the cellar when cellar-access-granted is true.
Before climbing the trapdoor to the cellar, try entering the trapdoor to the cellar instead.
Instead of inserting something into the trapdoor to the cellar, say "[if the location is the Flophouse]You aren't in the habit of dropping your possessions into trapdoors[otherwise]You could just climb up if you wanted[end if]."
Instead of searching the trapdoor to the cellar, say "You can't see much."

Part 3.34.2 - Flophouse during Day Two

Chapter 3.34.2.1 - The Landlord

[This character is a reference to XS, one of the best and most twisted questmistresses I've ever encountered on /tg/.]

The landlord is a neuter mutant person in the Flophouse. "In the reception office, a nightmarish many-armed creature crouches, and pores obsessively over an assortment of keys."
The description is "There's something deeply unnatural about the way it moves. You have to look away before you get a headache."
The sound is "[The landlord] is murmuring to itself."
The scent is "There is a whiff of something oily and faintly pelagic."
Understand "many-armed/armed/arm/arms" or "many" or "nightmarish" or "creature" as the landlord.
Instead of attacking, cutting, or pushing the landlord, say "You don't think that would be a good idea."

landlord-title-known is a truth state that varies.
Rule for printing the name of the landlord when landlord-title-known is false: say "creature".

The assortment of keys is a thing carried by the landlord.
The description is "Crudely fashioned keys, jangling together on loops of wire."
Understand "key" or "assorted" or "crude/crudely" or "fashioned" or "loop/loops" or "wire" as the assortment of keys.
Instead of searching the assortment of keys, say "You can't see much while it's moving the keys around."
Instead of taking the assortment of keys, say "You don't think [the landlord] would appreciate that."

Does the player mean examining the assortment of keys: it is likely. [As opposed to Sal's battered keyring.]

Before giving the battered keyring to the landlord, try talking to the landlord instead.
Instead of giving Doctor Cavala's signum to the landlord, say "[The landlord] doesn't even look."

Chapter 3.34.2.2 - Gating the Cellar

cellar-keygiven is a truth state that varies.
cellar-access-granted is a truth state that varies.
cellar-noaccess-quipped is a truth state that varies.

Instead of going south in the Flophouse when cellar-access-granted is false (this is the spoopy Room IV gating message rule):
	if cellar-noaccess-quipped is false:
		say "You take a step into the passageway, only to hear a screeching from behind you. A rubbery tentacle snaps tight around your foot.[paragraph break]";
		wait for any key;
		say "[italic type]'You,'[roman type] [the landlord] hisses, its voice crawling on your neck. [italic type]'Not resident. Not key-bearer. No more steps. No more. Understand?'[roman type][paragraph break]";
		wait for any key;
		say "'I-- I understand,' you stutter. 'Please don't hurt me.'[paragraph break]";
		wait for any key;
		if cellar-keygiven is true:
			say "[italic type]'Learn which room. Tell which room. Then... change, reconsider.'[roman type][paragraph break]";
		otherwise:
			say "[italic type]'Show me key. Show me key-teeth. Then... change, reconsider.'[roman type][paragraph break]";
		wait for any key;
		say "The creature withdraws. You rub your neck with a trembling hand.";
		now cellar-noaccess-quipped is true;
	otherwise:
		if cellar-keygiven is true:
			say "The landlord said that you had to tell it which room Sal's key unlocked before it would allow you to go in.";
		otherwise:
			say "[The landlord] said that you had to show it a key before it would allow you to go in.";

Chapter 3.34.2.3 - The Landlord's Introduction

Some dialogue branches are defined by the Table of Day Two Landlord Dialogue.

Table of Day Two Landlord Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
landlord-d2-intro	true	false	""	"'E-Excuse me?' you say.

The creature freezes. It rears up, bringing undulating folds of flesh to bear, and it fixes you with seven unblinking eyes.

[wait for any key][italic type]'I am,'[roman type] it says. [italic type]'Landlord.'[roman type]

[wait for any key]A clatter. It has dropped its keys -- it rushes forth like an engulfing wave. Its eyes surround you, press inward.

[wait for any key][italic type]'You are,'[roman type] it breathes. [italic type]'You are?'[roman type]"	{landlord-d2-panic, landlord-d2-pleasegetaway, landlord-d2-mynameis}
landlord-d2-panic	true	true	"<Panic.>"	"Okay, now you're panicking."	{landlord-d2-pleasegetaway, landlord-d2-mynameis}
landlord-d2-pleasegetaway	true	true	"'Please get away from me.'"	"'Please get away from me.'

The landlord blinks with all seven of its eyes. It shifts back slightly.

[italic type]'Rude.'[roman type]"	{landlord-d2-panic, landlord-d2-sorryforgetaway, landlord-d2-mynameis}
landlord-d2-sorryforgetaway	true	true	"'...Sorry. It's just...'"	"'...Sorry,' you append. 'It... it's just...'

The landlord watches you, expressionless.

'Um.'"	{landlord-d2-panic, landlord-d2-mynameis}
landlord-d2-mynameis	true	false	"'My name is Marid. Servator Marid Orpheia.'"	"'M-My name is Marid,' you stutter. 'Serva... Servator Marid Orpheia.'

[italic type]'Hmmmmmm.'[roman type]

The creature lowers itself close. It inspects your neck. A wriggling presence touches your hair, your ear.

[wait for any key]Then it withdraws, and collects its keys from the floor.

[italic type]'You are not resident,'[roman type] it says, in a tone that sounds almost disappointed. [italic type]'You are not[roman type] key-bearer.'"	{landlord-d2-noimnot, landlord-d2-resident, landlord-d2-keybearer, landlord-d2-operate, landlord-d2-actuallyihavekey, landlord-d2-okgoingnow}
landlord-d2-noimnot	true	false	"'No. I'm not.'"	"'No. I'm not.'

The landlord blinks, very slowly, and seems to droop.

[italic type]'Sad.'[roman type]"	{landlord-d2-resident, landlord-d2-keybearer, landlord-d2-operate, landlord-d2-actuallyihavekey, landlord-d2-okgoingnow}
landlord-d2-resident	true	true	"'Who are the residents?'"	"'Who are the residents?'

The landlord inhales wetly. It peers blinking at the rooms, and gesticulates with its tentacles.

[italic type]'They are residents. Live in flophouse. Key-bearers. They sleep, grow.'[roman type]

'Can you tell me who they are?' you ask.

[italic type]'Many residents. Come and go. You wish to know? Landlord will not tell. Secret.'[roman type]"	{landlord-d2-keybearer, landlord-d2-operate, landlord-d2-seerooms, landlord-d2-imkeybearer, landlord-d2-comebacklater}
landlord-d2-keybearer	true	true	"'What's a key-bearer?'"	"'What's a key-bearer?'

The landlord licks its beak. [italic type]'Key. Key important. Bearer of key? Key-bearer. Owner of room.'[roman type]"	{landlord-d2-resident, landlord-d2-operate, landlord-d2-seerooms, landlord-d2-imkeybearer, landlord-d2-comebacklater}
landlord-d2-operate	true	true	"'You operate this establishment?'"	"'You operate this establishment?'

The creature looks at you very intently.

[italic type]'Landlord is landlord,'[roman type] it says. [italic type]'Landlord.'[roman type]"	{landlord-d2-landlord, landlord-d2-resident, landlord-d2-keybearer, landlord-d2-seerooms, landlord-d2-imkeybearer, landlord-d2-comebacklater}
landlord-d2-landlord	true	true	"'Landlord?'"	"'Landlord?'

[italic type]'Landlord.'[roman type]

'Landlord...'

[italic type]'Landlord is landlord.'[roman type]

'...Okay.' you say. 'Okay. You're the landlord. I get the picture.'"	{landlord-d2-resident, landlord-d2-keybearer, landlord-d2-seerooms, landlord-d2-imkeybearer, landlord-d2-comebacklater}
landlord-d2-seerooms	false	true	"'I'd like to take a look at your rooms.'"	"'I'd like to take a look at your rooms.'

The creature spasms. It makes a pendulum-like motion with its foremost tentacle.

[italic type]'Cannot,'[roman type] it says. [italic type]'No room. All rooms. Occupied. Secret.'[roman type]"	{landlord-d2-makeexception, landlord-d2-resident, landlord-d2-keybearer, landlord-d2-imkeybearer, landlord-d2-comebacklater}
landlord-d2-makeexception	true	true	"'Please. I'm investigating a man's death.' <Present the signum.>"	"'Please. I'm investigating a man's death.'

The landlord brushes your signum away. [italic type]'No,'[roman type] it repeats. [italic type]'Cannot. You are not key-bearer.'[roman type]"	{landlord-d2-resident, landlord-d2-keybearer, landlord-d2-imkeybearer, landlord-d2-comebacklater}
landlord-d2-okgoingnow	true	false	"'Okay... I'll be going now.'"	"'Okay... I'll be going now.'

[italic type]'See. You soon.'[roman type]

The landlord slinks back into the reception office."	{}
landlord-d2-comebacklater	true	false	"'I'll come back later.'"	"'I'll come back later.'

[italic type]'See. You soon.'[roman type]

The landlord slinks back into the reception office."	{}
landlord-d2-nevermind	true	false	"'Sorry. Never mind.'"	"'Sorry. Never mind.'

The landlord slinks back into the reception office."	{}
landlord-d2-home	true	false	""	"'E-Excuse me?'

The landlord comes rippling out of the reception office, looking expectant."	{landlord-d2-resident, landlord-d2-keybearer, landlord-d2-operate, landlord-d2-seerooms, landlord-d2-imkeybearer, landlord-d2-nevermind}

The home dialogue branch of the landlord is landlord-d2-intro.

After reading out landlord-d2-intro:
	now landlord-title-known is true;
	redraw status line;
	now the home dialogue branch of the landlord is landlord-d2-home.

After reading out landlord-d2-operate: now the enabled of landlord-d2-seerooms is true.

Instead of talking to the landlord when cellar-keygiven is false and the enabled of landlord-d2-resident is false and the enabled of landlord-d2-keybearer is false and the enabled of landlord-d2-operate is false and the enabled of landlord-d2-seerooms is false and the enabled of landlord-d2-imkeybearer is false (this is the no more landlord dialogue before key given rule):
	say "[one of]'E-Excuse me?'

The landlord waves its tentacle dismissively. [italic type]'You are not key-bearer.'[roman type][line break][or]The landlord won't entertain anyone who doesn't have a key.[stopping]";

Chapter 3.34.2.4 - Presenting Keys

Table of Day Two Landlord Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
landlord-d2-actuallyihavekey	false	false	"'Actually, I have some keys right here.' <Present the battered keyring.>"	"'Actually, I have some keys right here.'

The landlord blinks with all its eyes. It rushes up to you, quivering, scrutinizing the keys from all directions.

[wait for any key]There is an uncomfortably long pause.

[wait for any key][italic type]'Strange,'[roman type] it says at last. [italic type]'Right key. Wrong person.'[roman type]"	{landlord-d2-explanation1, landlord-d2-explanation2, landlord-d2-explanation3}
landlord-d2-imkeybearer	false	false	"'Are you sure I'm not a key-bearer?' <Present the battered keyring.>"	"'Are you sure I'm not a key-bearer?'

You hold up the keyring. The landlord rushes up to you, quivering, scrutinizing the keys from all directions.

[wait for any key]There is an uncomfortably long pause.

[wait for any key][italic type]'Strange,'[roman type] it says at last. [italic type]'Right key. Wrong person.'[roman type]"	{landlord-d2-explanation1, landlord-d2-explanation2, landlord-d2-explanation3}
landlord-d2-explanation1	true	false	"'The owner of the keyring is dead. I'm investigating his death.'"	"'The owner of the keyring is dead. I'm investigating his death.'

The landlord's tentacles coil around your arm, cradling the keyring, and you suppress the urge to shudder.

[italic type]'Maybe,'[roman type] it says. [italic type]'Maybe you lie. Maybe you thief.'[roman type]

[wait for any key]It exhales wetly, and recedes. Saliva runs from its beak and strikes the floor with a hiss.

[italic type]'Conundrum. Compromise. You have key? Tell which room. Correct, you enter. Wrong, you leave. Yes?'[roman type]

[wait for any key]'Um...'"	{landlord-d2-answer1, landlord-d2-answer2, landlord-d2-answer3, landlord-d2-cellar, landlord-d2-arbitrary, landlord-d2-idk}
landlord-d2-explanation2	true	false	"'The keyring was given to me by the previous owner.'"	"'The keyring was given to me by the previous owner.'

The landlord's tentacles coil around your arm, cradling the keyring, and you suppress the urge to shudder.

[italic type]'Maybe,'[roman type] it says. [italic type]'Maybe you lie. Maybe you thief.'[roman type]

[wait for any key]It exhales wetly, and recedes. Saliva runs from its beak and strikes the floor with a hiss.

[italic type]'Conundrum. Compromise. You have key? Tell which room. Correct, you enter. Wrong, you leave. Yes?'[roman type]

[wait for any key]'Um...'"	{landlord-d2-answer1, landlord-d2-answer2, landlord-d2-answer3, landlord-d2-cellar, landlord-d2-arbitrary, landlord-d2-idk}
landlord-d2-explanation3	true	false	"'I have the keyring now. Does it matter who it used to belong to?'"	"'I have the keyring now. Does it matter who it used to belong to?'

The landlord's tentacles coil around your arm, cradling the keyring, and you suppress the urge to shudder.

[italic type]'Maybe,'[roman type] it says. [italic type]'Maybe. Standards to uphold.'[roman type]

[wait for any key]It exhales wetly and recedes. Saliva runs from its beak and strikes the floor with a hiss.

[italic type]'Compromise. You have key? Tell which room. Correct, you enter. Wrong, you leave. Yes?'[roman type]

[wait for any key]'Um...'"	{landlord-d2-answer1, landlord-d2-answer2, landlord-d2-answer3, landlord-d2-cellar, landlord-d2-arbitrary, landlord-d2-idk}
landlord-d2-answer1	true	false	"'The key unlocks the first room.'"	"'The key unlocks the first room.'

[landlord-wronganswer]"	{}
landlord-d2-answer2	true	false	"'The key unlocks the second room.'"	"'The key unlocks the second room.'

[landlord-wronganswer]"	{}
landlord-d2-answer3	true	false	"'The key unlocks the third room.'"	"'The key unlocks the third room.'

[landlord-wronganswer]"	{}
landlord-d2-arbitrary	true	false	"'That seems like an overly arbitrary way to decide.'"	"'That seems like an overly arbitrary way to decide,' you tell the landlord.

It tilts its head. Seven pupils gaze unblinking.

[italic type]'Perhaps. Perhaps. Answer.'[roman type]"	{landlord-d2-answer1, landlord-d2-answer2, landlord-d2-answer3, landlord-d2-cellar, landlord-d2-idk}
landlord-d2-idk	true	false	"'I don't know which room this unlocks.'"	"'I don't know which room this unlocks.'

The landlord hisses. The coils tighten, and you feel the keyring being pried from your fingers.

[italic type]'Honest. Good. Saves trouble.'[roman type]

[wait for any key]'Please,' you say desperately. 'Please. I need to get into that room--'

The landlord holds up the keyring, gingerly, almost tenderly. Saliva runs from its beak and oozes down the wire.

[italic type]'I will,'[roman type] it says. [italic type]'Keep this. Until you know. Until you see.'[roman type]

[wait for any key]'Until... I see?'

[italic type]'Learn which room. Tell which room. Until then... go.'[roman type]

[wait for any key]Its grip loosens. You step back, holding your arm close to your chest."	{}

To say landlord-wronganswer:
	say "A beat. You feel your heart crawl in your chest.[paragraph break]";
	wait for any key;
	say "[italic type]'Wrong.'[roman type][paragraph break]";
	wait for any key;
	say "The coils tighten around your forearm. You cry out in pain. The keyring is pried from your fingers.[paragraph break]";
	wait for any key;
	say "[italic type]'You guess. You not know. Pathetic.'[roman type][paragraph break]";
	wait for any key;
	say "'I'm sorry!' you wail. 'Oh Primes -- I'm sorry I guessed--'[paragraph break]";
	say "[italic type]'Pathetic.'[roman type][paragraph break]";
	wait for any key;
	say "The landlord flings you to the ground and you collapse clutching your bruised forearm. With its other arm it holds up the keyring, gingerly, almost tenderly.[paragraph break]";
	wait for any key;
	say "[italic type]'I will,'[roman type] it says. [italic type]'Keep this. Until you know. Until you see.'[roman type][paragraph break]";
	wait for any key;
	say "'Please,' you find yourself saying. 'Please...'[paragraph break]";
	say "[italic type]'Learn which room. Tell which room. Until then... go.'[roman type][paragraph break]";
	wait for any key;
	say "It slithers back into the reception office. You clamber unsteadily to your feet. ";
	now the battered keyring is nowhere;
	now cellar-keygiven is true;
	now the home dialogue branch of the landlord is landlord-d2-home2.
	
After reading out landlord-d2-answer1: now the enabled of landlord-d2-guess1 is false.
After reading out landlord-d2-answer2: now the enabled of landlord-d2-guess2 is false.
After reading out landlord-d2-answer3: now the enabled of landlord-d2-guess3 is false.
	
After reading out landlord-d2-idk:
	now the battered keyring is nowhere;
	now cellar-keygiven is true;
	now the home dialogue branch of the landlord is landlord-d2-home2.
	
Table of Day Two Landlord Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
landlord-d2-home2	true	false	""	"'Excuse me?'

The landlord comes rippling out of the reception office, looking expectant."	{landlord-d2-iknowroom, landlord-d2-guessroom, landlord-d2-nevermind}
landlord-d2-iknowroom	true	false	"'I know which room the keyring unlocks.'"	"'I know which room the keyring unlocks.'

The landlord cocks its head. [italic type]'Tell.'[roman type]"	{landlord-d2-guess1, landlord-d2-guess2, landlord-d2-guess3, landlord-d2-cellar, landlord-d2-allwrong, landlord-d2-nevermind}
landlord-d2-guess1	true	true	"'The key unlocks the first room.'"	"'The key unlocks the first room.'

[italic type]'Wrong.'[roman type]"	{landlord-d2-guess2, landlord-d2-guess3, landlord-d2-cellar, landlord-d2-allwrong, landlord-d2-comebacklater}
landlord-d2-guess2	true	true	"'The key unlocks the second room.'"	"'The key unlocks the second room.'

[italic type]'Wrong.'[roman type]"	{landlord-d2-guess1, landlord-d2-guess3, landlord-d2-cellar, landlord-d2-allwrong, landlord-d2-comebacklater}
landlord-d2-guess3	true	true	"'The key unlocks the third room.'"	"'The key unlocks the third room.'

[italic type]'Wrong.'[roman type]"	{landlord-d2-guess2, landlord-d2-guess3, landlord-d2-cellar, landlord-d2-allwrong, landlord-d2-comebacklater}
landlord-d2-allwrong	false	true	"'...This is a trick question, isn't it?'"	"'...This is a trick question, isn't it?'

[italic type]'Maybe.'[roman type]

You sigh."	{landlord-d2-cellar, landlord-d2-comebacklater}
landlord-d2-guessroom	true	true	"'Aren't there only a few rooms? All I have to do is guess which one.'"	"'Aren't there only a few rooms? All I have to do is guess which one.'

It looks at you, eyes unblinking.

[italic type]'Try.'[roman type]"	{landlord-d2-iknowroom, landlord-d2-nevermind}

After reading out landlord-d2-guess1: check for landlord-d2-allwrong.
After reading out landlord-d2-guess2: check for landlord-d2-allwrong.
After reading out landlord-d2-guess3: check for landlord-d2-allwrong.
	
To check for landlord-d2-allwrong:
	if the enabled of landlord-d2-guess1 is false and
	the enabled of landlord-d2-guess2 is false and
	the enabled of landlord-d2-guess3 is false:
		now the enabled of landlord-d2-guessroom is false;
		now the enabled of landlord-d2-allwrong is true.
		
Instead of talking to the landlord when cellar-keygiven is true and cellar-access-granted is false and the enabled of landlord-d2-guess1 is false and the enabled of landlord-d2-guess2 is false and the enabled of landlord-d2-guess3 is false and the enabled of landlord-d2-allwrong is false and the enabled of landlord-d2-cellar is false (this is the no more landlord dialogue before answering cellar rule):
	say "You haven't found out which room the keyring unlocks.";
	
Chapter 3.34.2.5 - Answering Cellar

Table of Day Two Landlord Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	choices
landlord-d2-cellar	false	false	"'The key unlocks the fourth room -- the cellar.'"	"'The key unlocks the fourth room -- the cellar.'

The landlord regards you wordlessly, and your lips feel suddenly dry. You're no longer quite so sure about your guess--

[wait for any key][italic type]'You see.'[roman type]

[wait for any key]A crescent opens up in the landlord's body, a ring of grinning white teeth. [italic type]'You see. You know.'[roman type]

[wait for any key]Then it says a word that doesn't -- doesn't quite [italic type]register[roman type] in your mind. Your head feels fuzzy for a second, and you -- you [italic type]blink--[roman type]

[wait for any key]--Where did that trapdoor come from?

[wait for any key]There's a trapdoor to the south where there was carpet just seconds ago. It's cut into the floor, with a half-eaten ladder descending into darkness.

[wait for any key]And the landlord...

[wait for any key]The landlord is gone. There's no one there. The office is empty."	{}

After reading out landlord-d2-cellar:
	now the landlord is nowhere;
	now cellar-access-granted is true.

Book 3.35 - Cellar

There is a room called the Cellar. "A dimly lit mouse-hole of a hollow that has been bricked off from prying eyes. A pair of mattresses lie near the entrance, where Sal and Piper must have slept. Further in, a guttering candle on the only table illuminates bladed weapons, counterfeit bills, and other contraband.

A trapdoor ascends out of the cellar."

The simple-name is "the cellar".
The sound is "You hear the faint sounds of vermin squeaking."
The scent is "There is a strange odor in the air."
The exit reminder is "You can only go upstairs, back to the flophouse."

Before going outside in the Cellar, try going north instead.
Before going up in the Cellar, try going north instead.
Before examining outside in the Cellar, try examining north instead.
Before examining up in the Cellar, try examining north instead.
Instead of examining north in the Cellar, say "The exit is that way."

The trapdoor to the cellar is south of the Flophouse and north of the Cellar. [I have to put this here because Inform 7 is trash when it comes to objects with names that include other names.]

Part 3.35.1 - Scenery

The dimly lit hollow is scenery in the Cellar.
The description is "This is a place for vermin, not for people."
Before listening to or smelling the dimly lit hollow, now the noun is the location.
Understand "mouse-hole/mousehole/hole" or "of" or "brick/bricks/bricked" or "dim" or "mouse" as the dimly lit hollow.
Before inserting something into the dimly lit hollow, try dropping the noun instead.
Before putting something on the dimly lit hollow, try dropping the noun instead.
Instead of entering the dimly lit hollow, say "You're standing in it."
Before getting off the dimly lit hollow, try going outside instead.

Some dingy mattresses are scenery in the Cellar.
The description is "One is big; the other, small."
The scent is "The mattresses certainly smell criminal."
Understand "pair" or "of" or "mattress" or "bed/beds" as the dingy mattresses.
Before entering the dingy mattresses, try sleeping instead.
Instead of sleeping when the dingy mattresses are in the location, say "You'd really rather not."
Instead of looking under the dingy mattresses, say "Nothing under there but cockroaches."

Some cockroaches are faraway scenery in the Cellar.
The description is "Cockroaches haven't scared you since you were a little girl. They are, however, deathly irritating things."
The cockroaches have some text called the faraway response. The faraway response is "The cockroaches scurry away before you can get close."
Understand "cockroach/roach/roaches/vermin" as the cockroaches.
Instead of attacking the cockroaches, say "[one of]Whap! You missed.[or]Pow! Nope. You missed.[or]Slap! You missed.[or]Ha! Got one![or]Okay, that's enough. You can't spend the whole day killing cockroaches.[or]You can't spend the whole day killing cockroaches.[stopping]".

Part 3.35.2 - The Incriminating Table

The incriminating table is a scenery supporter in the Cellar.
The printed name is "table".
Instead of examining or searching the incriminating table, say "There are many shapes that glisten in the candlelight, but that wine bottle seems the strangest."
Instead of putting something that is not the gift note on the incriminating table, say "You shouldn't leave your things lying around here."

The guttering phlogiston candle is scenery on the incriminating table.
The description is "A slow-burning phlogiston candle. It looks as though it was lit some days ago, then forgotten."
Understand "slow-burning/burning" or "slow" as the guttering phlogiston candle.
Instead of burning the guttering phlogiston candle, say "The candle is already lit."
Instead of extinguishing the guttering phlogiston candle, say "You don't like it, but you need the light to see by."
Instead of listening to, pushing, pulling, rubbing, smelling, squeezing, taking, touching, or turning the guttering phlogiston candle, say "You don't want to."

Some miscellaneous bladed weapons are scenery on the incriminating table.
The description is "Knives, mostly, of various sizes and shapes. There is also a saber which you recognize to be stolen from the Vigiles."
Understand "weapon/blade/blades" or "knife/knives" or "saber/sabre" or "stolen" or "vigiles" or "contraband/shape/shapes" as the miscellaneous bladed weapons.
Instead of taking the miscellaneous bladed weapons, say "Being caught with one of these would just raise unwanted questions. In any case, you already have your scalpel for cutting things."

Some counterfeit bills are scenery on the incriminating table.
The description is "You can tell they're counterfeit because some of the bills are only halfway inscribed."
The scent is "They are convincingly odorless."
Understand "bill" as the counterfeit bills.
Instead of taking the counterfeit bills, say "You pick up a bill, only for it to fall apart in your fingers. It seems the glyphs on these bills have not yet been sealed."
Instead of searching or looking under the counterfeit bills, say "You sift through the stacks of money, but there's nothing underneath."

Part 3.35.3 - The Highly Suspicious Wine Bottle

A highly suspicious wine bottle is an open unopenable container on the incriminating table. "[one of]You notice a wine bottle on the table that seems particularly out of place[or]On the table is a wine bottle[stopping]."
The description is "The bottle is [if the highly suspicious wine bottle is all wined up]still half-full[otherwise]empty, now[end if]; the label suggests an expensive claret. But the odor surrounding the mouth of the bottle is not quite the odor of wine.

Next to the wine bottle, you spy a stained ribbon[if the gift note is on the incriminating table] and a handwritten note[end if]."
Understand "expensive" or "claret" or "mouth" or "of" or "red" or "quantity" or "drop/drops/droplet/droplets/dreg/dregs" as the highly suspicious wine bottle.

The highly suspicious wine bottle can be all wined up or all wined out. The highly suspicious wine bottle is all wined up.

Before smelling the highly suspicious wine bottle, try examining the strange odor instead.
Instead of drinking or tasting the highly suspicious wine bottle, say "[if the highly suspicious wine bottle is all wined up]You aren't comfortable tasting suspicious wine from a hidden cellar. Especially when it doesn't [italic type]smell[roman type] quite right[otherwise]There's no wine left in the bottle[end if]."
Instead of inserting the endoscope into the highly suspicious wine bottle, say "You poke around with the endoscope for a bit, but [if the highly suspicious wine bottle is all wined up]the wine isn't any less opaque close up[otherwise]make out nothing interesting from the dregs that remain in the bottle[end if]."
Instead of inserting something into the highly suspicious wine bottle, say "That won't accomplish anything."
Instead of pushing, pulling, swinging, or turning the highly suspicious wine bottle, say "[if the highly suspicious wine bottle is all wined up]You give the bottle a shake, but the wine is too murky to make out anything inside[otherwise]Nothing happens[end if]."
Instead of searching the highly suspicious wine bottle, say "The bottle [if the highly suspicious wine bottle is all wined up]contains a quantity of red wine[otherwise]is empty[end if]."
Instead of taking the highly suspicious wine bottle, say "[if the highly suspicious wine bottle is all wined up]It's uncorked, and you might spill it while moving around. Best to just leave it where it is[otherwise]You don't need an empty bottle[end if]."
Instead of touching the highly suspicious wine bottle, say "It's cold."

Instead of emptying the highly suspicious wine bottle into:
	if the highly suspicious wine bottle is all wined up:
		if the second noun is not the location:
			say "(That would make a big mess, so you decide to pour the wine onto the floor instead.)[paragraph break]";
		say "You pick up the bottle and pour the wine out, careful not to get any on your gloves or trousers. It's scarlet, glittering, and it cascades and splashes in droplets before seeping into the stone.

Is it just your imagination, or is it -- thicker, somehow, than you'd expect wine to be?[paragraph break]";
		say wait for any key;
		say "In any case, it's all gone now. Nothing is revealed at the bottom of the now-empty bottle. You replace it on the table.";
		now the highly suspicious wine bottle is all wined out;
	otherwise:
		say "The bottle is already empty."

The strange odor is faraway scenery in the Cellar.
The description is "At first it smells like red wine, light and fruity. But there is the barest coppery undertone to it."
The strange odor has some text called the faraway response. The faraway response is "It's just a scent -- nothing more."
Understand "scent" or "odour" as the strange odor.
Before smelling the strange odor, try examining the strange odor instead.

Part 3.35.4 - Other Non-Wine-Bottle, Less Suspicious (But No Less Informative) Clues

The stained ribbon is scenery on the incriminating table.
The description is "A sigiled natron ribbon, of the kind used in gift-wrapping. It's stained black on blood-red."
The scent is "The natron fabric masks the scent, but you think you smell dried blood."
Understand "sigil/sigils/sigiled" or "natron" or "gift" or "gift-wrap/gift-wrapping/giftwrap/giftwrapping/wrap/wrapping" or "blood-red" as the stained ribbon.
Instead of pushing, pulling, squeezing, taking, touching, or turning the stained ribbon, say "The stains on the ribbon make you hesitant to touch it."

Some black speckled stains are part of the stained ribbon.
The description is "You have a feeling that they aren't inkstains. And they definitely aren't wine."
The scent is "The natron fabric masks the scent, but you think you smell dried blood."
Understand "stain/bloodstain/bloodstains" or "dried" or "blood" as the black speckled stains.
Instead of pushing, pulling, squeezing, touching, or turning the black speckled stains, say "You don't think touching the stains is a good idea."

Chapter 3.35.4.1 - Gift Note

The gift note is an undescribed thing on the incriminating table.
The description is "[if the gift note is described]A handwritten note you found in the flophouse cellar[otherwise]A gift note written on plain stationery[end if]. It reads:[paragraph break][italic type]Congratulations to both of you on a job well done. Here is a gift to our continued partnership.[line break]A. Z. B. N. Creditor Nacarat[roman type]".
The scent is "The note is odorless."
Understand "handwritten" or "hand" or "written" or "plain" or "stationery" as the gift note.

After examining the gift note when clue-giftnote is false:
	now clue-giftnote is true;
	wait for any key;
	say "[']A. Z. B. N.[']? That's an old-fashioned way to end a letter. You thought the instructors at the Physicians['] College were the only ones who still wrote that.[paragraph break]";
	wait for any key;
	say "More importantly, this is proof that Creditor Nacarat had been working with Sal and Piper.[paragraph break]";
	wait for any key;
	say "Or is it?[paragraph break]";
	wait for any key;
	say "There's something off here that you can't quite put your finger on.";

Instead of attacking or cutting the gift note:
	say "You tear up the note.";
	now the noun is nowhere.
	
Instead of dropping the gift note:
	if the location is in Outdoors:
		say "The note flutters away in the wind.";
		now the noun is nowhere;
	otherwise if the location is not Marid's Room and the location is not the Cellar:
		say "You shouldn't leave the note lying around here.";
	otherwise:
		continue the action.

Book 3.36 - Gangway

The Gangway is a proper-named room in Outdoors. "Rotting beams spiral from the Shanty Quarter like a stairway grasping for the stars. At their head is a jutting structure like a treehouse, and it shadows all that is beneath it, shielding grimy brick and concrete from desolate sky.

The Shanty Quarter yawns below. Above you is [first time]the place called [only]the Crow's Nest[if Webster is in-the-way and Webster is improper-named] -- but a fearsome eight-legged bouncer blocks the way[otherwise if Webster is in-the-way]-- but the eight-legged bouncer named Webster blocks the way[end if]."
It is above the Shanty Quarter.

The simple-name is "the Gangway".
The sound is "The wind whistles around you."
The scent is "It's cold here, and foul."
The exit reminder is "You can go down to the Shanty Quarter or up to the Crow's Nest."
The going-in disambiguation is "Do you mean going down (to the Shanty Quarter) or going up (to the Crow's Nest)?"

Instead of jumping in the Gangway, say "That sounds rather more fatal than you would prefer."
Before examining up in the Gangway, try examining the view of the Crow's Nest instead.
Before examining down in the Gangway, try examining the view of the Shanty Quarter instead.
Instead of examining inside in the Gangway, say "It's unclear where you want to look."
Instead of examining outside in the Gangway, say "It's unclear where you want to look."
Instead of examining a direction in the Gangway, say "The city stretches away in that direction."

Part 3.36.1 - Scenery

The high-rise buildings, the mist, and the view of the Shanty Quarter are in the Gangway.

Before entering the view of the Shanty Quarter in the Gangway, try going down instead.

Some rotting beams are scenery in the Gangway.
The description is "Old wood, but noticeably reinforced and maintained."
Understand "beam/buttress/buttresses" or "spiral/lattice" or "stair/stairs/staircase/stairway" or "wood/wooden" as the rotting beams.
Before climbing the rotting beams, try going up instead.
Instead of attacking, pushing, pulling, rubbing, squeezing, touching, or turning the rotting beams, say "The beams are surprisingly sturdy."
Instead of entering the rotting beams, say "That's where you're perched right now."

Some figurative stars are faraway scenery in the Gangway.
The description is "Figuratively speaking. The stars aren't actually out."
The sound is "Figuratively speaking. The stars aren't actually out."
The figurative stars have some text called the faraway response. The faraway response is "Figuratively speaking. The stars aren't actually out."

The view of the Crow's Nest is faraway scenery in the Gangway.
The description is "At first glance it is haphazardly built. Only on closer inspection do you see the buttresses, the care that has gone into its construction."
The sound is "It's quiet."
The scent is "There is the faintest scent of food on the wind."
Understand "jutting" or "structure" or "treehouse/house" or "pub/public" or "place" as the view of the Crow's Nest.
Before climbing or entering the view of the Crow's Nest, try going up instead.
Instead of looking under the view of the Crow's Nest, say "The Crow's Nest is balanced on a lattice of beams."

Part 3.36.2 - Webster

Webster is a human man.
He is improper-named. The indefinite article is "a".
The printed name is "[if Webster is improper-named]bouncer[otherwise]Webster".
The description is "[first time]He is human, though you wouldn't have guessed from his silhouette. [only]He wears cracked welding goggles and the greasy leathers of a mechanist; below the waist, his legs have been entirely replaced with a roaring pistoning walking-chassis. But if you look beyond the sound and fury, there's a twinkle in his eye, and an unexpected air of amicable civility."
The sound is "His mechanical legs clank and hiss."
The scent is "He smells like a machine shop."
Understand "fearsome" or "bouncer" or "eight-legged/8-legged/legged" or "eight/8/viii" as Webster.
Instead of attacking, cutting, knocking on, or pushing Webster, say "You doubt that would end well for you."
Instead of looking under Webster, say "He's standing (sitting?) on the wooden beams."

Some cracked welding goggles are a thing worn by Webster.
The description is "Scratches and scorch marks."
Understand "goggle" or "crack/cracks/scratch/scratches/scratched" or "scorch" or "mark/marks" as the cracked welding goggles.

Some greasy leathers are a thing worn by Webster.
The description is "His clothes are just a little too oily and pockmarked to be fashionable."
Before smelling the greasy leathers, try smelling Webster instead.
Understand "oil/oily/grease" or "pockmark/pockmarks/pockmarked" or "clothes" or "leather" or "machinist" as the greasy leathers.

The walking-chassis is a thing part of Webster.
The description is "A spider-legged contraption of bewildering complexity. A glyph of transfusion connects [the Webster]'s nervous system to the chassis."
Before smelling the walking-chassis, try smelling Webster instead.
Understand "roaring" or "piston/pistons/pistoning" or "walking" or "chassis/contraption" or "spider" or "leg/legs/legged/spider-legged" as the walking-chassis.
Before looking under the walking-chassis, try looking under Webster instead.
Instead of pushing, pulling, rubbing, squeezing, swinging, taking, touching, or turning the walking-chassis, say "[one of]'Hey,' says [the Webster]. 'No touching.'[or][The Webster] told you not to touch the chassis.[stopping]"

The glyph of transfusion is a thing part of the walking-chassis.
The description is "An advanced glyph you learned in the Physicians['] College. You never imagined you'd come across it in a place like this."
Understand "nervous" or "system" or "advanced" as the glyph of transfusion.
Before pushing, pulling, rubbing, squeezing, swinging, taking, touching, or turning the glyph of transfusion, try touching the walking-chassis instead.
Instead of looking under the glyph of transfusion, say "The glyph is inscribed on the chassis."

Chapter 3.36.2.1 - Webster during Day Two

Webster can be in-the-way or sufficiently-convinced. Webster is in-the-way.

[You need to bring up Reden to get into the Crow's Nest, which is only possible if you know he visited this place.]

Book 3.37 - Crow's Nest

There is a proper-named room called the Crow's Nest. It is above the Gangway.

[There is an antique tinderbox in Crow's Nest]

Book of the Rest

The Sewer Enclave is a room. 

There is a proper-named room called the Channelworks.
It is north of the Channelworks Concourse.
Understand "building" as the Channelworks.
The simple-name is "the Channelworks building".