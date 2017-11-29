(* Kyler Dunn, Isaiah Banta/Standard
	Project Prototype :)
	
*)


datatype Abilities = DeathSentence | DarkPassage | Flay | TheBox 
| EndoftheLine | SmokeScreen | Quickdraw | CollateralDamage
| Spellflux | RunePrison | Overload | RealmWarp
| Duskbringer | ShroudofDarkness | UnspeakableHorror | Paranoia;

datatype name = Thresh | Graves | Ryze | Nocturne;

datatype Champion = Champ of name * Abilities list * int;

val thresh = Champ(Thresh, [DeathSentence, DarkPassage, Flay, TheBox], 5);
val graves = Champ(Graves, [EndoftheLine, SmokeScreen, Quickdraw, CollateralDamage], 6);
val ryze = Champ(Ryze, [Spellflux, RunePrison, Overload, RealmWarp], 8);
val nocturne = Champ(Nocturne, [Duskbringer, ShroudofDarkness, UnspeakableHorror, Paranoia], 6);

fun nametoString(Thresh) = "Thresh"
|	nametoString(Graves) = "Graves"
|	nametoString(Ryze) = "Ryze"
|	nametoString(Nocturne) = "Nocturne";

fun fight(Champ(name1, _, x), Champ(name2, _, y)) = if x=y then nametoString(name1) ^ " ties with " ^ nametoString(name2) ^ "."
														else if x>y then nametoString(name1) ^ " Wins!"
																		else nametoString(name2) ^ " Wins!";
																		
fight(thresh, ryze);
fight(nocturne, graves);
