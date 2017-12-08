datatype Abilities = DeathSentence | DarkPassage | Flay | TheBox 
| EndoftheLine | SmokeScreen | Quickdraw | CollateralDamage
| Spellflux | RunePrison | Overload | RealmWarp
| Duskbringer | ShroudofDarkness | UnspeakableHorror | Paranoia;



datatype Champion = Champ of string * real list * (Abilities * real * real * real * real * real) list;

val thresh = Champ("Thresh", [560.0, 56.0, 144.0], [(DeathSentence, 0.0, 80.0, 0.0, 0.5, 0.0), (DarkPassage, 0.0, 0.0, 60.0, 0.0, 0.0),
(Flay, 0.0, 60.0, 0.0, 0.4, 0.0), (TheBox,  0.0, 250.0, 0.0, 1.0, 0.0)]);

val nocturne = Champ("Nocturne", [582.0, 180.0, 20.0], [(Duskbringer, 0.0, 65.0, 0.0, 0.0, 0.75), (ShroudofDarkness, 0.0, 0.0, 50.0, 0.5, 0.0),
(UnspeakableHorror, 80.0, 0.0, 0.0, 1.0, 0.0), (Paranoia, 0.0, 150.0, 0.0, 0.0, 1.2)]);


fun fullBattle(Champ(name, [hp, ad, ap], [(Qability, Qapdmg, Qaddmg, Qutil, Qapratio, Qadratio), 
		(Wability, Wapdmg, Waddmg, Wutil, Wapratio, Wadratio), (Eability, Eapdmg, Eaddmg, Eutil, Eapratio, Eadratio), 
			(Rability, Rapdmg, Raddmg, Rutil, Rapratio, Radratio)]))=

	let fun abilityDamage(damage, power, apdamage, addamage, pratio, dratio) = 
		(apdamage) + ((pratio*power)+(dratio*damage));
		
		fun utility(ap, ad, heal, ApRatio, AdRatio) = if floor(heal)=0 then 0.0 else ((heal) + ((ap*ApRatio)+(ad*AdRatio)));
	
		fun attack(_) = 
		abilityDamage(ad, ap, Qapdmg, Qaddmg, Qapratio, Qadratio) + abilityDamage(ad, ap, Wapdmg, Waddmg, Wapratio, Wadratio) +
		abilityDamage(ad, ap, Eapdmg, Eaddmg, Eapratio, Eadratio) + abilityDamage(ad, ap, Rapdmg, Raddmg, Rapratio, Radratio);
		
		fun heal(_) = utility(ad, ap, Qutil, Qapratio, Qadratio) + utility(ad, ap, Wutil, Wapratio, Wadratio) + 
		utility(ad, ap, Eutil, Eapratio, Eadratio) + utility(ad, ap, Rutil, Rapratio, Radratio);
		
	in heal(1)
	end;

fullBattle(thresh);