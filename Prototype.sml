36, 75



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



datatype DamageType = AP | AD;
datatype Champion = Champ of string * (Abilities*int) list;

val thresh = Champ(Thresh, [(DeathSentence, 50), (DarkPassage, 30), (Flay, 55), (TheBox, 70)]);
val graves = Champ(Graves, [(EndoftheLine, 55), (SmokeScreen, 30), (Quickdraw, 20), (CollateralDamage, 80)];

datatype Champion = Champ of string * (Abilities*int*) list;

(name, [base health, ap, ad], [(ability, ap damage, ad damage, heal/shield, ap ratio, ad ratio)

datatype Champion = Champ of string * (real * real * real) list * (Abilities * real * real * real * real * real) list;
val thresh = Champ("Thresh", [560.0, 56.0, 144.0], [(DeathSentence, 0.0, 80.0, 0.0, 0.5, 0.0), (DarkPassage, 0.0, 0.0, 60.0, 0.0, 0.0),
(Flay, 0.0, 60.0, 0.0, .4, 0.0), (TheBox,  0.0, 250.0, 0.0, 1.0, 0.0)]);

fun fullBattle(Champ(name, [hp, ad, ap], [(Qability, Qapdmg, Qaddmg, Qutil, Qapratio, Qadratio), 
		(Wability, Wapdmg, Waddmg, Wutil, Wapratio, Wadratio), (Eability, Eapdmg, Eaddmg, Eutil, Eapratio, Eadratio), 
			(Rability, Rapdmg, Raddmg, Rutil, Rapratio, Radratio)]))=

	let fun abilityDamage(damage, power, apdamage, addamage, pratio, dratio) = 
		(apdamage) + ((pratio*ability)+(dratio*damage));
		
		fun utility(ap, ad, adheal, ApRatio, AdRatio) = (heal) + ((ap*ApRatio)+(ad*AdRatio));
	
		fun attack() = 
		abilityDamage(ad, ap, Qapdmg, Qaddmg, Qapratio, Qadratio) + abilityDamage(ad, ap, Wapdmg, Waddmg, Wapratio, Wadratio) +
		abilityDamage(ad, ap, Eapdmg, Eaddmg, Eapratio, Eadratio) + abilityDamage(ad, ap, Rapdmg, Raddmg, Rapratio, Radratio);
		
		fun heal() = utility(ad, ap, Qutil, Qapratio, Qadratio) + utility(ad, ap, Wutil, Wapratio, Wadratio) + 
		utility(ad, ap, Eutil, Eapratio, Eadratio) + utility(ad, ap, Rutil, Rapratio, Radratio);
		
	in attack()
	end;
	
		
		
		
		



