
// Project: Grow A Squid! 
// Created: 2017-09-11

#include "Framework.agc"
#include "Functions.agc"

InitialiseScreen(720,1300, "Grow A Squid", 0, 1,0)

ShowSplashScreen("HopelessArts.png")
LoadGraphics()
HideSplashScreen(4)
SetupWorld()
AddVirtualButton(1, 10, 85, 8)

time as integer
smile as integer
full as integer

do    
	
	time= Timer()
	if GetVirtualButtonExists(1)= 1:
		if GetVirtualButtonReleased(1)= 1:
			DropFood()
			DeleteVirtualButton(1)
		endIf
	endIf
    if GetSpriteHit(GetMouseClickX(),GetMouseClickY())= 3:
		Hatch()
	endIf
	
	if GetSpriteExists(4)= 1:
		DynamicMouseMovement()
		MonsterAnim(time)
		if GetSpriteExists(6)= 1:
			if GetSpriteCollision(4, 6)= 1:
				SetSpriteImage(4, 5)
				PlaySound(2)
				DeleteSprite(6)
				full= full + 1
				if full= 3:
					GrowMonster()
				endIf
				AddVirtualButton(1, 10, 85, 8)
			endIf
		endIf
		if smile> 400:
			SetSpriteImage (4, 5, 1)
		endIf
	endIf
	
	if GetSpriteExists(5)= 1
		DynamicMouseMovement()
		MonsterAnim2(time)
		if GetSpriteExists(6)= 1:
			if GetSpriteCollision(5, 6)= 1:
				SetSpriteImage(5, 7)
				PlaySound(2)
				DeleteSprite(6)
				full= full + 1
				AddVirtualButton(1, 10, 85, 8)
			endIf
		endIf
	endIf
	
    //Print(ScreenFPS())
    //print(time)
    //print(full)
    Sync()
loop
