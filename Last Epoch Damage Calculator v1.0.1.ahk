F5::Reload

myGui := Construct()
Construct() {
	myGui := Gui()
	myGui.Add("Text", "x296 y16 w227 h23 +0x200", "Don't leave any fields blank or the script will fail.")
	myGui.Add("Text", "x88 y354 w429 h19 +0x200", "If your skill has no base damage (i.e., Multishot, Flurry, etc.), then just add all of the sources")
	myGui.Add("Text", "x88 y376 w429 h19 +0x200", "            of added damage (weapons/passive tree). Sources of 'More Damage' are")
	myGui.Add("Text", "x88 y398 w429 h19 +0x200", "multiplicative (even with themselves).  'Increased Damage' is additive with itself in all cases.")
	Edit1 := myGui.Add("Edit", "x128 y16 w120 h21", "0")
	Edit2 := myGui.Add("Edit", "x128 y40 w120 h21", "0")
	Edit3 := myGui.Add("Edit", "x128 y64 w120 h21", "0")
	Edit4 := myGui.Add("Edit", "x128 y88 w120 h21", "0")
	Edit5 := myGui.Add("Edit", "x128 y112 w120 h21", "0")
	Edit6 := myGui.Add("Edit", "x128 y136 w120 h21", "0")
	Edit7 := myGui.Add("Edit", "x128 y160 w120 h21", "0")
	Edit8 := myGui.Add("Edit", "x128 y184 w120 h21", "0")
	Edit9 := myGui.Add("Edit", "x128 y208 w120 h21", "0")
	Edit10 := myGui.Add("Edit", "x128 y232 w120 h21", "0")
	Edit11 := myGui.Add("Edit", "x128 y256 w120 h21", "0")
	Edit12 := myGui.Add("Edit", "x128 y280 w120 h21", "0")
	myGui.Add("Text", "x264 y136 w62 h23 +0x200", "Crit Chance:")
	Edit13 := myGui.Add("Edit", "x328 y136 w59 h21", "5")
	myGui.Add("Text", "x392 y136 w43 h23 +0x200", "Crit Multi:")
	Edit14 := myGui.Add("Edit", "x440 y136 w70 h21", "200")
	myGui.Add("Text", "x280 y288 w147 h19 +0x200", "Added Damage Effeciveness")
	Edit16 := myGui.Add("Edit", "x424 y288 w64 h21", "100")
	myGui.Add("Text", "x280 y310 w217 h19 +0x200", "(Hold Alt and hover over your skill to find this)")
	myGui.Add("Text", "x264 y208 w312 h11 +0x200", "Unfortunately, the character sheet only shows crit chance from")
	myGui.Add("Text", "x264 y224 w312 h11 +0x200", "gear and passives.  Any other sources of chance to crit will have")
	myGui.Add("Text", "x296 y240 w312 h11 +0x200", " to be calculated by you. The formula for this is")
	Edit17 := myGui.Add("Edit", "x304 y256 w209 h20 +ReadOnly", "(5+Chance to crit) * (1+(Inc Crit / 100))")
	myGui.Add("Text", "x264 y160 w331 h14 +0x200", "Put the crit chance/multi found on your character sheet here.")
	myGui.Add("Text", "x264 y176 w328 h14 +0x200", "If you don't want to include crits in the result, set your crit chance to 0.")
	ButtonCalculate := myGui.Add("Button", "x368 y88 w80 h23", "Calculate")
	ButtonCalculate.OnEvent("Click", OnEventHandler)
	myGui.Add("Text", "x8 y16 w120 h23 +0x200", "Base + Added Damage")
	myGui.Add("Text", "x8 y40 w120 h23 +0x200", "Increased Damage")
	myGui.Add("Text", "x8 y64 w120 h23 +0x200", "More Damage 1")
	myGui.Add("Text", "x8 y88 w120 h23 +0x200", "More Damage 2")
	myGui.Add("Text", "x8 y112 w120 h23 +0x200", "More Damage 3")
	myGui.Add("Text", "x8 y136 w120 h23 +0x200", "From here, all boxes are")
	myGui.Add("Text", "x8 y160 w120 h23 +0x200", "sources of More Damage")
	myGui.OnEvent('Close', (*) => ExitApp())
	myGui.Title := "Last Epoch Damage Calculator"
	myGui.Show("w620 h420")
	
	OnEventHandler(*)
	{
	
		result := Floor(((Edit1.Value * (Edit16.Value / 100)) * 
		(1 + (Edit2.Value / 100)) * 
		(1 + (Edit3.Value / 100)) * 
		(1 + (Edit4.Value / 100)) * 
		(1 + (Edit5.Value / 100)) * 
		(1 + (Edit6.Value / 100)) * 
		(1 + (Edit7.Value / 100)) * 
		(1 + (Edit8.Value / 100)) * 
		(1 + (Edit9.Value / 100)) * 
		(1 + (Edit10.Value / 100)) * 
		(1 + (Edit11.Value / 100)) * 
		(1 + ((Edit12.Value / 100)))) * 
		(1 + ((Edit13.Value / 100) * (Edit14.Value / 100)))
		)
			
		Edit15 := myGui.Add("Edit", "x336 y48 w171 h21 +ReadOnly", "Final Damage Value: " . result)

	}
	
	return myGui
}