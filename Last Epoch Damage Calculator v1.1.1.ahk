
#Requires Autohotkey v2
;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

F5::Reload

myGui := Construct()

Construct() {
	myGui := Gui()
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y408 w170 h32 +0x200", "Increased Damage:")
	myGui.SetFont("s14")
	IncDmg := myGui.Add("Edit", "x200 y408 w85 h29", "0")
	myGui.SetFont("s10")
	myGui.Add("Text", "x32 y440 w255 h51 +0x1", "All sources of Increased Damage are additive. This includes damage from your primary stat.`n")
	myGui.SetFont("s10")
	myGui.Add("Text", "x32 y728 w255 h52 +0x1", "Sources of More Damage (or sources that indicate that they are multiplicative with other sources) are all multiplicative.")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y152 w143 h32 +0x200", "Added Damage:")
	myGui.SetFont("s14")
	AddedDmg := myGui.Add("Edit", "x176 y152 w81 h27", "0")
	myGui.SetFont("s10")
	myGui.Add("Text", "x32 y184 w255 h82 +0x1", "Added Damage comes from your gear, passive tree, and skill tree in the form of `"Additional Physical Damage: X`" (Black Arrow skill tree) or `"+3 to Spell Lightning Damage`" (Copper Amulet base)")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y272 w193 h32 +0x200", "Damage Effectiveness:")
	myGui.SetFont("s14")
	DmgEff := myGui.Add("Edit", "x224 y272 w61 h27", "100")
	myGui.SetFont("s10")
	myGui.Add("Text", "x32 y304 w255 h100 +0x1", "Damage Effectivenss comes from skills.  Some skills have 100`% (Multishot), in which case leave this field at 100.  If your skill has more or less (60`% for Flurry, 350`% for Judgement), change this field to that number.  Don't include the `% sign.")
	
	myGui.SetFont("s14")
	CritChance := myGui.Add("Edit", "x480 y80 w71 h27", "5")
	myGui.SetFont("s14")
	myGui.Add("Text", "x296 y80 w183 h32 +0x200", "Critical Strike Chance:")
	myGui.SetFont("s10")
	myGui.Add("Text", "x296 y120 w255 h355 +0x1", "Base Critical Strike chance 5`%.  The character sheet shows your `"final`" critical strike chance after sources of `"Increased Critical Strike Chance`" are applied, but it does not include sources of Base Critical Strike Chance or Increased Critical Strike Chance for specific skills or archtypes.  For instance, Flurry has a skill tree node that says `"Critical Strike Chance : +2`%`" which is adding Base Critical Strike Chance.  Similarly, Black Arrow has a skill tree node that says `"Flurry Base Crit Chance: +3`%`".  These are effectively the same thing, but are not represented on your character sheet.  This also applies to things like `"+X`% Critical Strike Chance with Fire Skills`".  For simplicity's sake, you could just guestimate your final critical strike chance and put it here, or if you know you're crit capped, just put 100. Alternatively, if you want to exclude crit from the calculation and just check your base damage, put 0.")
	myGui.SetFont("s14")
		
	CritMulti := myGui.Add("Edit", "x448 y480 w71 h27", "200")
	myGui.SetFont("s14")
	myGui.SetFont("s14")
	myGui.Add("Text", "x296 y480 w145 h32 +0x200", "Critical Multiplier:")
	myGui.SetFont("s10")
	myGui.Add("Text", "x296 y512 w255 h149 +0x1", "Base Critical Multiplier is 200.  Much like Critical Strike Chance, sources that don't give generic Critical Multiplier aren't represented on your character sheet.  If you have +70`% Critical Multiplier, then your final number here will be 270.  Some items have the text `"Your critical strikes do not deal additional damage`".  If you are using an item like that, set this number to 100.")
	myGui.SetFont("s14")
	
	
	myGui.SetFont("s14")
	SkillSpeed := myGui.Add("Edit", "x712 y80 w71 h27", "1")
	myGui.SetFont("s14")
	myGui.Add("Text", "x560 y80 w151 h32 +0x200", "Base Skill Speed:")
	myGui.SetFont("s10")
	myGui.Add("Text", "x560 y112 w255 h18 +0x1", "This number can be found at")
	myGui.SetFont("s10")
	SkillLink := myGui.Add("Edit", "x592 y136 w203 h20 +ReadOnly", "www.LastEpochTools.com/skills")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x560 y168 w151 h32 +0x200", "Increased Speed:")
	myGui.SetFont("s14")
	IncSpeed := myGui.Add("Edit", "x712 y168 w71 h27", "0")
	myGui.SetFont("s10")
	myGui.Add("Text", "x560 y208 w255 h86 +0x1", "This field is for increases to attack speed or cast speed.  Your character sheet, once again, may not accurately reflect your final attack/cast speed.  It's better to manually add them together.")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x560 y304 w179 h32 +0x200", "Weapon Attack Rate:")
	myGui.SetFont("s10")
	myGui.Add("Text", "x560 y336 w255 h52 +0x1", "  If you're using spells, leave this field at 1.        If you're using attacks, insert your weapon's base attack rate.")
	myGui.SetFont("s14")
	WpnSpeed := myGui.Add("Edit", "x744 y304 w71 h27", "1")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x560 y400 w200 h32 +0x200", "Resistance Penetration:")
	myGui.SetFont("s14")
	ResPen := myGui.Add("Edit", "x760 y400 w56 h27", "0")
	myGui.SetFont("s10")
	myGui.Add("Text", "x560 y440 w255 h69 +0x1", "This is specifically for sources of Penetration (Amulet prefix, certain uniques and set bonuses).`nDo not include the `% sign.")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x560 y520 w158 h32 +0x200", "Resistance Shred:")
	myGui.SetFont("s14")
	ResShred := myGui.Add("Edit", "x720 y520 w71 h27", "0")
	myGui.SetFont("s10")
	myGui.Add("Text", "x560 y552 w255 h100 +0x1", "Insert the final `% of shred you'll be applying here. Don't include the `% sign.`nThe maximum number of Resistance Shred stacks is 10. Resistance Shred for nomal enemies is 5`% per stack, but only 2`% per stack on bosses.")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x824 y368 w167 h32 +0x200", "Scaling Resistance:")
	myGui.SetFont("s14")
	EnemyDR := myGui.Add("Edit", "x992 y368 w71 h27", "87")
	myGui.SetFont("s10")
	myGui.Add("Text", "x824 y400 w270 h51 +0x1", "Enemies gain multiplicative damage reduction up to 87`% at level 100.  If you're doing empowered monoliths, leave this at 87.")
	myGui.SetFont("s10")
	DRLink := myGui.Add("Edit", "x840 y496 w228 h21 +ReadOnly", "https://lastepoch.tunklab.com/mobdr")
	myGui.SetFont("s10")
	myGui.Add("Text", "x824 y528 w270 h21 +0x1", "(Target dummies have 0)")
	
	myGui.SetFont("s10")
	myGui.Add("Text", "x824 y456 w270 h33 +0x1", "If you're not, you can find the specific resistance here:")
	myGui.SetFont("s10")
	ArmorLink := myGui.Add("Edit", "x840 y336 w219 h21 +ReadOnly", "https://lastepoch.tunklab.com/armor")
	myGui.SetFont("s10")
	myGui.Add("Text", "x824 y120 w255 h210 +0x1", "I'll level with you: I'm quite lazy and I don't want to write the entire armour calculation formula into this script.  Please refer to the following website to find what `% increased damage taken the enemy will receive at your number of armour shred stacks.  There's three tabs at the top of the page, click on `"Shred`" then hover over the bars until you find the correct number.  Keep in mind: armour applies differently for physical and non-physical hits, so pick the correct number according to your skill.`nDon't include the `% sign.")
	myGui.SetFont("s14")
	myGui.Add("Text", "x824 y80 w130 h32 +0x200", "Armour Shred:")
	myGui.SetFont("s14")
	ArmorShred := myGui.Add("Edit", "x952 y80 w71 h27", "0")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x296 y672 w80 h32 +0x200", "Shotgun:")
	myGui.SetFont("s14")
	Shotgun := myGui.Add("Edit", "x376 y672 w71 h27", "1")
	myGui.SetFont("s10")
	myGui.Add("Text", "x296 y712 w347 h55 +0x1", "Some skills can hit an enemy multiple projectiles per attack (Multishot with the Giant Slayer node).  Insert the number of projectile you anticipate will be hitting the target.`n")
	myGui.SetFont("s14")
	
	myGui.Add("Text", "x32 y80 w125 h32 +0x200", "Base Damage:")
	myGui.SetFont("s14")
	BaseDmg := myGui.Add("Edit", "x160 y80 w81 h27", "0")
	myGui.SetFont("s10")
	myGui.Add("Text", "x24 y112 w255 h37 +0x1", "This number does NOT include any sources other than the skill itself.")
	
	
	myGui.SetFont("s14")
	More1 := myGui.Add("Edit", "x176 y496 w102 h27", "0")
	More2 := myGui.Add("Edit", "x176 y528 w102 h27", "0")
	myGui.SetFont("s14")
	More3 := myGui.Add("Edit", "x176 y560 w102 h27", "0")
	myGui.SetFont("s14")
	More4 := myGui.Add("Edit", "x176 y592 w102 h27", "0")
	myGui.SetFont("s14")
	More5 := myGui.Add("Edit", "x176 y624 w102 h27", "0")
	myGui.SetFont("s14")
	More6 := myGui.Add("Edit", "x176 y656 w102 h27", "0")
	More7 := myGui.Add("Edit", "x176 y688 w102 h27", "0")	
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y688 w143 h32 +0x200", "More Damage 1:")
	myGui.Add("Text", "x32 y496 w143 h32 +0x200", "More Damage 2:")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y528 w143 h32 +0x200", "More Damage 3:")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y560 w143 h32 +0x200", "More Damage 4:")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y592 w143 h32 +0x200", "More Damage 5:")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y624 w143 h32 +0x200", "More Damage 6:")
	myGui.SetFont("s14")
	myGui.Add("Text", "x32 y656 w143 h32 +0x200", "More Damage 7:")
	myGui.SetFont("s14")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x816 y696 w122 h32 +0x200", "Final Avg. Hit:")
	myGui.SetFont("s14")
	HitDmg := myGui.Add("Edit", "x952 y696 w135 h27", "0")
	
	myGui.SetFont("s14")
	myGui.Add("Text", "x816 y728 w134 h32 +0x200", "Final Avg. DPS:")
	myGui.SetFont("s14")
	DPS := myGui.Add("Edit", "x952 y728 w134 h27", "0")
	
	myGui.SetFont("s14")
	ButtonCalculate := myGui.Add("Button", "x888 y640 w127 h45", "&Calculate")
	ButtonCalculate.OnEvent("Click", OnEventHandler)
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "Last Epoch Damage Calculator v1.1.1"
	myGui.Show("w1131 h800")
	
	
	OnEventHandler(*)
	{
		FinalHit := Floor(
					(
			(
		(BaseDmg.Value) +
		(AddedDmg.Value * (DmgEff.Value / 100))
			) *
		(1 + (IncDmg.Value / 100)) *
		(1 + (More1.Value / 100)) * 
		(1 + (More2.Value / 100)) * 
		(1 + (More3.Value / 100)) * 
		(1 + (More4.Value / 100)) * 
		(1 + (More5.Value / 100)) * 
		(1 + (More6.Value / 100)) 
				) *
		(1 + ((CritChance.Value / 100) * (CritMulti.Value / 100))) *
						(Shotgun.Value) /
							(1 - ((ResPen.Value + ResShred.Value) / 100)) /
								(1 - (ArmorShred.Value / 100)) *
									(1 - (EnemyDR.Value / 100))
		)
		
		FinalDPS := Floor(
				(
					(
			(
		(BaseDmg.Value) +
		(AddedDmg.Value * (DmgEff.Value / 100))
			) *
		(1 + (IncDmg.Value / 100)) *
		(1 + (More1.Value / 100)) * 
		(1 + (More2.Value / 100)) * 
		(1 + (More3.Value / 100)) * 
		(1 + (More4.Value / 100)) * 
		(1 + (More5.Value / 100)) * 
		(1 + (More6.Value / 100))
				) *
		(1 + ((CritChance.Value / 100) * (CritMulti.Value / 100)))
					) *
						(Shotgun.Value) /
							(1 - ((ResPen.Value + ResShred.Value) / 100)) /
								(1 - (ArmorShred.Value / 100)) *
									(1 - (EnemyDR.Value / 100)) *
										((SkillSpeed.Value) * (WpnSpeed.Value) * (1 + (IncSpeed.Value / 100)))
		
		
		)
		
			
		HitDmg := myGui.Add("Edit", "x952 y696 w135 h27 +ReadOnly", FinalHit)
		DPS := myGui.Add("Edit", "x952 y728 w134 h27 +ReadOnly", FinalDps)
		
		
	}
	
	myGui.SetFont("s14 Bold Underline")
	myGui.Add("Text", "x232 y8 w681 h32 +0x200 +0x1", "Please do not leave any field blank. The script will malfunction if you do.")
	myGui.Add("Text", "x184 y40 w757 h32 +0x200 +0x1", "Check www.LastEpochTools.com for any information that isn't shown in-game.")
	
	return myGui
}