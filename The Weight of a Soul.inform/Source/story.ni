"The Weight of a Soul" by Chin Kee Yong

The story headline is "A study of the ars vitalis".
The story genre is "Fantasy".
The release number is 1.
The story description is "In a world of arcane mysteries, a young doctor's apprentice unravels a conspiracy most grim."
The story creation year is 2017.

[




!!!!!!!!!!!!

S P O I L E R   W A R N I N G

The source code of The Weight of a Soul is hosted on GitHub for backup purposes.

If you read on, there WILL be massive spoilers.

You have been warned.

!!!!!!!!!!!!


























---TO DO---

- Write Day One
	- Write Returning to a Break-In
	- Write journal entries for Returning to a Break-In
	- Write Cavala post-attack dialogue
	- Write Walking Home in Fear
	- Write journal entry for Walking Home in Fear
	- Write new bartender dialogue

- Write Day Two
- Write Midnight
- Write Day Three
- Write Day Four
- Write Epilogue

- Implement the Map]

Volume 1 - Preamble

Book 1.1 - Miscellany

Part 1.1.1 - Use Options

Use American dialect and the serial comma.
Use MAX_NUM_STATIC_STRINGS of 40000.
Use MAX_PROP_TABLE_SIZE of 400000.
Use MAX_STATIC_DATA of 960000.
Use MAX_SYMBOLS of 40000.
Release along with a "NoSidebar" website and an interpreter.

Part 1.1.2 - Extensions

Include Approaches by Emily Short.
Include Basic Screen Effects by Emily Short.
Include Menus by Emily Short.

Part 1.1.3 - Miscellaneous Functions

To say wait for any key: wait for any key. [This allows us to write it directly inside the text without having to rely on tedious substitutions. Useful for dialogue trees and scripted events using tables.]

This is the rest of the turn rule:
	follow the scene changing rules;
	abide by the every turn stage rule;
	abide by the timed events rule;
	abide by the advance time rule;
	abide by the update chronological records rule;
	abide by the adjust light rule;
	abide by the note object acquisitions rule;
	abide by the notify score changes rule;
	follow the scene changing rules.

[This is the turn sequence rules minus the part that parses and follows a command, plus the scene changing rules (which apparently do not trigger if you reject the player's command). We use the 'rest of the turn rule' later when we reject the player's command but still want to advance the turn. The scene changing rules are listed twice in case a scene start or end condition changes between the start and end of this rule.]

Part 1.1.4 - Tweaked Approaches Functionality

A room can be goto-passable or goto-impassable. A room is usually goto-passable.

This is the new approach-heading selection rule:
	now approach-heading is the best route from the location to the noun through goto-passable visited rooms, using doors;
	if approach-heading is not a direction:
		now approach-heading is the best route from the location to the noun through goto-passable visited rooms, using even locked doors;
	if approach-heading is not a direction:
		now approach-heading is the best route from the location to the noun through visited rooms, using even locked doors;
		if approach-heading is a direction:
			say "You can't think how to get there from here.";
			rule fails.
			
The new approach-heading selection rule is listed instead of the approach-heading selection rule in the approach-finding rules.

[This allows us to make certain rooms impassable for approaching on the fly, which is handy when the player is barred from entering certain rooms by means other than locked doors.]

Part 1.1.5 - Room Names

A room has some text called the simple-name.

Rule for printing the name of a room (called the room in question) while the player is hurrying: say "[if the simple-name of the room in question is not empty][simple-name of the room in question][otherwise][the room in question][end if]".

Rule for printing the name of a room (called the room in question) while asking which do you mean: say "[if the simple-name of the room in question is not empty][simple-name of the room in question][otherwise][the room in question][end if]".

The can't approach our current location rule response (A) is "You are already in [if the simple-name of the location is not empty][simple-name of the location][otherwise][the location][end if]."

[The default Inform behavior for printing the names of rooms is weird. This allows us to define an alternate string in certain cases.]

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

Walking Home in Fear is a scene. [Marid goes home after fixing Doctor Cavala's leg.]
Walking Home in Fear begins when First Aid on Cavala ends.

Chapter 1.2.1.3 - Day Two

[A messenger brings a rude awakening: there's been another spate of goblin deaths, and Doctor Arturus, who took in the patients, is dead of the same infection. Quarantine has been enacted by Doctor Serpens. Cavala sets Detective Marid on the scene. She discovers that there seems to be a deliberate pattern to the infection, that certain signs recur, and that Doctor Arturus was murdered. Cavala tells her to rest well and be careful.]

Day Two is a scene.
Day Two begins when Day One ends.

Chapter 1.2.1.4 - Midnight

[Carnicer makes a nighttime attempt on Marid's life. Marid flees her room through the window, runs through a condemned block, and outwits Carnicer by leading her into a nest of deadly vermin -- nearly dying herself in the process, and experiencing a strange vision of the hereafter. Help arrives moments after, but by then Carnicer is already dead.]

Midnight is a scene.
Midnight begins when Day Two ends.

Chapter 1.2.1.5 - Day Three

[More deaths. Doctor Cavala is quite certain that a conspiracy is afoot, that the plague is not natural, and asks Marid to look for a common infection vector. Marid goes out and discovers a newfound affinity for aurorae, which she uses to glean clues by speaking with the ghosts of the departed. But the ghosts of those killed by Noctis are fragmented, unable to tell her much. The clues lead her to Arturus's secret lab beneath the Channelworks, where she is promptly knocked out cold.]

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

Table of Status Line when Not Engaged in Dialogue
left	central	right
" [location]"	""	"[if the current day is Prologue or the current day is Epilogue][otherwise][current day]"

Table of Status Line when Engaged in Dialogue
left	central	right
" [location]"	""	"[conversational partner text]"

Rule for constructing the status line:
	if the player is engaged in dialogue, fill status bar with Table of Status Line when Engaged in Dialogue;
	otherwise fill status bar with Table of Status Line when Not Engaged in Dialogue;
	rule succeeds.
	
Part 1.2.3 - Skipping Scenes

To skip past Reden's Surgery:
	now Reden is dead;
	now all purely surgical necessities are nowhere;
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
	follow the scene changing rules.
	
To skip past Nine to Five Zombie:
	if Prologue has not ended:
		skip past Prologue;
		now Reden is on the mortuary slab;
		follow the scene changing rules;
	now Marid's Dormitory is visited;
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
	now Reden's Shack is visited;
	now journal-reden-shack-known is true;
	now Riggertown Upper Level is visited;
	now VII Layabout Row is visited;
	move the player to the Riggertown Mechanistry, without printing a room description;
	now the forewoman is nowhere;
	follow the scene changing rules.
	
Skipping Reden's surgery is an action applying to nothing. Understand "skip surgery" as skipping Reden's surgery.
Check skipping Reden's surgery when Reden's surgery has ended: say "Reden's surgery has already ended."; stop the action.
Carry out skipping Reden's surgery:
	skip past Reden's Surgery;
	say "Surgery skipped.";
	try looking.

Skipping to Day One is an action applying to nothing. Understand "skip to day one" as skipping to Day One.
Check skipping to Day One when Prologue has ended: say "Day One has already begun."; stop the action.
Carry out skipping to Day One:
	skip past Prologue;
	unveil Day One.
	
Skipping to errands is an action applying to nothing. Understand "skip to errands" as skipping to errands.
Check skipping to errands when Nine to Five Zombie has ended: say "Cavala's Errands has already begun."; stop the action.
Carry out skipping to errands:
	skip past Nine to Five Zombie;
	try looking.
	
Skipping to censor is an action applying to nothing. Understand "skip to censor" as skipping to censor.
Check skipping to censor when the bundle of documents is delivered: say "The bundle of documents has already been delivered."; stop the action.
Carry out skipping to censor:
	skip past the first errand;
	try looking.
	
Skipping the Shanty Maze is an action applying to nothing. Understand "skip shanty quarter/-- maze" as skipping the Shanty Maze.
Check skipping the Shanty Maze when Cadaver Walk is visited: say "Cadaver Walk is already visited."; stop the action.
Carry out skipping the Shanty Maze:
	skip past the Shanty Maze;
	try looking.
	
Skipping to mechanistry is an action applying to nothing. Understand "skip to mechanistry" as skipping to mechanistry.
Check skipping to mechanistry when Cavala's Errands has ended: say "Returning to a Break-In has already begun."; stop the action.
Carry out skipping to mechanistry:
	skip past Zoiro;
	try looking.
	
Part 1.2.4 - Other Debug Commands - Not for release

Making all rooms visited is an action out of world. Understand "all rooms/-- visited" as making all rooms visited.
Carry out making all rooms visited: now all rooms are visited; say "Ok, all rooms are now visited."

Book 1.3 - People

Part 1.3.1 - Defining People

Definition: a person is other if it is not the player.

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

The sound of a person is usually "[regarding the item described][They] [are]n't saying anything."
		
Instead of eating someone, say "What a strange notion."
Instead of drinking, switching on, switching off, or wearing someone (this is the can't do that to a person rule): say "That doesn't make any sense."
Instead of setting someone to something (this is the can't set people rule): say "That doesn't make any sense."

Instead of looking under something carried by an other living person (called the carrier), say "[regarding the noun][They're] what [the carrier] [are] carrying."
Instead of looking under something worn by an other living person (called the wearer), say "[regarding the noun][They're] what [the wearer] [are] wearing."

Instead of taking an other living person (this is the new can't take people response rule): say "[regarding the noun]You lack the strength, even if [they] allowed you to."

Instead of attacking, cutting, knocking on, or pushing an other friendly living person (this is the can't hurt friendly people rule): say "That hardly seems called for."
Instead of kissing, pulling, rubbing, searching, smelling, swinging, squeezing, touching, or turning an other friendly living person (this is the block actions on friendly people rule): say "[if time is critical]This is not the time.[otherwise]You aren't [italic type]that[roman type] friendly with [the noun]."

Instead of attacking or cutting an other hostile living person (this is the can't hurt hostile people rule): say "You doubt that would end well for you."
Instead of knocking on, pulling, pushing, smelling, squeezing, touching, or turning an other hostile living person (this is the can't provoke hostile people rule): say "You doubt that would go over well with [the noun]."
Instead of kissing, rubbing, or searching an other hostile living person (this is the block actions on hostile people rule), say "You doubt [the noun] will let you do that."

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
The scent is "Doctor Cavala never wears perfume, owing to the danger of contamination during surgery."
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
	otherwise:
		say "She seems to be at a crossroads, lost in thought. ".

Chapter 1.3.3.2 - Horatio

Horatio is a human man.
The description is "[horatio-description]".
The scent is "Horatio smells like sweat and ozone."
Understand "vigile" as Horatio.

To say horatio-description:
	if Day One is happening:
		say "Vigile Horatio is a childhood friend of yours. He's always been a bit dense, but you're glad to have his around. ".

Chapter 1.3.3.3 - Carnicer

Carnicer is an undescribed hostile mutant woman.
Understand "hooded" or "assassin" or "killer" or "butcher" as Carnicer.
Understand "stranger" as Carnicer when Averting Cavala's Assassination is happening.

The poisoned blade is carried by Carnicer.
Understand "sword" as the poisoned blade.

Book 1.4 - When Time is Critical

[This is used to flag the player at certain tense times so that comedic and relaxed responses don't trigger.]

force-time-critical is a truth state that varies.

To decide whether time is critical:
	if force-time-critical is true, decide yes;
	if Reden's Surgery is happening, decide yes;
	if the location is the Condemned Block, decide yes;
	if the location is the Shanty Quarter, decide yes;
	if the location is Rats' Run, decide yes;
	if the location is in the Shanty Maze, decide yes;
	if Returning to a Break-In is happening and Carnicer is in the Clinic, decide yes;
	if Averting Cavala's Assassination is happening, decide yes;
	if First Aid on Cavala is happening, decide yes;
	decide no.

To decide whether time is not critical:
	if time is critical, decide no;
	decide yes.
	
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

The player is female. Understand "servator" or "marid" or "orpheia" as yourself. Understand "marid's" or "my" as a thing when the player has the item described.

The description of the player is "[marid-description-text]".
The sound of the player is "[if time is critical]Your heart is pounding.[otherwise]Your breathing seems normal."
The scent of the player is "[if time is critical]This is not the time.[otherwise]You smell okay."

To say marid-description-text:
	if the location is Maze Part Two:
		say "Fortunately, the knife didn't penetrate your jacket. You're unhurt. ";
	otherwise:
		say "You feel alert and well. [if time is critical]O[otherwise]Slightly o[end if]n edge, perhaps, but that's nothing unusual considering the circumstances. ";
	say "[paragraph break][inventory-text][run paragraph on]".

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
The can't give to yourself rule response (A) is "[if time is critical]This is not the time.[otherwise]If only gifts could be earned so freely."
Instead of kissing, pushing, pulling, or taking the player, say "[if time is critical]This is not the time.[otherwise]What a strange notion."
Instead of knocking on or touching the player, say "You feel nothing unexpected."
Instead of rubbing the player, say "[if time is critical]This is not the time.[otherwise]You don't need a shower right now."
Instead of squeezing the player, say "[if time is critical]This is not the time.[otherwise]It isn't [italic type]that[roman type] cold."
Instead of swinging the player, say "[if time is critical]This is not the time.[otherwise]That would require some sort of pendulum."
Instead of turning the player, say "[if time is critical]This is not the time.[otherwise]You turn around to little effect."

Part 2.1.2 - Marid's Tattoos

The alchemical tattoos are part of the player. The indefinite article of the alchemical tattoos is "your". The description of the alchemical tattoos is "Your father gave you these tattoos when you were a young child, as is tradition in some alchemical families. Even now, the flowing, circuitous lines remind you of him." Understand "my" or "marid's" or "face" or "neck" or "tattoo" or "flowing" or "circuitous" or "lines" or "line" as the alchemical tattoos.

Instead of knocking on, looking under, rubbing, searching, or touching the alchemical tattoos, say "[if time is critical]This is not the time.[otherwise]Your feel the faintest tingle of power beneath your skin."

Before doing anything other than examining, knocking on, looking under, rubbing, searching, or touching to the alchemical tattoos: now the noun is the player.

Part 2.1.3 - Marid's Eyes

Marid's eyes are a thing that is part of yourself. The printed name of Marid's eyes is "your eyes". The description of Marid's eyes is "[if time is critical]This is not the time.[otherwise if the location is Marid's Dormitory]They are the eyes of one who has glimpsed death.[otherwise]Your eyes seem to be working fine." Understand "my" or "eye" as Marid's eyes.

Before searching Marid's eyes, try examining Marid's eyes instead.
Instead of attacking, burning, cutting, pushing, or pulling Marid's eyes, say "No."
Instead of knocking on, listening to, looking under, swinging, or tasting Marid's eyes, say "That doesn't make any sense."
Instead of rubbing, squeezing, or touching Marid's eyes, say "[if time is critical]This is not the time.[otherwise]That's bad for your eyes."

Book 2.2 - Marid's Possessions

Part 2.2.1 - Key Items

[This marks items that can't be dropped.]

A key item is a kind of thing.

Last check dropping (this is the can't drop key items rule):
	if the noun is a key item:
		say "It's better to keep [the noun] on your person.";
		stop the action.

Last check putting something on something (this is the can't put key items on things rule):
	if the noun is a key item:
		say "It's better to keep [the noun] on your person.";
		stop the action.
		
Last check inserting something into something (this is the can't insert key items into things rule):
	if the noun is a key item:
		say "It's better to keep [the noun] on your person.";
		stop the action.
		
Last check giving something to someone (this is the can't give away key items rule):
	if the noun is a key item:
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
Understand "garb" or "blouse" or "glove" or "gloves" or "apron" or "pants" or "pocket" or "pockets" or "boot" or "boots" or "shoe" or "shoes" or "sock" or "socks" as the clothes.

Before smelling the clothes, try smelling the player instead.
Instead of attacking or burning the clothes, say "[if time is critical]This is not the time.[otherwise]What an odd idea."
Instead of looking under the clothes, say "[if time is critical]This is not the time.[otherwise]That's what you're wearing."
Instead of pulling the clothes, say "[if time is critical]This is not the time.[otherwise]Your clothes are already close-fitting enough."
Instead of searching the clothes, say "You have on your person [a list of things carried by the player]."
Instead of taking off the clothes, say "[if time is critical]This is not the time.[otherwise if the location is Marid's Dormitory]You don't need a change of clothes at the moment.[otherwise]You'd rather remain in proper attire."
Instead of tying the clothes to something, say "Your clothes are too close-fitting to tie anything with."
Instead of tying something to the clothes, say "Your clothes are too close-fitting to tie anything with."

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

The practitioner's badge is a key item carried by the player. The indefinite article is "your".
The description is "This burnished badge bears the symbol of a snake coiling around a staff, certifying you as a qualified apprentice of the [italic type]ars vitalis[roman type]."
Understand "burnished" or "symbol" or "snake" or "staff" as the practitioner's badge.

Instead of attacking or cutting the practitioner's badge, say "The badge is far too valuable to risk damaging."
Instead of giving the practitioner's badge to someone, say "[if time is critical]This is not the time.[otherwise]You earned this badge. You'll keep it."
Instead of rubbing the practitioner's badge, say "[if time is critical]This is not the time.[otherwise]You polish your badge a little."
Instead of looking under or turning the practitioner's badge, say "[if time is critical]This is not the time.[otherwise]There's nothing on the reverse of the badge. The clip broke off some months ago."
Instead of wearing the practitioner's badge, say "[if time is critical]This is not the time.[otherwise]The clip of the badge broke off some months ago, and so you've had to keep it in your pocket instead."

Part 2.2.6 - Scalpel

The scalpel is a key item carried by the player. The indefinite article is "your".
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

The purse is a key item carried by the player. The indefinite article is "your".
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

The antiseptic cloth is a key item carried by the player.
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

The bundle of documents is a key item.
The description is "Comprehensive documentation of Reden's death. It's filled out in neat longhand and bound with Doctor Cavala's signature."
The scent is "It smells of ink."
Understand "sheaf" or "document/documentation" or "paper/papers" or "doctor/doctor's/-- cavala/cavala's/-- signature" or "seal" as the bundle of documents.

Instead of attacking or cutting the bundle of documents, say "You are fairly certain that would get your apprenticeship terminated."
Instead of opening the bundle of documents, say "You shouldn't break the seal."
Instead of giving the bundle of documents to someone, say "[regarding the second noun][They] [are]n't the recipient of the documents."
Instead of giving the bundle of documents to Doctor Cavala, say "Doctor Cavala gives you a strange look."

Part 2.2.11 - Endoscope

The endoscope is a key item.
The description is "An intricate assembly of tiny lenses mounted on adjustable brass rods. It can be used to see inside the internal pathways of the human body, or perhaps other sinuous crevices of a similar nature."
Understand "intricate" or "assembly" or "tiny" or "lense" or "lenses" or "adjustable" or "brass" or "rod" or "rods" or "scope" or "fragile" or "implement" as the endoscope.

Instead of attacking, cutting, or knocking on the endoscope, say "The endoscope is far too valuable to risk damaging."

Instead of inserting the endoscope into something, say "[The second noun] [are]n't something you can thread the endoscope into."
Before inserting the endoscope into something when time is critical, say "You don't have time for that." instead.

Instead of pushing, pulling, turning, searching, switching on, switching off, or squeezing the endoscope, say "To use the endoscope, insert it into the pathway you wish to examine."
Instead of setting the endoscope to something, say "To use the endoscope, insert it into the pathway you wish to examine."
Understand "use [the endoscope]" as a mistake ("To use the endoscope, insert it into the pathway you wish to examine.").

Book 2.3 - Actions

Part 2.3.1 - New Block Responses

Instead of attacking or cutting, say "That won't accomplish anything."
Instead of burning, say "No. No burning."
Instead of climbing, say "[regarding the noun][They're] not something you can climb."
Instead of drinking, say "[regarding the noun][They're] not something you can drink."
Instead of jumping, say "There's no reason to jump on the spot."
Instead of tasting, say "That can't be hygienic."
Instead of tying something to something, say "You can't tie those."
Instead of waking up, say "This is not a dream."
Instead of rubbing or swinging, say "Nothing happens."
Instead of throwing something at something, say "That won't accomplish anything."
Instead of sleeping, say "[if time is critical]Sleep is the last thing on your mind right now.[otherwise if Walking Home in Darkness is happening]You would prefer to sleep in the comfort of your dormitory.[otherwise if Nine to Five Zombie is happening]No, you have to report for work.[otherwise]It's too early to sleep."
After waiting when time is critical, say "This is no time for inaction."

Last before pushing something to: if the noun is not pushable between rooms, try pushing the noun instead.

Last instead of swinging a scenery thing: say "[regarding the noun][They're] not something you can swing."
Last instead of swinging a fixed in place thing: say "[regarding the noun][They] [are] fixed in place."

Rule for printing a parser error (this is the swear word filter rule):
	repeat through the Table of Mild Swear Words:
		if the player's command includes the topic entry:
			say "Indeed." instead;
	repeat through the Table of Severe Swear Words:
		if the player's command includes the topic entry:
			if time is critical:
				say "If you feel frustrated, type >HELP for hints." instead;
			otherwise:
				say "[one of]Language, Marid.[or]'Vulgar words reveal one's vulgar nature.' Philosopher Scepter.[or]If you feel frustrated, type >HELP for hints.[stopping]" instead;
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

[Because why not?]

Rule for printing a parser error when the latest parser error is the I beg your pardon error (this is the accept Blue Lacuna style looking rule):
	if the player is engaged in dialogue:
		say "Please choose a response from the list by typing the corresponding number.";
	otherwise:
		abide by the after reading a command rules; [This is notably relevant during Reden's Surgery.]
		try looking;
		follow the rest of the turn rule.

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
Understand "insert [something preferably held] down [something]" as inserting it into.
Understand "jump through/into/in/inside/on/onto/at/to [something]" as entering.
Understand "kick [something]" as attacking.
Understand "lick [something]" as tasting.
Understand "look behind/beside [something]" as looking under.
Understand "l behind/beside [something]" as looking under.
Understand "look for [text] in [something]" as consulting it about (with nouns reversed).
Understand "l for [text] in [something]" as consulting it about (with nouns reversed).
Understand "load" as restoring the game.
Understand "order [something]" as buying.
Understand "put [something preferably held] down [something]" as inserting it into.
Understand "ring [something]" as swinging.
Understand "search [something] for [text]" as consulting it about.
Understand "search for [text] in [something]" as consulting it about (with nouns reversed).
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
Understand "unravel [something]" as opening.
Understand "untie [something]" as opening.
Understand "watch" as waiting.

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

Part 2.3.3 - New Miscellaneous Actions

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
	otherwise if the location is Marid's Dormitory:
		if Walking Home in Darkness is happening:
			say "[one of]You brush your teeth.[or]You've already brushed your teeth.[stopping]";
		otherwise:
			say "You've already brushed your teeth.";
	otherwise:
		say "You have nothing with which to brush your teeth."
		
Combing your hair is an action applying to nothing. Understand "comb my/-- hair" or "brush my/-- hair" as combing your hair. [The logical next step.]
Carry out combing your hair (this is the standard combing your hair rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the location is Marid's Dormitory:
		if Walking Home in Darkness is happening:
			say "There isn't much point. Your hair will get messed up when you sleep.";
		otherwise:
			say "You've already combed your hair.";
	otherwise:
		say "You have nothing with which to comb your hair."
		
Crying is an action applying to nothing. Understand "cry" or "panic" as crying.
Check crying (this is the block crying rule): say "No. You have to stay strong."; stop the action.
		
Descending is an action applying to nothing. Understand "descend" as descending.
Check descending: try going down instead.
		
Extinguishing is an action applying to one thing. Understand "extinguish [something]" or "put out [something]" or "snuff [something]" as extinguishing.
Check extinguishing: say "That's not something that can be extinguished."; stop the action.

Filing your nails is an action applying to nothing. Understand "cut my/-- nails" or "file my/-- nails" or "trim my/-- nails" as filing your nails. [I hate you all.]
Carry out filing your nails (this is the standard filing your nails rule):
	if time is critical:
		say "This is not the time.";
	otherwise if the location is Marid's Dormitory and Walking Home in Darkness is happening:
		say "[one of]You file your nails.[or]You've already filed your nails.[stopping]";
	otherwise:
		say "You've already filed your nails.";

Going home is an action applying to nothing. Understand "go back/-- home" as going home.
Carry out going home:
	if Marid's Dormitory is visited:
		try approaching Marid's Dormitory;
	otherwise:
		say "That isn't an area you've visited.";

Knocking on is an action applying to one thing. Understand "knock on/-- [something]" or "tap [something]" as knocking on.
Check knocking on an openable door: say "There is no response."; stop the action.
Check knocking on: say "Nothing happens."; stop the action.

Scaring is an action applying to one visible thing. Understand "chase away/-- [something]" or "scare away/-- [something]" or "shoo away/-- [something]" or "frighten away-- [something]" as scaring.
Check scaring when the noun is not a person: say "That is unlikely to elicit a response."; stop the action.
Check scaring the player: say "[if time is critical]This is not the time.[otherwise]There's no need for that."; stop the action.
Check scaring a friendly person: say "That hardly seems called for."; stop the action.
Check scaring a hostile person: say "That seems unlikely to be effective."; stop the action.

Screaming is an action applying to nothing. Understand "yell" or "holler for/-- the/-- guard/guards/--" or "shout" or "scream" as screaming.
Check screaming: say "No. You have to keep your cool."; stop the action.

Singing is an action applying to nothing. Understand "sing" or "hum" as singing.
Check singing: say "[if time is critical]This is not the time.[otherwise]You hum to yourself."; stop the action.

Swimming is an action applying to nothing. Understand "swim" or "dive" as swimming.
Check swimming (this is the block swimming rule):
	if the fosse is in the location:
		say "Diving into the fosse is both dangerous and illegal.";
	otherwise if the Bilious Canal is in the location or the up-close Canal is in the location:
		say "The Bilious Canal isn't the most appealing venue for a swim.";
	otherwise:
		say "You don't see anywhere to swim here.";
	stop the action.
	
Tickling is an action applying to one thing. Understand "tickle [something]" or "fondle [something]" as tickling.
Check tickling when the noun is not a person: say "That is unlikely to elicit a response."; stop the action.
Check tickling the player: say "[if time is critical]This is not the time.[otherwise]It's impossible to tickle oneself. The exact reason why is one of the great mysteries of the [italic type]ars vitalis[roman type]."; stop the action.
Check tickling a friendly person: say "You aren't [italic type]that[roman type] friendly with [the noun]."; stop the action.
Check tickling a hostile person: say "You doubt [the noun] will let you do that."; stop the action.

Understand "bow" or "curtsy" or "curtsey" as a mistake ("[if time is critical]This is not the time.[otherwise]That's a little old-fashioned, don't you think?").
Understand "cook" or "cook [text]" as a mistake ("[if time is critical]This is not the time.[otherwise]You have neither the knowledge nor the inclination.").
Understand "die" as a mistake ("[if time is critical]No.[otherwise]Entertaining such thoughts is never productive.").
Understand "chuckle" or "grin" or "laugh" or "smile" as a mistake ("[if time is critical]This is not the time.[otherwise if Day One is happening]You smile.[otherwise]You aren't in the mood.").
Understand "dance" or "dance [text]" or "do a dance/jig" as a mistake ("[if time is critical]This is not the time.[otherwise]You aren't in the mood.").
Understand "fall down/over/--" or "misstep" or "trip" as a mistake ("[if time is critical]This is not the time.[otherwise]You're more sure-footed than that, Marid.").
Understand "follow" or "follow [text]" or "go after [text]" as a mistake ("You'll have to specify which direction you want to go in.").
Understand "jump in front of [text]" or "run in front of [text]" as a mistake ("[if time is critical]This is not the time.[otherwise]That seems exceedingly unwise.").
Understand "kneel" or "kneel [text]" or "sink to my/-- knees" or "fall to my/-- knees" as a mistake ("[if marid-kneeling-in-maze is true]You are already kneeling.[otherwise if the location is Maze Part Four]You are not going to sink to your knees again.[otherwise if time is critical]This is not the time.[otherwise]You'll face the world on your feet.").
Understand "use [text]" as a mistake ("You'll have to use a more specific verb than that.").
Understand "whistle" as a mistake ("[if time is critical]This is not the time.[otherwise]You don't know how to whistle.").
Understand "pray" or "pray [text]" as a mistake ("[if time is critical]Action is needed now, not prayer.[otherwise]You never took much stock in the Deist worldview.").
Understand "prime" or "primes" or "oh primes" as a mistake ("[if time is critical]This is not the time.[otherwise]'Vulgar words reveal one's vulgar nature.' Philosopher Scepter.").
Understand "remember" or "remember [text]" or "recall" or "recall [text]" or "think about" or "think about [text]" as a mistake ("Type >JOURNAL for a reminder of the information you've come across.").
Understand "roll my/-- eyes" as a mistake ("[if time is critical]This is not the time.[otherwise]You roll your eyes.").
Understand "step with care" as a mistake ("[if time is critical]This is not the time.[otherwise]You always do.").
Understand "stoop" as a mistake ("[if time is critical]This is not the time.[otherwise]You stoop.").
Understand "take out [text]" as a mistake ("Just indicate what you want to do with that.").
Understand "throw up" or "vomit" or "barf" or "lose my/-- lunch" as a mistake ("You're made of sterner stuff than that.").
Understand "xyzzy" or "plugh" or "plover" as a mistake ("[if time is critical]This is not the time.[otherwise]You're a doctor's apprentice, not a wizard's apprentice.").

Part 2.3.4 - New Parser Error Messages

Last rule for printing a parser error (this is the new parser error message rule):
	if the latest parser error is:
		-- the can't see any such thing error:
			say "That is either not important or not something you can see." instead;
		-- the not a verb I recognise error:
			say "That is either not important or not something you can see." instead;
		-- the noun did not make sense in that context error:
			say "That isn't an area you've visited." instead; [For approaching.]
	make no decision.
	
Part 2.3.5 - New Action Behavior

After opening (this is the reveal any newly visible interior even if it contains nothing rule):
	if the noun is an opaque container and
		the noun contains nothing and
		the noun does not enclose the actor:
		if the action is not silent, say "[We] [open] [the noun]. It's empty.";
		stop the action.

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

Chapter 2.3.9.2 - Tearing Out Inform Dialogue

Understand the commands "ask" and "tell" and "say" and "answer" as something new.

Understand "ask [text]" or "tell [text]" or "answer [text]" or "say [text]" or "insult [text]" or "compliment [text]" or "flirt [text]" or "greet [text]" or "whisper [text]" or "wave at [text]" or "report [text]" as a mistake ("Use the command TALK TO or T to converse with other characters.").
Understand "hello" or "hi" or "ok" or "okay" or "nod" or "shake head" or "wave" as a mistake ("Use the command TALK TO or T to converse with other characters.").

Instead of asking someone to try doing something, say "Use the command TALK TO or T to converse with other characters."
Instead of answering someone that something, say "Use the command TALK TO or T to converse with other characters."
Instead of saying yes or saying no or saying sorry, say "Use the command TALK TO or T to converse with other characters."

Chapter 2.3.9.3 - Engaged in Dialogue

Yourself can be engaged in dialogue. Yourself is not engaged in dialogue.

The available dialogue choices is a list of dialogue branches that varies.

Reading out something is an activity on dialogue branches. [This activity is what translates the dialogue branch object into displayed text and provides the appropriate dialogue choices. We make it an activity rather than a function so we can write "Before reading out X..." or "After reading out X..."]

To read out (current branch - a dialogue branch):
	carry out the reading out activity with the current branch. [A more convenient and human-readable way to say the same thing.]
	
Rule for reading out a dialogue branch (called the current branch):
	say "[description of the current branch][if the description of the current branch is not empty][line break]";
	if the one-shot of the current branch is true, now the enabled of the current branch is false;
			
Last after reading out a dialogue branch (called the current branch) (this is the end the dialogue after reading out a dialogue branch with no choices rule): [This is separated from the main 'reading out' rule because the 'after reading out' rules may change the conditions of a scene change or what dialogue choices are available.]
	if the number of entries in the choices of the current branch is 0:
		end the dialogue;
	otherwise:
		change the available dialogue choices to have 0 entries;
		repeat with current child running through the choices of current branch:
			if the enabled of current child is true, add current child to the available dialogue choices.

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
	if the player's command includes "[number]":
		let N be the number understood;
		if N > 0 and N <= the number of entries in the available dialogue choices:
			read out entry N in the available dialogue choices;
			reject the player's command;
			stop;
	say "Please choose a response from the list by typing the corresponding number.";
	reject the player's command.

First turn sequence rule (this is the time doesn't pass during dialogue rule):
	if the player is engaged in dialogue, rule fails.

Chapter 2.3.9.3 - Starting and Ending a Dialogue

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
	follow the rest of the turn rule.

Chapter 2.3.9.4 - Talking To

Talking to is an action applying to one visible thing.
Understand "t [something]" as talking to.
Understand "holler at [something]" as talking to.
Understand "talk to/with/-- [something]" as talking to.
Understand "scream at [something]" as talking to.
Understand "shout at [something]" as talking to.
Understand "speak to/with/-- [something]" as talking to.
Understand "yell at [something]" as talking to.

Does the player mean talking to something that is not a person: it is unlikely.

Check talking to something that is not a person (this is the can't talk to inanimate objects rule): say "You won't get much of a response." instead.

Check talking to the player (this is the can't talk to yourself rule): say "You aren't that far gone, Marid." instead.

Check talking to an other person when the home dialogue branch of the noun is the null dialogue branch (this is the can't talk to someone with no home dialogue rule): say "[The noun] [have] nothing to say to you." instead.

Check talking to an other person when the enabled of the home dialogue branch of the noun is false (this is the can't talk to someone with disabled home dialogue rule): say "[The noun] [have] nothing to say to you." instead.

Carry out talking to something (this is the standard talking to rule):
	now ambience suppression is true; [Defined in Backdrops - Ambience. We don't want random atmospheric events to come into play.]
	start a dialogue with the noun.

Part 2.3.10 - Help Menu

Table of the Help Menu
title	subtable	description	toggle
"About This Game"	--	"[about-this-game-text]"	a rule
"How to Play"	--	"[how-to-play-text]"	--
"List of Commands"	--	"[useful-commands-text]"	--
"Journal"	--	"[journal-text]"	--
"Characters"	--	"[characters-text]"	--
"Map"	--	"[map-text]"	--
"Hints"	Table of the Hint Menu	--	--
"Credits"	--	"[credits-text]"	--

Chapter 2.3.3.1 - How to Play, Useful Commands, About This Game, Credits

To say about-this-game-text:
	say "[bold type]About this game[roman type]

[italic type]The Weight of a Soul[roman type] is an interactive fiction game set in the world of Solphos. It takes place some years after my short story [italic type]The Guiding Light[roman type], and is an indirect sequel to it. There are callbacks and references scattered throughout this game for those already familiar with Solphos, but don't worry if you're new to the setting: the game is designed so that anyone can enjoy it regardless of prior experience.

This game was written and compiled in Inform, a design system for interactive fiction using human-readable programming language. Inform 7 was created by Graham Nelson with contributions from countless talented writers and programmers, and this game is deeply indebted to all of their efforts. More information can be found at inform7.com.";

To say how-to-play-text:
	say "[bold type]How to play[roman type]

This is a work of interactive fiction. It is a game about solving puzzles and investigating mysteries. You play the part of Marid, a doctor's apprentice, and your actions in the coming days could determine the fate of the Channelworks District.

The > symbol indicates a command prompt. When a > is displayed, you can type commands for Marid to follow, in the form >GO WEST or >OPEN DOOR, and she will go along as far as she is able and willing. A list of commands can be found in the help menu.

If you are talking to someone, you will instead be prompted to choose from a list of possible responses, in the form [italic type]'1) Say hello; 2) Say goodbye.'[roman type] In this case, you should choose one of the responses by typing the corresponding number.

At other times, there may be no command prompt provided at all, such as during a dramatic pause in the text. In these cases, press any key to continue.";

To say useful-commands-text:
	say "[bold type]A list of useful commands[roman type]

LOOK (L or <no command> for short) provides a description of your surroundings.

INVENTORY (I for short) tells you what items you're wearing or carrying. You can TAKE or DROP things; WEAR or TAKE OFF clothing; PUT items ON or IN containers; and so on.

EXAMINE <SOMETHING> (X <SOMETHING> or simply <SOMETHING> for short) provides you with a closer look at whatever it is you're examining.

GO <DIRECTION> (<DIRECTION> for short) allows you to navigate your surroundings. The directions are each of the eight compass directions, plus UP, DOWN, INSIDE and OUTSIDE. NORTHWEST can be abbreviated to NW. You can also GO TO a room you've visited before, or ENTER or EXIT things when it makes sense to do so.

TALK TO <SOMEONE> (T <SOMEONE> for short) allows you to interact with someone. You may find it worthwhile to talk to people multiple times, as newly discovered information can open up new conversational options.

LISTEN, SMELL, and TOUCH allow you to investigate your environment in more detail. You may find it useful to SEARCH things or LOOK UNDER them; PUSH, PULL, or TURN objects; ATTACK, CUT, CLIMB, and more. The game recognizes a good deal of synonyms and miscellaneous commands not listed here. Feel free to experiment.

HELP opens this menu. COMMANDS (C), JOURNAL (J), CHARACTERS, MAP (M), and HINTS can be used as shortcuts to display those menu pages.

Lastly, some 'out of world' commands: UNDO takes back your last command, while AGAIN (G) repeats it. SAVE allows you to create a saved game, while RESTORE restores a game you've saved. And QUIT exits the game.";

To say credits-text:
	say "[bold type]Acknowledgements[roman type]

[italic type]The Weight of a Soul[roman type] was written by Chin Kee Yong a.k.a. CKY, a Singaporean artist, writer, game designer, and coffee addict. It is my first serious foray into interactive fiction.

I'd like to thank Lieu, Gu, Wen, Chew, Sean, WY, WH, GA, Marvin, Matthew, and the rest for putting up with my fits of manic inspiration. Thanks also to Aaarrrgh, Barinellos, Brentain, Hidetsugu, Huey, Keeper, Luna, OL, Raven, razor, Ruwin, and Tevish: you've been wonderful co-creators and stewards of the Expanded Multiverse. Your creativity and positivity are what inspire me to keep going.

Thanks to Emily Short for writing the various extensions that do backstage heavy lifting for [italic type]The Weight of a Soul[roman type]. Thanks to my family for supporting me, to the Inform team for creating an amazing IDE, and to the IF community for creating a truly inspirational body of work. And of course, thank you, dear player: I hope you enjoy the game I've made.[paragraph break]";
	say "[bold type]Licensing and Contact Information[roman type]

[italic type]The Weight of a Soul[roman type] is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License. For questions, comments, and/or criticism, feel free to drop me a line: as of this writing, I am reachable at chinkeeyong (at) gmail (dot) com.";

Chapter 2.3.3.2 - Journal

[The Journal shows the current quest objectives and clues that have been discovered. We show quest objectives by referencing the scenes that are happening, and clues by checking against specific flags.]

To say journal-text:
	say "[bold type][journal-text-date][roman type]

[journal-text-entry]

[bold type]Current objectives:[roman type][line break][journal-text-objectives][journal-text-notes]";

Chapter 2.3.3.3 - Characters

[Choosing Characters brings up a list of all the significant characters you've encountered. Each character gets a short bio about them and their relationship with Marid.]

A person can be discoverable, undiscoverable, or discovered. A person is usually undiscoverable. [A person is only listed in Characters if they are discovered.]

Every turn when a discoverable person is in the location (this is the discover nearby characters rule):
	now all discoverable people in the location are discovered. 

A person has some text called the bio-name. The bio-name of a person is usually "[printed name in title case]".
A person has some text called the bio-description. The bio-description of a person is usually "No information available."

To say characters-text:
	say "You have discovered the following notable characters:";
	repeat with current character running through discovered people:
		say "[paragraph break][bold type][bio-name of current character][roman type][if current character is yourself] (yourself)[end if][line break][bio-description of current character][run paragraph on]".

Yourself is discovered. The bio-name of yourself is "Servator Marid Orpheia".
The bio-description of yourself is "A seventeen-year-old graduate of the Physicians['] College, currently apprenticed to Doctor Cavala. You have taken care of yourself ever since your parents died four years ago."

Doctor Cavala is discovered.
The bio-description of Doctor Cavala is "Your mentor in the [italic type]ars vitalis.[roman type] A former army doctor and a physician of commanding skill.[if Doctor Cavala is incapacitated] She is currently injured following a mysterious break-in."

When Reden's Surgery ends (this is the discover Reden after he dies rule): now Reden is discovered.
The bio-description of Reden is "A goblin bum who died in Doctor Cavala's surgery room of an hitherto unknown affliction."

Horatio is discoverable. The bio-name of Horatio is "Vigile Horatio".
The bio-description of Horatio is "A guardsman of the Channelworks District, and a childhood friend of yours."

Chapter 2.3.3.4 - Map

To say map-text:
	say "Sorry, this feature is not yet implemented."

Chapter 2.3.3.5 - Hints

Table of the Hint Menu
title	subtable	description	toggle
"General Hints"	--	"[general-hints-text]"	a rule
"Prologue"	Table of Prologue Hints	--	--
"Day One"	Table of Day One Hints	--	--

Section 2.3.3.5.1 - General Hints

To say general-hints-text:
	say "[bold type]General hints for play[roman type]

[italic type]The Weight of the Soul[roman type] is a game about investigation and problem-solving. Take your time and examine your surroundings, especially things that seem out of place or things that could be connected to the greater mystery at hand. Don't be afraid to ask around, explore, and get your hands dirty. Only look at hints if you're completely stuck and need guidance.

Marid is a capable and perceptive protagonist, and she usually has a good idea of where to go next. The Journal shows your current objective, a list of clues you've found, and Marid's thoughts on the situation. You can also consult Characters to refresh your memory on important personages you've encountered, or Map for a street map of the Channelworks District.

[italic type]The Weight of a Soul[roman type] is a very forgiving game. (It's rated 'Polite' on the Zarfian Cruelty Scale, if you know what that is.) Nevertheless, some sections of it have deadly time limits, and it [italic type]is[roman type] possible for the story to end badly for Marid. It is recommended to SAVE if you find yourself in a dire situation. If you get a game over, UNDO to retrace your steps and try again.";

Section 2.3.3.5.2 - Prologue Hints

Table of Prologue Hints
title	subtable	description	toggle
"How do I save the patient?"	Table of Reden's Surgery Hints	--	hint toggle rule

Table of Reden's Surgery Hints
hint	used
"He doesn't look good."	a number
"Follow Doctor Cavala's instructions."
"If you don't see something at first, try looking again."
"The soporific is the inhaler labeled [italic type]aer soporifer[roman type] on the shelves of medical supplies."
"The stethoscope is hidden behind the gurney."
"The breath of catholicon is on the shelves of medical supplies, but only appears after you examine the shelves several times."
"It's impossible to keep Reden from dying. However, if you see the sequence all the way through, you unlock a special dialogue option in the conversation with Doctor Cavala that follows."

Section 2.3.3.5.3 - Day One Hints

Table of Day One Hints
title	subtable	description	toggle
"How do I deliver the documents to the censor?"	Table of Censor's Nap Hints	--	hint toggle rule

Table of Censor's Nap Hints
hint	used
"First, you have to get to the basilica."	a number
"To reach the basilica, follow the Via Terminalis east to the junction, then go south to the grand forum and west to the basilica."
"Try various actions to wake the censor up."
"The easiest way is to hit him."
"There are eight different ways to wake him up, each eliciting a different oath from the censor. See if you can find all of them."

Chapter 2.3.3.6 - Summoning the Help Menu

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
	try looking.
	
Asking for commands is an action out of world.
Understand "c" as asking for commands.
Understand "commands" as asking for commands.
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
	try looking.
	
Asking for characters is an action out of world.
Understand "characters" as asking for characters.
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
	try looking.
	
Asking for commands is menu-summoning. Asking for journal is menu-summoning. Asking for characters is menu-summoning. Asking for map is menu-summoning.

Rule for constructing the status line while menu-summoning (this is the constructing status line while menu-summoning rule):
	if the endnode flag is 0,
		fill status bar with Table of Deep Menu Status;
	otherwise fill status bar with Table of Shallow Menu Status;
	rule succeeds.
	
Part 2.3.11 - Journal Text

Chapter 2.3.11.1 - Flags

journal-riggertown-detour-known is a truth state that varies.
journal-zoiro-address-known is a truth state that varies.
journal-reden-shack-known is a truth state that varies.

Chapter 2.3.11.2 - Date
	
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

Chapter 2.3.11.3 - Entry
	
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

Chapter 2.3.11.4 - Objectives

To say journal-text-objectives:
	let L be a list of texts;
	[---
	PROLOGUE
	---]
	if Reden's Surgery is happening:
		add "Help Doctor Cavala save Reden's life" to L;
	if Walking Home in Darkness is happening:
		add "Get a good night's sleep" to L;
	[---
	DAY ONE
	---]
	if Nine to Five Zombie is happening:
		if 9-5-zombie-cavala-prompt is false:
			add "Report for work at Doctor Cavala's clinic" to L;
		otherwise if the location is not the Mortuary:
			add "Find Doctor Cavala" to L;
		otherwise:
			add "Report to Doctor Cavala" to L;
	if Cavala's Errands is happening:
		if the location is in the Shanty Maze:
			add "Find a way out of the Shanty Quarter" to L;
		otherwise:
			if the bundle of documents is undelivered:
				add "Deliver the bundle of documents to the censor in the basilica" to L;
			if The Censor's Nap is happening:
				add "[italic type]...and think of a way to wake the censor[roman type]" to L;
			add "Find Zoiro, Reden's son, in Riggertown" to L;
			if journal-zoiro-address-known is false:
				if Maze Part One is unvisited:
					add "[italic type]...by asking the censor for his address[roman type]" to L;
				add "[italic type]...by asking around Riggertown[roman type]" to L;
			if Following the Canal is visited and journal-riggertown-detour-known is false and no rooms in Riggertown are visited:
				add "[italic type]...and find another route around the blocked path to Riggertown[roman type]" to L;
	if Returning to a Break-In is happening:
		if Carnicer is in the West End:
			add "Report back to Doctor Cavala's clinic" to L;
		otherwise:
			add "Investigate the stranger" to L;
	[---
	END
	---]
	if the number of entries in L is 0:
		say "[line break]I have no particular objective at the moment.";
	otherwise:
		repeat with current objective running through L:
			say "[line break]- [current objective]";

Chapter 2.3.11.5 - Notes

To say journal-text-notes:
	let L be a list of texts;
	[---
	CLUES, DAY ONE
	---]
	if Cavala's Errands is happening:
		if the Basilica is unvisited:
			add "I remember that the basilica is across the Via Terminalis bridge, next to the grand forum. " to L;
		if no rooms in Riggertown are visited:
			if journal-riggertown-detour-known is true:
				add "I learned that I can reach Riggertown by detouring through the Shanty Quarter." to L;
			otherwise:
				add "I remember that Riggertown is down the canal from the Via Terminalis[if Following the Canal is visited], but the footpath is currently blocked[end if]. " to L;
		if journal-zoiro-address-known is true:
			if the enabled of censor-woken-address is false:
				add "I learned that Zoiro lives on Layabout Row, in Upper Riggertown, and works at the Riggertown Mechanistry. " to L;
			otherwise:
				add "I learned that Zoiro works at the Riggertown Mechanistry, in Upper Riggertown. " to L;
	[---
	MUSINGS, MISCELLANEOUS
	---]
	if time is not critical and the enabled of bartender-dialogue-drink is true:
		add "I'm in the mood for a drink... " to L;
	[---
	MUSINGS, PROLOGUE
	---]
	if Walking Home in Darkness is happening and the Dormitory Block is visited and Saliunca is friendly:
		add "There's something strange about [if we have talked to Saliunca]Saliunca[otherwise]that old woman in the atrium[end if]... " to L;
	[---
	MUSINGS, DAY ONE
	---]
	if Cavala's Errands is happening:
		if Maze Part One is visited:
			if Upper Riggertown is visited and we have not examined the advertising horns:
				add "Just what are those horns in Upper Riggertown honking anyway?... " to L;
		otherwise if Via Terminalis West Street is visited:
			if the enabled of cavala-errands2-vision is true:
				add "Doctor Cavala told me to think about what I saw last night... " to L;
			add "This district is so much larger than the Lake District... " to L;
			if the enabled of horatio-dayone-intro is true:
				add "I haven't spoken with Horatio in a while. I wonder how he's getting on... " to L;
			if the Grand Forum is visited and we have not examined the street buskers:
				add "I wonder what those buskers in the grand forum are performing... " to L;
			if we have not talked to the porter:
				add "Perhaps I could go to the Turris Infinita and pay Justinian a surprise visit... " to L;
	[---
	END
	---]
	if the number of entries in L is not 0:
		say "[paragraph break][bold type]Marid's notes:[roman type][line break]";
		repeat with current note running through L:
			say "[line break]- [current note]";


Volume 3 - The Channelworks District

Book 3.1 - Miscellany

Part 3.1.1 - Outdoors and the Sky

Outdoors is a region.
Instead of examining up in Outdoors, try examining the sky.
Before listening to something that is part of the sky, try listening to the sky instead.

The sky is a faraway backdrop in Outdoors. The indefinite article is "the".
The description is "[if Prologue is happening or Midnight is happening]Shrouded among the clouds and the constellations, the [italic type]Luna[roman type] presides from its throne.[otherwise]The clouds huddle overhead in suspense."
The sound is "The [if Prologue is happening or Midnight is happening]night is[otherwise]clouds are[end if] quiet."
The sky has some text called the faraway response. The faraway response of the sky is "The heavens are beyond your reach."
Understand "heaven" or "heavens" or "day/night/daylight" or "weather" or "overcast" as the sky.

Some clouds are scenery part of the sky. The indefinite article is "the".
The description is "[if Prologue is happening or Midnight is happening]They are dark shapes in a darker sky.[otherwise]The sun is shy on the best of days here, and today's weather is far from the best."
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
The description is "[if Prologue is happening or Midnight is happening]All the shops are closed for the night.[otherwise if time is critical]Shopping is the last thing on your mind at the moment.[otherwise]Signs advertise a variety of goods and services, but none of them catch your eye."
The sound is "[if Prologue is happening or Midnight is happening]All the shops are closed for the night.[otherwise]You hear the sounds of commerce."
Before smelling the various shops, try smelling the location instead.
Understand "shop" or "window" or "windows" or "signs/signage" or "advertisement/advertisements" or "goods" or "and" or "services" or "shop door/doors" as the shops.
Instead of buying, entering, knocking on, or searching the shops, say "[if Prologue is happening or Midnight is happening]All the shops are closed for the night.[otherwise if time is critical]Shopping is the last thing on your mind at the moment.[otherwise]None of the shops are relevant to your situation."

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
The description is "An imposing gothic hall. Petitioners trickle in and out."
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
Understand "maze" or "of/-- urban/-- decay" as the view of the Shanty Quarter.

The nightmarish architecture is a backdrop.
The description is "The architecture of this place is nightmarish, impossible. Walls are crushed together. Roofs and floors are one and the same."
The scent is "Every inch of this place smells foul."
Understand "rope/ropes" or "concrete" or "wall/walls" or "impossible" or "roof/roofs" or "floor/floors" or "manhole/manholes" or "rickety" or "beam/beams" or "light/darkness" as the nightmarish architecture.
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
Understand "walking" or "dead" or "homeless" or "lost" or "damned" or "crowd/crowds" or "man/men/woman/women/person/people" or "human/humans" or "goblin/goblins" or "mutant/mutants" or "and" or "voice/voices" or "bustle/traffic" or "life/lives" or "destitute" or "slum" or "dweller/dwellers" or "slum-dweller" or "in" or "general" as the slum-dwellers.
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

Part 3.1.3 - Ambience

[This part governs random events that sometimes trigger in various areas, to create a sense of liveliness in the Channelworks District. There are a number of backdrop objects which can be placed in rooms to provide them with ambience. The actual ambience text is provided by tables which we shuffle and cycle through in random order.]

The ambience cooldown timer is a number that varies. The ambience cooldown timer is 3.

Ambience suppression is a truth state that varies.

When play begins (this is the shuffle the ambience rule):
	sort the Table of Day One Upper Perioch ambience in random order;
	sort the Table of Day One Riggertown ambience in random order.

Chapter 3.1.3.1 - Upper Perioch Ambience

Some Upper Perioch ambience is a privately-named backdrop.

The Upper Perioch ambience index is a number that varies. The Upper Perioch ambience index is 1.

Every turn when the Upper Perioch ambience is in the location (this is the Upper Perioch ambience rule):
	if ambience suppression is false:
		decrement the ambience cooldown timer;
		if the ambience cooldown timer is 0:
			now the ambience cooldown timer is a random number from 3 to 4;
			if the current day is Day One:
				say the happening in row Upper Perioch ambience index of the Table of Day One Upper Perioch Ambience;
				say line break;
				increment the Upper Perioch ambience index;
				if the Upper Perioch ambience index is greater than the number of rows in the Table of Day One Upper Perioch Ambience:
					now the Upper Perioch ambience index is 1;
					sort the Table of Day One Upper Perioch ambience in random order;
	otherwise:
		now ambience suppression is false.

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

Chapter 3.1.3.2 - Riggertown Ambience

Some Riggertown ambience is a privately-named backdrop.

The Riggertown ambience index is a number that varies. The Riggertown ambience index is 1.

Ambience suppression is a truth state that varies.

Every turn when the Riggertown ambience is in the location (this is the Riggertown ambience rule):
	if ambience suppression is false:
		decrement the ambience cooldown timer;
		if the ambience cooldown timer is 0:
			now the ambience cooldown timer is a random number from 3 to 4;
			if the current day is Day One:
				say the happening in row Riggertown ambience index of the Table of Day One Riggertown Ambience;
				say line break;
				increment the Riggertown ambience index;
				if the Riggertown ambience index is greater than the number of rows in the Table of Day One Riggertown Ambience:
					now the Riggertown ambience index is 1;
					sort the Table of Day One Riggertown ambience in random order;
	otherwise:
		now ambience suppression is false.

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
Instead of examining or searching the shelves of medical supplies, say "[if something is on the shelves of medical supplies]Nestled among the medical supplies, you spy [a list of things on the shelves of medical supplies].[otherwise]You spy nothing useful on the shelves, well-stocked though they are."
Instead of entering the shelves of medical supplies, say "There's no need; you can reach all the shelves quite easily."

Part 3.2.2 - Calomel Curtain

The calomel curtain is a scenery door. It is south of the Surgery Room and north of the Clinic. It is open and unopenable.
The description is "It decontaminates objects that pass through it."
The scent is "It smells, unsurprisingly, of calomel."
Understand "immaterial" or "field" or "of" or "energy" as the calomel curtain.
Understand "exit" as the calomel curtain when the location is the Surgery Room.

Instead of searching the calomel curtain, say "You can't see much through the calomel curtain."
Instead of touching the calomel curtain, say "Your hand tingles as it passes through the curtain."
Instead of attacking, climbing, closing, knocking on, opening, pulling, pushing, rubbing, squeezing, swinging, taking, or turning the calomel curtain, say "The calomel curtain is an immaterial field of energy. It isn't a literal curtain."

After going through the calomel curtain while the player is staid: say "A wave of warmth washes over you as you step through the calomel curtain."; continue the action. 

Part 3.2.3 - Gurney

The gurney is a fixed in place enterable supporter in the Surgery Room. "[if Reden is on the gurney][reden-gurney-description].[otherwise if something is on the gurney]On the gurney [is-are a list of things on the gurney].[otherwise]The gurney in the center of the room is empty."
Understand "sober" or "mechanical" or "bed" or "drawer" or "drawers" or "side" or "of" as the gurney.

Instead of examining the gurney, say "It's a sober mechanical bed with various devices and surgical implements attached.[if Reden is on the gurney] [reden-gurney-description].[otherwise if something is on the gurney][line break]On the gurney [is-are a list of things on the gurney]."

The attached surgical implements are part of the gurney. Understand "devices" or "device" or "implement" or "strap" or "straps" or "hook" as the implements. Instead of doing anything with the implements, say "You don't think anything useful will result from fiddling with the gurney devices."

Instead of entering the gurney, say "The gurney is for patients. It isn't a toy."
Instead of searching the gurney, say "You find nothing useful in the mechanical drawers."

Instead of taking an other person on the gurney, say "[regarding the noun]You don't think you should disturb [them]."
Instead of putting something on the gurney when someone is on the gurney, say "[The random person on the gurney] [are] already on the gurney."

Part 3.2.4 - Reden

Reden is a goblin man on the gurney. 
The scent is "[if Reden is living]He reeks.[otherwise if Reden is on the gurney]He's going to have to be embalmed soon.[otherwise]He smells of embalming fluid."
Understand "patient" as Reden.
Understand "chest" or "cavity" or "autopsy" as Reden when Reden's Autopsy is happening.

To say reden-gurney-description:
	if Reden is living:
		say "The patient shudders against his straps on the gurney, black blood streaming from his eyes and mouth, even as Doctor Cavala fights to isolate the infection";
		now Doctor Cavala is mentioned;
	otherwise:
		say "Reden lies on the gurney, lifeless and still";
	now Reden is mentioned.

The description of Reden is "[if Reden is living]Reden, goblin male aged 51, stumbled into the clinic six minutes ago suffering from convulsions and phantom pains. Now his life is in Doctor Cavala's hands -- and yours.[otherwise if Reden's Autopsy is happening]His chest cavity has been dissected, revealing a spiderweb pattern of blackened blood vessels and tissues.[otherwise]Black stains run down his cheeks like tears."

Chapter 3.2.4.1 - Streams of Black Blood

Some streams of black blood are part of Reden.
The description is "A chilling symptom. It's unlike any affliction you've ever studied."
Understand "fluid/effluvium" or "stream" or "stain/stains" or "spiderweb" or "pattern" or "blackened" or "vessel/vessels/artery/arteries/arterial" or "tissue/tissues" as the streams.
Instead of doing anything other than examining or rubbing with the streams, say "The fluid could be contagious. You shouldn't interact carelessly with it."
Instead of doing anything when the second noun is the streams, say "The fluid could be contagious. You shouldn't interact carelessly with it."

Part 3.2.5 - Surgery Room during Prologue

Doctor Cavala is in the Surgery Room.

When play begins (this is the print the introduction rule):
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
		say "[happening in row 1 of the Table of Reden's Surgical Procedure][paragraph break](New players should type >HELP.)";
		now first-message-and-help-text-shown is true.

Chapter 3.2.5.1 - Reden's Surgical Procedure

[This is a minigame where you help Doctor Cavala find stuff for the procedure, potentially prolonging Reden's life. He dies either way, but it's good for atmosphere.]

The CSORSP [current step of Reden's surgical procedure] is a number that varies. The CSORSP is 1.

A purely surgical necessity is a kind of thing. [These things will be removed from play when Reden's Surgery ends.]
A purely surgical necessity has some text called the terse appellation.
Instead of doing anything other than taking or examining when the noun is a purely surgical necessity or the second noun is a purely surgical necessity, say "This is not the time."

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
3	"'...massive internal bleeding...' she mutters."	--	--
4	"'...unnerving. I've never seen anything like it.' Doctor Cavala shakes her head before glancing to you. 'Marid. Did you find the soporific? Give it to me.'"	--	soporific

The soporific inhaler is a purely surgical necessity. The printed name is "inhaler labeled [italic type]aer soporifer[roman type]". The terse appellation is "the soporific".
The description is "This must be the soporific Doctor Cavala is looking for."
Understand "inhaler" or "labeled" or "aer" or "soporifer" as the soporific.
	
The vivific inhaler is a purely surgical necessity. The printed name is "inhaler labeled [italic type]aer vivificans[roman type]".
Understand "labeled" or "aer" or "vivificans" as the vivific.

Understand "inhalers" as the soporific and the vivific.

The phantom-soporific is an undescribed purely surgical necessity in the Surgery Room. The printed name is "soporific". [This is a bone for new players, after playtesting revealed several attempts to interact with the soporific followed by confusion.]
Instead of doing anything with the phantom-soporific, say "You can't see anything like that at the moment.[paragraph break](Try typing >EXAMINE SHELVES or >SHELVES.)[line break]".
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

[I decided later on that a legit stethoscope would be given to the player, so this section uses a pair of prop stethoscopes.]

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

The purely-surgical-stethoscope is a privately-named purely surgical necessity. "Hanging on the side of the gurney is an orichalcum stethoscope." The printed name is "stethoscope". The terse appellation is "the stethoscope".
The description is "[if the purely-surgical-stethoscope is carried by Doctor Cavala]Doctor Cavala's using it.[otherwise]It looks to be a new design, sleeker than the ones in the Physicians['] College. No wonder you missed it the first time round."
Understand "stethoscope" or "orichalcum" or "ausculting" or "dish" as the purely-surgical-stethoscope.
Instead of doing anything other than examining to the purely-surgical-stethoscope when the purely-surgical-stethoscope is carried by Doctor Cavala, say "You can't disturb Doctor Cavala, not now."

Instead of examining, looking under, or searching the gurney when the purely-surgical-stethoscope is in the Reden's surgery holding zone (this is the spawn the stethoscope rule):
	say "You look behind the gurney and there it is -- a stethoscope reclining snakelike on its hook.";
	now the purely-surgical-stethoscope is in the Surgery Room;
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
12	"'It's in an inhaler,' she says finally. 'Labeled in the [italic type]lingua libria[roman type]. It cost me a great deal to acquire.'

There is no mirth in her voice, and for a moment you are at a loss for words."	--	--
13	"There is another convulsion from the patient, but with less vigor than before. Much less.

'He's falling apart,' Doctor Cavala says in a low voice. 'Don't hesitate, Marid. Get me the catholicon.'"	--	--
14	"Distantly you hear Reden's ragged breathing."	--	catholicon

The catholicon inhaler is a purely surgical necessity. The printed name is "inhaler labeled [italic type]halitus catholiconis[roman type]". The terse appellation is "the catholicon".
The description is "Something is moving inside."
Understand "labeled" or "halitus" or "catholiconis" as the catholicon.

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
	now all purely surgical necessities are nowhere;
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

'If only what?' She fixes you with a stern gaze. 'The man is dead, Marid. We are not animologists. Nothing we do will bring him back -- and you of all people should know this.'

'I know,' you say bitterly. 'I just... wish there was something we could do.'

[if the player is wearing the surgical mask]Doctor Cavala holds out her hand. No words are needed. You pull off your surgical mask and hand it to her, unable to meet her gaze.[otherwise]Doctor Cavala's eyes flicker to the outline of your pendant, under your jacket, but she says nothing."	{cavala-redendead-catholicon, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-catholicon	false	true	"'The catholicon -- what [roman type]was[italic type] that?'"	"'The catholicon--'

You glance at Reden, half expecting to see white fire in his eyes, and suppress a shudder.

'The catholicon, Doctor. What [italic type]was[roman type] that?'

Doctor Cavala takes the empty inhaler out of her pocket. She looks pensively into the glass, and holds it up to the lights where it shines.

'The catharsis,' she says quietly. 'The purging of the soul. It is the most destructive of all remedies, and the most irreversible once administered. But remember this, Marid: sometimes a thing must be destroyed before it can be built anew.'

She turns to regard the body on the gurney, so frail and gentle in death, and sighs.

'It was his only chance,' she says. 'He was going to die either way. But... I'm sorry you had to see that, Marid. I really am.'"	{cavala-redendead-mask2, cavala-redendead-ifonly, cavala-redendead-sawlight, cavala-redendead-whatnext}
cavala-redendead-sawlight	true	true	"'At the moment he died, I had a strange vision...'"	 "'At the moment he died, I had a strange vision. It was... it was...'

You try to recall the strange sensation you experienced, but it fragments and swims away, and lingers at the edge of your consciousness where you can find no purchase. What words could describe that weightless moment?

'It was...' you flounder, 'it was...'

Doctor Cavala watches you intently. 'People see many strange things at the moment of death, Marid. Especially when the animus escapes untethered. You studied such reactions in the Physicians['] College, did you not?'

'This was different,' you insist.

'It's been a long day,' she replies. 'Take a moment to collect your thoughts. Talk to me again tomorrow when you are certain.'

You lower your eyes. 'Yes, Doctor.'"	{cavala-redendead-mask2, cavala-redendead-ifonly, cavala-redendead-catholicon, cavala-redendead-whatnext}
cavala-redendead-whatnext	true	false	"'What happens next?'"	"'What happens next?'

[if the player is wearing the surgical mask]'You can begin by taking off your mask,' she reminds you. 'We won't be operating on a cadaver any time soon.'

You sigh and pull off your mask. 'But what happens next?'

[end if]'It's a unique situation, to be sure.' Doctor Cavala [if the player is wearing the surgical mask]takes the mask from you and [end if]begins to pace around the gurney. 'For any other disease, our course would be straightforward. Log the death. Inform the family. Check for symptoms. Do our best to contain the contagion. Easier said than done, but at least it would be straightforward.

'Now Reden has died of an illness I cannot identify. And I've seen a lot of illnesses, Marid.' She studies her gloved hands, stained black with blood.  'In the morning I will reference the [italic type]Alchemical Library of Fluids[roman type] and contact my colleagues for help... but we must be prepared for the possibility that we are dealing with an unknown affliction.

'For now, we proceed with caution.' She gives you a curt nod. 'After you clean up the surgery room, Marid, you may retire for the night. You've been a good assistant. As for myself... I will begin on the paperwork, and on the task of moving the body to the mortuary.'"	{cavala-redendead-goodbye, cavala-redendead-help}
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

Instead of switching off the lamps during Reden's Surgery, say "But a surgery is in progress."

Instead of going from the Surgery Room during Reden's Surgery, say "Doctor Cavala has not given up hope, and neither should you."

Instead of doing anything other than examining to Reden during Reden's Surgery, say "You can't disturb the patient at this critical juncture."
Instead of doing anything when the second noun is Reden during Reden's Surgery, say "You can't disturb the patient at this critical juncture."

Instead of doing anything other than examining to Doctor Cavala during Reden's Surgery, say "You can't disturb Doctor Cavala, not now."
Instead of doing anything other than giving something to something when the second noun is Doctor Cavala during Reden's Surgery, say "You can't disturb Doctor Cavala, not now."

Book 3.3 - Clinic

The Clinic is a proper-named room. "[if time is not critical]Doctor Cavala's clinic is a small, unostentatious affair, neatly organized with little in the way of decoration. [end if]A row of chairs faces the prescription counter, where the medication and patient records are sorted in gridlike pigeonholes[if time is not critical]; f[otherwise]. F[end if]urther on is the consulting study, home to a desk strewn with notes and diagrams.

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
The description is "[if Nine to Five Zombie is happening]The chairs are empty.[otherwise]They're for waiting patients to sit on."
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
Instead of opening the money drawer, say "You are many things, Marid, but you are not a thief."

The small brass handbell is scenery on the prescription counter.
The description is "A small brass handbell. You know its sound all too well."
Understand "bell" or "clapper" as the handbell.
Instead of listening to or swinging the handbell, say "You have already heard it ring countless times, and you aren't inclined to listen to it again."
Instead of searching the handbell, say "Inside the bell is its clapper."
Instead of taking the handbell, say "You see little point in removing it from the counter."

The view of the surgery room is faraway scenery in the Clinic.
Instead of doing anything when the current action involves the view of the surgery room, say "You can't perceive much of the surgery room from here."

Chapter 3.3.1.1 - Consulting Study

The consulting study is scenery in the Clinic.
The description is "[if Nine to Five Zombie is happening]Doctor Cavala is not in her study.[otherwise]Named so because it is used for study and consultation."
Before entering the consulting study, try entering Doctor Cavala's armchair instead.

Doctor Cavala's armchair is an enterable scenery supporter in the Clinic.
The description is "[if Nine to Five Zombie is happening]Doctor Cavala's armchair is empty.[otherwise]It looks comfortable."
Instead of taking, pushing, pulling, or turning Doctor Cavala's armchair, say "You don't think Doctor Cavala would appreciate that."
[Doctor Cavala is technically not in her armchair, so we can show her initial appearance. But we want the game to behave in all other respects as though she is.]
Instead of entering the armchair when Doctor Cavala is in the Clinic, say "Doctor Cavala is already in the armchair."
Instead of putting anything on the armchair when Doctor Cavala is in the Clinic, say "Doctor Cavala is already in the armchair."
Report entering the armchair: say "You sit in the armchair."; stop the action.
Report getting off the armchair: say "You stand up."; stop the action.

The consulting-study desk is a scenery supporter in the Clinic. The printed name is "desk in the consulting study".
The description is "Doctor Cavala's notes are laid out in neat stacks."
Understand "desk in the consulting study" or "consulting/study desk" or "consulting study desk" as the desk.

There is some plural-named scenery on the desk called Doctor Cavala's notes and diagrams.
The description is "Studies of human, goblin, and mutant anatomy; musings on possible contagion vectors; comparisons between ailments with similar symptoms."
Understand "note" or "diagram" or "studies" or "anatomy" or "musings" or "comparisons" or "possible" or "contagion" or "vectors" or "ailments" or "similar" or "symptoms" as the diagrams.
Instead of searching the diagrams, say "It's all way over your head."
Instead of looking under or taking the diagrams, say "You shouldn't interfere with Doctor Cavala's work."

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

cavala-wh-forgot-quipped is a truth state that varies. cavala-wh-forgot-quipped is false.
cavala-wh-goodnight-quipped is a truth state that varies. cavala-wh-goodnight-quipped is false.

Rule for writing a paragraph about Doctor Cavala during Walking Home in Darkness:
	if the location was the West End:
		if cavala-wh-forgot-quipped is false:
			say "Doctor Cavala raises an eyebrow when she notices you. 'Forgot something?'";
			now cavala-wh-forgot-quipped is true;
		otherwise:
			say "Doctor Cavala glances at you before returning to her paperwork.";
	otherwise:
		say "Doctor Cavala is at her desk, engrossed in paperwork[if the location was the Surgery Room]. As you emerge from the surgery room, she glances up and gives you a nod[end if].";

Instead of talking to Doctor Cavala during Walking Home in Darkness:
	if cavala-wh-forgot-quipped has been true for only one turn:
		say "'I'm just checking,' you reply.

She shrugs and returns to her paperwork.[line break]";
	otherwise if cavala-wh-goodnight-quipped is false:
		say "'Good night, Doctor Cavala.'[paragraph break]'Good night, Marid,' she replies. 'Don't stay up too late.'";
		now cavala-wh-goodnight-quipped is true;
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
Instead of searching the consulting study during Nine to Five Zombie, say "Doctor Cavala is not in her study."
Instead of searching the prescription counter during Nine to Five Zombie, say "Doctor Cavala is not behind the counter."

Instead of listening to or swinging the handbell during Reden's Autopsy, start a dialogue with Doctor Cavala.

Chapter 3.3.5.2 - Clinic during Returning to a Break-In

Instead of going to the Clinic when Returning to a Break-In is happening and Carnicer is not in the Clinic (this is the block approaching the Clinic during Returning to a Break-In rule):
	say "[path-walked so far][line break]".
	
Instead of searching the clinic door during Returning to a Break-In, say "You can't see much."
Instead of listening to the clinic door during Returning to a Break-In, say "You can't hear much."
Instead of closing the clinic door during Returning to a Break-In, say "This is not the time."
	
Instead of going to the Clinic when Returning to a Break-In is happening and Carnicer is in the Clinic (this is the Returning to a Break-In cutscene rule):
	[begin showcase build]
	clear only the main screen;
	say "[paragraph break][paragraph break][paragraph break][paragraph break]";
	center "T O";
	say paragraph break;
	center "B E";
	say paragraph break;
	center "C O N T I N U E D";
	wait for any key;
	clear only the main screen;
	end the story saying "Thanks for playing";
	rule fails;
	[end showcase build]
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
	say "You lunge at the assassin and she spins around. ";
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
	say "and Doctor Cavala comes up the stairs with a flying tackle that sends the assassin staggering into the waiting chairs. In three steps she is reaching under the counter -- but the assassin is quicker -- her blade faster -- blood spatters the floor -- Doctor Cavala cries out -- a blur of motion -- and there is a flash and thunder echoes from the walls.[paragraph break]";
	now Doctor Cavala is incapacitated;
	wait for any key;
	say "The assassin clutches at her face. Doctor Cavala raises the cutter and pulls the trigger again and lightning arcs, misses by inches.[paragraph break]";
	wait for any key;
	say "'Get the fuck out of my clinic,' she growls.[paragraph break]";
	wait for any key;
	say "A rush of wind. The assassin is gone. You whirl around and see only a dark shape disappearing into the coming night.[paragraph break]";
	wait for any key;
	say "Doctor Cavala takes a deep breath. Stifles a cry.

'Marid,' she says. 'My leg.'[paragraph break]";
	now Carnicer is nowhere;
	wait for any key;
	say "She's slumped onto the floor, her chest rising and falling. A gash has been torn just above her left knee. Her entire trouser leg is stained red.";
	start a dialogue with Doctor Cavala using dialogue cavala-firstaid-home.

Chapter 3.3.5.4 - First Aid on Cavala

[This is a multi-step procedure similar to Reden's surgery.

0. Doctor Cavala is already lying on the ground and has checked the wound for debris.

1. Immediately bandage the wound tightly.

2. Apply tourniquet.

3. Raise her leg.

4. Put ice on it.]

Section 3.3.5.4.1 - Cavala First Aid Dialogue

Some dialogue branches are defined by the Table of Cavala First Aid Dialogue.

Table of Cavala First Aid Dialogue
dialogue branch	enabled	one-shot	prompt	description	choices
cavala-firstaid-home	true	false	""	""	{cavala-firstaid-doctor, cavala-firstaid-ohprimes}
cavala-firstaid-doctor	true	false	"'Doctor...!'"	""	{}
cavala-firstaid-ohprimes	true	false	"'Oh Primes...'"	""	{}

Section 3.3.5.4.2 - Setting the Scene

Rule for writing a paragraph about Doctor Cavala during First Aid on Cavala:
	say "Doctor Cavala is lying on the floor in pain.";
	
Instead of examining Doctor Cavala during First Aid on Cavala: [If for some reason we've never examined Doctor Cavala, this bypasses the suspense-killing initial description of her.]
	say "Insert description here."
	
The galvanic cutter is a thing.
The description is "It looks like Doctor Cavala kept a little something from her days as an army surgeon."
The scent is "You can still detect the faint smell of ozone."
Understand "lightning" as the galvanic cutter.

When First Aid on Cavala begins (this is the spawn the galvanic cutter rule):
	now the galvanic cutter is carried by Doctor Cavala.

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

After going through the mortuary stairs while the player is staid: say "[if the location was the Clinic]You descend the steps into shadow...[paragraph break][otherwise]You emerge from the darkness of the mortuary...[paragraph break]"; continue the action.

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
Instead of examining the mortuary slab, say "It's a dais for cadavers to be laid on. Reden's body and organs are presently occupying it."
Instead of entering the mortuary slab, say "[if Day One is happening]You shouldn't disturb Doctor Cavala while she's performing the autopsy.[otherwise]There's no need for that."
Instead of putting something on the mortuary slab, say "Reden's body is already occupying the slab."

Some labeled niches are a scenery container in the Mortuary.
The description is "For each niche, a body."
Understand "niche" as the labeled niches.
Instead of entering the labeled niches, say "You aren't dead yet, Marid."
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

Doctor Cavala [if the location is the Mortuary]gets to her feet, [end if]wipes off her gloves[if the location is the Mortuary],[end if] and places her hand on your shoulder. 

'Don't worry,' she says, more gently. 'It's not an easy thing to go through. I remember the first time I lost a patient. [cavala-errands-introtext]"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-nightmare	true	false	"'I had a terrible nightmare...'"	"'I had a terrible nightmare,' you confide. 'I... I saw him die over and over. I saw the flames again.'

Doctor Cavala sighs. She [if the location is the Mortuary]gets to her feet, [end if]wipes off her gloves[if the location is the Mortuary],[end if] and places her hand on your shoulder.

'I'm sorry,' she says. 'It's not an easy thing to have gone through -- to have witnessed. Wounds like yours take a long time to heal. [cavala-errands-introtext]"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-rathernot	true	false	"'I'd rather not talk about it.'"	"You look down. 'I'd rather not talk about it.'

Doctor Cavala sighs. She [if the location is the Mortuary]gets to her feet, [end if]wipes off her gloves[if the location is the Mortuary],[end if] and places her hand on your shoulder.

'It's not an easy thing to go through,' she says. 'I remember the first time I lost a patient. [cavala-errands-introtext]"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}

To say cavala-errands-introtext:
	say "But I promise it will get better.'

You shake your head. 'I'll... I'll be fine, Doctor. Don't worry about me.'

After a pause, she nods and squeezes your shoulder. 'Good girl.'[paragraph break]";
	wait for any key;
	say "Then Doctor Cavala steps back, and her businesslike demeanor returns.[paragraph break]";
	wait for any key;
	say "'The order of business today is twofold,' she begins. 'As we are expecting few patients today, you aren't required to be in attendance at the counter. Instead, I need you to run an errand for me.'

'What sort of errand?' you ask.

She purses her lips. 'First, I need you to deliver the documentation of Reden's death to the basilica. Second, I need you to inform Reden's next of kin that he has passed away.' "

Table of Cavala's Errands Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
cavala-errands-documents	true	true	"'What's the procedure for delivering the documentation?'"	"'What's the procedure for delivering the documentation?'

'It's quite straightforward.' Doctor Cavala shows you a sheaf of papers. 'I've already bundled the documents and sent word to the basilica by correspondence. All you have to do is pass the bundle to the censor's office.'

You rack your memory. 'The basilica is next to the forum, right? Across the Via Terminalis bridge?'

'Correct.'"	 {cavala-errands-nextofkin, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-nextofkin	true	true	"'Where does Reden's next of kin live?'"	"'Where does Reden's next of kin live?' you ask.

Doctor Cavala frowns. 'According to my file, he has a son in Riggertown by the name of Zoiro, but I don't have an address for you. Your best bet is to look up his name in the census records. Or you could ask around in Riggertown -- I understand the goblin community is quite tightly knit.'

'Is Riggertown that shanty town down the canal?'

'It is. Turn right from the bridge and you'll see it.' She pauses. 'And another thing -- check whether anyone in Riggertown is exhibiting similar symptoms. The cause of the affliction has yet to be determined.'"	 {cavala-errands-documents, cavala-errands-youdoing, cavala-errands-onit}
cavala-errands-youdoing	true	true	"'What will you be doing?'"	"'What will you be doing?' you ask.

Doctor Cavala inclines her head at the [if the location is the Mortuary]slab[otherwise]stairs to the mortuary[end if]. 'I intend to spend today studying Reden's affliction. It is definitively not in the Alchemical Library. I've already left correspondence for Doctor Arturus, who I expect shall join me in the afternoon; in the meantime, I am compiling post-mortem observations and studying the mechanism by which Reden has died. If all goes well, we should be able to present our findings to the medical community by the end of the week.'"	 {cavala-errands-documents, cavala-errands-nextofkin, cavala-errands-onit}
cavala-errands-onit	true	false	"'I'm on it, Doctor.'"	"'I'm on it, Doctor.'

She nods and presses the bundle of documentation into your hands. 'Remember: first, deliver the documents to the basilica; second, look for Zoiro in Riggertown. Report back to me when you're done.'

'Okay.'

'I'll be [if the location is the Mortuary]here[otherwise]in the mortuary[end if] if you need anything.' She pauses. 'Take your time. Consider today a break after yesterday night.'

'Yes, Doctor.'

'Run along.'

With that, she [if the location is the Mortuary]sits down at the slab[otherwise]returns to the mortuary[end if]."	 {}

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

'Pass them to the censor's office,' she replies. 'It's in the basilica down the street, next to the forum. You can't miss it.'"	{cavala-errands2-nextofkin, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-backsoon}
cavala-errands2-nextofkin	true	false	"'Who is Reden's next of kin again?'"	"'Who is Reden's next of kin again?' you ask.

'His name is Zoiro,' she replies. 'Reden's son. Either get his address from the censor's office, in the basilica; or ask around Riggertown, down the canal from here.'"	{cavala-errands2-documents, cavala-errands2-footpath, cavala-errands2-footpath2, cavala-errands2-autopsy, cavala-errands2-vision, cavala-errands2-backsoon}
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

Via Terminalis West End is a proper-named room in Outdoors. "You stand in the terminus of the Via Terminalis, a cul-de-sac of steel spires and buildings aspiring to the heavens. [if Prologue is happening]Night has fallen, broken only by the ghostly glow of bound animii in street-lamps and shop windows. Beyond, you see the great spine of the Channelworks District, receding from the lamplight into the beginnings of rain.[otherwise]From here the street-lamps and shop windows line the great spine of the Channelworks District until, shrouded in the mists of the canal, it curves out of sight.[end if]

The white cross of Doctor Cavala's clinic is to the west[if Nine to Five Zombie has not ended];[otherwise],[end if] the dormitory block where you live lies to the north[if Prologue is happening]. The rest of the district can wait until tomorrow.[otherwise if Nine to Five Zombie is happening]. The rest of the district will have to wait until after you report for work.[otherwise], and a gap between buildings hides an alley entrance to the south. The great Via Terminalis continues to the east."
The printed name is "Via Terminalis, West End".

The simple-name is "the West End".
The sound is "You hear the murmuring of the city all around you."
The scent is "The smell of ozone mingles with the mist."
The exit reminder is "You can go west to the clinic[if Nine to Five Zombie has ended],[otherwise] or[end if] north to the dormitory block[if Nine to Five Zombie has ended], south to the crooked alley, or east along the Via Terminalis[end if]."
The going-in disambiguation is "Do you mean going north (to the dormitory block)[if Nine to Five Zombie has ended], going south (to the crooked alley),[end if] or going west (to the clinic)?"

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

Instead of going to Via Terminalis West Street during Walking Home in Darkness, say "It's dangerous to go out at night."
Instead of going to the Crooked Alley during Walking Home in Darkness, say "It's dangerous to go out at night."

The burgeoning rain is faraway scenery in Via Terminalis West End. The indefinite article is "the".
The description is "More than mist, but less than rain."
The burgeoning rain has some text called the faraway response. The faraway response is "The rain is barely there."
Understand "beginning/beginnings" or "of" as the burgeoning rain.

When Prologue ends (this is the despawn the burgeoning rain rule):
	now the burgeoning rain is nowhere.

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

Book 3.6 - Dormitory Block

The Dormitory Block is a proper-named room in Outdoors. "You have walked the grounds of this three-storey estate long enough to know it by heart. Here is the faded arch, with its years of verdigris; here are the too-small atrium and the fountain at its center. All around above are [if Prologue is happening]the lights of [end if]innumerable domiciles, linked by crumbling stairs and divided by flimsy plaster walls.

From here, you can go up to your dormitory, visit the public house to the west, or exit the building to the south."
The Dormitory Block is north of the West End.
Understand "dorm" as the Dormitory Block.

The simple-name is "the dormitory block".
The sound is "You hear the flowing of the fountain, the bustle of the public house."
The scent is "You smell cooking from the dormitory and the public house."
The exit reminder is "You can go up to your dormitory, west to the public house, or south to the Via Terminalis."
The going-in disambiguation is "Do you mean going up (to your dormitory), going west (to the public house), or going south (to the Via Terminalis)?"

Before examining up in the Dormitory Block, try examining the dormitory domiciles instead.
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
Instead of searching the atrium-fountain, say "There is nothing in the water."
Instead of taking or touching the atrium-fountain, say "You splash your face with a little water."

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
The indefinite article is "an". The printed name is "old woman".
The description is "[if Saliunca is hostile]You don't want to look at her.[otherwise]You recognize her as a fellow dormitory resident, having passed by her once or twice in the washhouse. She is feeding the pigeons breadcrumbs from the basket in her lap."
Understand "old" or "lady" or "resident" or "fellow" or "dormitory resident" as Saliunca.

Instead of attacking, burning, cutting, knocking on, pulling, or pushing Saliunca when Saliunca is hostile, say "No... that would only get you in trouble."
Instead of talking to Saliunca when Saliunca is hostile, say "You have nothing more to say to her."
Instead of touching Saliunca when Saliunca is hostile, say "You are loath to touch her."

Instead of talking to Saliunca when Saliunca is improper-named:
	now the printed name of Saliunca is "Saliunca";
	now Saliunca is proper-named;
	continue the action.

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
saliunca-greet1	true	false	"'It's nice to meet you too, Ma'am.'"	"'It's nice to meet you too, Ma'am.'

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

'Oh, you poor, poor girl,' she murmurs, laying a hand on your arm. 'It's the clinic, isn't it? I can't imagine -- oh, the things Doctor Cavala must have you do. It's no way for a young lady to live, Marid, no way for a lady to live.

'But if it's your choice, your calling--' She squeezes your arm. 'The [italic type]ars vitalis[roman type] is a very noble pursuit, Marid. Very brave. Tending to the sick, saving lives and all that--'

You tense up."	{saliunca-outburst, saliunca-havetogo}
saliunca-wrong	true	false	"'I don't believe that for a second...'"	"'I don't believe that for a second,' you say. 'The pigeons may be pests, but [italic type]poisoning[roman type] them? That's too cruel. There must be some other way.'

'Oh?' Saliunca raises an eyebrow. 'Pray tell.'

'I... I don't...' You shake your head. 'I don't know. But there must be a way. Perhaps you just aren't looking hard enough.'

'And suppose I'm right, and there isn't?' She frowns. 'You've got some nerve telling me off, young lady, when all I've heard out of you is talk. Talk won't get you anywhere. Don't tell me you're squeamish about killing a few birds -- or is that what the Physicians['] College taught you?'

You tense up."	{saliunca-outburst, saliunca-havetogo}
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

'I -- I live on the third floor,' you admit.

'Then you haven't noticed.' She sighs. 'The pigeons are everywhere, love -- a great nuisance they are making. Stealing food. Leaving their droppings about. And that's why their numbers have to be culled.

'For some peace, Marid, for some peace. You understand, don't you?' "

The home dialogue branch of Saliunca is saliunca-home1.
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

Before going west in Dormitory Block during Nine to Five Zombie, say "Doctor Cavala is at the clinic. You shouldn't keep her waiting." instead.

Chapter 3.6.4.1 - Dead Pigeons and Cleaners

The Council of Works char-golem is a thing. "The ground is littered with what must be dozens of dead pigeons. A char-golem is busy sweeping the carcasses into a bag, while a gobliness slouches beside the fountain nearby."
The description is "An animated golem comprised of cast iron. The stamp on its forehead identifies it as property of the Council of Works."
The sound is "The golem is silent."
Understand "golem" or "cast" or "iron" or "cast-iron" or "animated" or "char/chare/chore" or "stamp" as the char-golem.
Instead of attacking or cutting the char-golem, say "That hardly seems called for."
Instead of climbing the char-golem, say "You have better things to do than that."
Instead of knocking on the char-golem, say "Clank."
Instead of pushing, pulling, swinging, taking, or turning the char-golem, say "The golem is many times your weight."
Instead of talking to the char-golem, say "Golems aren't sapient. You'd sooner get a response out of a lamp-post."

Some dead pigeons are a scenery thing.
The description is "Each carcass is contorted strangely, as though frozen in an instant of convulsion."
The scent is "They are less putrefied than one might expect, perhaps due to the preservative qualities of strychnia."
Understand "corpse/corpses" or "cadaver/cadavers" or "carcass/carcasses" or "ground" or "dozen/dozens of/--" or "pigeon" as the dead pigeons.
Instead of attacking the dead pigeons, say "They are already dead."
Instead of cutting the dead pigeons, say "This is neither the time nor place for a dissection."
Instead of entering the dead pigeons, say "That seems unnecessary."
Instead of knocking on, squeezing, or touching the dead pigeons, say "They are still."
Instead of rubbing, swinging, taking, or tasting the dead pigeons, say "You can't imagine any reason you would have to do that."

The odd-job gobliness is an undescribed goblin woman.
The description is "She's dressed like an odd-job woman. The pockets of her apron are stuffed with work tools."

Instead of talking to the gobliness, say "[one of]'Good morning.'

'Morning, miss.' She tips her cap. 'Take care you don't step on one of them pigeons. Nasty business.'

You look at your feet. 'Thanks for the warning.'[or]You make some small talk, but the conversation soon peters out.[stopping]"

The odd-job gobliness wears a container called a simple apron.
Instead of examining the simple apron, say "A simple apron, spotty from years of use."
Understand "stuffed" or "pocket/pockets" as the simple apron.

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

Book 3.7 - Public House

There is a proper-named room called the Public House. "Tucked away in the shadow of the domiciles, this cozy establishment offers a retreat from the [if Prologue is happening]melancholy of the night[otherwise]bustle of the day[end if]. Other patrons are scattered at the tables, engaged in drinking and conversation, while in the corner a solitary clockwork musician plays. The door is to the east."

The simple-name is "the public house".
The sound is "Music and conversation intermingle with one another."
The scent is "The aroma of hot food reaches you."
The exit reminder of the Public House is "The only door is to the east."

Instead of buying in the Public House, say "To buy something, talk to the bartender."
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
Understand "drinks/drinking" or "supper/suppers" or "cooking" as the food.
Instead of drinking, eating, taking, or tasting the food, say "To buy something, talk to the bartender."
Instead of looking under the food, say "It's on the dining tables."

Part 3.7.4 - Serving Counter

The serving counter is a fixed in place supporter in the Public House.
Understand "stool/stools" as the serving counter.
Instead of examining the serving counter, say "It's the counter where patrons are served their food and drink. A chalkboard displays the menu."
Instead of looking under the serving counter, say "The bartender is behind the counter."
Rule for writing a paragraph about the serving counter: now the serving counter is mentioned; now the chalkboard menu is mentioned. [This is a hack to make the chalkboard menu not be described when looking, but show up when searching the counter.]

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
	
The chalkboard menu is on the serving counter.
The description is "It lists the food and drink on offer. Talk to the bartender if you'd like to buy something."
The scent is "It smells of chalk."
Understand "chalk" as the chalkboard menu.
Instead of rubbing or touching the chalkboard menu, say "The bartender would be annoyed if you wiped away the chalk."
Instead of pushing, pulling, swinging, taking, or turning the chalkboard menu, say "You don't think the bartender would appreciate that."
Instead of searching the chalkboard menu, say "To buy something, talk to the bartender."

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
Instead of setting the clockwork musician to something, say "You don't think you should interfere with the property of the public house."

The clockwork musician track number is a number that varies.
The clockwork musician track time is a number that varies.

When a scene begins (this is the initialize the clockwork musician every scene rule): 
	sort the Table of the Clockwork Musician's Repertoire in random order;
	now the clockwork musician track number is 1;
	now the clockwork musician track time is a random number from 1 to 6.

Every turn when the location is the Public House (this is the clockwork musician playing rule):
	choose row clockwork musician track number in the Table of the Clockwork Musician's Repertoire;
	if the location was not the Public House:
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
""	"[italic type]Dance, Aurora[roman type]"
""	"[italic type]Trismegistus[roman type]"
"an "	"instrumental cover of [italic type]Amesha, Amesha[roman type]"
"a "	"song you can't remember the name of"

Part 3.7.7 - Bartender

[The bartender is an NPC for Marid to confide in and get all weepy with. Originally you were able to buy food and a bottle of brandy from him as well, but they don't presently serve any function for the puzzles or the storytelling, so those sections have been commented out. I may add them in later if there's a good reason.]

The bartender is a mutant man in the Public House. "[one of]A smartly-dressed mutant[or]The bartender[stopping] is behind the counter polishing a glass[first time] -- this must be the new bartender[only].[if the location was not the Public House] He gives you a nod as you enter."
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

Some dialogue branches are defined by the Table of Bartender Dialogue.

Before talking to the bartender when the player is not on the serving counter (this is the sit down before talking to the bartender rule):
	try silently entering the serving counter;
	say "You sit down at the serving counter. [run paragraph on]".

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
bartender-dialogue-confide	true	true	"<Get something off your mind.>"	"Your mind wanders to the things you've seen; the things you've done."	{bartender-dialogue-prologue, bartender-dialogue-finishdrinksilent}
bartender-dialogue-prologue	true	true	"'I watched a man die[if Prologue is happening]tonight[end if]...'"	"'I watched a man die[if Prologue is happening] tonight[otherwise], you know[end if],' you say quietly. 'It was just [if Day One is happening]yesterday[otherwise]around the corner[end if]. In Doctor Cavala's clinic.'

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
bartender-dialogue-finishdrink	true	false	"<Finish your drink.>"	"You down the last of your wine.

'Thanks for listening.'

The bartender takes the empty glass, and you feel a little better for having confided in him."	{bartender-dialogue-tip, bartender-dialogue-goodbye}
bartender-dialogue-finishdrinksilent	true	false	"<Finish your drink in silence.>"	"The bartender takes the empty glass with an understanding nod."	{bartender-dialogue-tip, bartender-dialogue-goodbye}
bartender-dialogue-tip	true	true	"<Tip the bartender.>"	"You tip the bartender and he bows."	{bartender-dialogue-goodbye}
bartender-dialogue-nevermind	true	false	"'Actually, never mind.'"	"'Actually, never mind.'

You stand up. The bartender shrugs and goes back to his business."	{}
bartender-dialogue-goodbye	true	false	"'See you soon.'"	"'See you soon.'

You stand up. The bartender goes back to his business; you suppose you should as well."	{}

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

The home dialogue branch of the bartender is bartender-dialogue. 
Before reading out bartender-dialogue-newguy: now the enabled of bartender-dialogue-business is true.
[After reading out bartender-dialogue-buybrandy: now the player carries the bottle of brandy.]
After reading out bartender-dialogue-goodbye: try silently getting off the serving counter.
After reading out bartender-dialogue-nevermind: try silently getting off the serving counter.

[When a scene (called the new scene) begins (this is the refresh drink-ordering dialogue every day rule):
	if the new scene is Day One or the new scene is Day Two or the new scene is Day Three:
		[now the enabled of bartender-dialogue-buyfood is true;]
		now the enabled of bartender-dialogue-drink is true;
		now the enabled of bartender-dialogue-tip is true.]
		
Instead of talking to the bartender when the enabled of bartender-dialogue-name is false and the enabled of bartender-dialogue-newguy is false and the enabled of bartender-dialogue-business is false and the enabled of bartender-dialogue-drink is false (this is the no bartender dialogue right now rule):
	say "You don't need anything from the bartender at present."

[Part 3.7.7 - Bottle of Brandy

The bottle of brandy is a thing. The description is "It's the bottle of brandy you bought from the public house."

Instead of closing the bottle of brandy, say "It's already closed."
Instead of emptying the bottle of brandy into something, say "That would be a waste of good brandy."
Instead of emptying the bottle of brandy into the bar and kitchen, say "Even if you were planning on drinking the brandy, this liquor is far too strong for you."
Instead of emptying the bottle of brandy into the antiseptic cloth, say "The cloth is already antiseptic enough."
Instead of opening the bottle of brandy, say "[if time is critical]This is not the time.[otherwise]You open the bottle of brandy and check its contents. Nothing seems to be out of the ordinary, so you close the bottle again."
Instead of searching the bottle of brandy, say "The bottle is filled with brandy."
Instead of smelling the bottle of brandy, say "[if time is critical]This is not the time.[otherwise]It smells very strongly of alcohol."
Instead of drinking or tasting the bottle of brandy, say "[if time is critical]Bad idea.[otherwise]Even if you were planning on drinking the brandy, this liquor is far too strong for you."
Instead of swinging the bottle of brandy, say "[if time is critical]This is not the time.[otherwise]You shake the bottle to stir up the brandy."]

Part 3.7.8 - Public House during Nine to Five Zombie

Instead of approaching the Public House when Nine to Five Zombie is happening, say "Doctor Cavala is at the clinic. You shouldn't keep her waiting."

Book 3.8 - Marid's Dormitory

Marid's Dormitory is a proper-named room. "[if time is not critical]Though this space of yours is small, you have done your best to furnish it with the comforts of home. [end if]In one corner is a dressing table, piled with stationery and assorted toiletries, and in another is the kitchenette. The only door leads back downstairs to the atrium."
Understand "my" or "own" or "house/home/room/dorm/domicile" as Marid's Dormitory. 

The simple-name is "your dormitory".
The sound is "[if time is critical]Your heartbeat hammers in your ears.[otherwise]The muffled sounds of adjoining domiciles can be heard through the walls."
The scent is "[if time is critical]You take a deep breath.[otherwise]Your room smells clean enough."
The exit reminder is "[if time is critical]You're not going to be escaping through a wall.[otherwise]You can take the stairs down to the atrium."

Before examining north in Marid's Dormitory, try searching the dormitory window instead.
Before examining down in Marid's Dormitory, try searching the dormitory window instead.
Before examining outside in Marid's Dormitory, try searching the dormitory window instead.

Before going outside in Marid's Dormitory, try going down instead.
	
Part 3.8.1 - Scenery

The high-rise buildings, the plaster walls, and the sky are in Marid's Dormitory.

Instead of listening to the plaster walls in Marid's Dormitory, say "[if time is critical]You don't have time for that.[otherwise]The muffled sounds of adjoining domiciles can be heard through the walls."

Part 3.8.2 - Dormitory Room Door

The dormitory room door is a scenery door. The dormitory room door is above the Dormitory Block and below Marid's Dormitory. The printed name is "door to your dormitory room".
The description is "A simple wooden door."
Understand "my" or "marid's" or "to" or "simple" or "wooden" or "dorm" as the dormitory room door.
Understand "exit" as the dormitory room door when the location is Marid's Dormitory.

Instead of knocking on the dormitory room door, say "[if time is critical]This is not the time.[otherwise if the location is Marid's Dormitory]What an odd idea.[otherwise]You live alone; there's no need to knock."
Instead of searching the dormitory room door, say "[if time is critical]You don't have time for that.[otherwise if the location is Marid's Dormitory]You peer around outside, but find nothing of interest.[otherwise]You'd have to go in to take a closer look."

Part 3.8.3 - Dressing Table

[The dressing table is for color. I may put other relevant things on the dressing table, such as a letter opener or something, if a puzzle requires it.]

The dressing table is a scenery supporter in Marid's Dormitory.
The description is "You have little need for vanity, and so use the dressing table as a writing desk. A mirror and some delicate drawers are the only concession to its original purpose."
Understand "vanity" or "writing" or "desk" as the dressing table.
Before examining the dressing table when time is critical, try searching the dressing table instead.

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
Instead of taking the folded clothing, say "[if time is critical]That will only slow you down.[otherwise]You don't need a change of clothes right now."
Instead of pulling, pushing, or turning the folded clothing, say "That won't accomplish anything."
Instead of rubbing or smelling the folded clothing, say "[if time is critical]This is not the time.[otherwise]It's freshly laundered."

Before going from Marid's Dormitory when the delicate drawers are open and time is not critical (this is the Marid is OCD enough to close her drawers rule):
	say "(first closing the drawers)";
	now the delicate drawers are closed;
	continue the action.

Part 3.8.4 - Kitchenette

[The kitchenette is here mainly for color, because it makes sense that the dormitory domicile would come with facilities for cooking. The stove and cold closet help with worldbuilding and hint at Marid's pyrophobia. I have no plans to use them as part of a puzzle right now, but that may change. If they end up being umimportant, I should put something in the cold closet, like medication or something, so it doesn't seem like Marid has a random empty fridge.]

The kitchenette is scenery in Marid's Dormitory.
The description is "[if time is critical]You see nothing that will help you.[otherwise]You are a more diligent disciple of the [italic type]ars vitalis[roman type] than the [italic type]ars coquinae,[roman type] and so the hooks here are bare. Nevertheless, the kitchenette is equipped with a stove and a cold closet."
Instead of entering the kitchenette, say "There is no space to sit there."
Instead of searching the kitchenette, say "A stove and a cold closet are the only things of note."

The kitchen hooks are scenery in Marid's Dormitory.
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
Instead of knocking on or touching the flameless stove, say "You would burn your hand if you did that."
Instead of searching the flameless stove, say "[if time is critical]This is not the time.[otherwise]Nothing is inside."

[Check inserting something into the flameless stove (this is the can't put most things in the stove rule):
	say "[if time is critical]You don't have time for that.[otherwise]No; the heat would damage [the noun].";
	stop the action.]
	
The cold closet is an openable closed scenery container part of the kitchenette.
The description is "[if time is critical]That won't help you right now.[otherwise]A simple wooden closet, internally cooled by glyphs that siphon heat from it to the stove." Understand "icebox" or "fridge" or "refrigerator" or "ice" or "empty" or "box" or "cream" or "ice-cream" or "jar/jars" as the cold closet.
Instead of searching the cold closet, say "[if time is critical]This is not the time.[otherwise]Nothing in there but empty ice-cream jars."
Instead of touching the cold closet, say "[if time is critical]This is not the time.[otherwise]It's cold to the touch."

Instead of opening the flameless stove, say "[if time is critical]That won't help you right now.[otherwise]You don't need to cook anything at the moment.[end if]".
Instead of inserting something into the flameless stove, say "What a strange notion."
Instead of opening the cold closet, say "[if time is critical]That won't help you right now.[otherwise]You aren't hungry.[end if]".
Instead of inserting something into the cold closet, say "What a strange notion."

Part 3.8.5 - Marid's Bed

Marid's bed is a privately-named enterable fixed in place supporter in Marid's Dormitory. "[if time is critical]Moonlight streams through the window above your bed.[otherwise]Your bed is at the end of the room, beside the window."
The printed name is "your bed".
The description is "[if time is critical]You could easily climb out the window using your bed as a step.[otherwise]It looks warm and inviting."
Understand "my" or "marid's" or "bed" or "bedding" or "mattress" as Marid's bed.

Instead of bed-making Marid's bed, say "[if time is critical]This is not the time.[otherwise if Walking Home in Darkness is happening]It's usual to make one's bed [italic type]after[roman type] one has slept in it.[otherwise]Your bed is already made."
Instead of entering Marid's bed, try sleeping.
Instead of pushing, pulling, or turning Marid's bed, say "[if time is critical]You can't possibly move any of the furniture in time.[otherwise]There's no need to rearrange the furniture."
Instead of knocking on or touching Marid's bed, say "[if time is critical]This is not the time.[otherwise]The mattress is soft and springy."
Instead of searching or looking under Marid's bed, say "[if time is critical]There is nowhere to hide.[otherwise]There is nothing but dust under the bed."
Instead of rubbing or smelling Marid's bed, say "[if time is critical]This is not the time.[otherwise]The bedding is still quite clean."

Part 3.8.6 - Dormitory Window

[Eventually, Marid is going to have to abscond through this window for Midnight.]

The dormitory window is an open unopenable scenery door. It is north of Marid's Dormitory and south of the Placeholder Chase Area.
The description is "It's a simple square opening without a pane or a grille. A shadowed rooftop can be seen through it."
The sound is "[if time is critical]This is not the time.[otherwise]You hear the murmuring of the city."
The scent is "[if time is critical]This is not the time.[otherwise]Though you can't see the abandoned mill from here, a trace of its ash lingers in the air."
Understand "dorm" as the dormitory window.
Before climbing the dormitory window, try entering the dormitory window instead.
Instead of searching the dormitory window, say "You can see little except the view of the rooftop."
Instead of knocking on or touching the dormitory window, say "There's no pane or grille in the window."

Before going through the dormitory window when Midnight is not happening, say "[if Midnight has not happened]There might one day be an extraordinary situation when you would consider braving the fall. Today is not that day.[otherwise]The memories are still fresh. You have no desire to relive them." instead.

The view of the shadowed rooftop is faraway scenery in Marid's Dormitory.
The description is "It might be the roof of one of the condemned buildings north of here."
Understand "roof" or "condemned" or "condemned building" as the rooftop view.
Before entering the rooftop view, try entering the dormitory window instead.

Part 3.8.7 - Housekeeping

[Before going from Marid's Dormitory while time is not critical (this is the tidy up the house before going rule):
	tidy up the house.
	
Before sleeping in Marid's Dormitory while time is not critical (this is the tidy up the house before sleeping rule):
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

Part 3.8.8 - Marid's Dormitory during Prologue

Chapter 3.8.8.1 - Go to Sleep, Marid

sleeping-reminder-shown is a truth state that varies. sleeping-reminder-shown is false.

 Before reading a command when the player is in Marid's Dormitory and sleeping-reminder-shown is false (this is the trigger the Prologue sleeping reminder rule):
	say "You feel tired. Weary.[paragraph break]";
	now sleeping-reminder-shown is true.

First instead of sleeping in Marid's Dormitory during Walking Home in Darkness (this is the sleeping in Marid's bed rule):
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
	now yourself is in Marid's Dormitory;
	now Marid's bed is described;
	say "Far off, the bells continue to ring: four, five, six, seven. Seven in the morning. You're lucky you haven't overslept. You quickly get dressed and run through your morning routine -- Doctor Cavala will be waiting for you at the clinic."
	
Part 3.8.9 - Marid's Dormitory during Day One

Instead of listening to Marid's Dormitory during Nine to Five Zombie, say "The bells have stopped ringing."

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

'Well, the footpath is closed at the moment, Miss, so I'd advise waiting until tomorrow if you have business in Riggertown.' He scratches his chin. 'The only other way is through the Shanty Quarter, and that's no place for a lady like you to be. No offense, of course.'

'I see,' you say. 'You've been a big help.'[or]'Have you seen anything interesting lately?' you ask one of the guards.

'Not that I can tell,' she replies. 'But don't worry, Miss. You'll be safe with us around.'[or]You shouldn't bother the guards too much. They have a job to do, after all.[stopping]".

Chapter 3.9.3.2 - Despawning the Guards on the Thoroughfare

When Cavala's Errands ends (this is the despawn Horatio and the guards at the end of Cavala's Errands rule):
	now Horatio is nowhere;
	now the guards on the thoroughfare are nowhere.

Chapter 3.9.3.3 - Horatio during Day One

Horatio is in the West Street.

Rule for writing a paragraph about Horatio during Day One (this is the we already mentioned Horatio with the guards during Day One rule):
	now Horatio is mentioned.
	
Before knocking on, squeezing, or touching Horatio during Day One, try talking to Horatio instead.

Instead of talking to Horatio when Day One is happening and the enabled of horatio-dayone-intro is false, say "You shouldn't. Any more chat and he'll be told off for shirking duty."
	
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

The bridge cleaning crew is a faraway scenery thing.
The description is "It's almost as though events conspire to make your life difficult."
The sound is "The crew sounds tired and exasperated."
Understand "spill" or "of" or "dangerous" or "caustic" or "alkali" or "blockage" or "exterminator/exterminators" or "demijohn/demijohns" as the bridge cleaning crew.

When Returning to a Break-In begins (this is the spawn the bridge cleaning crew rule):
	now the bridge cleaning crew is in the West Street.
	
When Returning to a Break-In ends (this is the despawn the bridge cleaning crew rule):
	now the Via Terminalis Bridge is goto-passable;
	now the bridge cleaning crew is nowhere.

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

Chapter 3.12.2.1 - Exterminators and the Cordon

Some exterminators are a hostile mixed-race man in Following the Canal. "[if exterminators-profession-known is false]Some civic work appears to be[otherwise]An extermination is[end if] in progress here[first time], much to your dismay[only]. Men in work coats guard an open manhole, and the way to Riggertown is completely cordoned off."
The printed name is "[if exterminators-profession-known is true]exterminators[otherwise]workmen".
The description is "[one of]Upon closer examination, t[or]T[stopping]he men are professional exterminators from Ciccus's Hunting Company. They sport armored coats and rank insignia, and they bear hoses hooked up to reinforced demijohns."
Before smelling the exterminators, try smelling the dangerous alchemical apparatus instead.
Understand "exterminator" or "in work/-- coat/coats" or "workman/workmen" or "civic" or "work" as the exterminators.
Instead of attacking or cutting the exterminators, say "That seems more likely to land you in prison than in Riggertown."
Instead of kissing or squeezing the exterminators, say "[one of]You give the nearest of the men a peck on the cheek, but he remains unmoved. 'I'm flattered, Miss,' he says, 'but I can't let you through.'[or]You've already tried that.[stopping]".
Instead of giving the purse to the exterminators, say "You don't have nearly enough money on you for a bribe."

exterminators-profession-known is a truth state that varies.
After examining or talking to the exterminators: now exterminators-profession-known is true; continue the action.

Instead of talking to the exterminators, say "[one of]'Excuse me--'

'Not now, Miss,' the foremost of the men says gruffly. 'We're investigating reports about a dangerous infestation of acidic slimes. Not to worry, you understand. We'll have this sorted out in a jiffy and be on our way.'[or]'I really need to get to Riggertown,' you say. 'Could you let me through, just this once?'

The foremost exterminator shakes his head. 'I'm afraid not, Miss. We're working with dangerous substances here. For your own safety, I can't let you past the cordon.'[or]You won't be able to persuade the men. Perhaps there's another route elsewhere.[stopping]".

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

The cordon is scenery in Following the Canal.
The description is "It doesn't look like you'll be getting through it."
Before smelling the cordon, try smelling the dangerous alchemical apparatus instead.
Before climbing or entering the cordon, try going south instead.

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
	now the cordon is nowhere;
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
Understand "electrum" or "filigree" as the annotated glyphs of locomotion.
Instead of knocking on, rubbing, or touching the annotated glyphs of locomotion, say "The glyphs thrum with power."

Some cobblestones along the bridge are scenery in the Via Terminalis Bridge. The indefinite article is "the".
The description is "The stones have been smoothed by decades of traffic."
Understand "cobblestone" or "cobble/cobbles" or "stone/stones" or "floor" or "ground" as the cobblestones along the bridge.

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
Instead of climbing, pushing, pulling, rubbing, squeezing, swinging, touching, or turning the armillary sphere, say "The rings of the sphere are moving too fast for you to touch safely."
Instead of looking under the armillary sphere, say "The armillary sphere is in the center of the inscribed rotunda."

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

The fosse is scenery in the Channelworks Concourse.
The description is "An immense water-filled moat bars access to the Channelworks."
Before listening to the fosse, try listening to the hydra-like channels instead.
Understand "moat" as the fosse.
Before entering the fosse, try swimming instead.
Instead of doing anything other than entering, examining, or listening to the fosse, say "The water is out of reach."
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
Instead of talking to the partition bridge, say "You don't know the password, if there is one."
Instead of closing the partition bridge when the partition bridge is closed, say "The bridge is already raised."
Instead of searching the partition bridge when the partition bridge is closed, say "The parts of the bridge are covered in incomprehensible glyphs."
Instead of opening, or taking the partition bridge when the partition bridge is closed, say "Yes, but how?"
Instead of pushing, pulling, squeezing, swinging, touching, or turning the partition bridge when the partition bridge is closed, say "The parts of the bridge are out of reach."

The partition bridge can be open or closed. The partition bridge is closed.

Understand "lower [something]" as opening when the location is the Channelworks Concourse.
Understand "raise [something]" as closing when the location is the Channelworks Concourse.

Instead of going north in the Channelworks Concourse when the partition bridge is closed, say "The bridge is up, and you don't know how to lower it."

Book 3.16 - Turris Infinita

There is a proper-named room called the Turris Infinita. "Mirrors cover every surface in this avant-garde tower, from the floors to the doors to the chandeliers. The porter's desk is framed in lights, while watchful gargoyles above gaze into infinity.

A hydraulic lift provides access to the upstairs domiciles. Doctor Arturus's clinic is east, and the exit is to the west."

The simple-name is "the Turris Infinita".
The sound is "It's quiet. You could hear a pin drop."
The scent is "The air is cold and sterile."
The exit reminder is "You can take the lift up to the domiciles, go east to Doctor Arturus's clinic, or leave to the west."
The going-in disambiguation is "Do you mean going up (to the domiciles) or going east (to Doctor Arturus's clinic)?"

Before examining west in the Turris Infinita, try examining the ornate double doors instead.
Before examining outside in the Turris Infinita, try examining the ornate double doors instead.
Before examining north in the Turris Infinita, try examining the hydraulic lift instead.
Before examining east in the Turris Infinita, try examining the view of Doctor Arturus's clinic instead.
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
Instead of attacking, cutting, or knocking on the innumerable mirrors, say "You would have to pay for the damage to the mirrors."
Instead of looking under the innumerable mirrors, say "They are fixed in place."
Instead of touching the innumerable mirrors, say "Your fingerprints stain the glass briefly, then evaporate without a trace."

Some elaborate crystal chandeliers are faraway scenery in the Turris Infinita.
The description is "Elaborate crystal chandeliers, suspended by invisible alchemical lines."
The elaborate crystal chandeliers have some text called the faraway response. The faraway response is "They're high out of reach."
Understand "chandelier" or "invisible" or "alchemical" or "line/lines" as the elaborate crystal chandeliers.

The porter's desk is scenery in the Turris Infinita. The indefinite article is "the".
The description is "It's difficult to imagine how anyone could work in that glare."
Understand "light/lights" or "chair" or "glare" as the porter's desk.
Instead of pushing, pulling, swinging, taking, or turning the porter's desk, say "That is fixed in place."
Instead of entering, searching, or looking under the porter's desk, say "There's only one chair, and the porter's sitting in it."

Some security gargoyles are faraway scenery in the Turris Infinita.
The description is "These gargoyles are carved with sigiled masks and lifelike wings. They are utterly unmoving, but you don't doubt they could spring to life with a word from the porter."
The sound is "The gargoyles are utterly silent."
The security gargoyles have some text called the faraway response. The faraway response is "They're high out of reach."
Understand "gargoyle" or "sigiled" or "mask/masks" or "lifelike" or "wing/wings" as the security gargoyles.
Instead of talking to the security gargoyles, say "[one of]'Hello?' you offer.

There is no response, save an exasperated sigh from the porter. 'If you require assistance, Miss, you should approach [italic type]me.[roman type] Not the gargoyles.'[or]These gargoyles don't seem like the kind for conversation.[stopping]".

Part 3.16.2 - Ornate Double Doors

Some ornate double doors are a scenery door. They are east of the Via Terminalis Junction and west of the Turris Infinita.
The description is "The doors of the Turris Infinita are as elaborate and futuristic as the rest of the building."
The sound is "[if the ornate double doors are closed]The doors block all sound.[otherwise if the location is the Turris Infinita]The sounds of the city filter in.[otherwise]Silence."
The scent is "[if the ornate double doors are closed]The doors block all scent.[otherwise if the location is the Turris Infinita]The smell of the city reaches you.[otherwise]The air within is impossibly clean."
Understand "door" as the ornate double doors.
Understand "exit" as the ornate double doors when the location is the Turris Infinita.
Instead of searching the ornate double doors, say "[if the ornate double doors are closed]The doors block all sound from the outside world.[otherwise if the location is the Turris Infinita]You see the Via Terminalis.[otherwise]The tower is lined with mirrors."

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

The hydraulic lift is scenery in the Turris Infinita.
The description is "A silvered contraption of telescoping pistons."
The sound is "The lift is not in use."
Understand "silvered" or "contraption" or "telescoping" or "piston/pistons" as the hydraulic lift.
Before entering the hydraulic lift, try going up instead.
Instead of attacking or cutting the lift, say "That seems unnecessarily sadistic."
Instead of opening, closing, switching on, or switching off the lift, say "The lift is of the automatic variety."

Part 3.16.4 - Porter

The porter is a hostile woman in the Turris Infinita. "[porter-initial-appearance]".
The description is "A hawkish woman all in white. The glare on her spectacles makes it difficult to look at her directly."
The scent is "She smells as nondescript as the rest of the entrance hall. There isn't even a hint of perfume."
Understand "spectacle/spectacles" as the porter.
Instead of attacking or cutting the porter, say "You don't think that would end well for you."
Instead of giving the bundle of documents to the porter, say "Those aren't appointment papers, and it would be inconvenient if you turned them over to the basilica with the seal broken."
Instead of giving the purse to the porter, say "You doubt your bribe will impress her, considering where she works."

Some reflective spectacles are worn by the porter.
The description is "The spectacles magnify her mirthless expression."
Understand "glasses/eyeglasses" as the spectacles.

To say porter-initial-appearance:
	if the location was not the Turris Infinita:
		say "[one of]The porter smiles coldly as you enter. 'Welcome to the Turris Infinita. Do you require assistance?' [or]'Welcome to--' The porter breaks off. 'Oh. It's you again.' [or]The porter regards you coolly and silently. [stopping]";
	otherwise:
		say "The porter regards you coolly and silently. ".
		
Part 3.16.5 - Turris Infinita during Day One

Chapter 3.16.5.1 - Porter Day One Dialogue

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

She retracts his hand and gives you a condescending look."	{porter-day1-appointment, porter-day1-visiting, porter-day1-goodbye}
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

Instead of talking to the porter when the enabled of porter-day1-visiting is false and the enabled of porter-day1-clinic is false, say "There's nothing to be gained in talking to her further."

Chapter 3.16.5.2 - Pissing Off the Porter and Getting Blacklisted

[If you mess around too much in the Turris Infinita, you get thrown out.]

Yourself can be a normal Turris Infinita guest, blacklisted by Turris Infinita security, cowed by Turris Infinita security, or cleared by Turris Infinita security. Yourself is a normal Turris Infinita guest.
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
	say "'Guards!' she calls. 'Show our guest to the door.'

Two gargoyles land to your left and right with a thud. They grab your arms and escort you out the doors, which slam behind you.";
	now the player is in the Via Terminalis Junction;
	now the ornate double doors are closed.
	
Instead of opening the ornate double doors when the player is blacklisted by Turris Infinita security (this is the blacklisted by Turris Infinita security during Day One rule):
	say "You have barely made it two steps in before the gargoyles recognize you and throw you out again.";
	now the player is cowed by Turris Infinita security.
	
Before going east in the Via Terminalis Junction when the player is cowed by Turris Infinita security, say "You don't really want to repeat that experience." instead.
Before opening the ornate double doors when the player is cowed by Turris Infinita security, say "You don't really want to repeat that experience." instead.
Before approaching the Turris Infinita when the player is cowed by Turris Infinita security, say "You don't really want to repeat that experience." instead.

When Day Two begins (this is the un-blacklist the player in the Turris Infinita rule): now the player is cleared by Turris Infinita security.

Book 3.17 - Grand Forum

There is a proper-named room in Outdoors called the Grand Forum. "This immense paved square is alive with people of all kinds: couples, merchants, buskers. There are children flying their paper kites and old men watching the clouds drift by. A brilliant mural of Furopolis and Solphos hovers at the heart of it all.

The arch of Miller's Gate rules the east, and the curving canal cradles the basilica to the west. From the northern Via Terminalis junction, the Via Mercurii splits off and travels south."
It is south of the Junction.

The simple-name is "the grand forum".
The sound is "The sounds of music and laughter fill the forum."
The scent is "You smell ice cream and flowers mingling in the mist."
The exit reminder is "You can go east to Miller's Gate, west to the basilica, north to the Via Terminalis junction, or south along the Via Mercurii."

Before buying in the Grand Forum, try talking to the traveling merchants instead.
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

Some promenading couples are undescribed mixed-race people in the Grand Forum.
The description is "You recognize them by their closeness."
The sound is "They are chatting and laughing."
The scent is "You smell perfume and cologne."
Understand "couple" or "woman/women" as the promenading couples.
Instead of talking to the promenading couples, say "It wouldn't be polite to intrude on the couples."

Some traveling merchants are undescribed mixed-race people in the Grand Forum.
The description is "Carts selling flowers, books, ice cream."
The sound is "They're peddling their wares."
The scent is "The flowers smell sweet."
Understand "cart/carts" or "flower/flowers" or "book/books" or "ice-cream/ice-creams" or "ice" or "cream/creams" or "merchant" or "wares" or "woman/women" as the traveling merchants.
Instead of talking to the traveling merchants, say "You don't have much money to spend on luxuries. Perhaps another time."

Some street buskers are undescribed mixed-race people in the Grand Forum.
The description is "[one of]You watch a ventriloquist and his irreverent dolls for a while.[or]You enjoy a spontaneous jazz rendition of [italic type]The Words I Couldn't Say[roman type].[or]You watch a bawdy puppet show about the adventures of a three-legged mutant.[or]You watch a stage illusionist perform increasingly implausible card tricks, much to her audience's delight.[or]That's enough entertainment for one day. You shouldn't keep Doctor Cavala waiting.[stopping]".
Before listening to the street buskers, try examining the street buskers instead.
The scent is "Fantastic smells abound."
Understand "busker" or "ventriloquist/ventriloquists" or "doll/dolls" or "puppet/puppets" or "stage/-- illusionist" or "card/-- trick/tricks" or "show/shows" or "woman/women" as the street buskers.
Instead of talking to the street buskers, say "The buskers are too busy for conversation."
After examining the street buskers: now ambience suppression is true; continue the action.

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
Understand "city" or "dome/domes/domed" or "perioch" or "upper" or "lower" or "spire/spires" or "row/rows" or "tiny/tinier" or "channelworks/-- district/districts" or "boundary" or "worlds" or "forum" as the depiction of Furopolis.

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

Chapter 3.17.2.1 - Newsboy

The newsboy is a human male person in the Grand Forum. "A newsboy is handing out copies of the [italic type]Libri Liberi[roman type] to passers-by."
The description is "A little human boy with ruddy cheeks and blond hair. His white cap marks him as an errand-boy for Revelaris Press."
The scent is "He smells like newspaper ink."
Understand "boy" or "errand/errand-boy" or "ruddy/-- cheek/cheeks" or "blond" or "hair" or "little" as the newsboy.
Understand "libri" or "liberi" or "newspaper/news/paper" as the newsboy when the copy of the Libri Liberi is off-stage.
Before taking the newsboy when the copy of the Libri Liberi has not been on-stage, try talking to the newsboy instead.
Instead of talking to the newsboy, say "He's too busy handing out newspapers to chat."

The white cap is worn by the newsboy.
The description is "It's a very nifty cap."

Instead of talking to the newsboy for the first time:
	say "'Good morning,' you say.

'Morning, Miss.' He thrusts a newspaper into your hands. 'Compliments of the press.'

'Um, thanks.'";
	now the player carries the copy of the Libri Liberi.

Chapter 3.17.2.2 - Copy of the Libri Liberi

The copy of the Libri Liberi is a thing. The printed name is "copy of [if the current day is Day One]today's[otherwise if the current day is Day Two]yesterday's[otherwise]the[end if] [italic type]Libri Liberi[roman type]".
The description is "[if time is critical]The newspaper can't help you.[otherwise]The headline article reads 'DEBATE: IS ANIMUS POWER ETHICAL?' It documents the little-understood discipline of animology and the recent controversy surrounding post-mortem animus donation."
The scent is "[if the current day is Day One]The ink is still fresh.[otherwise]It smells of ink."
Understand "newspaper/news/paper" or "headline/headlines" or "article/articles" as the copy of the Libri Liberi.
Understand "today's" as the copy of the Libri Liberi when the current day is Day One.
Understand "yesterday's" as the copy of the Libri Liberi when the current day is Day Two.

Instead of searching the copy of the Libri Liberi, say "[if time is critical]This is not the time.[otherwise]You flip through the newspaper for a while, but there isn't much of interest beyond the main headline."
Instead of eating the copy of the Libri Liberi, say "[if time is critical]This is not the time.[otherwise]While the [italic type]Libri Liberi[roman type] is technically edible, it doesn't strike you as the most appropriate midday snack."

Instead of giving the copy of the Libri Liberi to someone when Day One is happening (this is the giving away the newspaper rule):
	if the second noun is a creature:
		say "There is no response.";
		stop the action;
	if the second noun is:
		-- the newsboy:
			say "The newsboy takes back the newspaper. 'Thanks for reading, Miss.'";
			now the copy of the Libri Liberi is nowhere;
		-- Doctor Cavala:
			say "'Today's newspaper? Thank you, Marid.' Doctor Cavala takes the newspaper with a prim nod before returning to her work.";
			now the copy of the Libri Liberi is nowhere;
		-- Horatio:
			say "Horatio is on duty. You'd better not.";
		-- the guards on the thoroughfare:
			say "The guards respectfully decline.";
		-- the exterminators:
			say "[The exterminators] accept the newspaper graciously. 'Thank you kindly, Miss, but we still can't let you through.'";
			now the copy of the Libri Liberi is nowhere;
		-- the porter:
			say "The porter regards you humorlessly.";
		-- the street buskers:
			say "The buskers are too busy performing.";
		-- the playing children:
			say "The children are too busy playing.";
		-- the censor:
			say "He accepts the newspaper. 'Hmm! The news! Hmm! Thank you kindly.'";
			now the copy of the Libri Liberi is nowhere;
		-- otherwise:
			say "[The second noun] accept[if the second noun is singular-named]s[end if] the newspaper graciously.";
			now the copy of the Libri Liberi is nowhere.
			
Instead of giving the copy of the Libri Liberi to someone when Day One is not happening (this is the can't give away the newspaper after Day One rule):
	if the second noun is a creature:
		say "There is no response.";
	otherwise if the second noun is friendly:
		say "You don't think [the second noun] would want an outdated newspaper.";
	otherwise:
		say "You don't see what that would accomplish.";

newspaper-was-destroyed is a truth state that varies.

Instead of attacking or cutting the copy of the Libri Liberi (this is the destroying the newspaper rule):
	say "You reduce the newspaper to a collection of scraps, which flutter away in the wind[if the newsboy is in the location]. The newsboy looks horrified[end if].";
	now the copy of the Libri Liberi is nowhere;
	now newspaper-was-destroyed is true.

Instead of dropping the copy of the Libri Liberi (this is the how to drop a newspaper rule):
	if the location is in Outdoors:
		say "The newspaper flutters away in the wind[if the newsboy is in the location]. The newsboy looks saddened[end if].";
		now the copy of the Libri Liberi is nowhere;
		now newspaper-was-destroyed is true;
	otherwise if the location is not Marid's Dormitory:
		say "You shouldn't leave the newspaper lying around here.";
	otherwise:
		continue the action.

Instead of talking to the newsboy when newspaper-was-destroyed is true:
	say "'Sorry, Miss,' he says, flinching. 'Didn't mean to hurt your feelings or nothing. I'm just the newsboy.'

'Um, no, it's fine. Really.'";
	now newspaper-was-destroyed is false.
	
Instead of going while newspaper-was-destroyed is true:
	now newspaper-was-destroyed is false.

Book 3.18 - Canalside Steps

The Canalside Steps are a proper-named room in Outdoors. "The mist of the Bilious Canal slicks this cramped and winding stairway, and the rusted railings are battered with white spray. The bustle of the bridge reverberates cascading down the steps until they sink beneath the dark rushing water."
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

The mysterious iron door is a door. "Among the moss and graffiti of the east embankment, a mysterious iron door is set into the stone."
The description is "An iron door flush with the embankment. It is dirty, but without rust, and unmarked except for a crescent-shaped window. There is no handle."
The sound is "You hear nothing beyond the door."
The scent is "There is a hint of incense from the window."
It is east of the Canalside Steps and west of the Sewer Enclave.
It is better left open.
Instead of opening or closing the mysterious iron door, say "The door has no handle."
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
Before inserting something into the crescent-shaped window, try entering the crescent-shaped window instead.

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
Instead of inserting something carried by the player into the crescent keyhole when steps-keyhole-known is true, say "[The noun] doesn't fit into the hole."

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
	otherwise if Returning to a Break-In is happening:
		say "You can't just leave town. You still have to report back to Doctor Cavala.";
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

'Dogs in a dressing room!' he splutters, sitting bolt upright. (You quickly remove yourself from the desk.) 'What was [italic type]that[roman type] for?'";
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

'Trismegistus's tits!' he splutters, sitting bolt upright. 'What was [italic type]that[roman type] for?'";
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

The censor sighs. 'Of course. Of course. Right then.' He adjusts his collar and puffs out his chest. 'Censor Provis at your service, Miss. What can I do for you today?'"	{censor-woken-documents, censor-woken-address, censor-woken-detour}
censor-woken-sorry	true	false	"'Sorry...'"	"'Sorry,' you say, a little sheepishly. 'It's just that you were asleep at your desk, and...'

The censor turns red. 'Of course, of course. Let's not speak of that. Entirely understandable. On to business.' He adjusts his collar and puffs out his chest. 'Censor Provis at your service, Miss. What can I do for you today?'"	{censor-woken-documents, censor-woken-address, censor-woken-detour}
censor-woken-documents	true	true	"'I have documents from Doctor Cavala's clinic...'"	"'I have documents from Doctor Cavala's clinic regarding the death of a Channelworks District citizen,' you say. 'A middle-aged goblin man by the name of Reden.'

You hand the bundle of documents to the censor, who regards it with an appraising eye.

'Let me see.' He breaks the seal and quickly scans the contents. 'Yes. Hmm. Unfortunate, this. Not to worry. All shall be in order...'

[wait for any key]The censor's gaze pauses on one section of the report. He reads it -- rereads it.

[wait for any key]'Hmm!' he says. 'Well excuse [italic type]me![roman type] An unknown disease? Hmm! Now this is highly irregular. Highly irregular. I will have to contact my superiors.'

[wait for any key]He puts a big red stamp on the bundle and files it away in a clattering of drawers, muttering to himself all the while. At last he pats the desk and nods with an air of self-importance.

'Very good, Miss,' he says. 'Thank you for bringing this to our attention. Now was there anything else you needed?'"	{censor-woken-address, censor-woken-detour, censor-woken-thanks}
censor-woken-address	true	true	"'I need the address of a Channelworks District citizen...'"	"'I need the address of a Channelworks District citizen. His name is Zoiro.'

The censor furrows his brow. 'Right then,' he says. 'Just a moment. Wait here, if you please.'

He gets up and vanishes into one of the side doorways of the basilica, muttering a stream of incomprehensible jargon involving coordinates and street names. You hear the sounds of wooden scroll cases being rifled through, and furtive frantic consultations among the clerks.

[wait for any key]After an appreciable wait, he emerges from the doorway flush-faced and triumphant.

[wait for any key]'Seventh on Layabout Row,' he proclaims, Upper Riggertown. Property under the name of Zoiro and Koriph. And his place of employment, which I've taken the liberty to look up, is the Riggertown Mechanistry. Here, let me write it down for you--'

[wait for any key]He scribbles on a scrap of paper, hands it to you, and sits back down at his desk looking extremely satisfied.

'There we go,' he says. 'Now was there anything else you needed?'"	{censor-woken-documents, censor-woken-detour, censor-woken-thanks}
censor-woken-detour	false	true	"'The footpath from the Via Terminalis to Riggertown is blocked...'"	"'The footpath from the Via Terminalis to Riggertown is blocked,' you say. 'Do you know if there's any other way to get to Riggertown?'

'Hm. Yes, I recall issuing the license. The footpath...' The censor's eyes light up. 'Ah! You could take Cadaver Walk -- by way of the Shanty Quarter. It's just down the Via Mercurii from here...'

He frowns. 'But come to think of it, that's rather a suspect part of town, if you get my meaning. Is it rather... [italic type]urgent[roman type] for you to get to Riggertown?'

[wait for any key]'Yes,' you say. 'Yes it is.'

'Well...' He shrugs. 'If you run into any trouble, holler for the guards. Now was there anything else you needed?'"	{censor-woken-documents, censor-woken-address, censor-woken-thanks}
censor-woken-thanks	false	false	"'Nothing, thank you.'"	"'Nothing, thank you.'

The censor beams. 'Have a good day, Miss. Per radium sophia.'

You step away from the censor's desk."	{}
censor-woken-returning	true	false	""	"You approach the censor's desk, and he looks up like a startled animal.

'Yes, Miss?' he says. 'Was there something you needed?'"	{censor-woken-address, censor-woken-detour, censor-woken-thanks}

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

[wait for any key]The fortune-teller turns over the lower course, revealing it to be another dark and disturbing illustration; but upside-down, so that you can only see a bone-white figure with a skeletal aspect to its depiction.

[wait for any key]'Ah!' he declares. 'The Ghost appears, but inverted. The dire message it brings is not heard, and the course of fate is not changed. And that brings us to our final card, the delta--'

[wait for any key]The delta is a storm at sea, heaving with rain-lashed ships and alive with forked lightning. Above all in the pitch-black sky is a terrible sphere that can only be the [italic type]Luna[roman type].

[wait for any key]The fortune-teller sets the card down.

'The Tempest,' he whispers. 'The future will be filled with change and turmoil. It could be in many years, or it could be tomorrow. And all because of a humble man who drew the wrong attention -- and was silenced.'

A long pause."	{teller-isee, teller-areyousure, teller-drivel}
teller-past1	true	false	"'I've been having nightmares...'"	"'I've been having nightmares. I've had them ever since my parents died. I thought I got over them, but... I had another one, just last night.'

The fortune-teller grows sober. 'Dreams,' he says. 'Nightmares. They show us truths that cannot be found in the daylight. If you wish to learn how to conquer them, one pattern will prove most illuminating...'

He casts his hands apart, scattering the top cards of the deck with the sudden motion, and at first you wonder if he's dropped them by accident. But when the loose cards come to rest, they have landed in an deliberate, intricate pattern -- a cross.

[wait for any key]'The corners,' he says, tapping the cards at the end of each of the four arms. 'The spokes,' he continues, moving inward in counter-clockwise fashion. 'And the nexus--' he taps the two cards in the center, one laid perpendicular over the other, and you nod transfixed.

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

Book 3.22 - Shanty Quarter

There is a proper-named room in Outdoors called the Shanty Quarter. "No words can describe this place. It is claustrophobic, oppressive, a place where light does not reach. The air is heavy with the stench of offal and waste, and other things better left unimagined -- and you are hemmed in by ropes, walled off by concrete, entombed with the walking dead.

The Via Mercurii is somewhere to the north; Cadaver Walk is somewhere to the west[if Rats' Run is visited]. Rats' Run is somewhere below you, under the manholes and the rickety beams[end if]."
It is south of the Via Mercurii.

The simple-name is "the Shanty Quarter".
The sound is "The walls echo with the sounds of laughter and tears."
The scent is "It smells horrible in here."
The exit reminder is "You can go north to the Via Mercurii[if Rats' Run is visited], down to Rats' Run,[end if] or west to Cadaver Walk."

Part 3.22.1 - Scenery

The nightmarish architecture, the slum-dwellers, and the offal are in the Shanty Quarter.

Part 3.22.2 - Shanty Quarter during Day One

When Day One ends:
	now the Shanty Quarter is goto-passable.

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
			now the Shanty Quarter is goto-impassable;
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

Book 3.23 - Cadaver Walk

There is a proper-named room in Outdoors called Cadaver Walk. "You[one of][']ve emerged out onto[or] are on[stopping] a bridge, if it can be called that: a haphazard assortment of ropes, planks, chains, warning signs, layers upon layers bound up in incomprehensible knots. Below the lines trail where they have snapped and never been repaired, and the Bilious Canal gobbles them up as they descend.

Riggertown clings tenaciously to the western embankment, while the Shanty Quarter squats to the east."
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

You can climb a ladder up to the next level, [if journal-reden-shack-known is true]visit Reden's shack[otherwise]wander among the shacks[end if] to the west, or cross the canal east by way of Cadaver Walk."
It is west of Cadaver Walk.
The printed name is "Riggertown, Lower Level". 

The simple-name is "Lower Riggertown".
The sound is "The goblins chatter; the landings creak."
The scent is "The landing smells of grease and brine."
The exit reminder is "You can go up to Upper Riggertown, west to [if journal-reden-shack-known is true]Reden's shack[otherwise]the shacks[end if], or east to Cadaver Walk."
The going-in disambiguation is "Do you mean going up (to Upper Riggertown) or west (to [if journal-reden-shack-known is true]Reden's shack[otherwise]the shacks[end if])?"

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
Before entering or searching the sheet-metal shacks when journal-reden-shack-known is false, try going west instead.
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
The sound is "It is a gentle sound they make."
Understand "windchime" or "chime/chimes" as the tinkling windchimes.
Instead of knocking on, pulling, pushing, squeezing, swinging, touching, or turning the tinkling windchimes, say "Tinkle, tinkle, go the windchimes."

The view of Reden's shack is faraway scenery.
The description is "It looks small and sad."
The sound is "It's quiet."
Before entering or searching the view of Reden's shack, try going west instead.
Instead of climbing the view of Reden's shack, say "That strikes you as highly unnecessary."

Part 3.24.2 - Riggertown Lower Level during Day One

Instead of entering, knocking on, or searching the sheet-metal shacks when Cavala's Errands in happening: say "It's embarrassing to go door to door. There must be some other way."

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

The little tin post is scenery in Riggertown Lower Level.
The description is "It's a little tin post just the right height for a goblin to sit on."
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

'...I'll pass, thanks.'

He chuckles. 'Suit yourself, girlie. You don't know what you're missing.'"	{donti-name, donti-address, donti-symptoms, donti-bye}
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

You briefly elaborate on the symptoms, and a black look comes over his face.

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
	
Instead of talking to Donti (this is the no Donti dialogue left rule):
	if the enabled of donti-greeting is false and the enabled of donti-name is false and the enabled of donti-stick is false and the enabled of donti-goldtaste is false and the enabled of donti-address is false and the enabled of donti-symptoms is false:
		say "You can't think of anything to talk about.";
	otherwise:
		continue the action.

Book 3.25 - Reden's Shack

There is a proper-named room called Reden's Shack. "This tiny hovel is visibly shabbier than the rest. The roof is uncomfortably low, and the space just a little too cramped to stand in. A pile of bedding dominates the only room, draped in dirty clothing and empty wine bottles.

The only exit is to the east."
It is west of Riggertown Lower Level. It is inside of Riggertown Lower Level.

The simple-name is "Reden's shack".
The sound is "No sound but your breathing."
The scent is "The bedding reeks."
The exit reminder is "The only exit lies east, to Lower Riggertown."

Instead of examining east in Reden's Shack, say "The exit is that way."
Instead of examining outside in Reden's Shack, say "The exit is that way."

Before going to Reden's Shack (this is the entering Reden's Shack flavor rule):
	if journal-reden-shack-known is false:
		say "One shack among the others catches your attention. You enter cautiously...";
		now journal-reden-shack-known is true;
		now the view of Reden's shack is in Riggertown Lower Level;
	otherwise:
		say "You duck into the shack...";
		
Before going from Reden's Shack (this is the leaving Reden's Shack flavor rule):
	say "You emerge from the shack...";
	
Part 3.25.1 - Scenery

An uncomfortably cramped confine is scenery in Reden's Shack.
The description is "You don't think Reden got many human visitors. Or any visitors, for that matter."
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
Instead of bed-making the pile of bedding, say "There's a time and place to be fastidious about cleanliness. This isn't it."
Instead of entering the pile of bedding, say "You aren't comfortable getting into in a dead man's bed."
Instead of taking the pile of bedding, say "You'd look like an fool lugging all these blankets around."

The dirty clothing is scenery in Reden's Shack. The indefinite article is "some".
The description is "The clothing is crumpled and dirty, but otherwise unmarked. They smell like their owner has been wading around in canal-water."
The scent is "The odor is unmistakably that of the Bilious Canal."
Understand "crumpled" as the dirty clothing.
Before removing the dirty clothing from something, try taking the dirty clothing instead.
Instead of pushing, pulling, looking under, searching, swinging, or turning the dirty clothing, say "You find nothing in the clothing, or the bedding."
Instead of rubbing the dirty clothing, say "You aren't about to do a dead man's laundry."
Instead of taking the dirty clothing, say "You can't imagine any reason to take the clothing with you."

Some empty wine bottles are scenery in Reden's shack.
The description is "The labels denote shoddy liquor, third-pressed or fourth-pressed. It's charitable to call it wine at all."
The scent is "The bottles smell bitter and pungent."
Understand "label/labels" or "liquor" or "shoddy" or "bottle" as the empty wine bottles.
Before removing the empty wine bottles from something, try taking the empty wine bottles instead.
Instead of drinking or opening the empty wine bottles, say "All of the bottles are empty. Besides, you aren't sure you'd want to drink any."
Instead of closing the empty wine bottles, say "You don't see any bottle caps."
Instead of inserting something into the empty wine bottles, say "That seems entirely unwise."
Instead of searching the empty wine bottles, say "Nothing about these bottles seems out of the ordinary."
Instead of taking the empty wine bottles, say "You don't need any of these bottles."

Part 3.25.2 - Reden's Things

[TBA. Reden doesn't leave any textual clues, but he leaves a key of some sort that is necessary to get into the Channelworks. I'll put it here when I have a better idea of what kinds of obstacles lead there.]

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
	now ambience suppression is true;
	say "It's getting dark out. The spires and factories are closing for the day.";
	now returning-breakin-riggertown-quip is false.

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

She turns and grimaces at you. 'What do you want? Make it quick. I'm busy.'[or].

'You again?' She turns and crosses her arms. 'What do you want [italic type]now?'[roman type][stopping]"	{forewoman-attitude, forewoman-lookingfor, forewoman-nevermind}
forewoman-attitude	true	true	"'Do you greet everyone like that?'"	"'Do you greet everyone like that?'

'Only the wiseacre humans,' she replies, 'who don't know how to get to the bloody point.'"	{forewoman-lookingfor, forewoman-nevermind}
forewoman-lookingfor	true	false	"'I'm looking for a man named Zoiro...'"	"'I'm looking for a man named Zoiro. [if journal-zoiro-address-known is true]I have it on good authority that he's employed here.[otherwise]Would you happen to know him by any chance?[end if]'

'[if journal-zoiro-address-known is false]Know him? I [italic type]hired[roman type] him[otherwise]Yeah, he is[end if].' The forewoman narrows her eyes. 'What's this about? He miss a payment for something?'"	{forewoman-sthlikethat, forewoman-message, forewoman-badnews}
forewoman-sthlikethat	true	false	"'Something like that.'"	"'Something like that.'

She rolls her eyes. 'That's what I thought. Bloody layabout never gets anything done. Chats with his mate when he thinks I'm not looking.' She glances at you. 'You're from the clinic, right?'

'Um, yes.'

'Good, good. He'll listen to a doctor's authority. Give him a piece of my mind for me, would you?'

[wait for any key]The forewoman leads you in a circuit around the factory floor. You find yourself before a pair of men who are hard at work assembling animus lanterns. She clears her throat and both of them look up with trepidation."	{zoiro-mechanistry-um, zoiro-mechanistry-hello, zoiro-mechanistry-whichzoiro}
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
	say "'Zoiro!' she says. 'This here lady's got a message for you. Listen up, because she's only going to say it once.'

[wait for any key]You glance at her. She inclines her head, as if to say [italic type]you're on your own now,[roman type] before turning and disappearing into the forest of assembly lines.

You're left with the two goblins, who are more than a little nonplussed. They look at you. You look at them.";
	now the forewoman is nowhere;
	now the conversational partner text is "Talking to two goblins";
	if the number of characters in the conversational partner text is greater than 14, now right alignment depth is the number of characters in the conversational partner text;
	
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

[wait for any key]'This isn't the best place,' you tell him. 'Is there a smoking room around here? Somewhere where we'll have peace and quiet?'

Zoiro licks his lips nervously. 'The... the smoking room, yeah. Come on. I'll show you. Come on, Koriph -- you too. Let's get this over with.'

[wait for any key]You are brought into a little cubbyhole of a room, past a curtain you have to stoop to go through. The odor of smoke lingers uncomfortably in the air, just on the edge of your nostrils.

[wait for any key]Zoiro sits in an armchair; Koriph sits next to him. You take a seat opposite, going over your words in your mind."	{zoiro-mechanistry-bedirect, zoiro-mechanistry-begentle, zoiro-mechanistry-beprofessional}
zoiro-mechanistry-bedirect	true	false	"<Be direct.>"	"'It's about your brother, Reden.'

Zoiro leans forward. 'Why? What happened to him?'

'He staggered into Doctor Cavala's clinic last night. He was suffering from an acute illness that Doctor Cavala couldn't identify -- and he-- he--'

[wait for any key]You look down.

'He died on the gurney.'

'He [italic type]what?'[roman type]

'I'm sorry. We couldn't save him.'

[wait for any key]Zoiro falls silent. His mouth opens, but no words emerge. And he chokes -- h[zoiro-mechanistry-followup]"	{zoiro-mechanistry-needmoment, zoiro-mechanistry-anyqns, zoiro-mechanistry-saynothing}
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

[wait for any key]Zoiro falls silent. H[zoiro-mechanistry-followup]"	{zoiro-mechanistry-needmoment, zoiro-mechanistry-anyqns, zoiro-mechanistry-saynothing}
zoiro-mechanistry-beprofessional	true	false	"<Be professional.>"	"'It's about your brother, Reden.'

Zoiro leans forward. 'Why? What happened to him?'

'Last night, during the last shift at Doctor Cavala's clinic, he staggered through the door seriously ill. His symptoms were unlike anything Doctor Cavala had ever seen.'

Zoiro's eyes widen. 'He -- he wasn't sick at all when I saw him last.'

[wait for any key]You take a breath, keep your eyes fixed on him.

'His heart and lungs had failed. He was hemorrhaging badly. We rushed him to the surgery room, but-- but--'

'--Oh Primes--'

[wait for any key]You look away.

'I'm sorry,' you whisper. 'He died on the gurney. We couldn't save him.'

[wait for any key]Zoiro falls silent. H[zoiro-mechanistry-followup]"	{zoiro-mechanistry-needmoment, zoiro-mechanistry-anyqns, zoiro-mechanistry-saynothing}

To say zoiro-mechanistry-followup:
	say "e nods, bites his lip, buries his head in his hands.

Koriph puts a hand on his shoulder.[paragraph break]";
	wait for any key;
	say "'Well,' says Zoiro at last. 'I... I shouldn't be surprised. It was bound to happen sooner or later. He was a bum. A fucking disgrace. He was going to catch something, living the way he did. But still...'

[wait for any key]He hangs his head.

'It pains me so,' he says. 'Knowing that he's gone.' "

Table of Zoiro Mechanistry Dialogue (continued)
dialogue branch	enabled	one-shot	prompt	description	 choices
zoiro-mechanistry-saynothing	true	false	"<Say nothing.>"	"You look at your feet.

[zoiro-mechanistry-neversaid]"	{zoiro-mechanistry-youokay, zoiro-mechanistry-anyqns}
zoiro-mechanistry-needmoment	true	false	"'Do you need a moment?'"	"'Do you... do you need a moment?'

Zoiro looks at you.

'Yeah,' he says. 'Yeah, I think I do.'

[wait for any key][zoiro-mechanistry-neversaid]"	{zoiro-mechanistry-youokay, zoiro-mechanistry-anyqns}

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
zoiro-mechanistry-iusmedici	true	false	"'We're dissecting his body...'"	"'We're dissecting his body,' you tell him. 'Doctor Cavala has invoked the [italic type]ius medici[roman type]--'

'The what?'

'The right of the doctor,' you explain. 'The illness that took Reden's life is unlike anything we've encountered before. We don't know how contagious it is, or who else might be at risk. We need to study the cadaver so we can identify the affliction and make sure it doesn't kill anyone else.'

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

'Come on, Koriph. Let's talk to the forewoman about my compassionate leave...'

You get up and make your way back to the Mechanistry floor. Your work here is done. It's time to go. ";
	now the enabled of bartender-dialogue-drink is true.

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

VII Layabout Row is a proper-named room in Riggertown. "This rustic little house is one of many that squat here and there along the lane. A pair of scrap-metal sculptures flank the steps to the front door. Beside it is a tarnished old pull-bell, tied with a rope that has seen better days.

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
The description is "It looks like something out of a picture-book, if picture-books were made out of sheet metal."
The sound is "[if Day One is happening]Nobody seems to be home.[otherwise]You hear Zoiro puttering around in his home."
The scent is "You smell leftovers. Something fried."
Understand "home" or "zoiro's" or "koriph's" as the rustic little house.
Before entering the rustic little house, try going west instead.

Some other houses along Layabout Row are scenery in VII Layabout Row.
The description is "These suburbs are home to the majority of the Channelworks District's goblin population."
The sound is "Doors closing, frying-pans tossing, and other sounds of mundane life."
The scent is "All of the houses here smell like rust."
Understand "suburb/suburbs" or "many" or "lane" as the other houses along Layabout Row.
Instead of entering or searching the other houses along Layabout Row, say "You don't have any business in the other houses."

Some scrap-metal sculptures are scenery in VII Layabout Row.
The description is "Twin dragons. One is painted blue, the other green."
Understand "pair" or "of" or "dragons" or "scrap" or "metal" as the scrap-metal sculptures.

The blue dragon sculpture is scenery in VII Layabout Row.
The description is "This one has its mouth open, as though threatening to swallow intruders whole."
Understand "mouth" or "painted" as the blue dragon sculpture.

The green dragon sculpture is scenery in VII Layabout Row.
The description is "This one has its claws raised, as though threatening to slice intruders apart."
Understand "claw/claws" or "painted" as the green dragon sculpture.

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
Instead of swinging the tarnished old pull-bell, say "The bell clatters noisily[if Cavala's Errands is happening], but no one answers the door[end if]."
Instead of turning the tarnished old pull-bell, say "It's a pull-bell, not a turn-bell."
Instead of tying the tarnished old pull-bell to something, say "That won't accomplish anything."
Instead of tying something to the tarnished old pull-bell, say "That won't accomplish anything."

Part 3.28.2 - Front Door of Zoiro's House

The front door of Zoiro's house is a lockable locked scenery door.
It is west of VII Layabout Row and east of Placeholder House.
The description is "The plaque on the front door informs you that this house is the residence of Zoiro and Koriph."
Understand "plaque" or "koriph's" as the front door of Zoiro's house.
Instead of searching the front door of Zoiro's house, say "The door [if the front door of Zoiro's house is open and the location is VII Layabout Row]leads into the house.[otherwise if the front door of Zoiro's house is open]leads out of the house.[otherwise]is closed."
Does the player mean doing something with the front door of Zoiro's house: it is unlikely. [As opposed to Zoiro's house.]

Part 3.28.3 - VII Layabout Row during Day One

Instead of knocking on the front door while Cavala's Errands is happening:
	say "There is no response. Zoiro must not be home at the moment.";

Book of the Rest

The Sewer Enclave is a room. 

Rats' Run is a room. It is south of the Sewer Enclave.

There is a proper-named room called the Channelworks.
It is north of the Channelworks Concourse.
Understand "building" as the Channelworks.
The simple-name is "the Channelworks building".

Arturus's Domicile is a proper-named room.
It is above the Turris Infinita.
Understand "doctor" or "arturus'" as Arturus's Domicile.
The simple-name is "Doctor Arturus's domicile".

There is a proper-named room called Arturus's Clinic.
It is east of the Turris Infinita.
Understand "doctor" or "arturus'" as Arturus's Clinic.
The simple-name is "Doctor Arturus's clinic".