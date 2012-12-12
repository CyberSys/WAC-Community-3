
ENT.Base = "wac_hc_base"
ENT.Type = "anim"
ENT.Author = "Dr. Matt"
ENT.Category = wac.aircraft.spawnCategory
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.PrintName		= "RAH-66 Comanche"

ENT.Model			= "models/drmatt/rah66/body.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/drmatt/rah66/mainrotor.mdl"
ENT.BackRotorModel	= "models/drmatt/rah66/tailrotor.mdl"

ENT.TopRotorPos		= Vector(-33,-2,60)
ENT.TopRotorDir		= 1
ENT.BackRotorPos	= Vector(-300,0,1)
ENT.BackRotorDir	= 1
ENT.SmokePos		= Vector(-33,-2,65)
ENT.FirePos			= Vector(-33,-2,65)
ENT.ThirdPDist		= 500

function ENT:AddSeatTable()
	return{
		[1]={
			Pos=Vector(60, -1.5, -15),
			ExitPos=Vector(60,60,-40),
			wep={
				[1] = wac.aircraft.getWeapon("Hydra 70",{
					ShootPos = {
						[1]=Vector(-12,42,-14),
						[2]=Vector(40.25,-46,-14),
					}
				}),
			},
		},
		[2]={
			Pos=Vector(10, -1.5, -10),
			ExitPos=Vector(10,60,-40),
			wep={
				[1] = wac.aircraft.getWeapon("No Weapon"),
				[2] = wac.aircraft.getWeapon("M197"),
				[3] = wac.aircraft.getWeapon("Hellfire"),
			},
		},
	}
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/Heli/h6_start.wav"),
		Blades=CreateSound(self.Entity,"RAH66.External"),
		Engine=CreateSound(self.Entity,"RAH66.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"HelicopterVehicle/MinorAlarm.mp3"),
		LowHealth=CreateSound(self.Entity,"HelicopterVehicle/LowHealth.mp3"),
		CrashAlarm=CreateSound(self.Entity,"HelicopterVehicle/CrashAlarm.mp3"),
	}
end
