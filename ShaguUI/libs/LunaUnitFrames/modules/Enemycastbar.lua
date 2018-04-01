if checkAltUF() then return end
LunaUnitFrames.CasterDB = {}
LunaUnitFrames.Enemycastbar = CreateFrame("Frame")

local EnemyCastBar_Spells = {

	-- All Classes
		-- General
	["Hearthstone"] = {t=10.0};
	["Rough Copper Bomb"] = {t=1, ni=1};
	["Large Copper Bomb"] = {t=1, ni=1};
	["Small Bronze Bomb"] = {t=1, ni=1};
	["Big Bronze Bomb"] = {t=1, ni=1};
	["Iron Grenade"] = {t=1, ni=1};
	["Big Iron Bomb"] = {t=1, ni=1};
	["Mithril Frag Bomb"] = {t=1, ni=1};
	["Hi-Explosive Bomb"] = {t=1, ni=1};
	["Thorium Grenade"] = {t=1, ni=1};
	["Dark Iron Bomb"] = {t=1, ni=1};
	["Arcane Bomb"] = {t=1, ni=1};
	["Sleep"] = {t=1.5, ni=1};
	["Reckless Charge"] = {t=0};
	["Dark Mending"] = {t=2};

		-- First Aid
	["First Aid"] = {t=8.0};
	["Linen Bandage"] = {t=3.0};
	["Heavy Linen Bandage"] = {t=3.0};
	["Wool Bandage"] = {t=3.0};
	["Heavy Wool Bandage"] = {t=3.0};
	["Silk Bandage"] = {t=3.0};
	["Heavy Silk Bandage"] = {t=3.0};
	["Mageweave Bandage"] = {t=3.0};
	["Heavy Mageweave Bandage"] = {t=3.0};
	["Runecloth Bandage"] = {t=3.0};
	["Heavy Runecloth Bandage"] = {t=3.0};
	
	-- Druid
	["Healing Touch"] = {t=3.0};
	["Regrowth"] = {t=2.0, g=21.0};
	["Rebirth"] = {t=2.0, d=1800.0};
	["Starfire"] = {t=3};
	["Wrath"] = {t=1.5};
	["Entangling Roots"] = {t=1.5};
	["Hibernate"] = {t=1.5};
	["Soothe Animal"] = {t=1.5};
	["Barkskin"] = {t=0};
	["Teleport: Moonglade"] = {t=10.0};
	["Travel Form"] = {t=0};
	["Dire Bear Form"] = {t=0};
	["Cat Form"] = {t=0};
	["Bear Form"] = {t=0};
	["Moonkin Form"] = {t=0};
	["Aquatic Form"] = {t=0};
	["Feral Charge Effect"] = {t=0};
	["Bash"] = {t=0};
	["Starfire Stun"] = {t=0};
	["Pounce"] = {t=0};
	["Nature's Swiftness"] = {t=0};
	
	-- Hunter
	["Aimed Shot"] = {t=3.0};
	["Scare Beast"] = {t=1.5};
	["Dismiss Pet"] = {t=5.0};
	["Revive Pet"] = {t=10.0};
	["Eyes of the Beast"] = {t=2.0};
	["Scatter Shot"] = {t=0};
	["Freezing Trap Effect"] = {t=0};
	["Intimidation"] = {t=0};
	["Wyvern Sting"] = {t=0};
	
	-- Mage
	["Frostbolt"] = {t=2.5};
	["Fireball"] = {t=3.0};
	["Conjure Water"] = {t=3.0};
	["Conjure Food"] = {t=3.0};
	["Conjure Mana Ruby"] = {t=3.0};
	["Conjure Mana Citrine"] = {t=3.0};
	["Conjure Mana Jade"] = {t=3.0};
	["Conjure Mana Agate"] = {t=3.0};
	["Polymorph"] = {t=1.5};
	["Polymorph: Pig"] = {t=1.5};
	["Polymorph: Turtle"] = {t=1.5};
	["Pyroblast"] = {t=6.0, d=60.0};
	["Scorch"] = {t=1.5};
	["Flamestrike"] = {t=3.0, r="Death Talon Hatcher", a=2.5};
	["Slow Fall"] = {t=0, c="gains"};
	["Portal: Darnassus"] = {t=10.0};
	["Portal: Thunder Bluff"] = {t=10.0};
	["Portal: Ironforge"] = {t=10.0};
	["Portal: Orgrimmar"] = {t=10.0};
	["Portal: Stormwind"] = {t=10.0};
	["Portal: Undercity"] = {t=10.0};
	["Teleport: Darnassus"] = {t=10.0};
	["Teleport: Thunder Bluff"] = {t=10.0};
	["Teleport: Ironforge"] = {t=10.0};
	["Teleport: Orgrimmar"] = {t=10.0};
	["Teleport: Stormwind"] = {t=10.0};
	["Teleport: Undercity"] = {t=10.0};
	["Impact"] = {t=0};
	["Fire Ward"] = {t=0.0};
	["Frost Ward"] = {t=0.0};
	["Frost Armor"] = {t=0.0};
	["Ice Armor"] = {t=0.0};
	["Mage Armor"] = {t=0.0};
	["Counterspell - Silenced"] = {t=0.0, ni=1};
	["Ice Barrier"] = {t=0.0};
	["Mana Shield"] = {t=0.0};
	["Blink"] = {t=0};
	["Ice Block"] = {t=0};
	
	-- Paladin
	["Seal of Wisdom"] = {t=0};
	["Seal of Light"] = {t=0};
	["Seal of Righteousness"] = {t=0};
	["Seal of Command"] = {t=0};
	["Seal of the Crusader"] = {t=0};
	["Seal of Justice"] = {t=0};
	["Righteous Fury"] = {t=0};
	["Holy Light"] = {t=2.5};
	["Flash of Light"] = {t=1.5};
	["Summon Charger"] = {t=3.0, g=0.0};
	["Summon Warhorse"] = {t=3.0, g=0.0};
	["Hammer of Wrath"] = {t=1.0, d=6.0};
	["Holy Wrath"] = {t=2.0, d=60.0};
	["Turn Undead"] = {t=1.5, d=30.0};
	["Redemption"] = {t=10.0};
	["Divine Protection"] = {t=0};
	["Divine Shield"] = {t=0};
	["Hammer of Justice"] = {t=0};
	
	-- Priest
	["Greater Heal"] = {t=2.5};
	["Flash Heal"] = {t=1.5};
	["Heal"] = {t=2.5};
	["Resurrection"] = {t=10.0};
	["Smite"] = {t=2};
	["Mind Blast"] = {t=1.5, d=8.0};
	["Mind Control"] = {t=3.0};
	["Mana Burn"] = {t=2.5};
	["Holy Fire"] = {t=3.0, d=15.0};
	["Mind Soothe"] = {t=0};
	["Prayer of Healing"] = {t=3.0};
	["Shackle Undead"] = {t=1.5};
	["Fade"] = {t=0};
	["Psychic Scream"] = {t=0.0};
	["Silence"] = {t=0.0, ni = 1};
	["Blackout"] = {t=0.0};
	
	-- Rogue
	["Disarm Trap"] = {t=5.0};
	["Mind-numbing Poison"] = {t=3.0};
	["Mind-numbing Poison II"] = {t=3.0};
	["Mind-numbing Poison III"] = {t=3.0};
	["Instant Poison"] = {t=3.0};
	["Instant Poison II"] = {t=3.0};
	["Instant Poison III"] = {t=3.0};
	["Instant Poison IV"] = {t=3.0};
	["Instant Poison V"] = {t=3.0};
	["Instant Poison VI"] = {t=3.0};
	["Deadly Poison"] = {t=3.0};
	["Deadly Poison II"] = {t=3.0};
	["Deadly Poison III"] = {t=3.0};
	["Deadly Poison IV"] = {t=3.0};
	["Deadly Poison V"] = {t=3.0};
	["Crippling Poison"] = {t=3.0};
	["Pick Lock"] = {t=5.0};
	["Blind"] = {t=0};
	["Gouge"] = {t=0};
	["Kidney Shot"] = {t=0};
	["Kick - Silenced"] = {t=0, ni=1};
	["Kick"] = {t=0, ni=1};
	
	-- Shaman
	["Lesser Healing Wave"] = {t=1.5};
	["Healing Wave"] = {t=3.0};
	["Ancestral Spirit"] = {t=10.0};
	["Chain Lightning"] = {t=1.5, d=6.0};
	["Ghost Wolf"] = {t=3.0};
	["Astral Recall"] = {t=10.0};
	["Chain Heal"] = {t=2.5};
	["Lightning Bolt"] = {t=2.0};
	["Far Sight"] = {t=2.0};
	["Earth Shock"] = {t=0, ni=1};
	
	-- Warlock
	["Shadow Bolt"] = {t=2.5};
	["Immolate"] = {t=1.5};
	["Soul Fire"] = {t=4.0};
	["Searing Pain"] = {t=1.5};
	["Summon Dreadsteed"] = {t=3.0};
	["Summon Felsteed"] = {t=3.0};
	["Summon Imp"] = {t=6.0};
	["Summon Succubus"] = {t=6.0};
	["Summon Voidwalker"] = {t=6.0};
	["Summon Felhunter"] = {t=6.0};
	["Fear"] = {t=1.5};
	["Howl of Terror"] = {t=2.0};
	["Banish"] = {t=1.5};
	["Ritual of Summoning"] = {t=5.0};
	["Ritual of Doom"] = {t=10.0};
	["Create Spellstone"] = {t=5.0};
	["Create Soulstone"] = {t=3.0};
	["Create Healthstone"] = {t=3.0};
	["Create Firestone"] = {t=3.0};
	["Enslave Demon"] = {t=3.0};
	["Inferno"] = {t=2.0};
	["Inferno Effect"] = {t=0};
	["Shadow Ward"] = {t=0};
	["Death Coil"] = {t=0.0};
	["Corruption"] = {t=0};
	["Demon Armor"] = {t=0};
	["Demon Skin"] = {t=0};

		-- Succubus
		["Seduction"] = {t=1.5};
		
		-- Felhunter
		["Spell Lock"] = {t=0.0, ni=1};

	-- Warrior
	["Charge Stun"] = {t=0};
	["Intercept Stun"] = {t=0};
	["Revenge Stun"] = {t=0};
	["Mace Stun Effect"] = {t=0};
	["Intimidating Shout"] = {t=0};
	["Shield Bash - Silenced"] = {t=0};
	["Shield Bash"] = {t=0, ni=1};
	["Pummel"] = {t=0, ni=1};
	
}

local EnemyCastBar_Raids = {

	-- Ahn'Qiraj

		-- 20 Man Trash
		["Explode"] = {t=6.0};

	-- Blackwing Lair
			
		-- Firemaw/Flamegor/Ebonroc
		["Shadow Flame"] = {t=2.0, c="hostile"};
		["Wing Buffet"] = {t=1.0, c="hostile"};
		
		-- Neferian/Onyxia
		["Bellowing Roar"] = {t=2.0, c="hostile", r="Onyxia", a=1.5};
		
}

local EnemyCastBar_NonAfflictions = {
	["Frostbolt"] = true;
	["Fireball"] = true;
	["Pyroblast"] = true;
	["Entangling Roots"] = true;
	["Soothe Animal"] = true;
	["Mind Soothe"] = true;
	["Immolate"] = true;
	["Corruption"] = true;
	["Regrowth"] = true;
	["Mind Control"] = true;
	["Holy Fire"] = true;
	["Greater Heal"] = true;
}

local EnemyCastBar_Interrupts = {
	["Shield Bash"] = true;
	["Pummel"] = true;
	["Kick"] = true;
	["Earth Shock"] = true;
}

EnemyCastBar_SPELL_GAINS 				= "(.+) gains (.+)."
EnemyCastBar_SPELL_CAST 				= "(.+) begins to cast (.+)."
EnemyCastBar_SPELL_PERFORM				= "(.+) begins to perform (.+)."
EnemyCastBar_SPELL_AFFLICTED			= "(.+) (.+) afflicted by (.+)."
EnemyCastBar_SPELL_HIT					= "Your (.+) %a%a?its (.+) for %d+\."
EnemyCastBar_OTHER_SPELL_HIT			= "%a+'s (.+) %a%a?its (.+) for %d+\."


if ( GetLocale() == "deDE" ) then
	EnemyCastBar_Spells = {

		-- All Classes
			-- General
		["Ruhestein"] = {t=10.0};
		["Rauhe Kupferbombe"] = {t=1, ni=1};
		["Gro\195\159e Kupferbombe"] = {t=1, ni=1};
		["Kleine Bronzebombe"] = {t=1, ni=1};
		["Gro\195\159e Bronzebombe"] = {t=1, ni=1};
		["Eisengranate"] = {t=1, ni=1};
		["Gro\195\159e Eisenbombe"] = {t=1, ni=1};
		["Mithrilschrapnellbombe"] = {t=1, ni=1};
		["Hochexplosive Bombe"] = {t=1, ni=1};
		["Thoriumgranate"] = {t=1, ni=1};
		["Dunkeleisenbombe"] = {t=1, ni=1};
		["Arkane Bombe"] = {t=1, ni=1};
		["Schlaf"] = {t=1.5, ni=1};
		["Tollk\195\188hner Ansturm"] = {t=0};
		["Dunkle Besserung"] = {t=2};

			-- First Aid
		["Erste Hilfe"] = {t=8.0};
		["Leinenstoffverband"] = {t=3.0};
		["Schwerer Leinenstoffverband"] = {t=3.0};
		["Wollstoffverband"] = {t=3.0};
		["Schwerer Wollstoffverband"] = {t=3.0};
		["Seidenstoffverbannd"] = {t=3.0};
		["Schwerer Seidenstoffverband"] = {t=3.0};
		["Magiestoffverbannd"] = {t=3.0};
		["Schwerer Magiestoffverband"] = {t=3.0};
		["Runenstoffverband"] = {t=3.0};
		["Schwerer Runenstoffverband"] = {t=3.0};
		
		-- Druid
		["Heilende Ber\195\188hrung"] = {t=3.0};
		["Nachwachsen"] = {t=2.0, g=21.0};
		["Wiedergeburt"] = {t=2.0, d=1800.0};
		["Sternenfeuer"] = {t=3};
		["Zorn"] = {t=1.5};
		["Wucherwurzeln"] = {t=1.5};
		["Winterschlaf"] = {t=1.5};
		["Tier bes\195\164nftigen"] = {t=1.5};
		["Baumrinde"] = {t=0};
		["Teleportieren: Moonglade"] = {t=10.0};
		["Reisegestalt"] = {t=0};
		["Terrorb\195\164rengestalt"] = {t=0};
		["Katzengestalt"] = {t=0};
		["B\195\164rengestalt"] = {t=0};
		["Moonkingestalt"] = {t=0};
		["Wassergestalt"] = {t=0};
		["Wilde Attacke"] = {t=0};
		["Hieb"] = {t=0};
		["Sternenfeuerbet\195\164ubung"] = {t=0};
		["Anspringen"] = {t=0};
		["Schnelligkeit der Natur"] = {t=0};
		
		-- Hunter
		["Gezielter Schuss"] = {t=3.0};
		["Wildtier \195\164ngstigen"] = {t=1.5};
		["Tier freigeben"] = {t=5.0};
		["Tier wiederbeleben"] = {t=10.0};
		["Augen des Wildtiers"] = {t=2.0};
		["Streuschuss"] = {t=0};
		["Eisk\195\164ltefalle"] = {t=0};
		["Einsch\195\188chterung"] = {t=0};
		["Wyverngift"] = {t=0};
		
		-- Mage
		["Frostblitz"] = {t=2.5};
		["Feuerball"] = {t=3.0};
		["Wasser herbeizaubern"] = {t=3.0};
		["Essen herbeizaubern"] = {t=3.0};
		["Manarubin herbeizaubern"] = {t=3.0};
		["Manacitrin herbeizaubern"] = {t=3.0};
		["Manajade herbeizaubern"] = {t=3.0};
		["Manaachat herbeizaubern"] = {t=3.0};
		["Verwandlung"] = {t=1.5};
		["Verwandlung: Schwein"] = {t=1.5};
		["Verwandlung: Schildkr\195\182te"] = {t=1.5};
		["Pyroschlag"] = {t=6.0, d=60.0};
		["Versenegen"] = {t=1.5};
		["Flammensto\195\159"] = {t=3.0, r="Death Talon Hatcher", a=2.5};
		["Langsamer Fall"] = {t=0, c="gains"};
		["Portal: Darnassus"] = {t=10.0};
		["Portal: Thunder Bluff"] = {t=10.0};
		["Portal: Ironforge"] = {t=10.0};
		["Portal: Orgrimmar"] = {t=10.0};
		["Portal: Stormwind"] = {t=10.0};
		["Portal: Undercity"] = {t=10.0};
		["Teleportieren: Darnassus"] = {t=10.0};
		["Teleportieren: Thunder Bluff"] = {t=10.0};
		["Teleportieren: Ironforge"] = {t=10.0};
		["Teleportieren: Orgrimmar"] = {t=10.0};
		["Teleportieren: Stormwind"] = {t=10.0};
		["Teleportieren: Undercity"] = {t=10.0};
		["Impact"] = {t=0};
		["Feuerzauberschutz"] = {t=0.0};
		["Frostzauberschutz"] = {t=0.0};
		["Frostr\195\188stung"] = {t=0.0};
		["Eisr\195\188stung"] = {t=0.0};
		["Magische R\195\188stung"] = {t=0.0};
		["Gegenzauber - zum Schweigen gebracht"] = {t=0.0, ni=1};
		["Eisbarriere"] = {t=0.0};
		["Manaschild"] = {t=0.0};
		["Blinzeln"] = {t=0};
		["Eisblock"] = {t=0};
		
		-- Paladin
		["Siegel der Weisheit"] = {t=0};
		["Siegel des Lichts"] = {t=0};
		["Siegel der Rechtschaffenheit"] = {t=0};
		["Siegel des Befehls"] = {t=0};
		["Siegel des Kreuzfahrers"] = {t=0};
		["Siegel der Gerechtigkeit"] = {t=0};
		["Zorn der Gerechtigkeit"] = {t=0};
		["Heiliges Licht"] = {t=2.5};
		["Lichtblitz"] = {t=1.5};
		["Streitross beschw\195\182ren"] = {t=3.0, g=0.0};
		["Schlachtross beschw\195\182ren"] = {t=3.0, g=0.0};
		["Hammer des Zorns"] = {t=1.0, d=6.0};
		["Heiliger Zorn"] = {t=2.0, d=60.0};
		["Untote vertreiben"] = {t=1.5, d=30.0};
		["Erl\195\182sung"] = {t=10.0};
		["G\195\182ttlicher Schutz"] = {t=0};
		["Gottesschild"] = {t=0};
		["Hammer der Gerechtigkeit"] = {t=0};
		
		-- Priest
		["Gro\195\159e Heilung"] = {t=2.5};
		["Blitzheilung"] = {t=1.5};
		["Heilen"] = {t=2.5};
		["Auferstehung"] = {t=10.0};
		["G\195\182ttliche Pein"] = {t=2};
		["Gedankenschlag"] = {t=1.5, d=8.0};
		["Gedankenkontrolle"] = {t=3.0};
		["Manabrand"] = {t=2.5};
		["Heiliges Feuer"] = {t=3.0, d=15.0};
		["Gedankenbes\195\164nftigung"] = {t=0};
		["Gebet der Heilung"] = {t=3.0};
		["Untote fesseln"] = {t=1.5};
		["Verblassen"] = {t=0};
		["Psychischer Schrei"] = {t=0.0};
		["Stille"] = {t=0.0, ni = 1};
		["Blackout"] = {t=0.0};
		
		-- Rogue
		["Falle entsch\195\164rfen"] = {t=5.0};
		["Gedankenbenebelndes Gift"] = {t=3.0};
		["Gedankenbenebelndes Gift II"] = {t=3.0};
		["Gedankenbenebelndes Gift III"] = {t=3.0};
		["Sofort wirkendes Gift"] = {t=3.0};
		["Sofort wirkendes Gift II"] = {t=3.0};
		["Sofort wirkendes Gift III"] = {t=3.0};
		["Sofort wirkendes Gift IV"] = {t=3.0};
		["Sofort wirkendes Gift V"] = {t=3.0};
		["Sofort wirkendes Gift VI"] = {t=3.0};
		["T\195\182dliches Gift"] = {t=3.0};
		["T\195\182dliches Gift II"] = {t=3.0};
		["T\195\182dliches Gift III"] = {t=3.0};
		["T\195\182dliches Gift IV"] = {t=3.0};
		["T\195\182dliches Gift V"] = {t=3.0};
		["Verkr\195\188ppelndes Gift"] = {t=3.0};
		["Schloss knacken"] = {t=5.0};
		["Blenden"] = {t=0};
		["Solarplexus"] = {t=0};
		["Nierenhieb"] = {t=0};
		["Tritt - zum Schweigen gebracht"] = {t=0, ni=1};
		["Tritt"] = {t=0, ni=1};
		
		-- Shaman
		["Geringe Welle der Heilung"] = {t=1.5};
		["Welle der Heilung"] = {t=3.0};
		["Geist der Ahnen"] = {t=10.0};
		["Kettenblitzschlag"] = {t=1.5, d=6.0};
		["Geisterwolf"] = {t=3.0};
		["Astraler R\195\188ckruf"] = {t=10.0};
		["Kettenheilung"] = {t=2.5};
		["Blitzschlag"] = {t=2.0};
		["Fernsicht"] = {t=2.0};
		["Erdschock"] = {t=0, ni=1};
		
		-- Warlock
		["Schattenblitz"] = {t=2.5};
		["Feuerbrand"] = {t=1.5};
		["Seelenfeuer"] = {t=4.0};
		["Sengender Schmerz"] = {t=1.5};
		["Schreckensross herbeirufen"] = {t=3.0};
		["Teufelsross beschw\195\182ren"] = {t=3.0};
		["Wichtel beschw\195\182ren"] = {t=6.0};
		["Sukkubus beschw\195\182ren"] = {t=6.0};
		["Leerwandler beschw\195\182ren"] = {t=6.0};
		["Teufelsj\195\164ger beschw\195\182ren"] = {t=6.0};
		["Furcht"] = {t=1.5};
		["Schreckensgeheul"] = {t=2.0};
		["Verbannen"] = {t=1.5};
		["Ritual der Beschw\195\182rung"] = {t=5.0};
		["Ritual der Verdammnis"] = {t=10.0};
		["Zauberstein herstellen"] = {t=5.0};
		["Seelenstein herstellen"] = {t=3.0};
		["Gesundheitsstein herstellen"] = {t=3.0};
		["Feuerstein herstellen"] = {t=3.0};
		["D\195\164monensklave"] = {t=3.0};
		["Inferno"] = {t=2.0};
		["Inferno Effect"] = {t=0}; -- test
		["Schatten-Zauberschutz"] = {t=0};
		["Todesmantel"] = {t=0.0};
		["Verderbnis"] = {t=0};
		["D\195\164monenr\195\188stung"] = {t=0};
		["D\195\164monenhaut"] = {t=0};

			-- Succubus
			["Verf\195\188hrung"] = {t=1.5};
			
			-- Felhunter
			["Zaubersperre"] = {t=0.0, ni=1};

		-- Warrior
		["Sturmangriffsbet\195\164ubung"] = {t=0};
		["Bet\195\164ubung abfangen"] = {t=0};
		["Rachebet\195\164ubung"] = {t=0};
		["Streitkolbenbet\195\164ubung"] = {t=0};
		["Durchdringendes Heulen"] = {t=0};
		["Schildhieb - zum Schweigen gebracht"] = {t=0};
		["Schildhieb"] = {t=0, ni=1};
		["Zuschlagen"] = {t=0, ni=1};
		
		-- Mobs
		["Schrumpfen"] = {t=3.0};
		["Bansheefluch"] = {t=2.0};
		["Schattenblitz-Salve"] = {t=3.0};
		["Verkr\195\188ppeln"] = {t=3.0};
		["Dunkle Besserung"] = {t=3.5};
		["Willensverfall"] = {t=2.0};
		["Windsto\195\159"] = {t=2.0};
		["Schwarzer Schlamm"] = {t=3.0};
		["Toxischer Blitz"] = {t=2.5};
		["Giftspucke"] = {t=2.0};
		["Wilde Regeneration"] = {t=3.0};
		["Fluch der Totenwaldfelle"] = {t=2.0};
		["Blutfluch"] = {t=2.0};
		["Dunkler Schlamm"] = {t=5.0};
		["Seuchenwolke"] = {t=2.0};
		["Wandernde Seuche"] = {t=2.0};
		["Welkber\195\188hrung"] = {t=2.0};
		["Fieberhafte Ersch\195\182pfung"] = {t=3.0};
		["Umschlie\195\159ende Gespinste"] = {t=2.0};
		["Kristallblick"] = {t=2.0};
		["Flammenspeien"] = {t=3.0};
		["Echsenschlag"] = {t=2.0};
		["Gedanken verseuchen"] = {t=4.0};
	}

	EnemyCastBar_Raids = {

		-- Ahn'Qiraj

			-- 20 Man Trash
			["Explodieren"] = {t=6.0};

		-- Blackwing Lair
				
			-- Firemaw/Flamegor/Ebonroc
			["Schattenflamme"] = {t=2.0, c="hostile"};
			["Fl\195\188gelsto\195\159"] = {t=1.0, c="hostile"};
			
			-- Neferian/Onyxia
			["Dr\195\182hnendes Gebr\195\188ll"] = {t=2.0, c="hostile", r="Onyxia", a=1.5};
			
	}

	EnemyCastBar_NonAfflictions = {
		["Frostblitz"] = true;
		["Feuerball"] = true;
		["Pyroschlag"] = true;
		["Wucherwurzeln"] = true;
		["Tier bes\195\164nftigen"] = true;
		["Gedankenbes\195\164nftigung"] = true;
		["Feuerbrand"] = true;
		["Verderbnis"] = true;
		["Nachwachsen"] = true;
		["Gedankenkontrolle"] = true;
		["Heiliges Feuer"] = true;
		["Gro\195\159e Heilung"] = true;
	}

	EnemyCastBar_Interrupts = {
		["Schildhieb"] = true;
		["Zuschlagen"] = true;
		["Tritt"] = true;
		["Erdschock"] = true;
	}

	EnemyCastBar_SPELL_GAINS 				= "(.+) bekommt (.+)."
	EnemyCastBar_SPELL_CAST 				= "(.+) beginnt (.+) zu wirken."
	EnemyCastBar_SPELL_PERFORM				= "(.+) beginnt (.+) auszuf\195\188hren."
	EnemyCastBar_SPELL_AFFLICTED			= "(.+) ist von (.+) betroffen."
	EnemyCastBar_SPELL_HIT					= "(.+) von Euch trifft (.+) f\195\188r %d+\."
	EnemyCastBar_OTHER_SPELL_HIT			= "%a+'s (.+) trifft (.+) f\195\188r %d+\."
end

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PARTY_BUFF");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS");

LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS");
LunaUnitFrames.Enemycastbar:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE");

LunaUnitFrames.Enemycastbar:RegisterEvent("PLAYER_TARGET_CHANGED");

LunaUnitFrames.Enemycastbar.OnEvent = function ()
	if (event == "PLAYER_TARGET_CHANGED") then
		EnemyCastBar_Restore()
	else
		EnemyCastBar_Gfind(arg1)
	end
end

LunaUnitFrames.Enemycastbar:SetScript("OnEvent", LunaUnitFrames.Enemycastbar.OnEvent)

function EnemyCastBar_Gfind(arg1)
	if (arg1 ~= nil) then
		for mob, spell in string.gfind(arg1, EnemyCastBar_SPELL_CAST) do
			EnemyCastBar_Control(mob, spell, "casts")
			return
		end	
		for mob, spell in string.gfind(arg1, EnemyCastBar_SPELL_PERFORM) do
			EnemyCastBar_Control(mob, spell, "performs")
			return
		end
		for mob, spell in string.gfind(arg1, EnemyCastBar_SPELL_GAINS) do
			EnemyCastBar_Control(mob, spell, "gains")
			return
		end
		if ( GetLocale() == "deDE") then
			for mob, spell in string.gfind(arg1, EnemyCastBar_SPELL_AFFLICTED) do
				EnemyCastBar_Control(mob, spell, "afflicted")
				return
			end
		else
			for mob, crap, spell in string.gfind(arg1, EnemyCastBar_SPELL_AFFLICTED) do
				EnemyCastBar_Control(mob, spell, "afflicted")
				return
			end
		end
		for spell, mob in string.gfind(arg1, EnemyCastBar_SPELL_HIT) do
			EnemyCastBar_Control(mob, spell, "hit")
			return
		end
		for spell, mob in string.gfind(arg1, EnemyCastBar_OTHER_SPELL_HIT) do
			EnemyCastBar_Control(mob, spell, "hit")
			return
		end
	end
end

function EnemyCastBar_Control(mob, spell, special)
	if EnemyCastBar_Raids[spell] ~= nil then
		castime = EnemyCastBar_Raids[spell].t
		-- Spell might have the same name but a different cast time on another mob, ie. Onyxia/Nefarian on Bellowing Roar
		if EnemyCastBar_Raids[spell].r then
			if (mob == EnemyCastBar_Raids[spell].r) then
				castime = EnemyCastBar_Raids[spell].a
			end
		end
		if EnemyCastBar_Raids[spell].m then
			mob = EnemyCastBar_Raids[spell].m
		end
		EnemyCastBar_Show(mob, spell, castime)
	else
		if EnemyCastBar_Spells[spell] ~= nil and special ~= "hit" then
			if special == "afflicted" then
				if not EnemyCastBar_NonAfflictions[spell] then
					EnemyCastBar_Hide(mob, spell)
				end
				return
			end
			castime = EnemyCastBar_Spells[spell].t
			if special == "gains" then
				if not EnemyCastBar_NonAfflictions[spell] then
					EnemyCastBar_Hide(mob, spell)
				end
				return
			end
			-- Spell might have the same name but a different cast time on another mob, ie. Death Talon Hatchers/Players on Bellowing Roar
			if EnemyCastBar_Spells[spell].r then
				if mob == EnemyCastBar_Spells[spell].r then
					castime = EnemyCastBar_Spells[spell].a
				end
			end
			EnemyCastBar_Show(mob, spell, castime)
		elseif EnemyCastBar_Interrupts[spell] then
			if LunaUnitFrames.CasterDB[mob] and LunaUnitFrames.CasterDB[mob].ct > 0 then
				EnemyCastBar_Hide(mob, spell)
				return
			end
		end
	end
end

function EnemyCastBar_Show(mob, spell, castime)
	LunaUnitFrames.CasterDB[mob] = {sp = spell, start = GetTime(), ct = castime}
	if mob == UnitName("target") then
		LunaUnitFrames:StartTargetCast(GetTime(), spell, castime)
	end
end

function EnemyCastBar_Hide(mob, spell)
	if LunaUnitFrames.CasterDB[mob] and not (EnemyCastBar_Spells[spell].ni and EnemyCastBar_Spells[LunaUnitFrames.CasterDB[mob].sp].ni) then
		LunaUnitFrames.CasterDB[mob]["ct"] = 0
		if mob == UnitName("target") then
			LunaUnitFrames:StopTargetCast()
		end
	end
end

function EnemyCastBar_Restore()
	local mob = UnitName("target")
	if LunaUnitFrames.CasterDB[mob] then
		LunaUnitFrames:StartTargetCast(LunaUnitFrames.CasterDB[mob]["start"], LunaUnitFrames.CasterDB[mob]["sp"], LunaUnitFrames.CasterDB[mob]["ct"])
	else
		LunaUnitFrames:StopTargetCast()
	end
end
