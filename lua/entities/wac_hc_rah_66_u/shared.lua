if not wac then return end

ENT.Base = "wac_hc_base_u"
ENT.Type = "anim"
ENT.Author = "Dr. Matt"
ENT.Category = wac.aircraft.spawnCategoryU
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

ENT.Seats = {
	{
		pos=Vector(60, -1.5, -15),
		exit=Vector(60,60,-40),
		weapons={"Hydra 70"}
	},
	{
		pos=Vector(10, -1.5, -10),
		exit=Vector(10,60,-40),
		weapons={"M197", "Hellfire"}
	},
}

ENT.Weapons = {
	["Hydra 70"] = {
		class = "wac_pod_hydra",
		info = {
			Sequential = true,
			Pods = {
				Vector(-12,42,-14),
				Vector(40.25,-46,-14),
			}
		}
	},
	["Hellfire"] = {
		class = "wac_pod_hellfire",
		info = {
			Pods = {
				Vector(50, 60, 40),
				Vector(50, -60, 40),
			}
		}
	},
	["M197"] = {
		class = "wac_pod_aimedgun",
		info = {
			ShootPos = Vector(112,0,-40),
			ShootOffset = Vector(60, 0, 0),
		}
	},
}


ENT.Camera = {
	model = "models/props_junk/PopCan01a.mdl",
	pos = Vector(110,0,-20),
	offset = Vector(-1,0,0),
	viewPos = Vector(2, 0, -35),
	maxAng = Angle(45, 90, 0),
	minAng = Angle(-2, -90, 0),
	seat = 2
}


ENT.WeaponAttachments = {

	gunMount1 = {
		model = "models/drmatt/rah66/gunmount.mdl",
		pos = Vector(112,0,-33),
		restrictPitch = true
	},
	
	gunMount2 = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g2.mdl",
		pos = Vector(112,0,-40),
		offset = Vector(2,0,0)
	},

	gun = {
		model = "models/BF2/helicopters/AH-1 Cobra/ah1z_g.mdl",
		pos = Vector(112,0,-40),
		offset = Vector(2,0,0)
	},

}

ENT.Sounds={
	Start="WAC/Heli/h6_start.wav",
	Blades="WAC/rah66/external.wav",
	Engine="WAC/Heli/heli_loop_int.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}
