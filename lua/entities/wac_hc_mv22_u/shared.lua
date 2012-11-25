if not wac then return end

ENT.Base 				= "wac_hc_base_u"
ENT.Type 				= "anim"

ENT.PrintName			= "MV-22 Osprey"
ENT.Author				= "SentryGunMan"
ENT.Category			= wac.aircraft.spawnCategoryU
ENT.Contact    			= ""
ENT.Purpose 			= ""
ENT.Instructions 		= ""
ENT.Spawnable			= true
ENT.AdminSpawnable	= true

ENT.Model			= "models/sentry/osprey.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel		= "models/sentry/osprey_prop.mdl"
ENT.BackRotorModel	= "models/sentry/osprey_prop.mdl"
ENT.TopRotorDir        = 1
ENT.BackRotorDir	= 1
ENT.TopRotorPos	= Vector(9,278.5,236)
ENT.BackRotorPos = Vector(9,-278.5,236)
ENT.EngineForce	= 26
ENT.Weight		= 47500
ENT.SmokePos		= Vector(30,0,130)
ENT.FirePos		= Vector(30,280,60)
ENT.TwinBladed = true

function ENT:AddSeatTable()
    return{
        [1]={
            Pos=Vector(165, 24, 68),
            ExitPos=Vector(160,70,40),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [2]={
            Pos=Vector(165, -24, 68),
            ExitPos=Vector(160,-70,40),
            NoHud=true,
		wep={
				[1]=wac.aircraft.getWeapon("No Weapon"),
				[2]=wac.aircraft.getWeapon("M197",{Name="GAU-17",Ammo=6000,MaxAmmo=6000,ShootDelay=0.06}),
			},
		},
        [3]={
            Pos=Vector(25, 28, 60),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [4]={
            Pos=Vector(0, 28, 60),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [5]={
            Pos=Vector(105, 28, 60),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,-90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [6]={
            Pos=Vector(65, -28, 60),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [7]={
            Pos=Vector(-40, -28, 60),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
        [8]={
            Pos=Vector(-80, -28, 60),
            ExitPos=Vector(-320,0,10),
            Ang=Angle(0,90,0),
            NoHud=true,
            wep={wac.aircraft.getWeapon("No Weapon")},
        },
    }
end

function ENT:AddSounds()
	self.Sound={
		Start=CreateSound(self.Entity,"WAC/mv22/start.wav"),
		Blades=CreateSound(self.Entity,"MV22.External"),
		Engine=CreateSound(self.Entity,"MV22.Internal"),
		MissileAlert=CreateSound(self.Entity,"HelicopterVehicle/MissileNearby.mp3"),
		MissileShoot=CreateSound(self.Entity,"HelicopterVehicle/MissileShoot.mp3"),
		MinorAlarm=CreateSound(self.Entity,"WAC/Heli/fire_alarm_tank.wav"),
		LowHealth=CreateSound(self.Entity,"WAC/Heli/fire_alarm.wav"),
		CrashAlarm=CreateSound(self.Entity,"WAC/Heli/FireSmoke.wav"),
	}
end