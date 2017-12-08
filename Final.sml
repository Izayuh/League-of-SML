datatype Abilities = DeathSentence|DarkPassage|Flay|TheBox 
|EndoftheLine|SmokeScreen|Quickdraw|CollateralDamage
|Spellflux|RunePrison|Overload|RealmWarp
|Duskbringer|ShroudofDarkness|UnspeakableHorror|Paranoia|DarkFlight
|OrbofDeception|MarkoftheAssassin|Pulverize|BandageToss|FlashFrost|Disintegrate|FrostShot
|ConqueringSands|CosmicBinding|RocketGrab|Sear|WintersBite|PiltoverPeacemaker|NoxiousBlast
|Rupture|PhosphorusBomb|Decimate|CrescentStrike|InfectedCleaver|SpinningAxe|Neurotoxin|VenomousBite
|HungeringStrike|CrushingBlow|Arcanopulse|ThreeTalonStrike|SteelTempest|OmenofWar|StretchingStrike
|RazorShuriken|BouncingBomb|TimeBomb|DeadlyBloom|HuntersCall|Decoy|EyeofDestruction|BattleCry
|WindWall|OmenofPestilence|UnstableMatter|LivingShadow|SatchelCharge|Rewind|RampantGrowth|BloodScent
|NimbusStrike|ShockingOrb|AudaciousCharge|SweepingBlade|OmenofFamine|ElasticSlingshot|ShadowSlash
|HexplosiveMinefield|TimeWarp|GraspingRoots|InfiniteDuress|Cyclone|RiteoftheArcane|CrescentSweep
|LastBreath|OmenofDeath|LetsBounce|DeathMark|MegaInfernoBomb|Chronoshift|Stranglethorns|BloodThirst
|FoxFire|TwilightShroud|Headbutt|Despair|Crystallize|Incinerate|Volley|Arise|CaretakersShrine|Overdrive
|PillarofFlame|StandBehindMe|YordleSnapTrap|Miasma|FeralScream|Valkyrie|CripplingStrike|PaleCascade
|BurningAgony|BloodRush|VolatileSpiderling|BladesofTorment|Charm|CrescentSlash|TriumphantRoar|Tantrum
|Frostbite|MoltenShield|Hawkshot|ShiftingSands|MagicalJourney|PowerFist|Conflagration|Unbreakable
|NinetyCaliberNet|TwinFang|VorpalSpikes|GatlingGun|Apprehend|Moonfall|Masochism|StandAside|Cocoon
|Massacre|SpiritRush|ShadowDance|UnbreakableWill|CurseoftheSadMummy|GlacialStorm|SummonTibbers
|EnchantedCrystalArrow|EmperorsDivide|TemperedFate|StaticField|Pyroclasm|GlacialFissure|AceintheHole
|PetrifyingGaze|Feast|MissileBarrage|NoxianGuillotine|LunarRush|Sadism|WhirlingDeath|SpiderForm|HumanForm
|JawsoftheBeast|BloodHunt|PrimalHowl|CorrosiveCharge|Purge|Disdain|FearBeyondDeath
|BlindingDart|MoveQuick|ToxicShot|NoxiousTrap|WindBecomesLightning|BloodPrice
|MourningMist|DarkProcession|LastRites|EulogyoftheIsles|PortalJump|SleepyTroubleBubble|SpellThief|PaddleStar
|GardenofThornes|DeadlySpines; 

datatype Passive = Damnation|UmbraBlades|BloodWell|EssenceTheft
|TwinDisciplines|Trample|CursedTouch|Rebirth|Pyromania|Focus|ShurimasLegacy
|TravelersCall|ManaBarrier|Blaze|ConcussiveBlows|Headshot|DeadlyCadence|Carnivore
|HextechShrapnelShells|Hemorrhage|MoonsilverBlade|AdrenalineRush|WickedBlades
|EternalThirst|StoneSkin|ManaSurge|Challenge|WayoftheWanderer|UnholyCovenant|CellDivision
|ContemptfortheWeak|ShortFuse|HeightenedLearning|RiseoftheThorns|EchoingFlames|MoreSparkles|Camouflage
|Neurotoxin|GuerrillaWarfare|EternalHunger|Determination|ShepherdofSouls|TimeinaBottle|GardenofThornes;

datatype Role = Marksman | Support | Mage | Assassin | Tank | Fighter | OffTank | Devil;

datatype Build = AD | AP | Mixed | Defense;

datatype Position = Top | Jungle | Middle | Bottom; 

datatype Champion = Champ of string * Role * Build * Position * Passive * real list * 
(Abilities * real * real * real * real * real) list;

fun roleToString(Marksman) = "Marksman"
|	roleToString(Support) = "Support"
|	roleToString(Mage) = "Mage"
|	roleToString(Assassin) = "Assassin"
|	roleToString(Tank) = "Tank"
|	roleToString(Fighter) = "Fighter"
|	roleToString(OffTank) = "OffTank";

fun buildToString(AD) = "AD"
|	buildToString(AP) = "AP"
|	buildToString(Mixed) = "Mixed"
|	buildToString(Defense) = "Defense";

fun positionToString(Top) = "Top"
|	positionToString(Jungle) = "Jungle"
|	positionToString(Middle) = "Middle"
|	positionToString(Bottom) = "Bottom";

fun fullBattle(Champ(name, role, _, _, _, [hp, ad, ap], [(Qability, Qapdmg, Qaddmg, Qutil, Qapratio, Qadratio), 
		(Wability, Wapdmg, Waddmg, Wutil, Wapratio, Wadratio), (Eability, Eapdmg, Eaddmg, Eutil, Eapratio, Eadratio), 
			(Rability, Rapdmg, Raddmg, Rutil, Rapratio, Radratio)]), Champ(name2, role2, _, _, _, [hp2, ad2, ap2], 
			[(Qability2, Qapdmg2, Qaddmg2, Qutil2, Qapratio2, Qadratio2), 
		(Wability2, Wapdmg2, Waddmg2, Wutil2, Wapratio2, Wadratio2), 
		(Eability2, Eapdmg2, Eaddmg2, Eutil2, Eapratio2, Eadratio2), 
			(Rability2, Rapdmg2, Raddmg2, Rutil2, Rapratio2, Radratio2)]))=

	let fun abilityDamage(damage, power, apdamage, addamage, pratio, dratio) = 
		(apdamage) + ((pratio*power)+(dratio*damage));
		
		fun utility(ap, ad, heal, ApRatio, AdRatio) = if floor(heal)=0 then 0.0 else ((heal) + ((ap*ApRatio)+(ad*AdRatio)));
	
		val attack1 = 
		abilityDamage(ad, ap, Qapdmg, Qaddmg, Qapratio, Qadratio) + 
		abilityDamage(ad, ap, Wapdmg, Waddmg, Wapratio, Wadratio) +
		abilityDamage(ad, ap, Eapdmg, Eaddmg, Eapratio, Eadratio) + 
		abilityDamage(ad, ap, Rapdmg, Raddmg, Rapratio, Radratio);
		
		val attack2 =
		abilityDamage(ad2, ap2, Qapdmg2, Qaddmg2, Qapratio2, Qadratio2) + 
		abilityDamage(ad2, ap2, Wapdmg2, Waddmg2, Wapratio2, Wadratio2) +
		abilityDamage(ad2, ap2, Eapdmg2, Eaddmg2, Eapratio2, Eadratio2) + 
		abilityDamage(ad2, ap2, Rapdmg2, Raddmg2, Rapratio2, Radratio2);
		
		val heal1 = utility(ad, ap, Qutil, Qapratio, Qadratio) + utility(ad, ap, Wutil, Wapratio, Wadratio) + 
		utility(ad, ap, Eutil, Eapratio, Eadratio) + utility(ad, ap, Rutil, Rapratio, Radratio);
		
		val heal2 = utility(ad2, ap2, Qutil2, Qapratio2, Qadratio2) + utility(ad2, ap2, Wutil2, Wapratio2, Wadratio2) + 
		utility(ad2, ap2, Eutil2, Eapratio2, Eadratio2) + utility(ad2, ap2, Rutil2, Rapratio2, Radratio2);

		val trade = if (hp-attack2 < 0.1) then name ^ " has slain " ^ name2 else 
			if (hp2-attack1 < 0.1) then name2 ^ " has slain " ^ name else 
			name ^ " is left with " ^ Real.toString((hp - attack2)+heal1) ^ " Health. " ^
			name2 ^ " is left with " ^ Real.toString((hp2 - attack1)+heal2);
		
	in trade
	end;
	
fun checkAbility(Abilities, Champ(name, _, _, _, _, _, [(q, _, _, _, _, _), (w, _, _, _, _, _), 
	(e, _, _, _, _, _), (r, _, _, _, _, _)])) = if Abilities=q then name ^ " has the ability." 
	else if Abilities=w then name ^ " has the ability."
	else if Abilities=e then name ^ " has the ability." 
	else if Abilities=r then name ^ " has the ability." 
	else name ^ " does not have the ability.";	
	
fun isRole(Role, Champ(name, x, _, _, _, _, _))= if Role=x then name^ " is a " ^ roleToString(Role) ^ "."
	else name ^ " is not a " ^ roleToString(Role) ^ ".";
	
fun checkRole(Champ(name, x, _, _, _, _, _)) = name ^ " is a " ^ roleToString(x) ^ ".";

fun isBuild(Build, Champ(name, _, x, _, _, _, _)) = if Build=x then name^ " should build " ^ buildToString(Build) ^ "."
	else name ^ " should not build " ^ buildToString(Build) ^ ".";
	
fun checkBuild(Champ(name, _, x, _, _, _, _)) = name ^ " should build " ^ buildToString(x) ^ " items.";

fun isPosition(Position, Champ(name, _, _, x, _, _, _)) = if positionToString(Position)= "Jungle" then 
	if Position=x then name^" should be played in the Jungle." else name^" should not be played in the Jungle." else
	if Position=x 
	then name^ " should be played the " ^ positionToString(Position) ^ " lane."
	else name ^ " should not be played in the " ^ positionToString(Position) ^ " lane.";

fun checkPosition(Champ(name, _, _, x, _, _, _)) = x;

val aatrox = Champ("Aatrox", Fighter, AD, Top, BloodWell, [580.0, 20.0, 180.0], 
[(DarkFlight, 0.0, 10.0, 0.0, 0.0, 1.10), (BloodPrice, 0.0, 50.0, 0.0, 0.0, 0.75), 
(BladesofTorment, 0.0, 75.0, 0.0, 0.0, 0.07), (Massacre, 200.0, 0.0, 0.0, 1.0, 0.0)]);

val ahri = Champ("Ahri", Assassin, AP, Middle, EssenceTheft, [526.0, 160.0, 40.0],
[(OrbofDeception, 80.0, 0.0, 0.0, 0.35, 0.0), (FoxFire, 120.0, 0.0, 0.0, 0.30, 0.0), 
(Charm, 60.0, 0.0, 0.0, 0.60, 0.0), (SpiritRush, 210.0, 0.0, 0.0, 0.25, 0.0)]);

val akali = Champ("Akali", Assassin, Mixed, Top, TwinDisciplines, [593.0, 100.0, 100.0],
[(MarkoftheAssassin, 35.0, 0.0, 0.0, 0.4, 0.0), (TwilightShroud, 0.0, 0.0, 0.0, 0.0, 0.0),
(CrescentSlash, 70.0, 70.0, 0.0, 0.6, 0.8), (ShadowDance, 50.0, 0.0, 0.0, 0.35, 0.0)]);

val alistar = Champ("Alistar", [Support, AP, Bottom], Trample, [613.0, 160.0, 40.0],
[(Pulverize, 60.0, 0.0, 0.0, 0.5, 0.0), (Headbutt, 55.0, 0.0, 0.0, 0.7, 0.0), 
(Trample, 30.0, 0.0, 0.0, 0.04, 0.0), (UnbreakableWill, 0.0, 0.0, 0.0, 0.0, 0.0)]);

val amumu = Champ("Amumu", [Tank, AP, Jungle], CursedTouch, [613.0, 160.0, 40.0],
[(BandageToss, 80.0, 0.0, 0.0, 0.7, 0.0), (Despair, 5.0, 0.0, 0.0, 0.05, 0.0),
(Tantrum, 75.0, 0.0, 0.0, 0.5, 0.0), (CurseoftheSadMummy, 150.0, 0.0, 0.0, 0.8, 0.0)]);

val anivia = Champ("Anivia", [Mage, AP, Middle], Rebirth, [480.0, 160.0, 40.0],
[(FlashFrost, 60.0, 0.0, 0.0, 0.4, 0.0), (Crystallize, 0.0, 0.0, 0.0, 0.0, 0.0),
(Frostbite, 50.0, 0.0, 0.0, 0.5, 0.0), (GlacialStorm, 120.0, 0.0, 0.0, 0.125, 0.0)]);

val annie = Champ("Annie", [Mage, AP, Middle], Pyromania, [524.0, 160.0, 40.0],
[(Disintegrate, 80.0, 0.0, 0.0, .8, 0.0), (Incinerate, 70.0, 0.0, 0.0, .85, 0.0),
(MoltenShield, 20.0, 0.0, 0.0, 0.2, 0.0), (SummonTibbers, 150.0, 0.0, 0.0, 0.65, 0.0)]);

val ashe = Champ("Ashe", [Marksman, AD, Bottom], Focus, [528.0, 20.0, 180.0],
[(RangersFocus, 0.0, 21.0, 0.0, 0.0, 0.0), (Volley, 0.0, 20.0, 0.0, 0.0, 1.0), 
(Hawkshot, 0.0, 0.0, 0.0, 0.0, 0.0), (EnchantedCrystalArrow, 300.0, 0.0, 0.0, 1.0, 0.0)]);

val azir = Champ("Azir", [Mage, AP, Middle], ShurimasLegacy, [552.0, 160.0, 40.0], 
[(ConqueringSands, 70.0, 0.0, 0.0, 0.3, 0.0), (Arise, 0.0, 0.0, 0.0, 0.0, 0.0),
(ShiftingSands, 60.0, 0.0, 80.0, 0.4, 0.0), (EmperorsDivide, 150.0, 0.0, 0.0, 0.6, 0.0)]);

val bard = Champ("Bard", [Support, AP, Bottom], TravellersCall, [535.0, 160.0, 40.0],
[(CosmicBinding, 80.0, 0.0, 0.0, 0.65, 0.0), (CaretakersShrine, 30.0, 0.0, 0.0, 0.3, 0.0),
(MagicalJourney, 0.0, 0.0, 0.0, 0.0, 0.0), (TemperedFate, 0.0, 0.0, 0.0, 0.0, 0.0)]);

val blitzcrank = Champ("Blitzcrank", [Support, AP, Bottom], ManaBarrier, [583.0, 160.0, 40.0],
[(RocketGrab, 80.0, 0.0, 0.0, 1.0, 0.0), (Overdrive, 0.0, 0.0, 0.0, 0.0, 0.0),
(PowerFist, 65.0, 0.0, 0.0, 0.0, 1.0), (StaticShield, 250.0, 0.0, 0.0, 0.2, 0.0)]);

val brand = Champ("Brand", [Mage, AP, Middle], Blaze, [520.0, 160.0, 40.0],
[(Sear, 80.0, 0.0, 0.0, 0.55, 0.0), (PillarofFlame, 75.0, 0.0, 0.0, 0.6, 0.0),
(Conflagration, 70.0, 0.0, 0.0, 0.35, 0.0), (Pyroclasm, 100.0, 0.0, 0.0, 0.25, 0.0)]);

val braum = Champ("Braum", [Support, AP, Bottom], ConcussiveBlows, [576.0, 100.0, 100.0],
[(WintersBite, 60.0, 0.0, 0.0, 0.025, 0.0), (StandBehindMe, 0.0, 0.0, 0.0, 0.0, 0.0),
(Unbreakable, 0.0, 0.0, 0.0, 0.0, 0.0), (GlacialFissure, 150.0, 0.0, 0.0, 0.6, 0.0)]);

val caitlyn = Champ("Caitlyn", [Marksman, AD, Bottom], Headshot, [475.0, 20.0, 180.0],
[(PiltoverPeacemaker, 0.0, 30.0, 0.0, 0.0, 1.3), (YordleSnapTrap, 40.0, 0.0, 0.0, 0.0, 40.0),
(90CaliberNet, 0.0, 70.0, 0.0, 0.8, 0.0), (AceIntheHole, 0.0, 250.0, 0.0, 0.0, 200.0)]);

val chogath = Champ("Chogath", [Tank, AP, Top], Carnivore, [574.0, 160.0, 40.0],
[(Rupture, 80.0, 0.0, 0.0, 1.0, 0.0), (FeralScream, 75.0, 0.0, 0.0, 0.7, 0.0),
(VorpalSpikes, 20.0, 0.0, 0.0, 0.3, 0.0), (Feast, 300, 0.0, 0.0, 0.5, 0.2)]);

val corki = Champ("Corki", [Marksman, Mixed, Middle], HextechShrapnelShells, [518.0, 100.0, 100.0],
[(PhosphorusBomb, 0.0, 75.0, 0.0, 0.5, 05), (Valkyrie, 60.0, 0.0, 0.0, 0.1, 0.0),
(GatlingGun, 0.0, 40.0, 0.0, 0.0, 0.1), (MissileBarrage, 75.0, 0.0, 0.0, 0.15, 0.20)]);

val darius = Champ("Darius", [offTank, AP, Top], Hemorrhage, [582.0, 20.0, 180.0],
[(Decimate, 0.0, 40.0, 0.0, 0.0, 1.0), (CripplingStrike, 0.0, 180.0, 0.0, 0.0, 0.4),
(Apprehend, 0.0, 0.0, 0.0, 0.0, 0.0), (NoxianGuillotine, 0.0, 100.0, 0.0, 0.0, 0.75)]);

val diana = Champ("Diana", [Mage, AP, Middle], MoonsilverBlade, [594.0, 160.0, 40.0], 
[(CrescentStrike, 60.0, 0.0, 0.0, 0.7, 0.0), (PaleCascade, 66.0, 0.0, 40.0, 0.2, 0.0),
(Moonfall, 0.0, 0.0, 0.0, 0.0, 0.0), (LunarRush, 100.0, 0.0, 0.0, 0.6, 0.0)]);

val drMundo = Champ("Dr. Mundo", [Tank, AP, Top], AdrenalineRush, [583.0, 100.0, 100.0],
[(InfectedCleaver, 100, 0.0, 0.0, 0.15, 0.0), (BurningAgony, 60.0, 0.0, 0.0, 0.1, 0.0),
(Masochism, 50.0, 0.0, 0.0, 0.3, 0.0), (Sadism, 0.0, 0.0, 150.0, 0.5, 0.0)]);

val draven = Champ("Draven", [Marksman, AD, Bottom], WickedBlades, [558.0, 20.0, 180.0],
[(SpinningAxe, 0.0, 70.0, 0.0, 0.0, 0.65), (BloodRush, 0.0, 0.0, 0.0, 0.0, 0.0),
(StandAside, 0.0, 75.0, 0.0, 0.0, 0.5), (WhirlingDeath, 0.0, 175.0, 0.0, 0.0, 1.1)]);

val elise = Champ("Elise", [Mage, AP, Jungler], SpiderSwarm, [534.0, 160.0, 40.0],
[(Neurotoxin, 40.0, 0.0, 0.0, .3, 0.0), (VolatileSpiderling, 55.0, 0.0, 0.0, 0.95, 0.0),
(Cacoon, 0.0, 0.0, 0.0, 0.0, 0.0), (SpiderForm, 0.0, 0.0, 50.0, 0.0, 0.0)]);

val zyra = Champ ("Zyra", Support, AP, Bottom, GardenofThornes, [504.0, 160.0, 40.0], 
[(DeadlySpines, 60.0, 0.0, 0.0, 0.6, 0.0), (RampantGrowth, 0.0, 0.0, 0.0, 0.0, 0.0), 
(GraspingRoots, 60.0, 0.0, 0.0, 0.5, 0.0), (Stranglethorns, 180.0, 0.0, 0.0, 0.7, 0.0)]);

val zoe = Champ ("Zoe", Mage, AP, Middle, MoreSparkles, [526.0, 160.0, 40.0], 
[(PaddleStar, 58.0, 0.0, 0.0, 0.666, 0.0), (SpellThief, 23.3, 0.0, 0.0, 13.3, 0.0), 
(SleepyTroubleBubble, 180.0, 0.0, 0.0, 1.2, 0.0), (PortalJump, 0.0, 0.0, 0.0, 0.0, 0.0)]);

val zilean = Champ ("Zilean", Support, AP, Bottom, TimeinaBottle, [504.0, 160.0, 40.0], 
[(TimeBomb, 75.0, 0.0, 0.0, 0.9, 0.0), (Rewind, 0.0, 0.0, 0.0, 0.0, 0.0), 
(TimeWarp, 0.0, 0.0, 0.0, 0.0, 0.0), (Chronoshift, 0.0, 0.0, 600.0, 0.0, 0.0)]);

val ziggs = Champ ("Ziggs", Mage, AP, Middle, ShortFuse, [536.0, 160.0, 40.0], 
[(BouncingBomb, 75.0, 0.0, 0.0, 0.65, 0.0), (SatchelCharge, 70.0, 0.0, 0.0, 0.35, 0.0), 
(HexplosiveMinefield, 56.0, 0.0, 0.0, 0.42, 0.0), (MegaInfernoBomb, 200.0, 0.0, 0.0, 0.733, 0.0)]);

val zed = Champ ("Zed", Assassin, AD, Middle, ContemptfortheWeak, [584.0, 0.0, 200.0], 
[(RazorShuriken, 0.0, 140.0, 0.0, 0.0, 1.575), (LivingShadow, 0.0, 0.0, 0.0, 0.0, 0.0), 
(ShadowSlash, 0.0, 70.0, 0.0, 0.0, 0.8), (DeathMark, 52.5, 0.0, 0.0, 0.0, 1.0)]);

val zac = Champ ("Zac", Tank, Defense, Jungle, CellDivision, [615.0, 160.0, 40.0], 
[(StretchingStrike, 30.0, 0.0, 0.0, 32.5, 0.0), (UnstableMatter, 15.0, 0.0, 0.0, 0.066, 0.0), 
(ElasticSlingshot, 60.0, 0.0, 0.0, 0.7,0.0), (LetsBounce, 150.0, 0.0, 0.0, 0.7, 0.0)]);

val yorick = Champ ("Yorick", Tank, Defense, Top, ShepherdofSouls, [580.0, 100.0, 100.0], 
[(LastRites, 0.0, 30.0, 0.0, 0.0, 0.4), (DarkProcession, 0.0, 0.0, 0.0, 0.0, 0.0), 
(MourningMist, 70.0, 0.0, 0.0, 0.7, 0.0), (EulogyoftheIsles, 0.0, 0.0, 0.0, 0.0, 0.0)]);

val yasuo = Champ ("Yasuo", Fighter, AD, Middle, WayoftheWanderer, [523.0, 0.0, 200.0], 
[(SteelTempest, 0.0, 20.0, 0.0, 0.0, 1.0), (WindWall, 0.0, 0.0, 0.0, 0.0, 0.0), 
(SweepingBlade, 0.0, 60.0, 0.0, 0.0, 0.8), (LastBreath, 0.0, 200.0, 0.0, 0.0, 1.5)]);

val xinzhao = Champ ("Xin Zhao", Fighter, AD, Jungle, Determination, [570.0, 0.0, 200.0], 
[(ThreeTalonStrike, 0.0, 60.0, 0.0, 0.0, 0.4), (WindBecomesLightning, 0.0, 60.0, 0.0, 0.0, 0.3), 
(AudaciousCharge, 0.0, 50.0, 0.0, 0.0, 0.6), (CrescentStrike, 0.0, 225.0, 0.0, 0.0, 1.15)]);

val xerath = Champ ("Xerath", Mage, AP, Middle, ManaSurge, [526.0, 160.0, 40.0], 
[(Arcanopulse, 80.0, 0.0, 0.0, 0.75, 0.0), (EyeofDestruction, 90.0, 0.0, 0.0, 0.9, 0.0), 
(ShockingOrb, 80.0, 0.0, 0.0, 0.45, 0.0), (RiteoftheArcane, 600.0, 0.0, 0.0, 0.43, 0.0)]);

val wukong = Champ ("Wukong", Fighter, AD, Top, StoneSkin, [578.0, 0.0, 200.0], 
[(CrushingBlow, 0.0, 30.0, 0.0, 0.0, 0.1), (Decoy, 0.0, 70.0, 0.0, 0.0, 0.6), 
(NimbusStrike, 0.0, 65.0, 0.0, 0.0, 0.8), (Cyclone, 0.0, 20.0, 0.0, 0.0, 1.1)]);

val warwick = Champ ("Warwick", OffTank, AD, Jungle, EternalHunger, [550.0, 0.0, 200.0], 
[(JawsoftheBeast, 0.0, 0.0, 30.0, 0.0, 2.1), (BloodHunt, 0.0, 0.0, 0.0, 0.0, 0.0), 
(PrimalHowl, 0.0, 0.0, 0.0, 0.0, 0.0), (InfiniteDuress, 0.0, 291.65, 0.0, 50.0, 55.66)]);

val urgot = Champ ("Urgot", OffTank, AD, Top, EchoingFlames, [585.0, 0.0, 200.0], 
[(CorrosiveCharge, 0.0, 25.0, 0.0, 0.0, 0.5), (Purge, 0.0, 60.0, 0.0, 0.0, 0.3), 
(Disdain, 0.0, 60.0, 0.0, 0.0, 0.5), (FearBeyondDeath, 0.0, 9999.99, 0.0, 0.0, 0.0)]);

val teemo = Champ ("Teemo", Devil, AP, Top, GuerrillaWarfare, [528.0, 160.0, 40.0], 
[(BlindingDart, 80.0, 0.0, 0.0, 0.8, 0.0), (MoveQuick, 0.0, 0.0, 0.0, 0.0, 0.0), 
(ToxicShot, 132.0, 0.0, 0.0, 0.7, 0.0), (NoxiousTrap, 200.0, 0.0, 0.0, 0.125, 0.0)]);
	
val thresh = Champ("Thresh", Support, Defense, Bottom, Damnation, [560.0, 56.0, 144.0], 
[(DeathSentence, 0.0, 80.0, 0.0, 0.5, 0.0), (DarkPassage, 0.0, 0.0, 60.0, 0.0, 0.0),
(Flay, 0.0, 60.0, 0.0, 0.4, 0.0), (TheBox,  0.0, 250.0, 0.0, 1.0, 0.0)]);

val nocturne = Champ("Nocturne", Fighter, AD, Jungle, UmbraBlades, [582.0, 180.0, 20.0], 
[(Duskbringer, 0.0, 65.0, 0.0, 0.0, 0.75), (ShroudofDarkness, 0.0, 0.0, 20.0, 0.5, 0.0),
(UnspeakableHorror, 80.0, 0.0, 0.0, 1.0, 0.0), (Paranoia, 0.0, 150.0, 0.0, 0.0, 1.2)]);
