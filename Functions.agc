#include "Framework.agc"

function LoadGraphics()
	LoadImage(2, "Tank.png")
	LoadImage(3, "Egg.png")
	LoadImage(4, "Monster.png")
	LoadImage(5, "MonsterSmile.png")
	LoadImage(6, "Monster2.png")
	LoadImage(7, "MonsterSmile2.png")
	LoadImage(8, "MonsterBlink.png")
	LoadImage(9, "MonsterBlink2.png")
	LoadImage(10, "Food.png")
	LoadImage(11, "PFish.png")
	
	LoadMusic(1, "TankRythm.wav")
	
	LoadSound(1, "MagicPoof.wav")
	LoadSound(2, "Eat.wav")
endFunction

function SetupWorld()	
	SetPhysicsWallTop(1)
	SetPhysicsWallBottom(1)
	SetPhysicsWallLeft(1)
	SetPhysicsWallRight(1)
	SetPhysicsGravity(0,0.2)
	
	CreateSprite(2, 2)
	SetSpriteSize(2,100,100)
	PlayMusic(1)
	SetMusicFileVolume(1, 10)
	Sync()
	
	CreateSprite(3, 3)
	SetSpriteSize(3,10,15)
	SetSpritePosition(3, 50, 15)
	SetSpritePhysicsOn(3,2)
	SetSpritePhysicsVelocity(3, 0, 9)
	Sync()
endFunction

function hatch()
	DeleteSprite(3)
	PlaySound(1)
	CreateSprite(4, 4)
	SetSpriteSize(4,10,15)
	SetSpriteOffset(4, 5, 7)
	SetSpritePosition(4, 50, 50)
	SetSpritePhysicsOn(4,2)
	CreateMouseJoint(1, 4, 50, 50, 14)
endFunction

function GrowMonster()
	DeleteSprite(4)
	PlaySound(1)
	CreateSprite(5, 6)
	SetSpriteSize(5,20,30)
	SetSpriteOffset(5, 5, 7)
	SetSpritePosition(5, 50, 50)
	SetSpritePhysicsOn(5,2)
	SetSpritePhysicsVelocity(5, 0, 16)
	CreateMouseJoint(1, 5, 50, 50, 14)
endFunction

function DynamicMouseMovement()
	if GetPointerState()= 1:
		SetJointMouseTarget( 1, GetPointerX()-7, GetPointerY()-7)
	elseif GetPointerState()= 0:
		SetJointMouseTarget( 1, Random(10, 90), Random(10, 90))
	elseif GetSpriteExists(6)= 1:
		repeat
			SetJointMouseTarget(1, GetSpriteX(6), GetSpriteY(6))
		until GetSpriteExists(6)= 0
	endIf
endFunction

function MonsterAnim(time as integer)
	if Mod(time, 7)= 0:
		SetSpriteImage(4, 5)
	elseif Mod(time, 3)= 0:
		SetSpriteImage(4,4)
	elseif Mod(time, 2)= 0:
		SetSpriteImage(4, 8)
	endIf
		
endFunction

function MonsterAnim2(time as integer)
	if Mod(time, 7)= 0:
		SetSpriteImage(5, 7)
	elseif Mod(time, 3)= 0:
		SetSpriteImage(5,6)
	elseif Mod(time, 2)= 0:
		SetSpriteImage(5, 9)
	endIf
		
endFunction

function DropFood()
	CreateSprite(6, 10)
	SetSpriteSize(6,3,6)
	SetSpritePosition(6, Random(15,85), 5)
	SetSpritePhysicsOn(6,2)
	SetSpritePhysicsVelocity(6, 0, 10)
endFunction
